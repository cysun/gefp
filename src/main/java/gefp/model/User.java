package gefp.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Where;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
@Entity
@Table(name = "users")
public class User implements Serializable, UserDetails {

    @Id
    @GeneratedValue
    private Long id;

    @Column(unique = true, nullable = true)
    private String username = "";
    
    @Column(name = "first_name", nullable = true)
    private String firstName = "";
    
    @Column(name = "last_name", nullable = true)
    private String lastName = "";

    @Column(name = "middle_name", nullable = true)
    private String middleName = "";

    
    @JsonIgnore
    @OneToMany
    @JoinTable(name = "user_roles",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "role_id") })
    private Set<Role> roles;
        
    private String cin;

    private String email;

    @JsonIgnore
    private String password;

    @JsonIgnore
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_checkpoints_info",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "checkpoint_info_id") })
    private Set<CheckpointInfo> checkpointsInfo = new HashSet<CheckpointInfo>();

    // For Administrators
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department = new Department();

    // For Students
    @ManyToOne
    @JoinColumn(name = "major_id")
    private Department major = new Department();

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "plan_id")
    @Where(clause = "deleted = 'f'")
    private FlightPlan flightPlan = new FlightPlan();

    @JsonIgnore
    @ManyToMany
    @JoinTable(name = "user_plan_history",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "plan_id") })
    private List<FlightPlan> planHistory = new ArrayList<FlightPlan>();

    @JsonIgnore
    @ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "user_comments",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "comment_id") })
    @Where(clause = "deleted = 'f'")
    private List<Comment> comments = new ArrayList<Comment>();

    @JsonIgnore
    private boolean enabled;

    private boolean newAccount = false;

    @JsonIgnore
    private boolean deleted;

    @Transient
    private boolean validLogin = false;

    // This is used for GEFP Mobile API
    @Transient
    List<Checkpoint> planCheckpoints = new ArrayList<Checkpoint>();

    private String accessKey;

    public User()
    {
        comments = new ArrayList<Comment>();
        planHistory = new ArrayList<FlightPlan>();
    }

    public User( String username, String password )
    {
        this.username = username;
        this.password = password;
        comments = new ArrayList<Comment>();
        planHistory = new ArrayList<FlightPlan>();
    }

    public Long getId()
    {
        return id;
    }

    public void setId( Long id )
    {
        this.id = id;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName( String lastName )
    {
        this.lastName = lastName;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName( String firstName )
    {
        this.firstName = firstName;
    }

    public String getMiddleName()
    {
        return middleName;
    }

    public void setMiddleName( String middleName )
    {
        this.middleName = middleName;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername( String username )
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword( String password )
    {
        this.password = password;
    }

    public boolean isDeleted()
    {
        return deleted;
    }

    public void setDeleted( boolean deleted )
    {
        this.deleted = deleted;
    }

    public Set<Role> getRoles()
    {
        return roles;
    }

    public void setRoles( Set<Role> roles )
    {
        this.roles = roles;
    }

    public Department getDepartment()
    {
        return department;
    }

    public void setDepartment( Department department )
    {
        this.department = department;
    }

    public Department getMajor()
    {
        return major;
    }

    public void setMajor( Department major )
    {
        this.major = major;
    }

    public FlightPlan getFlightPlan()
    {
        return flightPlan;
    }

    public void setFlightPlan( FlightPlan flightPlan )
    {
        this.flightPlan = flightPlan;
    }

    public Set<CheckpointInfo> getCheckpointsInfo()
    {
        return checkpointsInfo;
    }

    public void setCheckpointsInfo( Set<CheckpointInfo> checkpoints )
    {
        this.checkpointsInfo = checkpoints;
    }

    public boolean isEnabled()
    {
        return enabled;
    }

    public void setEnabled( boolean enabled )
    {
        this.enabled = enabled;
    }

    public boolean isValidUser( User user )
    {

        if( user != null && this.username.equals( user.getUsername() )
            && this.password.equals( user.getPassword() ) ) return true;
        return false;
    }

    public String getCin()
    {
        return cin;
    }

    public void setCin( String cin )
    {
        this.cin = cin;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail( String email )
    {
        this.email = email;
    }

    public List<FlightPlan> getPlanHistory()
    {
        return planHistory;
    }

    public void setPlanHistory( List<FlightPlan> planHistory )
    {
        this.planHistory = planHistory;
    }

    public List<Comment> getComments()
    {
        return comments;
    }

    public void setComments( List<Comment> comments )
    {
        this.comments = comments;
    }

    public void setUserTypesInSession( HttpSession session )
    {

        for( Role role : this.roles )
        {
            if( role.getName().equalsIgnoreCase( "ADMIN" ) )
            {
                session.setAttribute( "LoginUserRole", "Admin" );
                session.setAttribute( "AdminUser", this );
            }
            if( role.getName().equalsIgnoreCase( "Advisor" ) )
            {
                session.setAttribute( "LoginUserRole", "Advisor" );
                session.setAttribute( "AdvisorUser", this );
            }
            if( role.getName().equalsIgnoreCase( "Student" ) )
            {
                session.setAttribute( "LoginUserRole", "Student" );
                session.setAttribute( "StudentUser", this );
            }
        }

    }

    public boolean isNewAccount()
    {
        return newAccount;
    }

    public void setNewAccount( boolean newAccount )
    {
        this.newAccount = newAccount;
    }

    @JsonIgnore
    public boolean isAdmin()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "ADMIN" ) ) return true;
        return false;
    }

    @JsonIgnore
    public boolean isAdvisor()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "ADVISOR" ) ) return true;
        return false;
    }

    @JsonIgnore
    public boolean isStudent()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "STUDENT" ) ) return true;
        return false;
    }

    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities()
    {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        for( Role role : roles )
            authorities.add( new SimpleGrantedAuthority( role.getName() ) );
        return authorities;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired()
    {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked()
    {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired()
    {
        return true;
    }

    public boolean isValidLogin()
    {
        return validLogin;
    }

    public void setValidLogin( boolean validLogin )
    {
        this.validLogin = validLogin;
    }

    public List<Checkpoint> getPlanCheckpoints()
    {
        return planCheckpoints;
    }

    public void setPlanCheckpoints( List<Checkpoint> planCheckpoints )
    {
        this.planCheckpoints = planCheckpoints;
    }

    public String toString()
    {
        return "User: Id=" + id + ", Username=" + username;
    }

    public String getAccessKey()
    {
        return accessKey;
    }

    public void setAccessKey( String accessKey )
    {
        this.accessKey = accessKey;
    }

}
