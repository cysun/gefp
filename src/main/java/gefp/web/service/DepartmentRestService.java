package gefp.web.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;
import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.User;
import gefp.model.dao.CellDao;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.CheckpointInfoDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;
import gefp.model.dao.UserDao;

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

    @RequestMapping(value = "/api/login.html")
    public String login( @RequestParam String username,
        @RequestParam String password, ModelMap models )
    {
        User user = userDao.validateUser( new User( username, password ) );

        if( user != null )
        {
            user.setValidLogin( true );
        }
        else
        {
            user = new User();
            user.setValidLogin( false );
        }
        models.put( "user", user );
        return "jsonView";
    }

    @RequestMapping(value = "/api/updateprofile.html",
        method = RequestMethod.POST)
    public String updateprofile( @RequestParam Long user_id,
        @RequestParam String firstName,
        @RequestParam(required = false) String middleName,
        @RequestParam String lastName, @RequestParam String email,
        @RequestParam String cin, @RequestParam(required = false) Integer dept_id,
        ModelMap models)
    {

        User user = userDao.getUserApi( user_id );
        Department dept = deptDao.getDepartment( dept_id );
        user.setFirstName( firstName );
        user.setMiddleName( middleName );
        user.setLastName( lastName );
        user.setCin( cin );
        user.setEmail( email );
        if( user.isNewAccount() )
        {
            user.setDepartment( dept );
            user.setMajor( dept );
            user.setFlightPlan( dept.getDefaultPlan() );
            user.setNewAccount( false );
        }

        user = userDao.saveUser( user );
        models.put( "user", user );
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
        @RequestParam Long user_id, ModelMap models )
    {
        List<Stage> stages = planDao.getFlightPlan( plan_id ).getStages();
        models.put( "stages", stages );
        return "jsonView";
    }

    @RequestMapping(value = "/api/userplan.html", method = RequestMethod.GET)
    public String showUserPlan( @RequestParam Long user_id, ModelMap models )
    {
        FlightPlan flightPlan = userDao.getUserApi( user_id ).getFlightPlan();
        models.put( "flightplan", flightPlan );
        return "jsonView";
    }

    @RequestMapping(value = "/api/changemilestone.html",
        method = RequestMethod.POST)
    public String saveStudentCheckpoint( @RequestParam Long user_id,
        @RequestParam Long checkpoint_id, @RequestParam String checked,
        @RequestParam String message, ModelMap models )
    {

        User currUserObj = userDao.getUser( user_id );

        String repsonse = "{data:" + checkpoint_id + ", status:" + checked
            + "}";

        if( checkpoint_id != null && checked != "" )
        {

            Checkpoint c = checkpointDao.getCheckPoint( checkpoint_id );

            if( checked.equals( "true" ) )
            {
                CheckpointInfo cinfo = new CheckpointInfo( c, message );
                currUserObj.getCheckpointsInfo().add( cinfo );
                logger.info( "User " + currUserObj.getUsername()
                    + " checked a Milestone (ID: " + checkpoint_id + " ) " );
            }
            else
            {
                Set<CheckpointInfo> newCheckpoints = new HashSet<CheckpointInfo>();
                for( CheckpointInfo cp : currUserObj.getCheckpointsInfo() )
                {
                    if( !cp.getCheckpoint().getId().equals( checkpoint_id ) )
                    {
                        newCheckpoints.add( cp );
                    }
                }
                currUserObj.setCheckpointsInfo( newCheckpoints );
                logger.info( "User " + currUserObj.getUsername()
                    + " Unchecked a Milestone (ID: " + checkpoint_id + " ) " );
            }
            userDao.saveUser( currUserObj );
        }
        return "jsonView";
    }
}
