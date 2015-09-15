package gefp.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

@Entity
@Table(name = "checkpoint_info")
public class CheckpointInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    private Checkpoint checkpoint;

    @Column(name = "message")
    private String message;

    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "checkpoint_info_comments",
        joinColumns = { @JoinColumn(name = "checkpoint_info_id") },
        inverseJoinColumns = { @JoinColumn(name = "comment_id") })
    @Where(clause = "deleted = 'f'")
    private List<Comment> comments;

    public CheckpointInfo()
    {
        this.comments = new ArrayList<Comment>();
    }

    public CheckpointInfo( Checkpoint checkpoint, String message )
    {
        this.comments = new ArrayList<Comment>();
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

    public List<Comment> getComments()
    {
        return comments;
    }

    public void setComments( List<Comment> comments )
    {
        this.comments = comments;
    }

}
