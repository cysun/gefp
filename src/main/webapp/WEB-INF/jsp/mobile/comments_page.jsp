<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>	

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | View Comments on Milestone</title>
<jsp:include page="../includes/styles.jsp" />

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
		<jsp:include page="../includes/header.jsp" />

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
							<li class="active">Flight Plan</li>
							<li class="active">Add Comment</li>
						</ol>

					</c:when>
					<c:otherwise>
						<ol class="breadcrumb">
							<security:authorize access="hasRole('ADMIN')">
								<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
								<li><a href="<c:url value="/admin/list-users.html"/>">Users</a></li>
							</security:authorize>

							<security:authorize access="hasRole('ADVISOR')">
								<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
							</security:authorize>

							<li class="active">Add Comment</li>
						</ol>
					</c:otherwise>
				</c:choose>

				<jsp:include page="../includes/dashboard_title.jsp" />
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
												<span class="planTitle">Plan Title: ${plan.name} <security:authorize
														access="hasAnyRole('ADMIN','ADVISOR')">
												(${plan.seasonName} ${plan.seasonYear})
											</security:authorize>
												</span>
											</h5>
											Major: ${plan.department.name}
										</div>

										
										<security:authorize access="hasRole('STUDENT')">
										
										<div class="pull-right">
											<a class="btn override btn-primary"
												href="<c:url value="/student/view-plan/${userId}.html" />"><i
												class="fa fa-back "></i> Back</a>
										</div>
										
										</security:authorize>
										
										<security:authorize access="hasAnyRole('ADMIN','ADVISOR')">
										
										<div class="pull-right">
											<a class="btn override btn-primary"
												href="<c:url value="/advisor/view-student-plan/${userId}.html" />"><i
												class="fa fa-back "></i> Back</a>
										</div>
										
										</security:authorize>



										<div style="clear: both;"></div>
									</div>


									<div class="panel-body">									
									Milestone: ${checkpoint.name}</div>
								</div>
								<%-- <a href="<c:url value="/#"/>" class="btn btn-danger">Delete</a> --%>


								<div class="">
									
									<form:form action="" modelAttribute="comment" method="post">
									<table id="sortable"
										class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th>Author</th>
												<th>Message</th>
												<th>Posted On</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="cmt" items="${comments}">
												<tr class="state-default">
													<th><span title="${cmt.commentedBy.firstName} ${cmt.commentedBy.lastName}">${cmt.commentedBy.username}</span></th>
													<td>${cmt.comment }</td>
													<td><span
														style="font-size: 12px; font-weight: normal;">Posted
															On: ${cmt.datetime} </span></td>
												</tr>
											</c:forEach>

											<tr>
												<td colspan="3"><form:textarea path="comment" class="ckeditor form-control"
														placeholder=""></form:textarea></td>
											</tr>
											<tr>
												<td colspan="3" align="right">
												<input type="hidden" name="checkpointId" value="${checkpointId}" />
												<input type="submit" value="Save Comment" class="btn btn-primary override" />
												</td>
											</tr>

										</tbody>
									</table>
									</form:form>

								</div>

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


	<jsp:include page="../includes/footer.jsp" />

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
