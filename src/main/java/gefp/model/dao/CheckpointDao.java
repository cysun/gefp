package gefp.model.dao;

import gefp.model.Checkpoint;
import gefp.model.CheckpointInfo;

import java.util.List;
import java.util.Set;

public interface CheckpointDao {

    Checkpoint getCheckPoint( Long id );

    List<Checkpoint> getCheckPoints();

    Checkpoint saveCheckPoint( Checkpoint checkpoint );

    List<Checkpoint> getCheckPointsInPlan( Long plan_id );

    Set<CheckpointInfo> getCheckPointsForUser( Long user_id, Long plan_id );

}
