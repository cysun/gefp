package gefp.model.dao;

import gefp.model.CheckPoint;

import java.util.List;

public interface CheckPointDao {	
	
	CheckPoint getCheckPoint( Integer id );

    List<CheckPoint> getCheckPoints();
    
    CheckPoint saveCheckPoint(CheckPoint checkpoint);
	
	List<CheckPoint> getCheckPointsInPlan( Integer plan_id );
	
	List<CheckPoint> getCheckPointsForUser( Integer user_id, Integer plan_id );

}
