package gefp.model.dao.jpa;

import gefp.model.CheckpointInfo;
import gefp.model.User;
import gefp.model.dao.CheckpointInfoDao;

import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CheckpointInfoDaoImpl implements CheckpointInfoDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public CheckpointInfo getCheckPointInfo( Long id )
    {
        
        return entityManager.find(CheckpointInfo.class, id);
    }

    @Override
    @Transactional
    public CheckpointInfo saveCheckPointInfo( CheckpointInfo checkpoint )
    {
        return entityManager.merge( checkpoint );
    }

    @Override
    public CheckpointInfo getCheckPointInfo( Long user_id,
        Long checkpoint_id )
    {
        try
        {
            Set<CheckpointInfo> checkpointInfos =  entityManager.createQuery(
                "from User where id = " + user_id, User.class )
                .getSingleResult()
                .getCheckpointsInfo();
            
            
            for(CheckpointInfo cinfo : checkpointInfos) {
                if(cinfo.getCheckpoint().getId().equals( checkpoint_id )) {
                    return cinfo;
                }
            }
            return null;
            
        }
        catch( NoResultException nre )
        {
            return null;
        }
    }



}
