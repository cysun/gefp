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
					<li class="active">Flight Plans</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h5>List of Flight Plans</h5>
								</div>

								<%--
							<a href="<c:url value="/admin/plan/add.html"/>" class="pull-right btn btn-primary">Add
							New Plan</a>
							 --%>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Plan Name</th>
												<th>Department</th>
												<th>Published</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${plans}" var="plan">

												<tr>
													<td>${plan.id}</td>
													<td>${plan.name}</td>
													<td>${plan.department.name}</td>
													<td><c:choose>
															<c:when test="${plan.published == false}">
																<a
																	href="<c:url value="/admin/plan/publish.html?planId=${plan.id}"/>">
																	<label class="label override label-primary">Publish Now</label>
																</a>
															</c:when>
															<c:otherwise>
																<label class="label override label-success">Published</label>
															</c:otherwise>

														</c:choose></td>
													<td><a
														href="<c:url value="/plan/view/${plan.id}.html" />"
														class="btn override btn-primary"><i class="fa fa-eye "></i>
															View Plan</a>
															
															<%--
															<a href="<c:url value="/plan/clone.html?planId=${plan.id}" />"
														class="btn btn-primary"><i class="fa fa-share-alt "></i>
															Clone</a>
															 --%>
															
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
