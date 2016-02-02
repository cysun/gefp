package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "stages")
public class Stage implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name")
    private String name;

    @JsonIgnore
    @OneToOne
    private Stage parent;

    @JsonIgnore
    private boolean deleted;

    public Stage()
    {
        parent = null;
    }

    public Stage( Long id, String name )
    {
        super();
        this.id = id;
        this.name = name;
        this.parent = null;
        this.deleted = false;
    }

    public Stage clone()
    {
        Stage stage = new Stage();
        stage.name = name;
        stage.parent = this;
        stage.deleted = false;
        return stage;
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

    public Stage getParent()
    {
        return parent;
    }

    public void setParent( Stage parent )
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

    @Override
    public String toString() {
        return "Stage: ID="+id+", Name="+name;
    }
}
