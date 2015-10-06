<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div class="row">
	
	<security:authorize access="authenticated">	
	<div class="col-md-6">
		<h2>${LoginUserRole} Dashboard</h2>
		<h5>Welcome ${loggedInUser.firstName} ${loggedInUser.lastName} ,
			we are glad to see you back.</h5>
	</div>
	</security:authorize>
	
	<security:authorize
		access="authenticated and hasAnyRole('ADMIN','ADVISOR')">
		<div class="col-md-6">
			<form action="<c:url value="/search/users.html" />">
				<table class="table">
					<tr>
						<td colspan="2" style="border: 0px solid !important;">&nbsp;</td>
					</tr>
					<tr>
						<td style="border: 0px solid !important;"><input id="search"
							class="form-control" type="text" name="q"
							placeholder="Search Student" /></td>
						<td style="border: 0px solid !important;"><input
							class="btn override btn-primary" type="submit" name="submit"
							value="Search" /></td>
					</tr>
				</table>
			</form>
		</div>
	</security:authorize>


</div>