package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Cell;
import gefp.model.FlightPlan;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.dao.CellDao;

@Repository
public class CellDaoImpl implements CellDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Cell getCell( Long id )
    {
        try
        {
            return entityManager.find( Cell.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Cell saveCell( Cell Cell )
    {
        return entityManager.merge( Cell );
    }

    @Override
    @Transactional
    public void deleteCells( Runway r )
    {
        String query = "update cells set deleted = true where runway_id = " + r.getId();
        entityManager.createNativeQuery( query );
    }

    @Override
    @Transactional
    public void deleteCells( Stage s )
    {
        String query = "update cells set deleted = true where stage_id = " + s.getId();
        entityManager.createNativeQuery( query );
    }

    @Override
    @Transactional
    public void deleteCells( FlightPlan plan )
    {
        String query = "update cells set deleted = true where flightplan_id = " + plan.getId();
        entityManager.createNativeQuery( query );
    }

    @Override
    public Cell getCell( Long runway_id, Long stage_id )
    {
        List<Cell> cells = entityManager.createQuery(
            "from Cell where runway_id = :runway_id and stage_id = :stage_id", Cell.class )
            .setParameter( "runway_id", runway_id )
            .setParameter( "stage_id", stage_id )
            .getResultList();
        return cells.size() == 0 ? null : cells.get( 0 );
    }

}
