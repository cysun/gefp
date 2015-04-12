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
							
							<a href="<c:url value="/admin/plan/add.html"/>" class="pull-right btn btn-primary">Add
							New Plan</a>
							<div class="clearfix"></div>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<form action="" method="post">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th></th>
												<th>#</th>
												<th>Plan Name</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${plans}" var="plan">

												<tr>
													<td>
													<c:set var="planSet" value="0" />
													<c:forEach var="tmp" items="${department.plans}">
														<c:if test="${tmp.id == plan.id }">
															<c:set var="planSet" value="1" />
														</c:if>
													</c:forEach>
													
													<c:choose>
														<c:when test="${planSet == 1}">
															<input type="checkbox" checked name="pis" value="${plan.id}" />
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="pis" value="${plan.id}" />
														</c:otherwise>
													</c:choose>
													
													</td>
													
													<td>${plan.id}</td>
													<td>${plan.name}</td>
													<td><a
														href="<c:url value="/plan/view/${plan.id}.html" />"
														class="btn btn-primary"><i class="fa fa-eye "></i>
															View Plan</a>
													</td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
									
									<button type="submit" class="btn btn-info">Save Selection</button>
									<span style="color:#F00;">${errorMessage}</span>
									<c:remove var="errorMessage" />
									</form>
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
