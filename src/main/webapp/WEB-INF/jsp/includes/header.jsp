<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-default navbar-cls-top " role="navigation"
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
		<div
			style="color: #FFF; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			Welcome ${principal.name}! &nbsp; <a
				href="<c:url value="/logout.html" />"
				class="btn btn-danger square-btn-adjust">Logout</a>
		</div>
	</security:authorize>

</nav>
<!-- /. NAV TOP  -->