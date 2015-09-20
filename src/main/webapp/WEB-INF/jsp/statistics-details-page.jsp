<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html ng-app="gefpApp" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | Flight Plan Statistics</title>
<jsp:include page="includes/styles.jsp" />

</head>
<body>

	<div id="wrapper">

		<security:authorize access="hasRole('STUDENTAAA')">
			<div id="loader-wrapper">
				<div id="loader"></div>

				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
		</security:authorize>
		<jsp:include page="includes/header.jsp" />

		<%--  
		<jsp:include page="includes/left_menu.jsp" />
		--%>

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" class="fullscreen">
			<div id="page-inner">


				<c:choose>
					<c:when test="${not empty StudentUser}">

						<ol class="breadcrumb">
							<li><a href="<c:url value="#"/>">Home</a></li>
							<li class="active">View Plan</li>
						</ol>

					</c:when>
					<c:otherwise>
						<ol class="breadcrumb">
							<security:authorize access="hasRole('ADMIN')">
								<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
								<li><a href="<c:url value="/admin/list-plans.html"/>">Flight
										Plans</a></li>
							</security:authorize>

							<security:authorize access="hasRole('ADVISOR')">
								<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
							</security:authorize>

							<li class="active">Milestone Statistics</li>
						</ol>
					</c:otherwise>
				</c:choose>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->



				<hr />

				<c:choose>

					<c:when test="${not empty plan }">

						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">

								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="pull-left">
											<h5>
												<span class="planTitle">Plan Title: <b>${plan.name} <security:authorize
														access="hasAnyRole('ADMIN','ADVISOR')">
												(${plan.seasonName} ${plan.seasonYear})
											</security:authorize>
											</b>
												</span>
											</h5>
										</div>

										<div class="pull-right">
											<a class=""
												href="<c:url value="/plan/view/${plan.id}.html" />"><i
												class="fa fa-arrow-left "></i> Back</a>
										</div>
										<div style="clear: both;"></div>
									</div>


									<div class="panel-body">Milestone: ${checkpoint.name}</div>
								</div>
								<%-- <a href="<c:url value="/#"/>" class="btn btn-danger">Delete</a> --%>


								<div class="mb20 col-md-12">
									Total Number of Students who checked this Milestone: <b>${cp_users.size()}</b>
								</div>
								
								<c:if test="${cp_users.size() > 0 }">
								<div class="col-md-6">
									<table id="sortable"
										class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th>#</th>
												<th>CIN</th>
												<th>Name</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${cp_users}" var="usr" varStatus="index">
												<tr class="state-default">
													<td>${index.count}
													<td><a
														href="<c:url value="/advisor/view-student-plan/${usr.id}.html" />">${usr.cin}</a></td>
													<td><a
														href="<c:url value="/advisor/view-student-plan/${usr.id}.html" />">${usr.firstName} ${usr.lastName}</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
								</c:if>

							</div>
						</div>
						<!-- /. ROW  -->

					</c:when>

					<c:otherwise>
				Plan not available
			
			</c:otherwise>

				</c:choose>


			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->


	<jsp:include page="includes/footer.jsp" />

	<script type="text/javascript">
		function publishPlan(planID) {

			smoke
					.confirm(
							"Are you sure you want to publish this plan?",
							function(e) {
								if (e) {
									top.location.href = '<c:url value="/admin/plan/publish.html?planId='
											+ planID + '" />';
								} else {

								}
							}, {
								ok : "Yes",
								cancel : "No",
								classname : "custom-class",
								reverseButtons : true
							});
		}
	</script>

</body>
</html>
