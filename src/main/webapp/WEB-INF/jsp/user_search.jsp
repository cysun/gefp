<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan</title>
<jsp:include page="includes/styles.jsp" />
</head>
<body>

	<div id="wrapper">

		<jsp:include page="includes/header.jsp" />
		<jsp:include page="includes/left_menu.jsp" />

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<security:authorize access="hasRole('ADMIN')">
				<ol class="breadcrumb">
					<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
					<li class="active">Users</li>
				</ol>
				</security:authorize>
				
				<security:authorize access="hasRole('ADVISOR')">
				<ol class="breadcrumb">
					<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
					<li class="active">Users</li>
				</ol>
				</security:authorize>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">List of Users</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Username</th>
												<th>Name</th>
												<th>CIN</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${users}" var="user">

												<tr>
													<td>${user.id}</td>
													<td>${user.username}</td>
													<td>${user.firstName} ${user.lastName}</td>
													<td>${user.cin}</td>
													<td><a title="View Flight Plan"
														href="<c:url value="/advisor/view-student-plan/${user.id}.html" />"
														class="btn btn-info override"><i class="fa fa-eye"></i></a>		
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

						</div>

					</div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->


	<jsp:include page="includes/footer.jsp" />

</body>
</html>
