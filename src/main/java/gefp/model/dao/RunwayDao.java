package gefp.model.dao;

import gefp.model.FlightPlan;
import gefp.model.Runway;

import java.util.List;

public interface RunwayDao {

    Runway getRunway( Long id );

    List<Runway> getRunways();

    Runway saveRunway( Runway runway );
    
    void deleteRunwayFromFlightPlan(Runway runway, FlightPlan plan);

}
