package gefp.web.controller;

import gefp.model.CheckPoint;
import gefp.model.FlightPlan;
import gefp.model.Runways;
import gefp.model.Stages;
import gefp.model.User;
import gefp.model.dao.CheckPointDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.RunwaysDao;
import gefp.model.dao.StagesDao;
import gefp.model.dao.UserDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.WebDataBinder;
//import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.support.SessionStatus;

//import gefp.web.controller.WebApplicationContext;

@Controller
@SessionAttributes({"checkpoint","stage","runway"})
public class FlightPlanController {
	
	@Autowired
    private FlightPlanDao planDao;
	@Autowired
	private RunwaysDao runwayDao;
	@Autowired
	private StagesDao stageDao;
	@Autowired
	private CheckPointDao checkpointDao;
	@Autowired
    private UserDao userDao;
	
	//@Autowired
    //private WebApplicationContext context;
	
//    @InitBinder
//    public void initBinder( WebDataBinder binder )
//    {
//        binder.registerCustomEditor( User.class,
//            (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
//    }
	
    @RequestMapping("/admin/list-plans.html")
    public String listplans( ModelMap models )
    {
    	models.put( "plans", planDao.getFlightPlans() );
    	return "list_plans";
    }
    
    @RequestMapping("/plan/view/{id}.html")
    public String viewplan( @PathVariable Integer id, ModelMap models )
    {
    	FlightPlan fp = planDao.getFlightPlan(id);
    	// List<Runways> runways = fp.getRunways();
    	
    	if( fp != null ) {
    		models.put( "plan",  fp);
    		
    		return "view_plan";
    	}
    	else {
    		return "redirect:/404";
    	}
    	
    }

    @RequestMapping("/student/view-plan/{id}.html")
    public String viewPlanStudent( @PathVariable Integer id, ModelMap models, HttpSession session )
    {
    	//User sessionUserObj = (User) session.getAttribute("loggedInUser");
    	User currUserObj = userDao.getUser(id);
    	//models.put( "sessionUserObj", sessionUserObj );
    	models.put( "currUserObj", currUserObj );
    	FlightPlan plan = null;

    	if(currUserObj.getFlightplan() != null) {
    		plan = planDao.getFlightPlan(currUserObj.getFlightplan().getId());
    	}
    	models.put( "plan", plan );
    	return "view_plan";
    }   
    
	@RequestMapping(value="/admin/plan/add.html", method = RequestMethod.GET)
    public String add( ModelMap models )
    {
    	models.put("flightplan", new FlightPlan());
    	return "add_plan";
    }

    @RequestMapping(value="/admin/plan/add.html", method = RequestMethod.POST)
    public String add( @ModelAttribute FlightPlan flightplan )
    {
    	System.out.println(flightplan.getName());
    	flightplan = planDao.saveFlightPlan(flightplan);
    	return "redirect:/plan/view/"+flightplan.getId()+".html";
    }

    @RequestMapping(value="/plan/saveStudentCheckpoint.html", method = RequestMethod.POST)
    public void saveStudentCheckpoint( ModelMap models, HttpServletRequest request, HttpServletResponse response, PrintWriter out, HttpSession session  )
    {
    	
    	if(request.getParameter("userId") == "" || request.getParameter("userId") == null) {
    		System.out.println("User ID is null");
    		return;
    	}
    	
    	//User sessionUserObj = (User) session.getAttribute("loggedInUser");
    	Integer userId = Integer.parseInt(request.getParameter("userId"));
    	
    	//User currUserObj = userDao.getUser(sessionUserObj.getId());    	
    	User currUserObj = userDao.getUser(userId);
    	
    	Integer id = Integer.parseInt(request.getParameter("id"));
    	String checked = request.getParameter("checked");
    	String repsonse = "{data:"+id+", status:"+checked+"}";
    	
    	if(id!=null && checked != "") {
    		
    		CheckPoint c = checkpointDao.getCheckPoint(id);
    		
	    	if(checked.equals("true")){
	    		System.out.println("Check ID " + c.getId());
	    		currUserObj.getCheckpoints().add(c);
	    	}
	    	else {

	    		// This code doesn;t work. Need to ask Professor about this.
//	    		System.out.println("size before " + currUserObj.getCheckpoints().size());
//	    		System.out.println("Check ID " + c.getId());
//	    		System.out.println("IndexOf " + currUserObj.getCheckpoints().indexOf(c));
//	    		currUserObj.getCheckpoints().remove(c);
//	    		System.out.println("size after " + currUserObj.getCheckpoints().size());

	    		List<CheckPoint> newCheckpoints = new ArrayList<CheckPoint>();
	    		for(CheckPoint cp : currUserObj.getCheckpoints()) {
	    			if(cp.getId()!=id) {
	    				newCheckpoints.add(cp);
	    			}
	    		}
	    		currUserObj.setCheckpoints(newCheckpoints);
	    		
	    	}
	    	userDao.saveUser(currUserObj);
    	}
    	response.setContentType("text/plain");
    	out.print(repsonse);
    }    
    
    
    @RequestMapping(value="/admin/plan/add-runway.html", method = RequestMethod.GET)
    public String addRunway( @RequestParam Integer planId, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("runway", new Runways());
    	return "add_runway";
    }
    
