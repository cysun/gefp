package gefp.web.controller;

import gefp.model.FlightPlan;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.FlightPlanDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    FlightPlanDao planDao;

    @Autowired
    CheckpointDao checkpointDao;

    @RequestMapping("/403")
    public String accessDenied()
    {
        return "403";
    }

    @RequestMapping("/test.html")
    public String testtest(@RequestParam Long p1, @RequestParam Long p2)
    {

//        List<User> users = planDao.getUsersWhoCheckedCheckpoint( checkpointDao.getCheckPoint( 7L ) );
//        System.out.println( users );
        System.out.println("test");
        FlightPlan parentPlan = planDao.findParent(planDao.getFlightPlan( p1 ), planDao.getFlightPlan( p2 ));
        System.out.println("Parent is:" + parentPlan);
        return "print_plan";

    }

}
