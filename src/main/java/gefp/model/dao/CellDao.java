package gefp.model.dao;

import gefp.model.Cell;
import gefp.model.FlightPlan;
import gefp.model.Runway;
import gefp.model.Stage;

public interface CellDao {

    Cell getCell( Long id );

    void deleteCells( Runway r );
    
    void deleteCells( Stage s );
    
    void deleteCells( FlightPlan plan );
    
    Cell saveCell( Cell cell );

}
