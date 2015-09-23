package gefp.model.dao.jpa;

import gefp.model.Checkpoint;
import gefp.model.FlightPlan;
import gefp.model.User;
import gefp.model.dao.FlightPlanDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class FlightPlanDaoImpl implements FlightPlanDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @PostAuthorize("returnObject != null && (returnObject.published == true or hasRole('ADMIN'))")
    public FlightPlan getFlightPlan( Long id )
    {
        return entityManager.find( FlightPlan.class, id );
    }

    @Override
    public List<FlightPlan> getFlightPlans()
    {
        return entityManager.createQuery(
            "from FlightPlan where deleted = 'f' order by id", FlightPlan.class )
            .getResultList();
    }

    @Override
    @Transactional
    @PreAuthorize("authenticated and hasRole('ADMIN')")
    public FlightPlan saveFlightPlan( FlightPlan flightplan )
    {

        return entityManager.merge( flightplan );
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getUsersWhoCheckedCheckpoint( Checkpoint checkpoint )
    {

        String query = "select u.* from checkpoint_info as ci join user_checkpoints_info as uci "
            + "ON ci.id = uci.checkpoint_info_id join users as u ON u.id=uci.user_id "
            + "WHERE ci.checkpoint_id = :checkpoint_id GROUP BY u.id";
        return entityManager.createNativeQuery( query, User.class )
            .setParameter( "checkpoint_id", checkpoint.getId() )
            .getResultList();
    }

    @Override
    public FlightPlan findParent( FlightPlan p1, FlightPlan p2 )
    {
        FlightPlan pl1 = p1;
        FlightPlan pl2 = p2;

        if( p1.getParent() == null && p2.getParent() == null )
        {
            return null;
        }
        else
        {

            while( pl1.getParent() != null )
            {
                if( pl1.getParent().getId().equals( p2.getId() ) )
                {
                    /*System.out.println( "1--" );
                    System.out.println( p2.getId() + " is parent of "
                        + p1.getId() );*/
                    return p2;
                }
                pl1 = pl1.getParent();
            }

            while( pl2.getParent() != null )
            {
                if( pl2.getParent().getId().equals( p1.getId() ) )
                {
                    /*System.out.println( "2--" );
                    System.out.println( p1.getId() + " is parent of "
                        + p2.getId() );*/
                    return p1;
                }
                pl2 = pl2.getParent();
            }
        }
        return null;
    }

}
