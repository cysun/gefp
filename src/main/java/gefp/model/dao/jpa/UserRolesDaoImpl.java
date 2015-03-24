package gefp.model.dao.jpa;

import gefp.model.UserRoles;
import gefp.model.dao.UserRolesDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;


@Repository
public class UserRolesDaoImpl implements UserRolesDao {
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
    public UserRoles getUserRoles( Integer id )
    {
		try {
			return entityManager.find( UserRoles.class, id );
		}
		catch(NoResultException nre) {
			return null;
		}
    }

    @Override
    public List<UserRoles> getUserRoles()
    {
    	try {
    		return entityManager.createQuery( "from UserRoles order by id", UserRoles.class )
                .getResultList();
    	}
    	catch(NoResultException nre) {
			return null;
		}
    }
	
}
