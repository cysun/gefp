package gefp.model.dao.jpa;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.FlightPlan;
import gefp.model.Stage;
import gefp.model.dao.StageDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class StageDaoImpl implements StageDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Stage getStage( Long id )
    {
        try
        {
            return entityManager.find( Stage.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public List<Stage> getStages()
    {
        try
        {
            return entityManager.createQuery( "from Stage where deleted = 'f' order by order_num",
                Stage.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Stage saveStage( Stage Stage )
    {
        return entityManager.merge( Stage );
    }

    @Override
    @Transactional
    @PreAuthorize("authenticated and hasRole('ADMIN')")
    public void removeStage( Stage stage )
    {
        // fetch all cells having this stage.
        // delete all the checkpoints in all the cells having the stage.
        // delete all the cells.
        // delete the stage.

        List<Cell> cells = entityManager.createQuery(
            "from Cell where stage_id = " + stage.getId(), Cell.class )
            .getResultList();

        for( Cell c : cells )
        {
            @SuppressWarnings("unchecked")
            List<Checkpoint> checkpoints = entityManager.createNativeQuery(
                "SELECT * FROM cell_checkpoints WHERE cell_id = " + c.getId(),
                Checkpoint.class ).getResultList();

            for( Checkpoint chk : checkpoints )
            {
                entityManager.remove( chk );
            }

            entityManager.remove( c );

        }

        entityManager.remove( stage );

    }
    
    @Override
    @Transactional
    public void deleteStageFromFlightPlan( Stage stage, FlightPlan plan )
    {
        String query = "delete from flightplan_stages where flightplan_id = :flightplan_id and stage_id = :stage_id";
        entityManager.createNativeQuery( query )
            .setParameter( "stage_id", stage.getId() )
            .setParameter( "flightplan_id", plan.getId() ).executeUpdate();

    }

}
