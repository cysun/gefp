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
import javax.persistence.Table;

import org.hibernate.annotations.IndexColumn;

@Entity
@Table(name = "flightplan")
public class FlightPlan implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private int id;
	
	@Column(name="plan_name", nullable = true)
	private String name;
	
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="flightplan_runways", joinColumns={@JoinColumn(name="flightplan_id")}
	, inverseJoinColumns={@JoinColumn(name="runway_id")})
	@IndexColumn(name="order_num")
	private List<Runways> runways;
	
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="flightplan_stages", joinColumns={@JoinColumn(name="flightplan_id")}
    , inverseJoinColumns={@JoinColumn(name="stage_id")})
	@IndexColumn(name="order_num")
	private List<Stages> stages;
	
	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="flightplan_checkpoints", joinColumns={@JoinColumn(name="flightplan_id")}
    , inverseJoinColumns={@JoinColumn(name="checkpoint_id")})
	@IndexColumn(name="order_num")
	private List<CheckPoint> checkpoints;
	
	private boolean published;
	
	private boolean active;
	private boolean deleted;
	
	public FlightPlan() {}

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

	public List<Runways> getRunways() {
		return runways;
	}

	public void setRunways(List<Runways> runways) {
		this.runways = runways;
	}

	public List<Stages> getStages() {
		return stages;
	}

	public void setStages(List<Stages> stages) {
		this.stages = stages;
	}
	
	public List<CheckPoint> getCheckpoints() {
		return checkpoints;
	}

	public void setCheckpoints(List<CheckPoint> checkpoints) {
		this.checkpoints = checkpoints;
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

	public boolean isPublished() {
		return published;
	}

	public void setPublished(boolean published) {
		this.published = published;
	}
}