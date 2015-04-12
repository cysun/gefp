package gefp.model.dao.jpa;

import gefp.model.Runway;
import gefp.model.dao.RunwayDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class RunwayDaoImpl implements RunwayDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Runway getRunway( Long id )
    {
        try
        {
            return entityManager.find( Runway.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public List<Runway> getRunways()
    {
        try
        {
            return entityManager.createQuery( "from Runway order by order_num",
                Runway.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Runway saveRunway( Runway runway )
    {
        return entityManager.merge( runway );
    }

}
