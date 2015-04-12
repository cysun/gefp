package gefp.model.dao;

import gefp.model.Stage;

import java.util.List;

public interface StageDao {

    Stage getStage( Long id );

    List<Stage> getStages();

    Stage saveStage( Stage stage );

}
