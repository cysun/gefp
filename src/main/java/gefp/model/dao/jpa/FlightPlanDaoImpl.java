package gefp.model.dao.jpa;

import gefp.model.FlightPlan;
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
        return entityManager.createQuery( "from FlightPlan where deleted = 'f' order by id",
            FlightPlan.class ).getResultList();
    }

    @Override
    @Transactional
    public FlightPlan saveFlightPlan( FlightPlan flightplan )
    {

        return entityManager.merge( flightplan );
    }

}
