/*
 * This file is part of the CSNetwork Services (CSNS) project.
 * 
 * Copyright 2012, Chengyu Sun (csun@calstatela.edu).
 * 
 * CSNS is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 * 
 * CSNS is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with CSNS. If not, see http://www.gnu.org/licenses/agpl.html.
 */
package gefp.security;

import gefp.model.User;
import gefp.model.dao.UserDao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationSuccessHandler extends
    SavedRequestAwareAuthenticationSuccessHandler {
    
    // private static final Logger logger = LoggerFactory.getLogger( LdapAuthenticationHandler.class );
    
    @Autowired
    DefaultUrls defaultUrls;
    
    @Autowired
    private UserDao userDao;

    @Override
    public void onAuthenticationSuccess( HttpServletRequest request,
        HttpServletResponse response, Authentication authentication )
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) authentication.getPrincipal();
        // User user = userDao.getUserByUsername( authentication.getPrincipal().toString() );
        // logger.info(user.getUsername() + " signed in.");

        logger.info( "Logged in Username is " + user.getUsername() );

        RequestCache requestCache = new HttpSessionRequestCache();
        SavedRequest savedRequest = requestCache.getRequest( request, response );
        if( savedRequest != null )
        {
            super.onAuthenticationSuccess( request, response, authentication );
            return;
        }
        
        session.setAttribute( "loggedInUser", user );
        user.setUserTypesInSession( session );

        getRedirectStrategy().sendRedirect( request, response,
            defaultUrls.userHomeUrl( request ) );
    }
}
