package gefp.model;

import java.io.Serializable;
import java.util.List;

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
@Table(name = "departments")
public class Department implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    int id;

    @Column(name = "name")
    String name;

    @OneToOne
    @JoinColumn(name = "plan_id")
    @Where(clause = "deleted = 'f'")
    private FlightPlan defaultPlan;

    @OneToMany
    @JoinTable(name = "department_plans",
        joinColumns = { @JoinColumn(name = "department_id") },
        inverseJoinColumns = { @JoinColumn(name = "plan_id") })
    @Where(clause = "deleted = 'f'")
    private List<FlightPlan> plans;

    private boolean active;

    private boolean deleted;

    public Department()
    {
    }

    public Department( int dept_id, String name )
    {
        super();
        this.id = dept_id;
        this.name = name;
    }

    public int getId()
    {
        return id;
    }

    public void setId( int id )
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

    
    public FlightPlan getDefaultPlan()
    {
        return defaultPlan;
    }

    
    public void setDefaultPlan( FlightPlan defaultPlan )
    {
        this.defaultPlan = defaultPlan;
    }

    
    public List<FlightPlan> getPlans()
    {
        return plans;
    }

    
    public void setPlans( List<FlightPlan> plans )
    {
        this.plans = plans;
    }

    public boolean isActive()
    {
        return active;
    }

    public void setActive( boolean active )
    {
        this.active = active;
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
