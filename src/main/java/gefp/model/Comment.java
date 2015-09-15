package gefp.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    String comment;

    @OneToOne
    User commentedBy;

    Date datetime;

    private boolean visibleToStudent = true;

    private boolean deleted = false;

    public Comment()
    {
        this.datetime = new Date();
        this.visibleToStudent = true;
        this.deleted = false;
    }

    public Comment( String comment, User commentedBy )
    {
        this.comment = comment;
        this.commentedBy = commentedBy;
        this.visibleToStudent = true;
        this.deleted = false;
        this.datetime = new Date();
    }

    public Long getId()
    {
        return id;
    }

    public void setId( Long id )
    {
        this.id = id;
    }

    public String getComment()
    {
        return comment;
    }

    public void setComment( String comment )
    {
        this.comment = comment;
    }

    public User getCommentedBy()
    {
        return commentedBy;
    }

    public void setCommentedBy( User commentedBy )
    {
        this.commentedBy = commentedBy;
    }

    public Date getDatetime()
    {
        return datetime;
    }

    public void setDatetime( Date datetime )
    {
        this.datetime = datetime;
    }

    public boolean isVisibleToStudent()
    {
        return visibleToStudent;
    }

    public void setVisibleToStudent( boolean visibleToStudent )
    {
        this.visibleToStudent = visibleToStudent;
    }

    public boolean isDeleted()
    {
        return deleted;
    }

    public void setDeleted( boolean deleted )
    {
        this.deleted = deleted;
    }

}
