package gefp.model.dao.jpa;

import gefp.model.Role;
import gefp.model.dao.RoleDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl implements RoleDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Role getRole( Integer id )
    {
        try
        {
            return entityManager.find( Role.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public List<Role> getRoles()
    {
        try
        {
            return entityManager.createQuery( "from Role order by id",
                Role.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

}
