package gefp.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "checkpoint_info")
public class CheckpointInfo extends Checkpoint {

    private static final long serialVersionUID = 1L;

    private String messages;

    public CheckpointInfo()
    {
        super();
    }

    public String getMessages()
    {
        return messages;
    }

    public void setMessages( String messages )
    {
        this.messages = messages;
    }

}
