package csns.web.editor;

//import gefp.model.Stage;
//import gefp.model.dao.StageDao;

import java.beans.PropertyEditorSupport;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
//import org.springframework.util.StringUtils;


@Component
@Scope("prototype")
public class StagePropertyEditor extends PropertyEditorSupport {

//    @Autowired
//    StageDao stageDao;
//
//    @Override
//    public void setAsText( String text ) throws IllegalArgumentException
//    {
//        if( StringUtils.hasText( text ) )
//            setValue( stageDao.getStage( Long.valueOf( text ) ) );
//    }
//
//    @Override
//    public String getAsText()
//    {
//        Stage stage = (Stage) getValue();
//        return stage != null ? stage.getId().toString() : "";
//    }

}
