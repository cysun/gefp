package gefp.model.dao;

import gefp.model.UserRoles;

import java.util.List;

public interface UserRolesDao {
	
	UserRoles getUserRoles( Integer id );

    List<UserRoles> getUserRoles();    
}
