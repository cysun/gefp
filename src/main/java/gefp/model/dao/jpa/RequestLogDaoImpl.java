package gefp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.RequestLog;
import gefp.model.dao.RequestLogDao;

@Repository
public class RequestLogDaoImpl implements RequestLogDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public void saveRequestLog(RequestLog log) {
		entityManager.merge(log);
	}
}
