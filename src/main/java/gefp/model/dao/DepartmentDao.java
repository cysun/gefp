package gefp.model.dao;

import gefp.model.Department;

import java.util.List;

public interface DepartmentDao {

    Department getDepartment( Integer id );

    List<Department> getDepartments();

    Department saveDepartment( Department department );

}
