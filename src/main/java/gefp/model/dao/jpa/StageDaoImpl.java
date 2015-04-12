package gefp.model.dao.jpa;

import gefp.model.Stage;
import gefp.model.dao.StageDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

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
            return entityManager.createQuery( "from Stage order by order_num",
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

}
