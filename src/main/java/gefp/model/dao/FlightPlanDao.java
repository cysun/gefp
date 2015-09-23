package gefp.model.dao;

import gefp.model.Checkpoint;
import gefp.model.FlightPlan;
import gefp.model.User;

import java.util.List;

public interface FlightPlanDao {

    FlightPlan getFlightPlan( Long id );

    List<FlightPlan> getFlightPlans();

    FlightPlan saveFlightPlan( FlightPlan flightplan );
    
    List<User> getUsersWhoCheckedCheckpoint(Checkpoint checkpoint);

    FlightPlan findParent( FlightPlan p1, FlightPlan p2 );
}
