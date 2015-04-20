package gefp.security;


import gefp.model.ADUser;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import static javax.naming.directory.SearchControls.SUBTREE_SCOPE;

import javax.naming.ldap.LdapContext;
import javax.naming.ldap.InitialLdapContext;

//******************************************************************************
//**  ActiveDirectory Class
//**  Provides static methods to authenticate users, change passwords, etc.
//**
//*****************************************************************************/

public class ActiveDirectory {

    private static String[] userAttributes = { "distinguishedName", "cn",
        "name", "uid", "sn", "userPrincipalName" };

    private ActiveDirectory()
    {
    }

    // **************************************************************************
    // ** getConnection
    // *************************************************************************/
    /**
     * Used to authenticate a user given a username/password and domain name.
     * Provides an option to identify a specific a Active Directory server.
     */

    public static LdapContext getConnection( String username, String password,
        String domainName, String serverName ) throws NamingException
    {

        if( domainName == null )
        {
            try
            {
                String fqdn = java.net.InetAddress.getLocalHost()
                    .getCanonicalHostName();
                if( fqdn.split( "\\." ).length > 1 )
                    domainName = fqdn.substring( fqdn.indexOf( "." ) + 1 );
            }
            catch( java.net.UnknownHostException e )
            {
            }
        }

        // System.out.println("Authenticating " + username + "@" + domainName +
        // " through " + serverName);

        if( password != null )
        {
            password = password.trim();
            if( password.length() == 0 ) password = null;
        }

        // bind by using the specified username/password
        Hashtable<String, Object> props = new Hashtable<String, Object>();
        String principalName = username + "@" + domainName;
        props.put( Context.SECURITY_PRINCIPAL, principalName );
        //props.put(  Context.REFERRAL, "follow" );
        
        if( password != null )
            props.put( Context.SECURITY_CREDENTIALS, password );

        String ldapURL = "ldap://"
            + ((serverName == null) ? domainName : serverName + "."
                + domainName) + '/';
        props.put( Context.INITIAL_CONTEXT_FACTORY,
            "com.sun.jndi.ldap.LdapCtxFactory" );
        
        System.out.println("ldapURL : " + ldapURL);
        
        props.put( Context.PROVIDER_URL, ldapURL );
        try
        {
            return new InitialLdapContext( props, null );
        }
        catch( javax.naming.CommunicationException e )
        {
            throw new NamingException( "Failed to connect to " + domainName
                + ((serverName == null) ? "" : " through " + serverName) );
        }
        catch( NamingException e )
        {
            throw new NamingException( "Failed to authenticate " + username
                + "@" + domainName
                + ((serverName == null) ? "" : " through " + serverName) );
        }
    }

    // **************************************************************************
    // ** getUser
    // *************************************************************************/
    /**
     * Used to check whether a username is valid.
     * 
     * @param username
     *            A username to validate (e.g. "peter", "peter@acme.com", or
     *            "ACME\peter").
     */
    public static ADUser getUser( String username, LdapContext context )
    {
        try
        {
            String domainName = null;
            if( username.contains( "@" ) )
            {
                username = username.substring( 0, username.indexOf( "@" ) );
                domainName = username.substring( username.indexOf( "@" ) + 1 );
            }
            else if( username.contains( "\\" ) )
            {
                username = username.substring( 0, username.indexOf( "\\" ) );
                domainName = username.substring( username.indexOf( "\\" ) + 1 );
            }
            else
            {
                String authenticatedUser = (String) context.getEnvironment()
                    .get( Context.SECURITY_PRINCIPAL );
                if( authenticatedUser.contains( "@" ) )
                {
                    domainName = authenticatedUser.substring( authenticatedUser.indexOf( "@" ) + 1 );
                }
            }

            System.out.println( "Username Name is " + username );
            System.out.println( "Domain Name is " + domainName );

            if( domainName != null )
            {
                String principalName = username + "@" + domainName;
                SearchControls controls = new SearchControls();
                controls.setSearchScope( SUBTREE_SCOPE );
                controls.setReturningAttributes( userAttributes );
                NamingEnumeration<SearchResult> answer = context.search(
                    toDC( domainName ), "(& (userPrincipalName="
                        + principalName + ")(objectClass=user))", controls );
                if( answer.hasMore() )
                {
                    Attributes attr = answer.next().getAttributes();
                    Attribute user = attr.get( "userPrincipalName" );
                    if( user != null ) return new ADUser( attr );
                }
            }
        }
        catch( NamingException e )
        {
            e.printStackTrace();
        }
        return null;
    }


    // **************************************************************************
    // ** getUsers
    //** -- Returns a list of users in the domain.
    // *************************************************************************/
    public static ADUser[] getUsers( LdapContext context ) throws NamingException
    {

        java.util.ArrayList<ADUser> users = new java.util.ArrayList<ADUser>();
        String authenticatedUser = (String) context.getEnvironment().get(
            Context.SECURITY_PRINCIPAL );
        if( authenticatedUser.contains( "@" ) )
        {
            String domainName = authenticatedUser.substring( authenticatedUser.indexOf( "@" ) + 1 );
            SearchControls controls = new SearchControls();
            controls.setSearchScope( SUBTREE_SCOPE );
            controls.setReturningAttributes( userAttributes );
            NamingEnumeration answer = context.search( toDC( domainName ),
                "(objectClass=user)", controls );
            try
            {
                while( answer.hasMore() )
                {
                    Attributes attr = ((SearchResult) answer.next()).getAttributes();
                    Attribute user = attr.get( "userPrincipalName" );
                    if( user != null )
                    {
                        users.add( new ADUser( attr ) );
                    }
                }
            }
            catch( Exception e )
            {
            }
        }
        return users.toArray( new ADUser[users.size()] );
    }

    private static String toDC( String domainName )
    {
        StringBuilder buf = new StringBuilder();
        for( String token : domainName.split( "\\." ) )
        {
            if( token.length() == 0 ) continue; // defensive check
            if( buf.length() > 0 ) buf.append( "," );
            buf.append( "DC=" ).append( token );
        }
        return buf.toString();
    }
}

