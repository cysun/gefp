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
<title>Golden Eagle Flight Plan | Student Flight Plan History</title>
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
							</security:authorize>

							<security:authorize access="hasRole('ADVISOR')">
								<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
							</security:authorize>

							<li class="active">Student Flight Plan History</li>
						</ol>
					</c:otherwise>
				</c:choose>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->



				<hr />

				<div class="row" ng-controller="checkpointController">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">



								<table id="student-details"
									class="table table-striped student-details">
									<thead>
										<tr>
											<td colspan="2">Student's Profile</td>
											<td align="right" colspan="2"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>First Name:</th>
											<td><span id="firstName">${currUserObj.firstName}</span></td>
											<th>Last Name:</th>
											<td><span id="lastName">${currUserObj.lastName}</span></td>
										</tr>
										<tr>
											<th>Username:</th>
											<td>${currUserObj.username}</td>
											<th>Email:</th>
											<td><span id="email">${currUserObj.email}</span></td>
										</tr>
										<tr>
											<th>CIN:</th>
											<td><span id="cin">${currUserObj.cin}</span></td>
											<th>Major:</th>
											<td><input type="hidden" id="oldMajorId"
												value="${currUserObj.major.id}" /> <span id="major">${currUserObj.major.name}</span></td>
										</tr>
									</tbody>
								</table>
								<div style="clear: both;"></div>
							</div>



							<div class="panel-body">
								<div class="">

									<div class="pull-left">Student's Flight Plan History:</div>
									<div class="studentPlanTitle pull-right">
										<a title="Back to Flight Plan"
											href="<c:url value="/advisor/view-student-plan/${currUserObj.id}.html"/>"><i
											class="fa fa-arrow-left "></i></a>
									</div>

								</div>
							</div>
						</div>
						</div>
						
						<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="sortable"
										class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th>#</th>
												<th>Flight Plan Title</th>
												<th>Department</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${currUserObj.planHistory}" var="plan" varStatus="index">
												<tr class="state-default">
													<td>${index.count}
													<td>${plan.name}</td>
													<td>${plan.department.name}</td>
													<td>
													<c:choose>
														<c:when test="${currUserObj.flightPlan.id == plan.id }">Current Plan</c:when>
														<c:otherwise><a onClick="changePlan(${currUserObj.id},${plan.id});" href="javascript:void(0);">Make As Current</a></c:otherwise>
													</c:choose>
													
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

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

	<script type="text/javascript">
		function changePlan(userId, planId) {

			smoke
					.confirm(
							"Are you sure you want to chnage this to Student's default plan?",
							function(e) {
								if (e) {
									top.location.href = '<c:url value="/advisor/change-student-default-plan.html?userId='
											+ userId + '&planId='+planId+'" />';
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
