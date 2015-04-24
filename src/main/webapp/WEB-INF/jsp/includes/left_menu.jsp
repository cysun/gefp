<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Menu For Administrators -->
<security:authorize access="authenticated and hasRole('ADMIN')">
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li class="text-center"><img
				src="<c:url value="/assets/img/gefp_logo.png" />"
				class="user-image img-responsive" /></li>
			<li><a href="<c:url value="/admin/dashboard.html" />" ><i class="fa fa-dashboard fa-3x"></i>
					Dashboard</a></li>
			<li><a href="<c:url value="/admin/list-departments.html" />"><i class="fa fa-book fa-3x"></i>
					Departments</a></li>
			<li><a href="<c:url value="/admin/list-plans.html" />"><i class="fa fa-table fa-3x"></i>
					Flight Plans</a></li>
			<li><a href="<c:url value="/admin/list-users.html" />"><i class="fa fa-user fa-3x"></i>
					Users</a></li>
		</ul>

	</div>
</nav>
</security:authorize>

<security:authorize access="authenticated and hasRole('ADVISOR')">
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li class="text-center"><img
				src="<c:url value="/assets/img/gefp_logo.png" />"
				class="user-image img-responsive" /></li>
			<li><a href="<c:url value="/advisor/dashboard.html" />" ><i class="fa fa-dashboard fa-3x"></i>
					Dashboard</a></li>
			<li><a href="<c:url value="/advisor/list-departments.html" />"><i class="fa fa-book fa-3x"></i>
					Departments</a></li>		
			<li><a href="<c:url value="/advisor/list-students.html" />"><i class="fa fa-user fa-3x"></i>
					Students</a></li>
		</ul>

	</div>
</nav>
</security:authorize>

<!-- Menu For Students -->
<c:if test="${not empty StudentUser}">
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li class="text-center"><img
				src="<c:url value="/assets/img/gefp_logo.png" />"
				class="user-image img-responsive" /></li>
			<li><a href="<c:url value="/student/view-plan/${loggedInUser.id}.html" />" ><i class="fa fa-table fa-3x"></i>
					Flight Plan</a></li>
			<li><a href="<c:url value="/user/profile/${loggedInUser.id}.html" />" ><i class="fa fa-user fa-3x"></i>
					My Profile</a></li>
		</ul>
	</div>
</nav>
</c:if>