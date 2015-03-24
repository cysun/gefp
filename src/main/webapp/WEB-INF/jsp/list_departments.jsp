<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

				<ol class="breadcrumb">
					<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
					<li class="active">Departments</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h5>List of Departments</h5>
								</div>
								<div class="pull-right">
									<a href="<c:url value="/admin/department/add.html"/>"
								class="btn btn-primary">Add Department</a>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Department Name</th>
												<!-- <th>Active Plan Name</th> -->
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${departments}" var="dept">

												<tr>
													<td>${dept.id}</td>
													<td>${dept.name}</td>
													<!-- <td>Computer Science Plan</td> -->
													<td><a
														href="<c:url value="/admin/department/list-plans.html?id=${dept.id}" />"
														class="btn btn-info"><i class="fa fa-eye "></i> View
															Plan(s)</a> <a
														href="<c:url value="/admin/department/edit.html?id=${dept.id}" />"
														class="btn btn-primary"><i class="fa fa-edit "></i>
															Edit</a></td>
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
