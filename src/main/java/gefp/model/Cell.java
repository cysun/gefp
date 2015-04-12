package gefp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
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
@Table(name = "cells")
public class Cell implements Serializable  {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;
    
    @OneToOne
    FlightPlan flightPlan;
    
    @OneToOne
    private Runway runway;
    
    @OneToOne
    private Stage stage;
    
    
    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "cell_checkpoints",
        joinColumns = { @JoinColumn(name = "cell_id") },
        inverseJoinColumns = { @JoinColumn(name = "checkpoint_id") })
    @IndexColumn(name = "order_num")
    List<Checkpoint> checkpoints;
    
    public Long getId()
    {
        return id;
    }
    
    public void setId( Long id )
    {
        this.id = id;
    }
    
    public Runway getRunway()
    {
        return runway;
    }
    
    public void setRunway( Runway runway )
    {
        this.runway = runway;
    }
    
    public Stage getStage()
    {
        return stage;
    }
    
    public void setStage( Stage stage )
    {
        this.stage = stage;
    }
    
    public List<Checkpoint> getCheckpoints()
    {
        return checkpoints;
    }

    public void setCheckpoints( List<Checkpoint> checkpoints )
    {
        this.checkpoints = checkpoints;
    }
    
    public FlightPlan getFlightPlan()
    {
        return flightPlan;
    }
    
    public void setFlightPlan( FlightPlan flightPlan )
    {
        this.flightPlan = flightPlan;
    }

}
