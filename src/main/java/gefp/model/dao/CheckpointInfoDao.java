package gefp.model.dao;

import gefp.model.CheckpointInfo;

public interface CheckpointInfoDao {

    CheckpointInfo getCheckPointInfo( Long id );
    
    CheckpointInfo getCheckPointInfo(Long user_id, Long checkpoint_id);
    
    CheckpointInfo saveCheckPointInfo( CheckpointInfo checkpoint );
}
