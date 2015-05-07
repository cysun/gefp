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
    public Role getRole( String roleName )
    {
        List<Role> roles = entityManager.createQuery(
            "from Role where name = :roleName", Role.class )
            .setParameter( "roleName", roleName )
            .getResultList();
        return roles.size() == 0 ? null : roles.get( 0 );
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