    @RequestMapping(value="/admin/plan/add-runway.html", method = RequestMethod.POST)
    public String addRunway( @ModelAttribute Runways runway, @RequestParam Integer planId, ModelMap models )
    {
    	FlightPlan plan = planDao.getFlightPlan(planId);
    	Runways newRunway = runwayDao.saveRunway(runway);
    	plan.getRunways().add(newRunway);
    	planDao.saveFlightPlan(plan);
    	return "redirect:/plan/view/"+plan.getId()+".html";
    }
    
    @RequestMapping(value="/admin/plan/edit-runway.html", method = RequestMethod.GET)
    public String editRunway( @RequestParam Integer id, @RequestParam Integer planId, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("runway", runwayDao.getRunway(id));
    	return "edit_runway";
    }
    
    @RequestMapping(value="/admin/plan/edit-runway.html", method = RequestMethod.POST)
    public String editRunway( @ModelAttribute("runway") Runways runway, @RequestParam Integer planId, ModelMap models, SessionStatus sessionStatus )
    {
    	runwayDao.saveRunway(runway);
    	sessionStatus.setComplete();
    	return "redirect:/plan/view/"+planId+".html";
    }
    
    @RequestMapping(value="/admin/plan/add-stage.html", method = RequestMethod.GET)
    public String addStage( @RequestParam Integer planId, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("stage", new Stages());
    	return "add_stage";
    }  
    
    @RequestMapping(value="/admin/plan/add-stage.html", method = RequestMethod.POST)
    public String addStage( @ModelAttribute("stage") Stages stage, @RequestParam Integer planId, ModelMap models, SessionStatus sessionStatus )
    {
    	
    	FlightPlan plan = planDao.getFlightPlan(planId);
    	Stages newStage = stageDao.saveStage(stage);
    	plan.getStages().add(newStage);
    	planDao.saveFlightPlan(plan);
    	sessionStatus.setComplete();
    	return "redirect:/plan/view/"+plan.getId()+".html";
    }
    
    @RequestMapping(value="/admin/plan/edit-stage.html", method = RequestMethod.GET)
    public String editStage( @RequestParam Integer id, @RequestParam Integer planId, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("stage", stageDao.getStage(id));
    	return "edit_stage";
    }

    @RequestMapping(value="/admin/plan/edit-stage.html", method = RequestMethod.POST)
    public String editStage( @ModelAttribute("stage") Stages stage, @RequestParam Integer planId, ModelMap models, SessionStatus sessionStatus )
    {
    	stageDao.saveStage(stage);
    	sessionStatus.setComplete();
    	return "redirect:/plan/view/"+planId+".html";
    }    
    
    @RequestMapping(value="/admin/plan/add-checkpoint.html", method = RequestMethod.GET)
    public String addCheckpoint( @RequestParam Integer planId, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("checkpoint", new CheckPoint());
    	return "add_checkpoint";
    }

    @RequestMapping(value="/admin/plan/add-checkpoint.html", method = RequestMethod.POST)
    public String addCheckpoint( @ModelAttribute CheckPoint checkpoint, HttpServletRequest request, ModelMap models )
    {
    	int planId = Integer.parseInt(request.getParameter("planId"));
    	
    	if(request.getParameter("runwayId") == "" || request.getParameter("stageId") == "" ) {
    		return "redirect:/admin/plan/add-checkpoint.html?planId="+planId;
    	}

    	int runwayId = Integer.parseInt(request.getParameter("runwayId"));
    	int stageId = Integer.parseInt(request.getParameter("stageId"));
    	
    	FlightPlan plan = planDao.getFlightPlan(planId);
    	checkpoint.setRunway(runwayDao.getRunway(runwayId));
    	checkpoint.setStage(stageDao.getStage(stageId));
    	checkpoint.setType("TEXT");
    	checkpoint.setActive(true);
    	checkpoint.setDeleted(false);
    	CheckPoint newCheckpoint = checkpointDao.saveCheckPoint(checkpoint);
    	plan.getCheckpoints().add(newCheckpoint);
    	planDao.saveFlightPlan(plan);
    	return "redirect:/plan/view/"+plan.getId()+".html";
    }

    @RequestMapping(value="/admin/plan/edit-checkpoint.html", method = RequestMethod.GET)
    public String editCheckpoint( @RequestParam Integer planId, @RequestParam Integer id, ModelMap models )
    {
    	models.put("flightplan", planDao.getFlightPlan(planId));
    	models.put("checkpoint", checkpointDao.getCheckPoint(id));
    	return "edit_checkpoint";
    }
    
    @RequestMapping(value="/admin/plan/publish.html", method = RequestMethod.GET)
    public String publish( ModelMap models, @RequestParam Integer planId )
    {
    	FlightPlan plan = planDao.getFlightPlan(planId);
    	plan.setPublished(true);
    	planDao.saveFlightPlan(plan);
    	return "redirect:/plan/view/"+planId+".html";
    }

