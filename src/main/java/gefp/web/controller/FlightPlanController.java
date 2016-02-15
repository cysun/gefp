package gefp.web.controller;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;
import gefp.model.Comment;
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

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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

@Controller
@SessionAttributes({ "checkpoint", "stage", "runway", "flightplan", "comment" })
public class FlightPlanController {

    private static final Logger logger = LoggerFactory.getLogger( FlightPlanController.class );

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

    @RequestMapping("/admin/list-plans.html")
    public String listplans( ModelMap models )
    {
        models.put( "plans", planDao.getFlightPlans() );
        return "list_plans";
    }

    @RequestMapping("/plan/view/{id}.html")
    public String viewplan( @PathVariable Long id, ModelMap models,
        @RequestParam(required = false) String showStats )
    {
        FlightPlan fp = planDao.getFlightPlan( id );

        if( fp != null )
        {
            if( showStats != null && showStats.equals( "true" ) )
            {
                for( Cell cl : fp.getCells() )
                    for( Checkpoint cp : cl.getCheckpoints() )
                        cp.setTotal( planDao.getUsersWhoCheckedCheckpoint( cp )
                            .size() );
            }

            models.put( "showStats", showStats );
            models.put( "comment", new Comment() );
            models.put( "plan", fp );
            return "view_plan";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping("/plan/edit-info/{id}.html")
    public String editPlanInfo( @PathVariable Long id, ModelMap models )
    {
        FlightPlan fp = planDao.getFlightPlan( id );

        if( fp != null )
        {
            models.put( "flightplan", fp );
            return "edit_plan_info";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping(value = "/plan/edit-info/{id}.html",
        method = RequestMethod.POST)
    public String savePlanInfo( @PathVariable Long id,
        @ModelAttribute("flightplan") FlightPlan flightplan,
        HttpServletRequest request )
    {
        String seasonName = request.getParameter( "seasonName" );
        String seasonYear = request.getParameter( "seasonYear" );
        flightplan.setSeasonName( seasonName );
        flightplan.setSeasonYear( seasonYear );
        planDao.saveFlightPlan( flightplan );
        return "redirect:/plan/edit/" + id + ".html";
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
        User currUserObj = userDao.getUser( id );

        if( currUserObj != null )
        {
            models.put( "currUserObj", currUserObj );
            FlightPlan plan = null;
            boolean student_mode = true;
            if( currUserObj.getFlightPlan() != null )
            {
                plan = planDao.getFlightPlan( currUserObj.getFlightPlan()
                    .getId() );
            }
            models.put( "student_mode", student_mode );
            models.put( "plan", plan );
            return "view_plan";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/plan/clone.html", method = RequestMethod.GET)
    public String clonePlan( @RequestParam Long planId, ModelMap models )
    {
        FlightPlan flightPlan = planDao.getFlightPlan( planId );

        if( flightPlan != null )
        {
            flightPlan.setName( "Copy Of " + flightPlan.getName() );
            models.put( "flightplan", flightPlan );
            models.put( "departments", deptDao.getDepartments() );
            return "clone_flightplan";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping(value = "/plan/clone.html", method = RequestMethod.POST)
    public String clonePlan( @RequestParam Long planId,
        HttpServletRequest request, SessionStatus sessionStatus,
        Principal principal )
    {
        if( request.getParameter( "name" ).isEmpty()
            || request.getParameter( "department" ).isEmpty() ){ return "redirect:/plan/clone.html?planId="
            + planId + "&error=true"; }

        FlightPlan flightplan = planDao.getFlightPlan( planId );
        Department department = deptDao.getDepartment( Integer.parseInt( request.getParameter( "department" ) ) );

        FlightPlan newPlan = flightplan.clone();
        newPlan.setName( request.getParameter( "name" ) );
        newPlan.setSeasonName( request.getParameter( "seasonName" ) );
        newPlan.setSeasonYear( request.getParameter( "seasonYear" ) );
        newPlan.setDepartment( department );
        newPlan = planDao.saveFlightPlan( newPlan );
        sessionStatus.setComplete();
        department.getPlans().add( newPlan );
        deptDao.saveDepartment( department );

        logger.info( "User " + principal.getName() + " cloned Flightplan "
            + flightplan.getName() );
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
        HttpServletRequest request, Principal principal )
    {
        Integer departmentId = Integer.parseInt( request.getParameter( "departmentId" ) );
        Department department = deptDao.getDepartment( departmentId );
        flightplan.setDepartment( department );
        FlightPlan flightplan2 = planDao.saveFlightPlan( flightplan );
        department.getPlans().add( flightplan2 );
        deptDao.saveDepartment( department );
        logger.info( "User " + principal.getName() + " added Flightplan \""
            + flightplan.getName() + "\" in department " + department.getName() );
        return "redirect:/plan/edit/" + flightplan2.getId() + ".html";
    }

    @RequestMapping(value = "/plan/saveStudentCheckpoint.html",
        method = RequestMethod.GET)
    public void saveStudentCheckpoint( ModelMap models,
        HttpServletRequest request, HttpServletResponse response,
        PrintWriter out, HttpSession session, Principal principal )
    {

        if( request.getParameter( "userId" ) == ""
            || request.getParameter( "userId" ) == null )
        {
            System.out.println( "User ID is null" );
            return;
        }

        Long userId = Long.parseLong( request.getParameter( "userId" ) );
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
                CheckpointInfo cinfo = new CheckpointInfo( c, message );
                currUserObj.getCheckpointsInfo().add( cinfo );
                logger.info( "User " + principal.getName()
                    + " checked a Milestone (ID: " + id + " ) for "
                    + currUserObj.getUsername() );
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
                logger.info( "User " + principal.getName()
                    + " Unchecked a Milestone (ID: " + id + " ) for "
                    + currUserObj.getUsername() );
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
        @RequestParam Long planId, ModelMap models, HttpSession session,
        Principal principal )
    {
        if( runway.getName().isEmpty() ){ return "redirect:/admin/plan/add-runway.html?planId="
            + planId + "&error=true"; }
        FlightPlan plan = planDao.getFlightPlan( planId );
        Runway newRunway = runwayDao.saveRunway( runway );
        plan.getRunways().add( newRunway );
        planDao.saveFlightPlan( plan );
        logger.info( "User " + principal.getName() + " added a new Runway ("
            + newRunway.getName() + ") to flightplan " + plan.getName() );
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-runway.html",
        method = RequestMethod.GET)
    public String editRunway( @RequestParam Long id, @RequestParam Long planId,
        ModelMap models, HttpServletRequest request )
    {
        FlightPlan flightPlan = planDao.getFlightPlan( planId );
        Runway runway = runwayDao.getRunway( id );

        if( flightPlan != null && runway != null )
        {

            models.put( "error", request.getParameter( "error" ) );
            models.put( "flightplan", flightPlan );
            models.put( "runway", runway );
            return "edit_runway";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/plan/edit-runway.html",
        method = RequestMethod.POST)
    public String editRunway( @ModelAttribute("runway") Runway runway,
        @RequestParam Long planId, ModelMap models,
        SessionStatus sessionStatus, Principal principal )
    {
        if( runway.getName().isEmpty() ){ return "redirect:/admin/plan/edit-runway.html?id="
            + runway.getId() + "&planId=" + planId + "&error=true"; }

        runwayDao.saveRunway( runway );
        logger.info( "User " + principal.getName()
            + " modified Runway title to " + runway.getName()
            + " in flightplan Id " + planId );
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
        @RequestParam Long planId, ModelMap models,
        SessionStatus sessionStatus, Principal principal )
    {

        if( stage.getName().isEmpty() ){ return "redirect:/admin/plan/add-stage.html?planId="
            + planId + "&error=true"; }

        FlightPlan plan = planDao.getFlightPlan( planId );
        Stage newStage = stageDao.saveStage( stage );
        plan.getStages().add( newStage );
        planDao.saveFlightPlan( plan );
        sessionStatus.setComplete();
        logger.info( "User " + principal.getName() + " added a new Stage ("
            + newStage.getName() + ") to flightplan " + plan.getName() );
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-stage.html",
        method = RequestMethod.GET)
    public String editStage( @RequestParam Long id, @RequestParam Long planId,
        ModelMap models, HttpServletRequest request )
    {

        FlightPlan flightPlan = planDao.getFlightPlan( planId );
        Stage stage = stageDao.getStage( id );

        if( flightPlan != null && stage != null )
        {
            models.put( "error", request.getParameter( "error" ) );
            models.put( "flightplan", planDao.getFlightPlan( planId ) );
            models.put( "stage", stageDao.getStage( id ) );
            return "edit_stage";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/plan/edit-stage.html",
        method = RequestMethod.POST)
    public String editStage( @ModelAttribute("stage") Stage stage,
        @RequestParam Long planId, ModelMap models,
        SessionStatus sessionStatus, Principal principal )
    {
        if( stage.getName().isEmpty() ){ return "redirect:/admin/plan/edit-stage.html?id="
            + stage.getId() + "&planId=" + planId + "&error=true"; }

        stageDao.saveStage( stage );
        sessionStatus.setComplete();
        logger.info( "User " + principal.getName()
            + " modified Stage title to " + stage.getName()
            + " in flightplan Id " + planId );
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
        HttpServletRequest request, ModelMap models, Principal principal )
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
            if( c.getRunway() != null && c.getStage() != null )
            {
                if( c.getRunway().getId().equals( runwayId )
                    && c.getStage().getId().equals( stageId ) )
                {
                    cellExists = true;
                    c.getCheckpoints().add( checkpoint );
                    break;
                }
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
        logger.info( "User " + principal.getName()
            + " added a new Milestone to " + plan.getName() );
        return "redirect:/plan/edit/" + plan.getId() + ".html";
    }

    @RequestMapping(value = "/admin/plan/edit-checkpoint.html",
        method = RequestMethod.GET)
    public String editCheckpoint( @RequestParam Long planId,
        @RequestParam Long cellId, @RequestParam Long id, ModelMap models )
    {

        FlightPlan flightPlan = planDao.getFlightPlan( planId );
        Cell cell = cellDao.getCell( cellId );
        Checkpoint checkpoint = checkpointDao.getCheckPoint( id );

        if( flightPlan != null && cell != null && checkpoint != null )
        {
            models.put( "flightplan", flightPlan );
            models.put( "cell", cell );
            models.put( "checkpoint", checkpoint );
            return "edit_checkpoint";
        }
        else
        {
            return "redirect:/404";
        }

    }

    @RequestMapping(value = "/admin/plan/publish.html",
        method = RequestMethod.GET)
    public String publish( ModelMap models, @RequestParam Long planId,
        Principal principal )
    {
        FlightPlan plan = planDao.getFlightPlan( planId );

        if( plan != null )
        {
            plan.setPublished( true );
            planDao.saveFlightPlan( plan );
            logger.info( "User " + principal.getName()
                + " Published Flightplan (" + plan.getName()
                + ") in department " + plan.getDepartment().getName() );
            return "redirect:/plan/view/" + planId + ".html";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/plan/unpublish.html",
        method = RequestMethod.GET)
    public String unpublish( ModelMap models, @RequestParam Long planId,
        Principal principal )
    {
        FlightPlan plan = planDao.getFlightPlan( planId );

        if( plan != null )
        {
            plan.setPublished( false );
            planDao.saveFlightPlan( plan );
            logger.info( "User " + principal.getName()
                + " Un-Published Flightplan (" + plan.getName()
                + ") in department " + plan.getDepartment().getName() );
            return "redirect:/plan/view/" + planId + ".html";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping(value = "/admin/plan/save-checkpoint.html",
        method = RequestMethod.POST)
    public String saveCheckpoint(
        @ModelAttribute("checkpoint") Checkpoint checkpoint,
        HttpServletRequest request, ModelMap models,
        SessionStatus sessionStatus, Principal principal ) throws Exception
    {
        Checkpoint original = checkpointDao.getCheckPoint( checkpoint.getId() );

        if( !original.getName().equals( checkpoint.getName() ) )
        {
            checkpoint.setParent( null );
        }

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
            if( c.getRunway() != null && c.getStage() != null )
            {
                if( c.getRunway().getId().equals( runwayId )
                    && c.getStage().getId().equals( stageId ) )
                {
                    cellExists = true;
                    newCellId = c.getId();
                }
            }
        }

        // Remove checkpoint from previous Cell.
        // Only if it was in a different Cell.
        if( !cellId.equals( newCellId ) )
        {
            /*
             * int cellIndex = cells.indexOf( cellDao.getCell( cellId ) ); Cell
             * oldCell = cells.get( cellIndex );
             * 
             * int oldIndex = oldCell.getCheckpoints().indexOf(
             * checkpointDao.getCheckPoint( chkId ) );
             * 
             * oldCell.getCheckpoints().remove( oldIndex ); cells.set(cellIndex,
             * oldCell);
             */

            for( Cell c : cells )
            {
                if( c.getId().equals( cellId ) )
                {
                    int index = c.getCheckpoints().indexOf(
                        checkpointDao.getCheckPoint( chkId ) );
                    c.getCheckpoints().remove( index );
                    planDao.saveFlightPlan( plan );
                    // throw new Exception("Checkpoint removed in same cell." +
                    // " index="+index + " ");
                    break;
                }
            }

        }

        // Check if cell exists

        if( cellExists )
        {
            for( Cell c : cells )
            {
                if( c.getRunway() != null && c.getStage() != null )
                {
                    if( c.getRunway().getId().equals( runwayId )
                        && c.getStage().getId().equals( stageId ) )
                    {
                        int currentIndex = c.getCheckpoints().indexOf(
                            checkpointDao.getCheckPoint( chkId ) );

                        if( currentIndex < 0 )
                        { // Add the checkpoint to new cell
                            c.getCheckpoints().add( checkpoint );
                        }
                        else
                        {// Get index of the checkpoint and update it
                            c.getCheckpoints().set( currentIndex, checkpoint );
                            // throw new
                            // Exception("Checkpoint updated in same cell." +
                            // " index="+currentIndex + " ");
                            // throw new
                            // Exception("Error in updating the checkpoint. No checkpoint with id "
                            // + chkId +
                            // " is found in Cell. Using parameters newCellId="
                            // +
                            // newCellId + " cellId=" + cellId +
                            // " index="+index);
                        }
                        break;
                    }
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
        logger.info( "User " + principal.getName() + " modified Milestone(ID: "
            + checkpoint.getId() + ") in " + plan.getName() );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-checkpoint.html",
        method = RequestMethod.GET)
    @PreAuthorize("authenticated hasRole('ADMIN')")
    public String removeCheckpoint( @RequestParam Long id,
        @RequestParam Long cellId, @RequestParam Long planId,
        Principal principal )
    {
        Checkpoint c = checkpointDao.getCheckPoint( id );
        FlightPlan plan = planDao.getFlightPlan( planId );
        Cell cell = cellDao.getCell( cellId );
        cell.getCheckpoints().remove( c );
        cellDao.saveCell( cell );
        c.setDeleted( true );
        checkpointDao.saveCheckPoint( c );
        logger.info( "User " + principal.getName() + " deleted Milestone(ID: "
            + id + ") in " + plan.getName() );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-runway.html",
        method = RequestMethod.GET)
    public String removeRunway( @RequestParam Long rid,
        @RequestParam Long planId, Principal principal )
    {
        Runway r = runwayDao.getRunway( rid );
        FlightPlan flightplan = planDao.getFlightPlan( planId );

        r.setDeleted( true );
        runwayDao.saveRunway( r );
        runwayDao.deleteRunwayFromFlightPlan( r, flightplan );
        cellDao.deleteCells( r );

        // flightplan.getRunways().remove( r );
        // planDao.saveFlightPlan( flightplan );
        logger.info( "User " + principal.getName() + " deleted Runway(ID: "
            + rid + ") in " + flightplan.getName() );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/remove-stage.html",
        method = RequestMethod.GET)
    public String removeStage( @RequestParam Long sid,
        @RequestParam Long planId, Principal principal )
    {
        FlightPlan flightplan = planDao.getFlightPlan( planId );

        Stage s = stageDao.getStage( sid );
        s.setDeleted( true );
        cellDao.deleteCells( s );
        // stageDao.removeStage( s );
        // flightplan.getStages().remove( s );
        // planDao.saveFlightPlan( flightplan );
        stageDao.saveStage( s );
        stageDao.deleteStageFromFlightPlan( s, flightplan );
        logger.info( "User " + principal.getName() + " deleted Stage(ID: "
            + sid + ") in " + flightplan.getName() );
        return "redirect:/plan/edit/" + planId + ".html";
    }

    @RequestMapping(value = "/admin/plan/reorder-stages.html",
        method = RequestMethod.POST)
    public void reorderStages( HttpServletRequest request,
        HttpServletResponse response, Principal principal )
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
            logger.info( "User " + principal.getName()
                + " Re-Ordered Stages in " + plan.getName() );
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
        HttpServletResponse response, Principal principal )
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
            logger.info( "User " + principal.getName()
                + " Re-Ordered Runways in " + plan.getName() );
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
        HttpServletResponse response, Principal principal )
    {
        try
        {

            PrintWriter out = response.getWriter();
            response.setContentType( "text/plain" );
            // Long planId = Long.parseLong( request.getParameter( "planId" ) );
            // FlightPlan plan = planDao.getFlightPlan( planId );
            System.out.println( request.getParameter( "cellId" ) );
            Long cellId = Long.parseLong( request.getParameter( "cellId" ) );
            String[] checkpointIds = request.getParameterValues( "checkpointIds[]" );
            Cell cell = cellDao.getCell( cellId );
            List<Checkpoint> checkpoints = new ArrayList<Checkpoint>();

            for( String s : checkpointIds )
                checkpoints.add( checkpointDao.getCheckPoint( Long.parseLong( s ) ) );

            cell.setCheckpoints( checkpoints );
            cellDao.saveCell( cell );
            logger.info( "User " + principal.getName()
                + " Re-Ordered Milestones in " + cell.getFlightPlan().getName() );
            out.println( "Checkpoints re-ordered successfully." );

        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/plan/milestone/add-comment.html",
        method = RequestMethod.GET)
    public String addMilestoneComment( ModelMap models,
        @RequestParam Long planId, @RequestParam Long checkpointId,
        @RequestParam Long userId, HttpSession session )
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
        models.put( "comments", cinfo.getComments() );
        // return "add_milestone_comment";
        return "comments_page";
    }

    @RequestMapping(value = "/plan/milestone/add-comment.html",
        method = RequestMethod.POST)
    public String saveStudentCheckpointComment(
        @ModelAttribute("comment") Comment comment, ModelMap models,
        HttpServletRequest request, HttpServletResponse response,
        PrintWriter out, HttpSession session, Principal principal,
        SessionStatus status )
    {

        User loginUser = (User) session.getAttribute( "loggedInUser" );

        if( request.getParameter( "userId" ) == ""
            || request.getParameter( "userId" ) == null )
        {
            System.out.println( "User ID is null" );
            return "redirect:/404";
        }

        Long planId = Long.parseLong( request.getParameter( "planId" ) );
        Long userId = Long.parseLong( request.getParameter( "userId" ) );
        User currUserObj = userDao.getUser( userId );

        Long checkpointId = Long.parseLong( request.getParameter( "checkpointId" ) );
        // String message = request.getParameter( "message" );

        if( checkpointId != null )
        {
            comment.setCommentedBy( loginUser );
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
            status.setComplete();
            /*
             * logger.info( "User " + principal.getName() +
             * " checked a Milestone (ID: " + checkpointId + " ) for " +
             * currUserObj.getUsername() );
             */
        }

        if( loginUser.isAdmin() || loginUser.isAdvisor() )
        {
            return "redirect:/plan/milestone/add-comment.html?userId=" + userId
                + "&checkpointId=" + checkpointId + "&planId=" + planId;
            // return "redirect:/advisor/view-student-plan/" + userId + ".html";
        }
        else
        {
            return "redirect:/plan/milestone/add-comment.html?userId=" + userId
                + "&checkpointId=" + checkpointId + "&planId=" + planId;
            // return "redirect:/student/view-plan/" + userId + ".html";
        }
    }

    @RequestMapping(value = "/admin/plan/delete.html",
        method = RequestMethod.GET)
    public String deleteFlightplan( @RequestParam Long planId,
        Principal principal )
    {
        FlightPlan plan = planDao.getFlightPlan( planId );
        plan.setDeleted( true );
        planDao.saveFlightPlan( plan );
        cellDao.deleteCells( plan );
        logger.info( "User " + principal.getName() + " deleted flight plan: "
            + plan.getName() );
        return "redirect:/admin/list-plans.html";
    }

    @RequestMapping(value = "/plan/statistics-details.html",
        method = RequestMethod.GET)
    public String planStats( @RequestParam Long planId,
        @RequestParam Long checkpointId, Principal principal, ModelMap models )
    {
        FlightPlan fp = planDao.getFlightPlan( planId );

        if( fp != null )
        {
            Checkpoint cp = checkpointDao.getCheckPoint( checkpointId );
            List<User> usersInCheckpoint = planDao.getUsersWhoCheckedCheckpoint( cp );
            models.put( "plan", fp );
            models.put( "checkpoint", cp );
            models.put( "cp_users", usersInCheckpoint );
            return "statistics-details-page";
        }
        else
        {
            return "redirect:/404";
        }
    }

    @RequestMapping("/plan/print/{id}.html")
    public String printFLightPlan( @PathVariable Long id, ModelMap models )
    {
        FlightPlan fp = planDao.getFlightPlan( id );

        if( fp != null )
        {
            models.put( "plan", fp );
            return "print_plan";
        }
        else
        {
            return "redirect:/404";
        }

    }

}
