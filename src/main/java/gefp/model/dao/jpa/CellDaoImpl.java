package gefp.model.dao.jpa;

import gefp.model.Cell;
import gefp.model.dao.CellDao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CellDaoImpl implements CellDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Cell getCell( Long id )
    {
        try
        {
            return entityManager.find( Cell.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Cell saveCell( Cell Cell )
    {
        return entityManager.merge( Cell );
    }

}
