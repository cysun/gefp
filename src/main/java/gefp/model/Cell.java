package gefp.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.IndexColumn;
import org.hibernate.annotations.Where;

@Entity
@Table(name = "cells")
public class Cell implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    FlightPlan flightPlan;

    @OneToOne
    @Where(clause = "deleted = 'f'")
    private Runway runway;

    @OneToOne
    @Where(clause = "deleted = 'f'")
    private Stage stage;

    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "cell_checkpoints",
        joinColumns = { @JoinColumn(name = "cell_id") },
        inverseJoinColumns = { @JoinColumn(name = "checkpoint_id") })
    @IndexColumn(name = "order_num")
    @Where(clause = "deleted = 'f'")
    List<Checkpoint> checkpoints;

    @OneToOne
    private Cell parent;

    private boolean deleted = false;

    public Cell()
    {
        super();
        checkpoints = new ArrayList<Checkpoint>();
        flightPlan = null;
        parent = null;
    }

    public Cell clone( FlightPlan flightPlan, List<Runway> runways,
        List<Stage> stages )
    {
        Cell cell = new Cell();
        cell.parent = this;
        cell.flightPlan = flightPlan;

        for( Runway r : runways )
        {
            if( r.getParent().getId().equals( runway.getId() ) )
            {
                cell.runway = r;
            }
        }

        for( Stage s : stages )
        {
            if( s.getParent().getId().equals( stage.getId() ) )
            {
                cell.stage = s;
            }
        }

        for( int i = 0; i < checkpoints.size(); i++ )
        {
            cell.checkpoints.add( checkpoints.get( i ).clone() );
        }
        return cell;
    }

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

    public Cell getParent()
    {
        return parent;
    }

    public void setParent( Cell parent )
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
