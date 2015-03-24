package gefp.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import gefp.model.User;

@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports( Class<?> clazz )
    {
        // clazz is User.class or a subclass of User
        return User.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
        User user = (User) target;
        
        if( !StringUtils.hasText( user.getUsername() ) )
            errors.rejectValue( "username", "error.username.required" );

        if( !StringUtils.hasText( user.getPassword() ) )
            errors.rejectValue( "password", "error.password.required" );
    }

    public void validateProfileInfo( Object target, Errors errors )
    {
        User user = (User) target;
        String numRegex   = ".*[0-9].*";
        String alphaRegex = ".*[a-zA-Z].*";
        
        if( user.getFirstName() == "" || user.getFirstName() == null )
            errors.rejectValue( "name", "error.name.required" );
        
        if(user.getPassword()!="") {
	        if( user.getPassword().length() < 4 )
	            errors.rejectValue( "password", "error.password.length" );
	        else if( !user.getPassword().matches(numRegex) || !user.getPassword().matches(alphaRegex) )
	            errors.rejectValue( "password", "error.password.format" );
        }

    }    
    
}
