package gefp.web.controller;

import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.User;
import gefp.model.Role;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.UserDao;
import gefp.model.dao.RoleDao;
import gefp.web.validator.UserValidator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({ "user" })
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private DepartmentDao deptDao;

    @Autowired
    private FlightPlanDao planDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    UserValidator userValidator;

    @RequestMapping(value = "/admin/dashboard.html", method = RequestMethod.GET)
    public String homepage( ModelMap models, HttpSession session )
    {

        models.put( "users", userDao.getUsers() );
        models.put( "departments", deptDao.getDepartments() );
        models.put( "plans", planDao.getFlightPlans() );
        return "admin_dashboard";
    }

    @RequestMapping(value = "/advisor/dashboard.html",
        method = RequestMethod.GET)
    public String advisorHome( ModelMap models, HttpSession session )
    {

        List<User> users = userDao.getUsers();
        List<User> students = new ArrayList<User>();
        for( User u : users )
        {
            if( u.isStudent() ) students.add( u );
        }
        models.put( "users", students );
        models.put( "departments", deptDao.getDepartments() );
        return "advisor_dashboard";
    }

    @RequestMapping(value = { "/admin/list-users.html" },
        method = RequestMethod.GET)
    public String listForAdmin( ModelMap models )
    {
        models.put( "users", userDao.getUsers() );
        return "list_users";
    }

    @RequestMapping(value = { "/advisor/list-students.html" },
        method = RequestMethod.GET)
    public String listForAdvisor( ModelMap models )
    {
        List<User> users = userDao.getUsers();
        List<User> students = new ArrayList<User>();

        for( User u : users )
        {
            if( u.isStudent() ) students.add( u );
        }

        models.put( "users", students );
        return "list_users";
    }

    @RequestMapping(value = "/admin/user/add.html", method = RequestMethod.GET)
    public String add( ModelMap models )
    {
        models.put( "departments", deptDao.getDepartments() );
        models.put( "roles", roleDao.getRoles() );
        models.put( "user", new User() );
        return "add_user";
    }

    @RequestMapping(value = "/admin/user/add.html", method = RequestMethod.POST)
    public String add( HttpServletRequest request, SessionStatus sessionStatus )
    {
        User user = new User();
        System.out.println( "In Post" );
        String firstName = request.getParameter( "firstName" );
        String lastName = request.getParameter( "lastName" );
        String email = request.getParameter( "email" );
        String cin = request.getParameter( "cin" );
        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );

        user.setFirstName( firstName );
        user.setLastName( lastName );
        user.setCin( cin );
        user.setEmail( email );
        user.setUsername( username );
        user.setPassword( password );

        Integer deptId = Integer.parseInt( request.getParameter( "department" ) );
        String[] roleIds = request.getParameterValues( "roles" );
        Set<Role> roles = new HashSet<Role>();

        for( String role : roleIds )
            roles.add( roleDao.getRole( Integer.parseInt( role ) ) );

        user.setDepartment( deptDao.getDepartment( deptId ) );
        user.setMajor( deptDao.getDepartment( deptId ) );
        user.setFlightPlan( deptDao.getDepartment( deptId ).getDefaultPlan() );
        user.setRoles( roles );
        user.setEnabled( true );
        User user2 = userDao.saveUser( user );
        sessionStatus.setComplete();
        System.out.println( "New user id is " + user2.getId() );
        return "redirect:/admin/list-users.html";
    }

    @RequestMapping(value = "/admin/user/edit/{id}.html",
        method = RequestMethod.GET)
    public String edit( @PathVariable Long id, ModelMap models )
    {
        models.put( "user", userDao.getUser( id ) );
        return "add_user";
    }

    @RequestMapping(value = "/admin/user/edit/{id}.html",
        method = RequestMethod.POST)
    public String save( @ModelAttribute("user") User user, ModelMap models,
        BindingResult bindingResult, SessionStatus sessionStatus )
    {

        userDao.saveUser( user );
        sessionStatus.setComplete();
        return "redirect:/admin/list-users.html";
    }

    /* Student Profile Page */

    @RequestMapping(value = "/user/profile/{id}.html",
        method = RequestMethod.GET)
    public String profile( @PathVariable Integer id, ModelMap models,
        HttpSession session )
    {

        User sessionUserObj = (User) session.getAttribute( "loggedInUser" );
        User currUserObj = userDao.getUser( sessionUserObj.getId() );

        models.put( "departments", deptDao.getDepartments() );
        models.put( "user", userDao.getUser( currUserObj.getId() ) );
        return "user_profile";
    }

    /* Student Profile Page */

    @RequestMapping(value = "/user/profile/{pid}.html",
        method = RequestMethod.POST)
    public String updateprofile( @PathVariable Integer pid, ModelMap models,
        HttpSession session, HttpServletRequest request )
    {

        String numRegex = ".*[0-9].*";
        String alphaRegex = ".*[a-zA-Z].*";

        String firstName = request.getParameter( "firstName" );
        String middleName = request.getParameter( "middleName" );
        String lastName = request.getParameter( "lastName" );

        // String uid = request.getParameter("uid");
        String password = request.getParameter( "password" );
        String deptIdStr = request.getParameter( "departmentID" );

        User sessionUserObj = (User) session.getAttribute( "loggedInUser" );
        User currUserObj = userDao.getUser( sessionUserObj.getId() );

        if( firstName == "" || firstName == null )
        {
            session.setAttribute( "firstName", "FirstName cannot be empty" );
            return "redirect:/user/profile/" + pid + ".html";
        }
        else if( firstName == "" || firstName == null )
        {
            session.setAttribute( "firstName", "FirstName cannot be empty" );
            return "redirect:/user/profile/" + pid + ".html";
        }
        else if( password != "" && password != null && password.length() < 4 )
        {
            System.out.println( "pppppp" );
            session.setAttribute( "passwordErr",
                "Password should be more than 4 characters." );
            return "redirect:/user/profile/" + pid + ".html";
        }
        else if( password != ""
            && password != null
            && (!password.matches( numRegex ) || !password.matches( alphaRegex )) )
        {
            session.setAttribute( "passwordErr",
                "Password should contain both letters and numbers." );
            return "redirect:/user/profile/" + pid + ".html";
        }
        else if( deptIdStr == "" )
        {
            session.setAttribute( "deptErr", "Please select a department." );
            return "redirect:/user/profile/" + pid + ".html";
        }

        Integer deptID = Integer.parseInt( deptIdStr );

        if( password != "" && password != null )
        {
            currUserObj.setPassword( password );
        }

        if( deptID != currUserObj.getDepartment().getId() )
        {
            Department newDept = deptDao.getDepartment( deptID );
            currUserObj.setDepartment( newDept );
            currUserObj.setFlightPlan( newDept.getDefaultPlan() );
        }

        currUserObj.setFirstName( firstName );
        currUserObj.setMiddleName( middleName );
        currUserObj.setLastName( lastName );

        userDao.saveUser( currUserObj );
        session.setAttribute( "successMsg", "Profile details updated" );
        session.setAttribute( "loggedInUser", currUserObj );
        return "redirect:/user/profile/" + pid + ".html";
    }

    /* Advisor Search functions */
    @RequestMapping(value = { "/search/users.html" },
        method = RequestMethod.GET)
    public String search( ModelMap models, @RequestParam String q )
    {
        models.put( "users", userDao.searchUsersByPrefix( q, 10 ) );
        return "user_search";
    }

    @RequestMapping("/advisor/view-student-plan/{id}.html")
    public String advisorViewPlanStudent( @PathVariable Long id,
        ModelMap models, HttpSession session )
    {

        User currUserObj = userDao.getUser( id );
        models.put( "currUserObj", currUserObj );

        FlightPlan plan = null;

        if( currUserObj.getFlightPlan() != null )
        {
            plan = planDao.getFlightPlan( currUserObj.getFlightPlan().getId() );
        }
        models.put( "plan", plan );
        return "advisor_view_student_plan";
    }

    @RequestMapping(value = "/autocomplete/user.html")
    public String users( @RequestParam String term, HttpServletResponse response )
        throws JSONException, IOException
    {
        JSONArray jsonArray = new JSONArray();
        List<User> users = userDao.searchUsersByPrefix( term, 10 );

        for( User user : users )
        {
            // System.out.println("username is " + user.getUsername());

            if( user.isStudent() )
            {
                Map<String, String> json = new HashMap<String, String>();
                json.put( "id", user.getId().toString() );
                json.put( "value", user.getFirstName() );
                json.put( "label",
                    user.getFirstName() + " " + user.getLastName() + " ("
                        + user.getCin() + ")" );
                jsonArray.put( json );
            }
        }

        response.setContentType( "application/json" );
        jsonArray.write( response.getWriter() );
        return null;
    }

    @RequestMapping(value = "/update-profile.html", method = RequestMethod.GET)
    public String updateprofile( ModelMap models, HttpServletRequest request )
    {
        models.put( "departments", deptDao.getDepartments() );
        return "update_profile";
    }
    
    @RequestMapping(value = "/update-profile.html", method = RequestMethod.POST)
    public String updateprofile2( ModelMap models, HttpServletRequest request )
    {
        
        HttpSession session = request.getSession();
        User sessionUserObj = (User) session.getAttribute( "loggedInUser" );
        sessionUserObj.setMajor( deptDao.getDepartment( 1 ) );
        sessionUserObj.setDepartment( deptDao.getDepartment( 1 ) );
        sessionUserObj.setFlightPlan( deptDao.getDepartment( 1 ).getDefaultPlan() );
        sessionUserObj.setNewAccount( false );
        userDao.saveUser( sessionUserObj );
        return "redirect:/student/view-plan/"+deptDao.getDepartment( 1 ).getDefaultPlan().getId()+".html";
    }

    /*
     * @RequestMapping(value = "/user/profile/{pid}.html", method =
     * RequestMethod.POST) public String updateprofile(@PathVariable Integer
     * pid, ModelMap models,
     * 
     * @ModelAttribute("user") Users user, BindingResult bindingResult,
     * HttpSession session, SessionStatus sessionStatus, HttpServletRequest
     * request) {
     * 
     * String deptIdStr = request.getParameter("departmentID"); Users
     * sessionUserObj = (Users) session.getAttribute("loggedInUser"); Users
     * currUserObj = userDao.getUser(sessionUserObj.getId());
     * 
     * 
     * System.out.println("USER ID IS " + sessionUserObj.getId());
     * System.out.println("OLD PASSWORD IS " + currUserObj.getPassword());
     * System.out.println("NEW PASSWORD IS " + user.getPassword());
     * 
     * userValidator.validateProfileInfo( user, bindingResult ); if(
     * bindingResult.hasErrors() || deptIdStr == "") { if(deptIdStr == "")
     * models.put("deptErr", "Please select a department");
     * models.put("departments", deptDao.getDepartments()); return
     * "user_profile"; }
     * 
     * Integer deptID = Integer.parseInt(deptIdStr);
     * 
     * if(user.getPassword()=="" || user.getPassword()==null) {
     * System.out.println("OLD PASSWORD IS " + currUserObj.getPassword());
     * user.setPassword(currUserObj.getPassword()); }
     * 
     * if(deptID != user.getDepartment().getId()) { Department newDept =
     * deptDao.getDepartment(deptID); user.setDepartment(newDept);
     * user.setFlightplan(newDept.getCurrentPlan()); } userDao.saveUser(user);
     * sessionStatus.setComplete(); session.setAttribute("successMsg",
     * "Profile details updated"); return "redirect:/user/profile/"+pid+".html";
     * }
     */
}
