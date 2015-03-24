package gefp.model.dao.jpa;

import gefp.model.CheckPoint;
import gefp.model.User;
import gefp.model.dao.CheckPointDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class CheckPointDaoImpl implements CheckPointDao {
	
	@PersistenceContext
    private EntityManager entityManager;
	
	
	@Override
    public CheckPoint getCheckPoint( Integer id )
    {
		try {
			return entityManager.find( CheckPoint.class, id );
		}
		catch(NoResultException nre) {
			return null;
		}
    }

    @Override
    public List<CheckPoint> getCheckPoints()
    {
    	try {
    		return entityManager.createQuery( "from CheckPoint order by id", CheckPoint.class )
                .getResultList();
    	}
    	catch(NoResultException nre) {
			return null;
		}
    }

	@Override
	@Transactional
	public CheckPoint saveCheckPoint(CheckPoint checkpoint) {
		return entityManager.merge(checkpoint);
	}
	
	@Override
    public List<CheckPoint> getCheckPointsInPlan( Integer plan_id )
    {
		try {
			return entityManager.createQuery("from CheckPoint where plan_id = " + plan_id, CheckPoint.class )
					.getResultList();
    	}
    	catch(NoResultException nre) {
			return null;
		}
		
    }

    @Override
    public List<CheckPoint> getCheckPointsForUser( Integer user_id, Integer plan_id )
    {
    	try {
    		return entityManager.createQuery("from Users where user_id = " + user_id, User.class )
    			.getSingleResult().getCheckpoints();
	    }
		catch(NoResultException nre) {
			return null;
		}
    	
    }
	
}
