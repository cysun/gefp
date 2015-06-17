package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "checkpoints")
public class Checkpoint implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false)
    private String name;

    @OneToOne
    private Checkpoint parent;

    public Checkpoint()
    {
        parent = null;
    }

    public Checkpoint( String name )
    {
        super();
        this.name = name;
        this.parent = null;
    }

    public Checkpoint( Long id, String name )
    {
        super();
        this.id = id;
        this.name = name;
        this.parent = null;
    }

    public Checkpoint clone()
    {
        Checkpoint checkpoint = new Checkpoint();
        checkpoint.name = name;
        checkpoint.parent = this;
        return checkpoint;
    }

    public Long getId()
    {
        return id;
    }

    public void setId( Long id )
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName( String name )
    {
        this.name = name;
    }

    public Checkpoint getParent()
    {
        return parent;
    }

    public void setParent( Checkpoint parent )
    {
        this.parent = parent;
    }

}
