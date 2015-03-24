package csns.web.editor;

//import gefp.model.Stages;
//import gefp.model.dao.StagesDao;

import java.beans.PropertyEditorSupport;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
//import org.springframework.util.StringUtils;


@Component
@Scope("prototype")
public class StagePropertyEditor extends PropertyEditorSupport {

//    @Autowired
//    StagesDao stageDao;
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
//        Stages stage = (Stages) getValue();
//        return stage != null ? stage.getId().toString() : "";
//    }

}
