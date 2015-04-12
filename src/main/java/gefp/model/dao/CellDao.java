package gefp.model.dao;

import gefp.model.Cell;

public interface CellDao {

    Cell getCell( Long id );

    Cell saveCell( Cell cell );

}
