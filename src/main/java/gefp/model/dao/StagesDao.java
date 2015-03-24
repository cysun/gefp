package gefp.model.dao;

import gefp.model.Stages;

import java.util.List;

public interface StagesDao {
	
	Stages getStage( Integer id );

    List<Stages> getStages();
    
    Stages saveStage(Stages stage);
    
}
