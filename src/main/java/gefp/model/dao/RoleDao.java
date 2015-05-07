package gefp.model.dao;

import gefp.model.Role;

import java.util.List;

public interface RoleDao {

    Role getRole( Integer id );
    
    Role getRole( String roleName );
    
    List<Role> getRoles();
}
