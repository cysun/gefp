package gefp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gefp.model.RequestLog;
import gefp.model.dao.RequestLogDao;

@Repository
public class RequestLogDaoImpl implements RequestLogDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public void saveRequestLog(RequestLog log) {
		entityManager.merge(log);
	}
}
