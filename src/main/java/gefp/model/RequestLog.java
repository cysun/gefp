package gefp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "request_log")
public class RequestLog {

    @Id
    @GeneratedValue
    Integer id;

    @Column(name = "client_ip")
    String clientIp;

    @Column(name = "request_uri")
    String requetsUri;

    @Column(name = "request_method")
    String requestMethod;

    @Column(name = "ad_username")
    String userId;

    @Column(name = "ad_user_role")
    String role;

    @Column(name = "timestamp")
    Date timestamp;

    public RequestLog()
    {

    }

    public Integer getId()
    {
        return id;
    }

    public void setId( Integer id )
    {
        this.id = id;
    }

    public String getClientIp()
    {
        return clientIp;
    }

    public void setClientIp( String clientIp )
    {
        this.clientIp = clientIp;
    }

    public String getRequetsUri()
    {
        return requetsUri;
    }

    public void setRequetsUri( String requetsUri )
    {
        this.requetsUri = requetsUri;
    }

    public String getRequestMethod()
    {
        return requestMethod;
    }

    public void setRequestMethod( String requestMethod )
    {
        this.requestMethod = requestMethod;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId( String userId )
    {
        this.userId = userId;
    }

    public String getRole()
    {
        return role;
    }

    public void setRole( String role )
    {
        this.role = role;
    }

    public Date getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp( Date timestamp )
    {
        this.timestamp = timestamp;
    }

}
