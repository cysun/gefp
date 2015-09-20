package gefp.model.dao.jpa;

import gefp.model.Checkpoint;
import gefp.model.FlightPlan;
import gefp.model.User;
import gefp.model.dao.FlightPlanDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PostAuthorize;
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
    public FlightPlan saveFlightPlan( FlightPlan flightplan )
    {

        return entityManager.merge( flightplan );
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getUsersWhoCheckedCheckpoint( Checkpoint checkpoint )
    {

        String query = "select u.* from checkpoint_info as ci join user_checkpoints_info as uci ON ci.id = uci.checkpoint_info_id join users as u on u.id=uci.user_id where ci.checkpoint_id = :checkpoint_id";
        return entityManager.createNativeQuery( query, User.class )
            .setParameter( "checkpoint_id", checkpoint.getId() )
            .getResultList();
    }

}
