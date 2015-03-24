package gefp.model.dao.jpa;

import gefp.model.Stages;
import gefp.model.dao.StagesDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class StagesDaoImpl implements StagesDao {
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
    public Stages getStage( Integer id )
    {
		try {
			return entityManager.find( Stages.class, id );
		}
		catch(NoResultException nre) {
			return null;
		}
    }

    @Override
    public List<Stages> getStages()
    {
    	try {
    		return entityManager.createQuery( "from Stages order by order_num", Stages.class )
                .getResultList();
    	}
    	catch(NoResultException nre) {
			return null;
		}
    }

	@Override
	@Transactional
	public Stages saveStage(Stages Stage) {
		return entityManager.merge(Stage);
	}
	
}
