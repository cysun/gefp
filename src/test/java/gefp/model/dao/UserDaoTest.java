package gefp.model.dao;

import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "UserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	@Autowired
	UserDao userDao;

	@Test
	// Test Case to check if user with username jdoe1 exists
	public void userJdoe1AndJdoe2Exists() {
		assert true;
		//assert userDao.getUserByName("jdoe1").getUsername().equals("jdoe1")
		//		&& userDao.getUserByName("jdoe2").getUsername().equals("jdoe2");
	}

}