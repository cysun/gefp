package gefp.web.controller;

import gefp.model.User;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.FlightPlanDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public void testtest() {
        
        List<User> users = planDao.getUsersWhoCheckedCheckpoint( checkpointDao.getCheckPoint( 77L ) );
        
        for(User u : users)
            System.out.println(u.toString());
        
    }
    
    
}
