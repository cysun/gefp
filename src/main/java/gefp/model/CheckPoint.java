package gefp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "checkpoints")
public class CheckPoint implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	
	@Column(nullable=false)
	private String name;
	
	@Column(name="chk_type", nullable=false)
	private String type;
	
	@OneToOne
	@JoinColumn(name="runway_id")
	private Runways runway;
	
	@OneToOne
	@JoinColumn(name="stage_id")
	private Stages stage;
	
	@OneToOne
	@JoinColumn(name="plan_id")
	private FlightPlan flightplan;
	
//	@OrderColumn
//	@Column(name = "order_num", nullable = false, columnDefinition="int4 Default 1")
//	private Integer order;
	
	private boolean active;
	private boolean deleted;
	
	@Transient
	private boolean checked;
	
	public CheckPoint(){}

	public CheckPoint(int id, String name) {
		super();
		this.id = id;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Runways getRunway() {
		return runway;
	}

	public void setRunway(Runways runway) {
		this.runway = runway;
	}

	public Stages getStage() {
		return stage;
	}

	public void setStage(Stages stage) {
		this.stage = stage;
	}

	public FlightPlan getFlightplan() {
		return flightplan;
	}

	public void setFlightplan(FlightPlan flightplan) {
		this.flightplan = flightplan;
	}
	
}
