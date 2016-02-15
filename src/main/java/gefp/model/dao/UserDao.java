package gefp.model.dao;

import java.util.List;

import gefp.model.User;

public interface UserDao {

    User getUser( Long id );

    List<User> getUsersInDepartment(Integer dept_id);

    List<User> getUsers();
    
    User validateUser( User user );
    
    User getApiUser(Long id);
    
    User saveUser( User user );

    User getUserByCin( String cin );

    User getUserByUsername( String username );

    User getUserByEmail( String email );

    List<User> searchUsers( String term );

    List<User> searchUsersByPrefix( String term, int maxResults );
    
    boolean validateAccessKey(String key, Long id);
}
