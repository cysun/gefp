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
<title>Golden Eagle Flight Plan</title>
<jsp:include page="includes/styles.jsp" />

</head>
<body>

	<div id="wrapper">

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

							<li class="active">View Plan</li>
						</ol>
					</c:otherwise>
				</c:choose>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />


				<div>
					<div class="">
						<h5>Student Name : ${currUserObj.firstName}
							${currUserObj.lastName}</h5>
					</div>
					<div class="">
						<h5>Student Username : ${currUserObj.username}</h5>
					</div>
					<div class="">
						<h5>CIN : ${currUserObj.cin}</h5>
					</div>
				</div>


				<c:choose>

					<c:when test="${not empty plan }">

						<div class="row" ng-controller="checkpointController">
							<div class="col-md-12 col-sm-12 col-xs-12">

								<div class="panel panel-default">
									<div class="panel-heading">
										
										${currUserObj.firstName}'s Flight Plan
										
										<div class="col-xs-offset-5 ">
											<div id="successMessage" style="color: #090; display: none;">
												<h5>Checkpoints updated successfully</h5>
											</div>
										</div>

										<div style="clear: both;"></div>
									</div>


									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														<th></th>
														<c:forEach items="${plan.runways}" var="runway">
															<th>${runway.name}</th>
														</c:forEach>
													</tr>
												</thead>

												<tbody>

													<c:forEach items="${plan.stages}" var="stage"
														varStatus="counter">
														<tr class="state-default">
															<th>${stage.name}</th>
															<c:forEach items="${plan.runways}" var="runway">
																<td><c:forEach items="${plan.cells}" var="cell">
																		<c:if
																			test="${cell.runway.id == runway.id && cell.stage.id == stage.id }">
																			<ul id="${cell.id}" class="checkpoint_list list">
																				<c:forEach items="${cell.checkpoints}"
																					var="checkpoint">
																					<li id="${checkpoint.id}" class="list"><c:set
																							var="userCheckedPoint" value="0" /> <c:forEach
																							items="${currUserObj.checkpoints}" var="userChk">

																							<c:if test="${userChk.id == checkpoint.id }">
																								<c:set var="userCheckedPoint" value="1" />
																							</c:if>

																						</c:forEach> <c:choose>

																							<c:when test="${userCheckedPoint == 1}">

																								<input checked type="checkbox"
																									name="checkpoints"
																									data-userId="${currUserObj.id}"
																									value="${checkpoint.id}"
																									class="flightplan_checkpoints pull-left" />
																							</c:when>
																							<c:otherwise>
																								<input type="checkbox" name="checkpoints"
																									data-userId="${currUserObj.id}"
																									value="${checkpoint.id}"
																									class="flightplan_checkpoints pull-left" />
																							</c:otherwise>
																						</c:choose> <span class="checkpoint_information pull-left">
																							${checkpoint.name} </span></li>
																				</c:forEach>
																			</ul>
																		</c:if>
																	</c:forEach></td>
															</c:forEach>

														</tr>

													</c:forEach>
												</tbody>



											</table>
										</div>
									</div>

								</div>
								<%-- <a href="<c:url value="/#"/>" class="btn btn-danger">Delete</a> --%>

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

</body>
</html>
