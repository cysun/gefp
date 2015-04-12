package gefp.model.dao.jpa;

import gefp.model.Checkpoint;
import gefp.model.User;
import gefp.model.dao.CheckpointDao;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CheckpointDaoImpl implements CheckpointDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Checkpoint getCheckPoint( Long id )
    {
        try
        {
            return entityManager.find( Checkpoint.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public List<Checkpoint> getCheckPoints()
    {
        try
        {
            return entityManager.createQuery( "from Checkpoint order by id",
                Checkpoint.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Checkpoint saveCheckPoint( Checkpoint checkpoint )
    {
        return entityManager.merge( checkpoint );
    }

    @Override
    public List<Checkpoint> getCheckPointsInPlan( Long plan_id )
    {
        try
        {
            return entityManager.createQuery(
                "from Checkpoint where plan_id = " + plan_id, Checkpoint.class )
                .getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }

    }

    @Override
    public Set<Checkpoint> getCheckPointsForUser( Long user_id,
        Long plan_id )
    {
        try
        {
            return entityManager.createQuery(
                "from User where user_id = " + user_id, User.class )
                .getSingleResult()
                .getCheckpoints();
        }
        catch( NoResultException nre )
        {
            return null;
        }

    }

}
