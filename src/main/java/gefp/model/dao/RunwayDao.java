package gefp.model.dao;

import gefp.model.Runway;

import java.util.List;

public interface RunwayDao {

    Runway getRunway( Long id );

    List<Runway> getRunways();

    Runway saveRunway( Runway runway );

}
