package gefp.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
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
import javax.persistence.Table;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "users")
public class User implements Serializable, UserDetails {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @ManyToMany
    @JoinTable(name = "user_roles",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "role_id") })
    private Set<Role> roles;

    @Column(name = "last_name", nullable = true)
    private String lastName;

    @Column(name = "first_name", nullable = true)
    private String firstName;

    @Column(name = "middle_name")
    private String middleName = "";

    @Column(unique = true, nullable = true)
    private String username;

    private String cin;

    private String email;

    private String password;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_checkpoints",
        joinColumns = { @JoinColumn(name = "user_id") },
        inverseJoinColumns = { @JoinColumn(name = "checkpoint_id") })
    private Set<Checkpoint> checkpoints = new HashSet<Checkpoint>();

    // For Administrators
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department = new Department();

    // For Students
    @ManyToOne
    @JoinColumn(name = "major_id")
    private Department major = new Department();

    @ManyToOne
    @JoinColumn(name = "plan_id")
    private FlightPlan flightPlan = new FlightPlan();

    private boolean enabled;

    private boolean newAccount = false;

    private boolean deleted;

    public User()
    {
    }

    public User( String username, String password )
    {
        this.username = username;
        this.password = password;
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

    public Set<Checkpoint> getCheckpoints()
    {
        return checkpoints;
    }

    public void setCheckpoints( Set<Checkpoint> checkpoints )
    {
        this.checkpoints = checkpoints;
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

    public boolean isAdmin()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "ADMIN" ) ) return true;
        return false;
    }

    public boolean isAdvisor()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "ADVISOR" ) ) return true;
        return false;
    }

    public boolean isStudent()
    {
        for( Role role : roles )
            if( role.getName().equalsIgnoreCase( "STUDENT" ) ) return true;
        return false;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities()
    {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        for( Role role : roles )
            authorities.add( new SimpleGrantedAuthority( role.getName() ) );
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired()
    {
        return true;
    }

    @Override
    public boolean isAccountNonLocked()
    {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired()
    {
        return true;
    }
}
