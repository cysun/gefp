package gefp.model.dao;

import gefp.model.FlightPlan;

import java.util.List;

public interface FlightPlanDao {

    FlightPlan getFlightPlan( Long id );

    List<FlightPlan> getFlightPlans();

    FlightPlan saveFlightPlan( FlightPlan flightplan );
}
