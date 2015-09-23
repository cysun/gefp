package gefp.model.dao.jpa;

import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;
import gefp.model.User;
import gefp.model.dao.CheckpointDao;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
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
            return entityManager.createQuery( "from Checkpoint where deleted = 'f' order by id",
                Checkpoint.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    @PreAuthorize("authenticated and hasRole('ADMIN')")
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
                "from Checkpoint where deleted = 'f' and plan_id = " + plan_id, Checkpoint.class )
                .getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }

    }

    @Override
    public Set<CheckpointInfo> getCheckPointsForUser( Long user_id,
        Long plan_id )
    {
        try
        {
            return entityManager.createQuery(
                "from User where user_id = " + user_id, User.class )
                .getSingleResult()
                .getCheckpointsInfo();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }
    
    @Override
    public boolean hasConnectionLink( Checkpoint c1, Checkpoint c2 )
    {
        Checkpoint cp1 = c1;
        Checkpoint cp2 = c2;
        
        if(c1.getParent() == null && c2.getParent() == null) {
            return false;
        }
        else {
            
            while(cp1.getParent() != null) {
                if(cp1.getParent().getId().equals(c2.getId())) {
                    //System.out.println("1--");
                    //System.out.println(c2.getId() + " is parent of " + c1.getId());
                    return true;
                }
                cp1 = cp1.getParent();
            }
            
            while(cp2.getParent() != null) {
                if(cp2.getParent().getId().equals(c1.getId())) {
                    //System.out.println("2--");
                    //System.out.println(c1.getId() + " is parent of " + c2.getId());
                    return true;
                }
                cp2 = cp2.getParent();
            }
        }
        return false;
    }

}
