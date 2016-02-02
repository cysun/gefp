package gefp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gefp.model.Department;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.User;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.UserDao;

@Controller
public class DepartmentRestService {
    // private static final Logger logger = LoggerFactory
    // .getLogger( UserRestService.class );

    @Autowired
    private FlightPlanDao planDao;

    @Autowired
    private DepartmentDao deptDao;

    /*
     * @Autowired private RunwayDao runwayDao;
     * 
     * @Autowired private StageDao stageDao;
     * 
     * @Autowired private CellDao cellDao;
     * 
     * @Autowired private CheckpointDao checkpointDao;
     * 
     * @Autowired private CheckpointInfoDao checkpointInfoDao;
     */

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/api/login")
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
            user = null;
        }
        models.put( "user", user );
        return "jsonView";
    }

    @RequestMapping(value = "/api/updateprofile", method = RequestMethod.POST)
    public String updateprofile( @RequestParam Long user_id,
        @RequestParam String firstName,
        @RequestParam(required = false ) String middleName,
        @RequestParam String lastName, @RequestParam String email,
        @RequestParam String cin, @RequestParam Integer dept_id,
        ModelMap models)
    {

        User user = userDao.getUser( user_id );
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

    @RequestMapping(value = "/api/departments", method = RequestMethod.GET)
    public String listDepartments( ModelMap models )
    {
        List<Department> departments = deptDao
            .getDepartmentsHavingDefaultPlan();
        models.put( "departments", departments );
        return "jsonView";
    }

    @RequestMapping(value = "/api/runways", method = RequestMethod.GET)
    public String listRunways( @RequestParam Long plan_id,
        @RequestParam Long user_id, ModelMap models )
    {
        List<Runway> runways = planDao.getFlightPlan( plan_id ).getRunways();
        models.put( "runways", runways );
        return "jsonView";
    }

    @RequestMapping(value = "/api/stages", method = RequestMethod.GET)
    public String listStages( @RequestParam Long plan_id,
        @RequestParam Long user_id, ModelMap models )
    {
        List<Stage> stages = planDao.getFlightPlan( plan_id ).getStages();
        models.put( "stages", stages );
        return "jsonView";
    }

}
