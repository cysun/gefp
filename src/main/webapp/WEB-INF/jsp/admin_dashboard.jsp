<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<div id="loader-wrapper">
	<div id="loader"></div>

	<div class="loader-section section-left"></div>
	<div class="loader-section section-right"></div>

</div>		
		<jsp:include page="includes/header.jsp" />
		
		<jsp:include page="includes/left_menu.jsp" />
		
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-red set-icon"> <i
								class="fa fa-book"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${departments.size()}</p>
								<p class="text-muted">Departments</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-bars"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${plans.size()}</p>
								<p class="text-muted">Flight Plans</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-blue set-icon"> <i
								class="fa fa-user"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${users.size()}</p>
								<p class="text-muted">Users</p>
							</div>
						</div>
					</div>

				</div>
				<!-- /. ROW  -->
				
				<%-- <div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">List of Departments</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Department Name</th>
												<th>Plan Name</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>
											
											<c:forEach items="${departments}" var="dept">
											
											<tr>
												<td>${dept.id}</td>
												<td>${dept.name}</td>
												<td>Computer Science Plan</td>
												<td><a href="/department/view/${dept.id}.html">View Plan(s)</a></td>
											</tr>
											
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div> --%>
				<!-- /. ROW  -->
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
