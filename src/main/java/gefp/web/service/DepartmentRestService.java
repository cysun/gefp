package gefp.web.service;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;
import gefp.model.Comment;
import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.Role;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.User;
import gefp.model.dao.CellDao;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.CheckpointInfoDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.RoleDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;
import gefp.model.dao.UserDao;
import gefp.security.ActiveDirectory;
import gefp.util.MyNullKeySerializer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Controller
@SuppressWarnings("unused")
public class DepartmentRestService {

    private static final Logger logger = LoggerFactory
        .getLogger( DepartmentRestService.class );

    @Autowired
    private FlightPlanDao planDao;

    @Autowired
    private DepartmentDao deptDao;

    @Autowired
    private RunwayDao runwayDao;

    @Autowired
    private StageDao stageDao;

    @Autowired
    private CellDao cellDao;

    @Autowired
    private CheckpointDao checkpointDao;

    @Autowired
    private CheckpointInfoDao checkpointInfoDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @RequestMapping(value = "/api/login.html")
    public void login( @RequestParam String username,
        @RequestParam String password, ModelMap models, PrintWriter out ) throws JsonProcessingException
    {

        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(SerializationFeature.WRITE_NULL_MAP_VALUES, false);
        mapper.setSerializationInclusion(Include.NON_NULL);
        mapper.getSerializerProvider().setNullKeySerializer(new MyNullKeySerializer());
        
        User user = null;
        String domain = "ad.calstatela.edu";
        String choice = "username"; // username | email
        Authentication auth = null;

        try
        {

            if( isSystemAccount( username, password ) )
            {
                user = userDao.getUserByUsername( username );
            }
            else
            {

                ActiveDirectory activeDirectory = new ActiveDirectory();
                activeDirectory.connect( domain, username, password );

                NamingEnumeration<SearchResult> result = activeDirectory
                    .searchUser( username, choice, null );

                if( result.hasMore() )
                {
                    SearchResult rs = (SearchResult) result.next();
                    Attributes attrs = rs.getAttributes();
                    user = userDao.getUserByUsername( username );
                    logger.info( "Username ( " + username
                        + " ) is authenticated from AD" );

                    if( user == null )
                    {
                        String temp = attrs.get( "givenName" ).toString();
                        String firstName = temp
                            .substring( temp.indexOf( ":" ) + 1 );
                        temp = attrs.get( "mail" ).toString();
                        String emailId = temp
                            .substring( temp.indexOf( ":" ) + 1 );
                        temp = attrs.get( "distinguishedName" ).toString();
                        String distinguishedName = temp
                            .substring( temp.indexOf( ":" ) + 1 );
                        int facultyIndex = distinguishedName
                            .indexOf( "OU=Employees" );

                        user = new User();
                        Set<Role> roles = new HashSet<Role>();

                        if( facultyIndex > 0 )
                        {
                            roles.add( roleDao.getRole( "ADVISOR" ) );
                        }
                        else
                        {
                            roles.add( roleDao.getRole( "STUDENT" ) );
                        }

                        user.setUsername( username );
                        user.setPassword( "" );
                        user.setFirstName( firstName );
                        user.setMiddleName( "" );
                        user.setLastName( "" );
                        user.setCin( "" );
                        user.setEmail( emailId );
                        user.setRoles( roles );
                        user.setEnabled( true );
                        user.setDepartment( null );
                        user.setMajor( null );
                        user.setFlightPlan( null );
                        user.setNewAccount( true );
                        user.setDeleted( false );
                        user.setAccessKey( UUID.randomUUID().toString() );
                        user = userDao.saveUser( user );
                    }
                }
                else
                {
                    logger.info(
                        "No match found in AD for username :" + username );
                }
                activeDirectory.closeLdapConnection();
            }
        }
        catch( NamingException e )
        {
            logger.info( "Invalid Username/Password" + e.getMessage() );
            e.printStackTrace();
        }
        catch( IOException e )
        {
            logger.debug( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
        catch( Exception e )
        {
            logger.debug( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }

        if( user != null )
        {
            user.setValidLogin( true );
            if( user.getAccessKey() == null )
            {
                user.setAccessKey( UUID.randomUUID().toString() );
                user = userDao.saveUser( user );
                logger.info( "Access key generated for " + username );
            }
        }
        else
        {
            user = new User();
            user.setValidLogin( false );
        }
        
        Map<String, User> userJson = new HashMap<String, User>();
        userJson.put( "user", user );
        
        out.print(mapper.writeValueAsString(userJson));
        
        /*
        models.put( "user", user );
        return "jsonView";
        */
    }

    @RequestMapping(value = "/api/updateprofile.html",
        method = RequestMethod.POST)
    public String updateprofile( @RequestParam Long user_id,
        @RequestParam String accessKey, @RequestParam String firstName,
        @RequestParam(required = false ) String middleName,
        @RequestParam String lastName, @RequestParam String email,
        @RequestParam(required = false) String cin,
        @RequestParam(required = false) Integer dept_id, ModelMap models)
    {

        if( userDao.validateAccessKey( accessKey, user_id ) )
        {
            if( middleName == null ) middleName = "";
            User user = userDao.getApiUser( user_id );
            user.setFirstName( firstName );
            user.setMiddleName( middleName );
            user.setLastName( lastName );
            user.setCin( cin );
            user.setEmail( email );
            if( user.isNewAccount() )
            {
                Department dept = deptDao.getDepartment( dept_id );
                user.setDepartment( dept );
                user.setMajor( dept );
                user.setFlightPlan( dept.getDefaultPlan() );
                user.setNewAccount( false );
            }

            user = userDao.saveUser( user );
            models.put( "user", user );
        }
        else
        {
            models.put( "user", null );
        }
        return "jsonView";
    }

    @RequestMapping(value = "/api/departments.html", method = RequestMethod.GET)
    public String listDepartments( ModelMap models )
    {
        List<Department> departments = deptDao
            .getDepartmentsHavingDefaultPlan();
        models.put( "departments", departments );
        return "jsonView";
    }

    @RequestMapping(value = "/api/runways.html", method = RequestMethod.GET)
    public String listRunways( @RequestParam Long plan_id,
        @RequestParam Long user_id, ModelMap models )
    {
        List<Runway> runways = planDao.getFlightPlan( plan_id ).getRunways();
        models.put( "runways", runways );
        return "jsonView";
    }

    @RequestMapping(value = "/api/stages.html", method = RequestMethod.GET)
    public String listStages( @RequestParam Long plan_id,
        @RequestParam Long user_id, @RequestParam String accessKey,
        ModelMap models )
    {

        if( userDao.validateAccessKey( accessKey, user_id ) )
        {
            List<Stage> stages = planDao.getFlightPlan( plan_id ).getStages();
            models.put( "stages", stages );
        }
        else
        {
            models.put( "stages", null );
        }
        return "jsonView";
    }

    @RequestMapping(value = "/api/userplan.html", method = RequestMethod.GET)
    public String showUserPlan( @RequestParam Long user_id, ModelMap models )
    {
        FlightPlan flightPlan = userDao.getApiUser( user_id ).getFlightPlan();
        models.put( "flightplan", flightPlan );
        return "jsonView";
    }

    @RequestMapping(value = "/api/checkpoints.html", method = RequestMethod.GET)
    public String showCheckpoints( @RequestParam Long user_id,
        @RequestParam Long plan_id, @RequestParam Long runway_id,
        @RequestParam Long stage_id, ModelMap models )
    {
        User apiUser = userDao.getApiUser( user_id );
        FlightPlan flightPlan = apiUser.getFlightPlan();
        List<Cell> cells = flightPlan.getCells();
        List<Checkpoint> checkpoints = new ArrayList<Checkpoint>();
        Set<CheckpointInfo> checkpointInfos = apiUser.getCheckpointsInfo();

        for( Cell cell : cells )
        {
            if( cell.getRunway().getId().equals( runway_id )
                && cell.getStage().getId().equals( stage_id ) )
            {
                checkpoints = cell.getCheckpoints();
            }
        }

        for( Checkpoint checkpoint : checkpoints )
        {
            for( CheckpointInfo cinfo : checkpointInfos )
            {

                if( cinfo.getCheckpoint().equals( checkpoint ) )
                {
                    checkpoint.setChecked( true );
                }
            }
        }

        models.put( "checkpoints", checkpoints );
        return "jsonView";
    }

    /*
     * @RequestMapping(value = "/api/changemilestone.html", method =
     * RequestMethod.POST) public String saveStudentCheckpoint( @RequestParam
     * Long user_id,
     * 
     * @RequestParam Long checkpoint_id, @RequestParam String checked,
     * 
     * @RequestParam(required = false ) String message, ModelMap models) {
     * 
     * User currUserObj = userDao.getApiUser( user_id );
     * 
     * String repsonse = "{data:" + checkpoint_id + ", status:" + checked + "}";
     * 
     * if( checkpoint_id != null && checked != "" ) {
     * 
     * Checkpoint c = checkpointDao.getCheckPoint( checkpoint_id );
     * 
     * if( checked.equals( "true" ) ) { CheckpointInfo cinfo = new
     * CheckpointInfo( c, message ); currUserObj.getCheckpointsInfo().add( cinfo
     * ); logger.info( "User " + currUserObj.getUsername() +
     * " checked a Milestone (ID: " + checkpoint_id + " ) " ); } else {
     * Set<CheckpointInfo> newCheckpoints = new HashSet<CheckpointInfo>(); for(
     * CheckpointInfo cp : currUserObj.getCheckpointsInfo() ) { if(
     * !cp.getCheckpoint().getId().equals( checkpoint_id ) ) {
     * newCheckpoints.add( cp ); } } currUserObj.setCheckpointsInfo(
     * newCheckpoints ); logger.info( "User " + currUserObj.getUsername() +
     * " Unchecked a Milestone (ID: " + checkpoint_id + " ) " ); }
     * userDao.saveUser( currUserObj ); } return repsonse; }
     */

    public boolean isSystemAccount( String username, String password )
    {
        User u = new User( username, password );
        if( userDao.validateUser( u ) != null ) return true;
        return false;
    }

    @RequestMapping("/api/mobile-user-plan.html")
    public String viewPlanStudent( @RequestParam Long user_id,
        @RequestParam Long runway_id, @RequestParam Long stage_id,
        @RequestParam String accessKey, ModelMap models )
    {

        if( userDao.validateAccessKey( accessKey, user_id ) )
        {

            User currUserObj = userDao.getApiUser( user_id );

            if( currUserObj != null )
            {
                models.put( "currUserObj", currUserObj );
                FlightPlan plan = null;
                boolean student_mode = true;
                if( currUserObj.getFlightPlan() != null )
                {
                    plan = planDao
                        .getFlightPlan( currUserObj.getFlightPlan().getId() );
                }
                models.put( "student_mode", student_mode );
                models.put( "plan", plan );
                models.put( "runway_id", runway_id );
                models.put( "stage_id", stage_id );
                models.put( "cell", cellDao.getCell( runway_id, stage_id ) );
                return "mobile/view_plan_cell";
            }
            else
            {
                return "redirect:/404";
            }
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/api/plan/saveStudentCheckpoint.html",
        method = RequestMethod.POST)
    public void saveStudentCheckpoint( @RequestParam Long userId,
        @RequestParam String accessKey, ModelMap models,
        HttpServletRequest request, HttpServletResponse response,
        PrintWriter out )
    {

        logger.info( "Mobile API request to update checkpoint: data {userId:" + userId
            + ", accessKey:" + accessKey + "}" );

        if( userDao.validateAccessKey( accessKey, userId ) )
        {
            
            logger.info( "Access Key is validated for userId:"+userId );
            
            User currUserObj = userDao.getApiUser( userId );

            Long id = Long.parseLong( request.getParameter( "id" ) );
            String checked = request.getParameter( "checked" );
            String repsonse = "{data:" + id + ", status:" + checked + "}";
            String message = request.getParameter( "message" );

            if( id != null && checked != "" )
            {

                Checkpoint c = checkpointDao.getCheckPoint( id );

                if( checked.equals( "true" ) )
                {
                    CheckpointInfo cinfo = new CheckpointInfo( c, message );
                    currUserObj.getCheckpointsInfo().add( cinfo );
                }
                else
                {
                    Set<CheckpointInfo> newCheckpoints = new HashSet<CheckpointInfo>();
                    for( CheckpointInfo cp : currUserObj.getCheckpointsInfo() )
                    {
                        if( !cp.getCheckpoint().getId().equals( id ) )
                        {
                            newCheckpoints.add( cp );
                        }
                    }
                    currUserObj.setCheckpointsInfo( newCheckpoints );
                }
                userDao.saveUser( currUserObj );
            }
            logger.info( "Checkpoint saved for userId:"+userId );
            response.setContentType( "text/plain" );
            out.print( repsonse );
        }
        else
        {
            logger.info( "Error for saving checkpoint for userId:"+userId );
            String repsonse = "{\"errorcode\": true}";
            response.setContentType( "text/plain" );
            out.print( repsonse );
        }
    }

    @RequestMapping(value = "/api/plan/milestone/add-comment.html",
        method = RequestMethod.GET)
    public String addMilestoneComment( @RequestParam String accessKey,
        @RequestParam Long runwayId, @RequestParam Long stageId,
        @RequestParam Long planId, @RequestParam Long checkpointId,
        @RequestParam Long userId, ModelMap models )
    {
        if( userDao.validateAccessKey( accessKey, userId ) )
        {

            FlightPlan plan = planDao.getFlightPlan( planId );
            Checkpoint checkpoint = checkpointDao.getCheckPoint( checkpointId );
            CheckpointInfo cinfo = checkpointInfoDao.getCheckPointInfo( userId,
                checkpointId );

            if( cinfo == null )
            {
                cinfo = new CheckpointInfo();
                cinfo.setCheckpoint( checkpoint );
            }

            models.put( "comment", new Comment() );
            models.put( "plan", plan );
            models.put( "checkpoint", checkpoint );
            models.put( "userId", userId );
            models.put( "runwayId", runwayId );
            models.put( "stageId", stageId );
            models.put( "accessKey", accessKey );
            models.put( "comments", cinfo.getComments() );
            // return "add_milestone_comment";
            return "mobile/comments_page";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/api/plan/milestone/add-comment.html",
        method = RequestMethod.POST)
    public String saveStudentCheckpointComment( @RequestParam String accessKey,
        @ModelAttribute("comment" ) Comment comment, ModelMap models,
        @RequestParam Long runwayId, @RequestParam Long stageId,
        HttpServletRequest request, HttpServletResponse response,
        PrintWriter out, @RequestParam Long userId, @RequestParam Long planId,
        @RequestParam Long checkpointId)
    {

        if( userDao.validateAccessKey( accessKey, userId ) )
        {
            User loginUser = userDao.getApiUser( userId );
            User currUserObj = userDao.getApiUser( userId );

            if( checkpointId != null )
            {
                comment.setCommentedBy( currUserObj );
                comment.setVisibleToStudent( true );

                CheckpointInfo cinfo = null;
                for( CheckpointInfo csx : currUserObj.getCheckpointsInfo() )
                {
                    if( csx.getCheckpoint().getId().equals( checkpointId ) )
                    {
                        cinfo = csx;
                    }
                }

                if( cinfo == null )
                {
                    Checkpoint c = checkpointDao.getCheckPoint( checkpointId );
                    cinfo = new CheckpointInfo();
                    cinfo.setCheckpoint( c );
                }
                cinfo.getComments().add( comment );

                currUserObj.getCheckpointsInfo().add( cinfo );
                userDao.saveUser( currUserObj );
            }
        }
        return "redirect:/api/plan/milestone/add-comment.html?userId=" + userId
            + "&checkpointId=" + checkpointId + "&planId=" + planId
            + "&runwayId=" + runwayId + "&stageId=" + stageId
            + "&accessKey=" + accessKey;
    }

}
