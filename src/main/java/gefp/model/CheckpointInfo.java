package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "checkpoint_info")
public class CheckpointInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    private Checkpoint checkpoint;

    @Column(name="message")
    private String message;

    public CheckpointInfo()
    {
    }
    
    public CheckpointInfo(Checkpoint checkpoint, String message)
    {
        this.checkpoint = checkpoint;
        this.message = message;
    }

    public Long getId()
    {
        return id;
    }

    public void setId( Long id )
    {
        this.id = id;
    }

    public Checkpoint getCheckpoint()
    {
        return checkpoint;
    }

    public void setCheckpoint( Checkpoint checkpoint )
    {
        this.checkpoint = checkpoint;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage( String message )
    {
        this.message = message;
    }

}
