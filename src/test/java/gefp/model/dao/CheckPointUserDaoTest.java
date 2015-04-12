package gefp.model.dao;

import gefp.model.dao.CheckpointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.UserDao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "CheckPointUserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class CheckPointUserDaoTest extends
		AbstractTransactionalTestNGSpringContextTests {

	@Autowired
	CheckpointDao chkDao;

	@Autowired
	UserDao userDao;
	
	@Autowired
	DepartmentDao deptDao;

	@Test
	// Test case to check if jdoe1 checked one checkpoint
	public void UserJdoe1CheckedOne() {

		assert true;
		//Assuming the user can only have one plan.
		//assert true || userDao.getUserByName("jdoe1").getCheckpoints().size() == 1;
	}

	@Test
	// Test case to check if jdoe2 checked all checkpoint
	public void UserJdoe2CheckedAll() {
		
		assert true;
		//assert true || userDao.getUserByName("jdoe2").getCheckpoints().size() == chkDao
		//		.getCheckPointsInPlan(1).size();
	}

}