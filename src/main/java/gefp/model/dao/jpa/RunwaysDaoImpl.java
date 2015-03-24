package gefp.model.dao.jpa;

import gefp.model.Runways;
import gefp.model.dao.RunwaysDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class RunwaysDaoImpl implements RunwaysDao {
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
    public Runways getRunway( Integer id )
    {
		try {
			return entityManager.find( Runways.class, id );
		}
		catch(NoResultException nre) {
			return null;
		}
    }

    @Override
    public List<Runways> getRunways()
    {
    	try {
    		return entityManager.createQuery( "from Runways order by order_num", Runways.class )
                .getResultList();
    	}
    	catch(NoResultException nre) {
			return null;
		}
    }   
    
	@Override
	@Transactional
	public Runways saveRunway(Runways runway) {
		return entityManager.merge(runway);
	}
	
}
