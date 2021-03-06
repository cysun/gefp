package gefp.web.controller;

import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.User;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.UserDao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({ "department" })
public class DepartmentController {

    private static final Logger logger = LoggerFactory.getLogger( DepartmentController.class );

    @Autowired
    private UserDao userDao;

    @Autowired
    private DepartmentDao deptDao;

    @Autowired
    private FlightPlanDao planDao;

    @RequestMapping(value = "/admin/list-departments.html",
        method = RequestMethod.GET)
    public String list( ModelMap models )
    {
        models.put( "departments", deptDao.getDepartments() );
        return "list_departments";
    }

    @RequestMapping(value = "/advisor/list-departments.html",
        method = RequestMethod.GET)
    public String listForAdvisor( ModelMap models )
    {
        models.put( "departments", deptDao.getDepartments() );
        return "list_departments";
    }

    @RequestMapping(value = "/department/list-students.html",
        method = RequestMethod.GET)
    public String listStudents( @RequestParam Integer id, ModelMap models,
        HttpSession session )
    {
        Department department = deptDao.getDepartment( id );
        User loginUser = (User) session.getAttribute( "loggedInUser" );
        List<User> students = new ArrayList<User>();

        if( department != null )
        {
            List<User> users = userDao.getUsersInDepartment( id );

            if( loginUser.isAdvisor() )
            {
                for( User u : users )
                {
                    if( u.isStudent() ) students.add( u );
                }
                models.put( "users", students );
            }
            else
            {
                models.put( "users", users );
            }

            models.put( "department", department );

            return "list_department_users";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/department/add.html",
        method = RequestMethod.GET)
    public String add( ModelMap models, HttpServletRequest request )
    {
        models.put( "error", request.getParameter( "error" ) );
        models.put( "department", new Department() );
        return "add_department";
    }

    @RequestMapping(value = "/admin/department/add.html",
        method = RequestMethod.POST)
    public String add( @ModelAttribute Department department,
        Principal principal )
    {
        if( department.getName().isEmpty() ){ return "redirect:/admin/department/add.html?error=true"; }
        department = deptDao.saveDepartment( department );
        logger.info( "User " + principal.getName() + " added new Department ("
            + department.getName() + ")" );
        return "redirect:/admin/list-departments.html";
    }

    @RequestMapping(value = "/admin/department/edit.html",
        method = RequestMethod.GET)
    public String edit( @RequestParam Integer id, ModelMap models,
        HttpServletRequest request )
    {
        Department department = deptDao.getDepartment( id );

        if( department != null )
        {
            models.put( "error", request.getParameter( "error" ) );
            models.put( "department", department );
            return "edit_department";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/department/edit.html",
        method = RequestMethod.POST)
    public String edit( @ModelAttribute("department") Department department,
        Principal principal )
    {
        if( department.getName().isEmpty() ){ return "redirect:/admin/department/edit.html?id="
            + department.getId() + "&error=true"; }
        department = deptDao.saveDepartment( department );
        logger.info( "User " + principal.getName()
            + " modified Department title (" + department.getName() + ")" );
        return "redirect:/admin/list-departments.html";
    }

    @RequestMapping(value = "/admin/department/delete.html",
        method = RequestMethod.GET)
    @PreAuthorize("authenticated and hasRole('ADMIN')")
    public String deleteDepartment( @RequestParam Integer departmentId,
        Principal principal )
    {
        Department dept = deptDao.getDepartment( departmentId );
        dept.setDeleted( true );
        deptDao.saveDepartment( dept );
        logger.info( "User " + principal.getName() + " deleted Department: "
            + dept.toString() );
        return "redirect:/admin/list-departments.html";
    }

    @RequestMapping(value = "/admin/department/list-plans.html",
        method = RequestMethod.GET)
    public String listplans( @RequestParam Integer id, ModelMap models )
    {
        Department department = deptDao.getDepartment( id );

        if( department != null )
        {
            models.put( "department", department );
            models.put( "plans", department.getPlans() );
            return "list-department-plans";
        }
        else
        {
            return "redirect:/404";
        }
    }
    
    @RequestMapping(value = "/advisor/department/list-plans.html",
        method = RequestMethod.GET)
    public String listplansAdvisor( @RequestParam Integer id, ModelMap models )
    {
        Department department = deptDao.getDepartment( id );

        if( department != null )
        {
            models.put( "department", department );
            models.put( "plans", deptDao.getDepartmentPublishedPlans( department ) );
            return "list-department-plans";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/department/set-official-plan.html",
        method = RequestMethod.GET)
    public String setOfficialPlan( @RequestParam Integer dept_id,
        @RequestParam Long plan_id )
    {
        Department department = deptDao.getDepartment( dept_id );
        FlightPlan flightplan = planDao.getFlightPlan( plan_id );

        if( department != null && flightplan != null )
        {
            
            flightplan.setPublished( true );
            department.setDefaultPlan( flightplan );
            deptDao.saveDepartment( department );
            return "redirect:/admin/department/list-plans.html?id="
                + department.getId();
        }
        else
        {
            return "redirect:/404";
        }
    }

    /*
     * @RequestMapping(value = "/admin/department/select-plans.html", method =
     * RequestMethod.GET) public String selectplans( @RequestParam Integer id,
     * ModelMap models ) { models.put( "department", deptDao.getDepartment( id )
     * ); models.put( "plans", planDao.getFlightPlans() ); return
     * "select-plans"; }
     * 
     * @RequestMapping(value = "/admin/department/select-plans.html", method =
     * RequestMethod.POST) public String selectSaveplans(
     * 
     * @ModelAttribute("department") Department department, ModelMap models,
     * HttpServletRequest request, SessionStatus sessionStatus, HttpSession
     * session ) { String[] selectedPids = request.getParameterValues( "pis" );
     * List<FlightPlan> plans = new ArrayList<FlightPlan>();
     * 
     * if( selectedPids == null ) { session.setAttribute( "errorMessage",
     * "Please select a plan" ); return
     * "redirect:/admin/department/select-plans.html?id=" + department.getId();
     * }
     * 
     * for( String pid : selectedPids ) { plans.add( planDao.getFlightPlan(
     * Long.parseLong( pid ) ) ); }
     * 
     * department.setPlans( plans ); deptDao.saveDepartment( department );
     * sessionStatus.setComplete(); return
     * "redirect:/admin/department/list-plans.html?id=" + department.getId(); }
     */

}
