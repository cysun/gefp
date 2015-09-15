package gefp.model.dao.jpa;

import gefp.model.Department;
import gefp.model.dao.DepartmentDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Department getDepartment( Integer id )
    {
        try
        {
            return entityManager.find( Department.class, id );
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    public List<Department> getDepartments()
    {
        try
        {
            return entityManager.createQuery( "from Department where deleted = 'f' order by name",
                Department.class ).getResultList();
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }

    @Override
    @Transactional
    public Department saveDepartment( Department department )
    {
        return entityManager.merge( department );
    }

}
