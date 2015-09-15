<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

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
					<li><a href="<c:url value="/admin/list-departments.html"/>">Departments</a></li>
					<li class="active">Users</li>
				</ol>
				</security:authorize>
				
				<security:authorize access="hasRole('ADVISOR')">
				<ol class="breadcrumb">
					<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
					<li><a href="<c:url value="/advisor/list-departments.html"/>">Departments</a></li>
					<li class="active">Users</li>
				</ol>
				</security:authorize>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h5>List of Users in ${department.name}</h5>
								</div>
								<security:authorize
									access="authenticated and hasRole('ADMINSSSSS')">
									<div class="pull-right">
										<a href="<c:url value="/admin/user/add.html"/>"
											class="btn btn-primary"><i class="fa fa-plus "></i> Add
											New</a>
									</div>
								</security:authorize>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body">
								<div class="table-responsive__">
									<table id="dataTables" class="table table-striped table-bordered dataTables table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>CIN</th>
												<th>Username</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>Role</th>
												<!-- <th>Active Plan Name</th> -->
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${users}" var="user" varStatus="index">

												<tr>
													<td>${index.count}</td>
													<td>${user.cin}</td>
													<td>${user.username}</td>
													<td>${user.firstName}</td>
													<td>${user.lastName}</td>
													<td><c:forEach var="role" items="${user.roles}">
														${role.name} 
													</c:forEach></td>
													<td><a title="View Plan"
														href="<c:url value="/advisor/view-student-plan/${user.id}.html" />"
														class=""><i class="fa fa-external-link"></i> </a> <security:authorize
															access="authenticated and hasRole('ADMINAA')">
															<a href="<c:url value="/user/edit/${user.id}.html" />"
																class=""><i class="fa fa-edit "></i>
																Edit</a>
														</security:authorize></td>

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
