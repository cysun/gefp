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


				<c:choose>

					<c:when test="${not empty plan }">

						<div class="row" ng-controller="checkpointController">
							<div class="col-md-12 col-sm-12 col-xs-12">

								<div class="panel panel-default">
									<div class="panel-heading">



										<table id="student-details" class="table table-striped student-details">
											<thead>
												<tr>
													<td align="right" colspan="4"><a
														class="editStudentInfo" id="StartEditMode" href="javascript:void(0)"><i
															class="fa fa-edit "></i>Edit</a></td>
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
													<td>
													<input type="hidden" id="oldMajorId" value="${currUserObj.major.id}" />
													<span id="major">${currUserObj.major.name}</span></td>
												</tr>
											</tbody>
										</table>
										
										<table class="table table-striped edit-student-details">
											<tbody>
												<tr>
													<th>First Name:</th>
													<td><input type="text" id="firstNameInp" name="firstName" class="form-control" value="${currUserObj.firstName}" /></td>
													<th>Last Name:</th>
													<td><input type="text" id="lastNameInp" name="lastName" class="form-control" value="${currUserObj.lastName}" /></td>
												</tr>
												<tr>
													<th>Username:</th>
													<td>${currUserObj.username}</td>
													<th>Email:</th>
													<td><input type="text" id="emailInp" name="email" class="form-control" value="${currUserObj.email}" /></td>
												</tr>
												<tr>
													<th>CIN:</th>
													<td><input type="text" id="cinInp" name="cin" class="form-control" value="${currUserObj.cin}" /></td>
													<th>Major:</th>
													<td>
														<select class="form-control" name="major" id="majorInp">
															<option value="">Select Major</option>
															<c:forEach var="dept" items="${departments}">
																<c:choose>
																	<c:when test="${dept.id == currUserObj.major.id }">
																		<option value="${dept.id}" data-txt="${dept.name}" selected>${dept.name}</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${dept.id}" data-txt="${dept.name}">${dept.name}</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
													</td>
												</tr>
												
												<tr>
													<td colspan="4" align="right">
													<input type="hidden" name="" value="${currUserObj.id}" id="userId" />
													<input id="SaveInformation" type="button" class="btn btn-info" value="Save" /> </td>
												</tr>
												
											</tbody>
										</table>



										<div class="col-xs-offset-5 ">
											<div id="successMessage" style="color: #090; display: none;">
												<h5>Checkpoints updated successfully</h5>
											</div>
										</div>

										<div style="clear: both;"></div>
									</div>


									<div class="panel-body">
										<div class="table-responsive">

											<div class="studentPlanTitle">${currUserObj.firstName}'s
												Flight Plan</div>

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
																							var="userCheckedPoint" value="0" /> <c:set
																							var="checkMessage" value="" /> <c:forEach
																							items="${currUserObj.checkpoints}"
																							var="userChkInfo">

																							<c:if
																								test="${userChkInfo.checkpoint.id == checkpoint.id }">
																								<c:set var="userCheckedPoint" value="1" />
																								<c:set var="checkMessage"
																									value="${userChkInfo.message}" />
																							</c:if>

																						</c:forEach> <c:choose>

																							<c:when test="${userCheckedPoint == 1}">

																								<input checked type="checkbox"
																									name="checkpoints"
																									data-userId="${currUserObj.id}"
																									value="${checkpoint.id}"
																									class="flightplan_checkpoints pull-left" />
																									${checkMessage}
																									
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

<script>

$(document).ready(function(){
	$("#StartEditMode").click(function(){
		$("#student-details").hide();
		$(".edit-student-details").show();
	});
	
	$("#SaveInformation").click(function(){
		console.log("test gdv ykdgyfgyksgk");
		
		var oldMajorId = $("#oldMajorId").val();
		var userId = $("#userId").val();
		var firstName = $("#firstNameInp").val();
		var lastName = $("#lastNameInp").val();
		var email = $("#emailInp").val();
		var cin = $("#cinInp").val();
		var major = $("#majorInp").val();
		
		$.ajax({
			data : {userId:userId, firstName:firstName, lastName:lastName, email:email, cin:cin, major:major},
			dataType: "text",
			method : "POST",
			url : '<c:url value="/advisor/update-student-profile.html" />',
			success : function(data, textStatus, jqXHR ) {
				
				if(oldMajorId!=major) {
					top.location.reload();
				}
				else {
					$("#firstName").text(firstName);
					$("#lastName").text(lastName);
					$("#email").text(email);
					$("#cin").text(cin);
					$("#major").text($("#majorInp option:selected").attr("data-txt"));
					$("#student-details").show();
					$(".edit-student-details").hide();
				}
				
				
			}
		})
		
		
	});
	
});


</script>


</body>
</html>
