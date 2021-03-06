package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import org.springframework.security.access.prepost.PostAuthorize;
// import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.User;
import gefp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    // (type=PersistenceContextType.EXTENDED)
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    @Override
    @PostAuthorize("returnObject!= null && (principal.username == returnObject.username or hasAnyRole('ADMIN','ADVISOR'))")
    // @PostAuthorize("principal.username == returnObject.username or principal.admin or principal.advisor")
    public User getUser( Long id )
    {
        User u = entityManager.find( User.class, id );
        return u;
    }
    
    @Override
    public User getApiUser( Long id )
    {
        User u = entityManager.find( User.class, id );
        return u;
    }

    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User order by id", User.class )
            .getResultList();
    }
    
    @Override
    public List<User> getUsersInDepartment(Integer dept_id)
    {
        return entityManager.createQuery( "from User where department_id = " + dept_id + " order by id", User.class )
            .getResultList();
    }

    @Override
    public User validateUser( User user )
    {

        try
        {
            return entityManager.createQuery(
                "from User where username = '" + user.getUsername()
                    + "' and password = '" + user.getPassword() + "'",
                User.class ).getSingleResult();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public User getUserByCin( String cin )
    {
        List<User> users = entityManager.createQuery(
            "from User where cin = :cin", User.class )
            .setParameter( "cin", cin )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }

    @Override
    public User getUserByUsername( String username )
    {

        String query = "from User " + "where lower(username) = :username";

        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "username", username.toLowerCase() )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }

    @Override
    public User getUserByEmail( String email )
    {
        String query = "from User where lower(email) = :email";

        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "email", email.toLowerCase() )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }

    @Override
    public List<User> searchUsers( String term )
    {
        term = term.toLowerCase();
        String query = "from User where cin = :term or lower(username) = :term "
            + "or lower(firstName) = :term or lower(lastName) = :term "
            + "or lower(firstName || ' ' || lastName) = :term "
            + "or lower(email) = :term order by firstName asc";

        return entityManager.createQuery( query, User.class )
            .setParameter( "term", term )
            .getResultList();
    }

    @Override
    public List<User> searchUsersByPrefix( String term, int maxResults )
    {
        term = term.toLowerCase();
        String query = "from User where cin like :term || '%' "
            + "or lower(username) like :term || '%' "
            + "or lower(firstName) like '%' || :term || '%' "
            + "or lower(lastName) like :term || '%' "
            + "or lower(firstName || ' ' || lastName) like :term || '%' "
            + "or lower(email) like :term || '%' "
            + "order by firstName asc";

        return entityManager.createQuery( query, User.class )
            .setParameter( "term", term )
            .setMaxResults( maxResults )
            .getResultList();
    }

    @Override
    @Transactional
    // @PreAuthorize("authenticated and (hasAnyRole('ADMIN','ADVISOR') or #user.username == principal.username)")
    public User saveUser( User user )
    {
        return entityManager.merge( user );
    }

    @Override
    public boolean validateAccessKey( String accesskey, Long id )
    {
        
        // For testing, using only the API access key.
        // String query = "from User where accessKey = :accesskey and id = :id";
        String query = "from User where accessKey = :accesskey";
        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "accesskey", accesskey )
            //.setParameter( "id", id )
            .getResultList();
        return users.size() == 0 ? false : true;
    }

}
