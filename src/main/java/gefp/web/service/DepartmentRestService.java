package gefp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gefp.model.Department;
import gefp.model.dao.DepartmentDao;

@Controller
public class DepartmentRestService {

    @Autowired
    DepartmentDao departmentDao;

    @RequestMapping("/api/departments")
    public String listDepartments( ModelMap models )
    {
        List<Department> departments = departmentDao
            .getDepartmentsHavingDefaultPlan();
        models.put( "departments", departments );
        return "jsonView";
    }

}
