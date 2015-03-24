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

@Entity
@Table(name = "departments")
public class Department implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "dept_id")
	int id;

	@Column(name = "dept_name")
	String name;

	@OneToOne
	@JoinColumn(name = "plan_id")
	private FlightPlan currentPlan;

	@OneToMany
	@JoinTable(name = "department_flightplan", joinColumns = { @JoinColumn(name = "dept_id") }, inverseJoinColumns = { @JoinColumn(name = "oldplan_id") })
	private List<FlightPlan> oldPlans;
	
	private boolean active;
	
	private boolean deleted;
	
	public Department() {
	}

	public Department(int dept_id, String name) {
		super();
		this.id = dept_id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public FlightPlan getCurrentPlan() {
		return currentPlan;
	}

	public void setCurrentPlan(FlightPlan currentPlan) {
		this.currentPlan = currentPlan;
	}

	public List<FlightPlan> getOldPlans() {
		return oldPlans;
	}

	public void setOldPlans(List<FlightPlan> oldPlans) {
		this.oldPlans = oldPlans;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
}