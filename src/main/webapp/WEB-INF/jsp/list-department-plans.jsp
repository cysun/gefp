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
					<li><a href="<c:url value="/admin/list-departments.html"/>">Departments</a></li>
					<li class="active">${department.name}</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
							<div class="pull-left">
								<h5>${department.name} : List of Flight Plans</h5>
							</div>
							<div class="pull-right">
								<a href="<c:url value="/admin/plan/add.html?departmentId=${department.id }"/>" class="btn btn-primary"><i class="fa fa-plus "></i> Add
								Plan</a>
							</div>
							<div class="clearfix"></div>
							</div>
							
							
							
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Plan Name</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${department.plans}" var="plan">

												<tr>
													<td>${plan.id}</td>
													<td>
														${plan.name}
														<c:choose>
															<c:when test="${plan.id == department.defaultPlan.id}">
																<span class="label label-success">Official Plan</span>
															</c:when>
															<c:otherwise>
																| 
																<a href="<c:url value="/admin/department/set-official-plan.html?dept_id=${department.id}&plan_id=${plan.id}"/>" class="btn btn-link">Make Official Plan</a>
															</c:otherwise>
															
														</c:choose>
														
													</td>
													<td><a
														href="<c:url value="/plan/view/${plan.id}.html" />"
														class="btn btn-primary"><i class="fa fa-eye "></i>
															View Plan</a> <%-- <a href="<c:url value="/plan/edit/${plan.id}.html" />" class="btn btn-primary"><i class="fa fa-edit "></i> Edit</a> --%>
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
