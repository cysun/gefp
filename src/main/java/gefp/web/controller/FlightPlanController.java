package gefp.web.controller;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;
import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.User;
import gefp.model.dao.CellDao;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;
import gefp.model.dao.UserDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
@SessionAttributes({ "checkpoint", "stage", "runway", "flightplan" })
public class FlightPlanController {

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
    private UserDao userDao;

    @RequestMapping("/admin/list-plans.html")
    public String listplans( ModelMap models )
    {
        models.put( "plans", planDao.getFlightPlans() );
        return "list_plans";
    }

    @RequestMapping("/plan/view/{id}.html")
    public String viewplan( @PathVariable Long id, ModelMap models )
    {
        FlightPlan fp = planDao.getFlightPlan( id );

        if( fp != null )
        {
            models.put( "plan", fp );
            return "view_plan";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping("/plan/edit/{id}.html")
    public String editplan( @PathVariable Long id, ModelMap models )
    {
        FlightPlan fp = planDao.getFlightPlan( id );

        if( fp != null )
        {
            models.put( "plan", fp );
            return fp.isPublished() ? "edit_published_plan" : "edit_plan";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping("/student/view-plan/{id}.html")
    public String viewPlanStudent( @PathVariable Long id, ModelMap models,
        HttpSession session )
    {
        // User sessionUserObj = (User) session.getAttribute("loggedInUser");
        User currUserObj = userDao.getUser( id );
        // models.put( "sessionUserObj", sessionUserObj );
        models.put( "currUserObj", currUserObj );
        FlightPlan plan = null;
        boolean student_mode = true;
        if( currUserObj.getFlightPlan() != null )
        {
            plan = planDao.getFlightPlan( currUserObj.getFlightPlan().getId() );
        }
        models.put( "student_mode", student_mode );
        models.put( "plan", plan );
        return "view_plan";
    }

    @RequestMapping(value = "/plan/clone.html", method = RequestMethod.GET)
    public String clonePlan( @RequestParam Long planId, ModelMap models )
    {
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "departments", deptDao.getDepartments() );
        return "clone_flightplan";
    }

    @RequestMapping(value = "/plan/clone.html", method = RequestMethod.POST)
    public String clonePlan( @RequestParam Long planId,
        HttpServletRequest request, SessionStatus sessionStatus )
    {
        if( request.getParameter( "name" ).isEmpty()
            || request.getParameter( "department" ).isEmpty() ){ return "redirect:/plan/clone.html?planId="
            + planId + "&error=true"; }

        FlightPlan newPlan = planDao.getFlightPlan( planId ).clone();
        newPlan.setName( request.getParameter( "name" ) );
        newPlan.setDepartment( deptDao.getDepartment( Integer.parseInt( request.getParameter( "department" ) ) ) );
        newPlan = planDao.saveFlightPlan( newPlan );
        sessionStatus.setComplete();
        return "redirect:/plan/view/" + newPlan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/add.html", method = RequestMethod.GET)
    public String add( ModelMap models, HttpServletRequest request )
    {
        String departmentId = request.getParameter( "departmentId" );
        if( departmentId == null || departmentId == "" )
            return "redirect:/admin/list-plans.html";

        models.put( "flightplan", new FlightPlan() );
        return "add_plan";
    }

    @RequestMapping(value = "/admin/plan/add.html", method = RequestMethod.POST)
    public String add( @ModelAttribute FlightPlan flightplan,
        HttpServletRequest request )
    {
        // System.out.println( flightplan.getName() );
        Integer departmentId = Integer.parseInt( request.getParameter( "departmentId" ) );
        Department department = deptDao.getDepartment( departmentId );
        flightplan.setDepartment( department );
        FlightPlan flightplan2 = planDao.saveFlightPlan( flightplan );
        department.getPlans().add( flightplan2 );
        deptDao.saveDepartment( department );
        return "redirect:/plan/edit/" + flightplan2.getId() + ".html";
    }

    @RequestMapping(value = "/plan/saveStudentCheckpoint.html",
        method = RequestMethod.POST)
    public void saveStudentCheckpoint( ModelMap models,
        HttpServletRequest request, HttpServletResponse response,
        PrintWriter out, HttpSession session )
    {

        if( request.getParameter( "userId" ) == ""
            || request.getParameter( "userId" ) == null )
        {
            System.out.println( "User ID is null" );
            return;
        }

        // User sessionUserObj = (User) session.getAttribute("loggedInUser");
        Long userId = Long.parseLong( request.getParameter( "userId" ) );

        // User currUserObj = userDao.getUser(sessionUserObj.getId());
        User currUserObj = userDao.getUser( userId );

        Long id = Long.parseLong( request.getParameter( "id" ) );
        String checked = request.getParameter( "checked" );
        String repsonse = "{data:" + id + ", status:" + checked + "}";
        String message = request.getParameter( "message" );

        if( id != null && checked != "" )
        {

            Checkpoint c = checkpointDao.getCheckPoint( id );

            if( checked.equals( "true" ) )
            {
                System.out.println( "Check ID " + c.getId() );
                CheckpointInfo cinfo = new CheckpointInfo( c, message );
                currUserObj.getCheckpoints().add( cinfo );
            }
            else
            {

                // This code doesn;t work. Need to ask Professor about this.
                // System.out.println("size before " +
                // currUserObj.getCheckpoints().size());
                // System.out.println("Check ID " + c.getId());
                // System.out.println("IndexOf " +
                // currUserObj.getCheckpoints().indexOf(c));
                // currUserObj.getCheckpoints().remove(c);
                // System.out.println("size after " +
                // currUserObj.getCheckpoints().size());

                Set<CheckpointInfo> newCheckpoints = new HashSet<CheckpointInfo>();
                for( CheckpointInfo cp : currUserObj.getCheckpoints() )
                {
                    if( cp.getCheckpoint().getId() != id )
                    {
                        newCheckpoints.add( cp );
                    }
                }
                currUserObj.setCheckpoints( newCheckpoints );

            }
            userDao.saveUser( currUserObj );
        }
        response.setContentType( "text/plain" );
        out.print( repsonse );
    }

    @RequestMapping(value = "/admin/plan/add-runway.html",
        method = RequestMethod.GET)
    public String addRunway( @RequestParam Long planId, ModelMap models,
        HttpServletRequest request )
    {
        models.put( "error", request.getParameter( "error" ) );
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "runway", new Runway() );
        return "add_runway";
    }

    @RequestMapping(value = "/admin/plan/add-runway.html",
        method = RequestMethod.POST)
    public String addRunway( @ModelAttribute Runway runway,
        @RequestParam Long planId, ModelMap models )
    {
        if( runway.getName().isEmpty() ){ return "redirect:/admin/plan/add-runway.html?planId="
            + planId + "&error=true"; }
        FlightPlan plan = planDao.getFlightPlan( planId );
        Runway newRunway = runwayDao.saveRunway( runway );
        plan.getRunways().add( newRunway );
        planDao.saveFlightPlan( plan );
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-runway.html",
        method = RequestMethod.GET)
    public String editRunway( @RequestParam Long id, @RequestParam Long planId,
        ModelMap models, HttpServletRequest request )
    {
        models.put( "error", request.getParameter( "error" ) );
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "runway", runwayDao.getRunway( id ) );
        return "edit_runway";
    }

    @RequestMapping(value = "/admin/plan/edit-runway.html",
        method = RequestMethod.POST)
    public String editRunway( @ModelAttribute("runway") Runway runway,
        @RequestParam Long planId, ModelMap models, SessionStatus sessionStatus )
    {
        if( runway.getName().isEmpty() ){ return "redirect:/admin/plan/edit-runway.html?id="
            + runway.getId() + "&planId=" + planId + "&error=true"; }

        runwayDao.saveRunway( runway );
        sessionStatus.setComplete();
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/add-stage.html",
        method = RequestMethod.GET)
    public String addStage( @RequestParam Long planId, ModelMap models,
        HttpServletRequest request )
    {
        models.put( "error", request.getParameter( "error" ) );
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "stage", new Stage() );
        return "add_stage";
    }

    @RequestMapping(value = "/admin/plan/add-stage.html",
        method = RequestMethod.POST)
    public String addStage( @ModelAttribute("stage") Stage stage,
        @RequestParam Long planId, ModelMap models, SessionStatus sessionStatus )
    {

        if( stage.getName().isEmpty() ){ return "redirect:/admin/plan/add-stage.html?planId="
            + planId + "&error=true"; }

        FlightPlan plan = planDao.getFlightPlan( planId );
        Stage newStage = stageDao.saveStage( stage );
        plan.getStages().add( newStage );
        planDao.saveFlightPlan( plan );
        sessionStatus.setComplete();
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-stage.html",
        method = RequestMethod.GET)
    public String editStage( @RequestParam Long id, @RequestParam Long planId,
        ModelMap models, HttpServletRequest request )
    {
        models.put( "error", request.getParameter( "error" ) );
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "stage", stageDao.getStage( id ) );
        return "edit_stage";
    }

