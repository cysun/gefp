

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" class="fullscreen">
			<div id="page-inner">


				<c:choose>
					<c:when test="${not empty StudentUser}">

						<a class="btn override btn-primary"
							href="<c:url value="/advisor/view-student-plan/${currUserObj.id}.html" />"><i
							class="fa fa-print "></i></a>

					</c:when>
					<c:otherwise>

						<a class="noprint"
							href="<c:url value="/advisor/view-student-plan/${currUserObj.id}.html" />">
							<i class="fa fa-arrow-left noprint"></i>
						</a>
						
						<span class="ml10">
							${currUserObj.firstName} ${currUserObj.lastName}'s Flight Plan
						</span>
						
						<a class="pull-right" href="javascript:window.print();"> <i class="fa fa-print noprint"></i>
						</a>

					</c:otherwise>
				</c:choose>

				<!-- /. ROW  -->

				<hr />




				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel">



								<table id="student-details" class="table student-details">
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

						</div>
						<div class="studentPlanTitle"> ${plan.name} (${plan.seasonName} ${plan.seasonYear})</div>
						<div>

							<table class="table table-bordered table-responsive">
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
																<c:forEach items="${cell.checkpoints}" var="checkpoint">
																	<li id="${checkpoint.id}" class="list"><c:set
																			var="userCheckedPoint" value="0" /> <c:set
																			var="checkMessage" value="" /> <c:forEach
																			items="${currUserObj.checkpointsInfo}"
																			var="userChkInfo">

																			<c:if
																				test="${userChkInfo.checkpoint.id == checkpoint.id }">
																				<c:set var="userCheckedPoint" value="1" />
																				<c:set var="checkMessage"
																					value="${userChkInfo.message}" />
																			</c:if>

																		</c:forEach> <c:choose>

																			<c:when test="${userCheckedPoint == 1}">

																				<input checked type="checkbox" name="checkpoints"
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
				<!-- /. ROW  -->

			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

	<!-- BOOTSTRAP SCRIPTS -->
	<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="<c:url value="/assets/js/jquery.metisMenu.js" />"></script>
	<!-- CUSTOM SCRIPTS -->

	<script src="<c:url value="/assets/js/angular.min.js" />"></script>
	<script src="<c:url value="/assets/js/gefp.app.js" />"></script>
	<script src="<c:url value="/assets/js/smoke.min.js" />"></script>
	<script src="<c:url value="/assets/ckeditor/ckeditor.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.dragtable.js"/>"></script>
	<script src="<c:url value="/assets/js/jquery.noty.packaged.min.js"/>"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script
		src="<c:url value="/assets/js/dataTables/jquery.dataTables.js" />"></script>
	<script
		src="<c:url value="/assets/js/dataTables/dataTables.bootstrap.js" />"></script>

	<script src="<c:url value="/assets/js/custom.js" />"></script>

	<script>
		$(document)
				.ready(
						function() {
							$('#dataTables').dataTable({
								"lengthMenu" : [ 10, 20, 50, 100 ],
								"pageLength" : 10
							});

							$('#dataTablesNoFilter').dataTable({
								"bFilter" : false,
								"lengthMenu" : [ 10, 20, 50, 100 ],
								"pageLength" : 10
							});

							$("#search")
									.autocomplete(
											{
												source : "<c:url value='/autocomplete/user.html' />",
												select : function(event, ui) {
													if (ui.item)
														window.location.href = "<c:url value='/advisor/view-student-plan/"+ui.item.id+".html' />";
												}
											}).autocomplete("instance")._renderItem = function(
									ul, item) {
								var li = $("<li>");
								return li.append(item.label).appendTo(ul);
							};

							setTimeout(function() {
								$('body').addClass('loaded');
							}, 100);

						});
	</script>
	<script>
		$(document).ready(function() {

		});
	</script>


</body>
</html>
