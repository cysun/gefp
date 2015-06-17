package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "stages")
public class Stage implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToOne
    private Stage parent;

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
    }

    public Stage clone()
    {
        Stage stage = new Stage();
        stage.name = name;
        stage.parent = this;
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

}