    @RequestMapping(value="/admin/plan/save-checkpoint.html", method = RequestMethod.POST)
    public String saveCheckpoint( @ModelAttribute("checkpoint") CheckPoint checkpoint, HttpServletRequest request, ModelMap models, SessionStatus sessionStatus )
    {
    	int planId = Integer.parseInt(request.getParameter("planId"));
    	int runwayId = Integer.parseInt(request.getParameter("runwayId"));
    	int stageId = Integer.parseInt(request.getParameter("stageId"));
//    	int checkPointId = Integer.parseInt(request.getParameter("chkId"));
//    	checkpoint.setId(checkPointId);
    	checkpoint.setRunway(runwayDao.getRunway(runwayId));
    	checkpoint.setStage(stageDao.getStage(stageId));
    	checkpoint.setFlightplan(planDao.getFlightPlan(planId));
//    	checkpoint.setType("TEXT");
//    	checkpoint.setActive(true);
//    	checkpoint.setDeleted(false);
    	checkpointDao.saveCheckPoint(checkpoint);
    	sessionStatus.setComplete();
    	//FlightPlan plan = planDao.getFlightPlan(planId);
    	//plan.getCheckpoints().add(newCheckpoint);
    	//planDao.saveFlightPlan(plan);
    	return "redirect:/plan/view/"+planId+".html";
    }
    
    @RequestMapping(value="/admin/plan/remove-checkpoint.html", method = RequestMethod.GET)
    public String removeCheckpoint( @RequestParam Integer id, @RequestParam Integer planId )
    {
    	FlightPlan plan = planDao.getFlightPlan(planId);
    	plan.getCheckpoints().remove(checkpointDao.getCheckPoint(id));
    	planDao.saveFlightPlan(plan);
    	return "redirect:/plan/view/"+planId+".html";
    }
    
    @RequestMapping(value="/admin/plan/reorder-stages.html", method = RequestMethod.POST)
    public void reorderStages( HttpServletRequest request, HttpServletResponse response )
    {
    	try {
			
    		PrintWriter out = response.getWriter();
			Integer planId = Integer.parseInt(request.getParameter("planId"));
	    	FlightPlan plan = planDao.getFlightPlan(planId);
	    	String [] stageIds = request.getParameterValues("stageIds[]");
//	    	String [] stageOrders = request.getParameterValues("stageOrders[]");
	    	
	    	List<Stages> stages = new ArrayList<Stages>();
	    	
	    	for( String sid : stageIds ) {
	    		stages.add(stageDao.getStage(Integer.parseInt(sid)));
	    	}
	    	plan.setStages(stages);
	    	planDao.saveFlightPlan(plan);
	    	out.println("Stages re-ordered successfully.");
	    	
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    @RequestMapping(value="/admin/plan/reorder-runways.html", method = RequestMethod.POST)
    public void reorderRunways( HttpServletRequest request, HttpServletResponse response )
    {
    	try {
			
    		PrintWriter out = response.getWriter();
    		response.setContentType("text/plain");
			Integer planId = Integer.parseInt(request.getParameter("planId"));
	    	FlightPlan plan = planDao.getFlightPlan(planId);
	    	String [] runwayIds = request.getParameterValues("runwayIds[]");
//	    	String [] runwayOrders = request.getParameterValues("runwayOrders[]");
	    	List<Runways> runways = new ArrayList<Runways>();
	    	
	    	for( String rid : runwayIds ) {
	    		runways.add(runwayDao.getRunway(Integer.parseInt(rid)));
	    	}
	    	plan.setRunways(runways);
	    	planDao.saveFlightPlan(plan);
	    	out.println("Runways re-ordered successfully.");
	    	
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

    @RequestMapping(value="/admin/plan/reorder-checkpoints.html", method = RequestMethod.POST)
    public void reorderCheckpoints( HttpServletRequest request, HttpServletResponse response )
    {
    	try {
			
    		PrintWriter out = response.getWriter();
    		response.setContentType("text/plain");
			Integer planId = Integer.parseInt(request.getParameter("planId"));
	    	FlightPlan plan = planDao.getFlightPlan(planId);
	    	String [] checkpointIds = request.getParameterValues("checkpointIds[]");
//	    	String [] runwayOrders = request.getParameterValues("runwayOrders[]");
	    	List<CheckPoint> checkpoints = plan.getCheckpoints();
	    	
	    	for( String s : checkpointIds ) {
	    		int index = checkpoints.indexOf(checkpointDao.getCheckPoint(Integer.parseInt(s)));
	    		System.out.println("remove id is " + s);
	    		System.out.println("size before " + checkpoints.size());
	    		checkpoints.remove(index);
	    		System.out.println("size after " + checkpoints.size());
	    		System.out.println("remove index is " + index);
	    		checkpoints.add(checkpointDao.getCheckPoint(Integer.parseInt(s)));
	    	}
	    	plan.setCheckpoints(checkpoints);
	    	planDao.saveFlightPlan(plan);
	    	out.println("Checkpoints re-ordered successfully.");
	    	
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}