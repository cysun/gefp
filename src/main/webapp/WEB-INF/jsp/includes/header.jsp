<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar brdt10 brdb10 navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand">Golden Eagle Flight Plan</a>
	</div>

	<security:authorize access="authenticated">
		<div class="menuUserTitleName"
			style="">
			Welcome ${loggedInUser.firstName} ${loggedInUser.lastName}! &nbsp; <a
				href="<c:url value="/logout.html" />"
				class="btn btn-danger override square-btn-adjust">Logout</a>
		</div>
	</security:authorize>

</nav>
<!-- /. NAV TOP  -->