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

    @Column(name = "season_year", nullable = true)
    private String seasonYear;

    @Column(name = "season_name", nullable = true)
    private String seasonName;

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

    @OneToOne
    private FlightPlan parent;

    public FlightPlan()
    {
        runways = new ArrayList<Runway>();
        stages = new ArrayList<Stage>();
        cells = new ArrayList<Cell>();
        published = false;
        parent = null;
    }

    public FlightPlan clone()
    {
        FlightPlan flightplan = new FlightPlan();
        flightplan.parent = this;
        flightplan.published = false;
        flightplan.name = "Copy of " + name;
        
        for( int i = 0; i < stages.size(); i++ )
        {
            flightplan.stages.add( stages.get( i ).clone() );
        }
        
        for( int i = 0; i < runways.size(); i++ )
        {
            flightplan.runways.add( runways.get( i ).clone() );
        }
        
        for( int i = 0; i < cells.size(); i++ )
        {
            flightplan.cells.add( cells.get( i ).clone(flightplan, flightplan.runways, flightplan.stages) );
        }

        
        
        return flightplan;
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

    public String getSeasonYear()
    {
        return seasonYear;
    }

    public void setSeasonYear( String seasonYear )
    {
        this.seasonYear = seasonYear;
    }

    public String getSeasonName()
    {
        return seasonName;
    }

    public void setSeasonName( String seasonName )
    {
        this.seasonName = seasonName;
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

    public FlightPlan getParent()
    {
        return parent;
    }

    public void setParent( FlightPlan parent )
    {
        this.parent = parent;
    }

}
