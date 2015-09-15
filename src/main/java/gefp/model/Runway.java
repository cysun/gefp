package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "runways")
public class Runway implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToOne
    private Runway parent;

    private boolean deleted = false;

    public Runway()
    {
        parent = null;
    }

    public Runway( Long id, String name )
    {
        super();
        this.id = id;
        this.name = name;
        this.parent = null;
        this.deleted = false;
    }

    public Runway clone()
    {
        Runway runway = new Runway();
        runway.name = name;
        runway.parent = this;
        runway.deleted = false;
        return runway;
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

    public Runway getParent()
    {
        return parent;
    }

    public void setParent( Runway parent )
    {
        this.parent = parent;
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
