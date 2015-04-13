package gefp.model;

import java.io.Serializable;
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

import org.hibernate.annotations.IndexColumn;

@Entity
@Table(name = "flightplans")
public class FlightPlan implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name", nullable = true)
    private String name;

    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "flightplan_runways",
        joinColumns = { @JoinColumn(name = "flightplan_id") },
        inverseJoinColumns = { @JoinColumn(name = "runway_id") })
    @IndexColumn(name = "order_num")
    private List<Runway> runways;

    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "flightplan_stages",
        joinColumns = { @JoinColumn(name = "flightplan_id") },
        inverseJoinColumns = { @JoinColumn(name = "stage_id") })
    @IndexColumn(name = "order_num")
    private List<Stage> stages;

    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private List<Cell> cells;
    
    @OneToOne
    Department department;
    
    private boolean published;

    public FlightPlan()
    {
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

    public List<Runway> getRunways()
    {
        return runways;
    }

    public void setRunways( List<Runway> runways )
    {
        this.runways = runways;
    }

    public List<Stage> getStages()
    {
        return stages;
    }
  
    public List<Cell> getCells()
    {
        return cells;
    }

    
    public void setCells( List<Cell> cells )
    {
        this.cells = cells;
    }

    public void setStages( List<Stage> stages )
    {
        this.stages = stages;
    }
    
    
    public Department getDepartment()
    {
        return department;
    }

    
    public void setDepartment( Department department )
    {
        this.department = department;
    }

    public boolean isPublished()
    {
        return published;
    }

    public void setPublished( boolean published )
    {
        this.published = published;
    }
}
