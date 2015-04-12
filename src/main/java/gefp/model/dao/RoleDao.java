package gefp.model.dao;

import gefp.model.Role;

import java.util.List;

public interface RoleDao {

    Role getUserRoles( Integer id );

    List<Role> getUserRoles();
}
