package gefp.model.dao;

import gefp.model.Runways;

import java.util.List;

public interface RunwaysDao {
	
	Runways getRunway( Integer id );

    List<Runways> getRunways();
    
    Runways saveRunway(Runways runway);
    
}