    @RequestMapping(value = "/admin/plan/edit-stage.html",
        method = RequestMethod.POST)
    public String editStage( @ModelAttribute("stage") Stage stage,
        @RequestParam Long planId, ModelMap models, SessionStatus sessionStatus )
    {
        if( stage.getName().isEmpty() ){ return "redirect:/admin/plan/edit-stage.html?id="
            + stage.getId() + "&planId=" + planId + "&error=true"; }

        stageDao.saveStage( stage );
        sessionStatus.setComplete();
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/add-checkpoint.html",
        method = RequestMethod.GET)
    public String addCheckpoint( @RequestParam Long planId,
        @RequestParam(value = "r", required = false) Long r,
        @RequestParam(value = "s", required = false) Long s, ModelMap models,
        HttpServletRequest request )
    {
        if( r != null && s != null )
        {
            models.put( "r", r );
            models.put( "s", s );
        }
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "checkpoint", new Checkpoint() );
        return "add_checkpoint";
    }

    @RequestMapping(value = "/admin/plan/add-checkpoint.html",
        method = RequestMethod.POST)
    public String addCheckpoint(
        @ModelAttribute("checkpoint") Checkpoint checkpoint,
        HttpServletRequest request, ModelMap models )
    {
        Long planId = Long.parseLong( request.getParameter( "planId" ) );

        if( request.getParameter( "runwayId" ) == ""
            || request.getParameter( "stageId" ) == "" ){ return "redirect:/admin/plan/add-checkpoint.html?planId="
            + planId; }

        Long runwayId = Long.parseLong( request.getParameter( "runwayId" ) );
        Long stageId = Long.parseLong( request.getParameter( "stageId" ) );

        FlightPlan plan = planDao.getFlightPlan( planId );
        List<Cell> cells = plan.getCells();
        boolean cellExists = false;

        for( Cell c : cells )
        {
            if( c.getRunway().getId().equals( runwayId )
                && c.getStage().getId().equals( stageId ) )
            {
                cellExists = true;
                c.getCheckpoints().add( checkpoint );
                break;
            }
        }

        if( !cellExists )
        {
            List<Checkpoint> checkpoints = new ArrayList<Checkpoint>();
            checkpoints.add( checkpoint );
            Cell cell = new Cell();
            cell.setFlightPlan( planDao.getFlightPlan( planId ) );
            cell.setRunway( runwayDao.getRunway( runwayId ) );
            cell.setStage( stageDao.getStage( stageId ) );
            cell.setCheckpoints( checkpoints );
            plan.getCells().add( cell );
        }

        planDao.saveFlightPlan( plan );
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-checkpoint.html",
        method = RequestMethod.GET)
    public String editCheckpoint( @RequestParam Long planId,
        @RequestParam Long cellId, @RequestParam Long id, ModelMap models )
    {
        models.put( "flightplan", planDao.getFlightPlan( planId ) );
        models.put( "cell", cellDao.getCell( cellId ) );
        models.put( "checkpoint", checkpointDao.getCheckPoint( id ) );
        return "edit_checkpoint";
    }

    @RequestMapping(value = "/admin/plan/publish.html",
        method = RequestMethod.GET)
    public String publish( ModelMap models, @RequestParam Long planId )
    {
        FlightPlan plan = planDao.getFlightPlan( planId );
        plan.setPublished( true );
        planDao.saveFlightPlan( plan );
        return "redirect:/plan/view/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/save-checkpoint.html",
        method = RequestMethod.POST)
    public String saveCheckpoint(
        @ModelAttribute("checkpoint") Checkpoint checkpoint,
        HttpServletRequest request, ModelMap models, SessionStatus sessionStatus ) throws Exception
    {
        Long chkId = Long.parseLong( request.getParameter( "chkId" ) );
        Long planId = Long.parseLong( request.getParameter( "planId" ) );
        Long cellId = Long.parseLong( request.getParameter( "cellId" ) );
        Long runwayId = Long.parseLong( request.getParameter( "runwayId" ) );
        Long stageId = Long.parseLong( request.getParameter( "stageId" ) );

        FlightPlan plan = planDao.getFlightPlan( planId );
        List<Cell> cells = plan.getCells();
        boolean cellExists = false;
        Long newCellId = null;

        for( Cell c : cells )
        {
            if( c.getRunway().getId().equals( runwayId )
                && c.getStage().getId().equals( stageId ) )
            {
                cellExists = true;
                newCellId = c.getId();
            }
        }

        // Remove checkpoint from previous Cell.
        // Only if it was in a different Cell.
        if( newCellId!=null && !newCellId.equals( cellId ) )
        {
            
            
            /*
            int cellIndex = cells.indexOf( cellDao.getCell( cellId ) );
            Cell oldCell = cells.get( cellIndex );
            
            int oldIndex = oldCell.getCheckpoints().indexOf(
                checkpointDao.getCheckPoint( chkId ) );
            
            oldCell.getCheckpoints().remove( oldIndex );
            cells.set(cellIndex, oldCell);
            */
            
            
            
            for( Cell c : cells )
            {
                if( c.getId().equals( cellId ) )
                {
                    int index = c.getCheckpoints().indexOf(
                        checkpointDao.getCheckPoint( chkId ) );
                    c.getCheckpoints().remove( index );
                    planDao.saveFlightPlan( plan );
                    throw new Exception("Checkpoint removed in same cell." + " index="+index + " ");
                    //break;
                }
            }
            
        }

        // Check if cell exists

        if( cellExists )
        {            
            for( Cell c : cells )
            {
                if( c.getRunway().getId().equals( runwayId )
                    && c.getStage().getId().equals( stageId ) )
                {
                    int currentIndex = c.getCheckpoints().indexOf(
                        checkpointDao.getCheckPoint( chkId ) );
                    
                    if(currentIndex < 0) { // Add the checkpoint to new cell
                        c.getCheckpoints().add(checkpoint);
                    }
                    else {// Get index of the checkpoint and update it 
                        c.getCheckpoints().set( currentIndex, checkpoint );
                        // throw new Exception("Checkpoint updated in same cell." + " index="+currentIndex + " ");
                        // throw new Exception("Error in updating the checkpoint. No checkpoint with id " + chkId + " is found in Cell. Using parameters newCellId=" + newCellId + " cellId=" + cellId + " index="+index);
                    }
                    break;
                }
            }
        }
        else
        {
            
            // throw new Exception("IN ELSE");
            List<Checkpoint> checkpoints = new ArrayList<Checkpoint>();
            checkpoints.add( checkpoint );
            Cell cell = new Cell();
            cell.setFlightPlan( planDao.getFlightPlan( planId ) );
            cell.setRunway( runwayDao.getRunway( runwayId ) );
            cell.setStage( stageDao.getStage( stageId ) );
            cell.setCheckpoints( checkpoints );
            plan.getCells().add( cell );
        }
        
        planDao.saveFlightPlan( plan );
        sessionStatus.setComplete();
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-checkpoint.html",
        method = RequestMethod.GET)
    public String removeCheckpoint( @RequestParam Long id,
        @RequestParam Long cellId, @RequestParam Long planId )
    {
        Cell cell = cellDao.getCell( cellId );
        cell.getCheckpoints().remove( checkpointDao.getCheckPoint( id ) );
        cellDao.saveCell( cell );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-runway.html",
        method = RequestMethod.GET)
    public String removeRunway( @RequestParam Long rid,
        @RequestParam Long planId )
    {
        FlightPlan flightplan = planDao.getFlightPlan( planId );
        flightplan.getRunways().remove( runwayDao.getRunway( rid ) );
        planDao.saveFlightPlan( flightplan );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-stage.html",
        method = RequestMethod.GET)
    public String removeStage( @RequestParam Long sid, @RequestParam Long planId )
    {
        FlightPlan flightplan = planDao.getFlightPlan( planId );

        Stage s = stageDao.getStage( sid );
        // stageDao.removeStage( s );
        flightplan.getStages().remove( s );
        planDao.saveFlightPlan( flightplan );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/reorder-stages.html",
        method = RequestMethod.POST)
    public void reorderStages( HttpServletRequest request,
        HttpServletResponse response )
    {
        try
        {
            PrintWriter out = response.getWriter();
            Long planId = Long.parseLong( request.getParameter( "planId" ) );
            FlightPlan plan = planDao.getFlightPlan( planId );
            String[] stageIds = request.getParameterValues( "stageIds[]" );
            List<Stage> stages = new ArrayList<Stage>();

            for( String sid : stageIds )
            {
                stages.add( stageDao.getStage( Long.parseLong( sid ) ) );
            }
            plan.setStages( stages );
            planDao.saveFlightPlan( plan );
            out.println( "Stage re-ordered successfully." );

        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/admin/plan/reorder-runways.html",
        method = RequestMethod.POST)
    public void reorderRunways( HttpServletRequest request,
        HttpServletResponse response )
    {
        try
        {

            PrintWriter out = response.getWriter();
            response.setContentType( "text/plain" );
            Long planId = Long.parseLong( request.getParameter( "planId" ) );
            FlightPlan plan = planDao.getFlightPlan( planId );
            String[] runwayIds = request.getParameterValues( "runwayIds[]" );
            List<Runway> runways = new ArrayList<Runway>();

            for( String rid : runwayIds )
            {
                runways.add( runwayDao.getRunway( Long.parseLong( rid ) ) );
            }
            plan.setRunways( runways );
            planDao.saveFlightPlan( plan );
            out.println( "Runway re-ordered successfully." );

        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/admin/plan/reorder-checkpoints.html",
        method = RequestMethod.POST)
    public void reorderCheckpoints( HttpServletRequest request,
        HttpServletResponse response )
    {
        try
        {

            PrintWriter out = response.getWriter();
            response.setContentType( "text/plain" );
            // Long planId = Long.parseLong( request.getParameter( "planId" ) );
            // FlightPlan plan = planDao.getFlightPlan( planId );
            Long cellId = Long.parseLong( request.getParameter( "cellId" ) );
            String[] checkpointIds = request.getParameterValues( "checkpointIds[]" );
            Cell cell = cellDao.getCell( cellId );
            List<Checkpoint> checkpoints = new ArrayList<Checkpoint>();

            for( String s : checkpointIds )
                checkpoints.add( checkpointDao.getCheckPoint( Long.parseLong( s ) ) );

            cell.setCheckpoints( checkpoints );
            cellDao.saveCell( cell );
            out.println( "Checkpoints re-ordered successfully." );

        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/plan/add-milestone-comment.html",
        method = RequestMethod.GET)
    public String addMilestoneComment( HttpServletRequest request )
    {
        return "add_milestone_comment";
    }

}
