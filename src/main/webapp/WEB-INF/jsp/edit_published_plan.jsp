<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

<security:authorize access="hasRole('STUDENT')">
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

				<ol class="breadcrumb">
					<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
					<li><a href="<c:url value="/admin/list-plans.html"/>">Flight
						Plans</a></li>
					<li class="active">View Plan</li>
				</ol>


				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

			<c:choose>

			<c:when test="${not empty plan }">

				<div class="row" ng-controller="checkpointController">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h5><span class="planTitle"><a href="<c:url value="/plan/view/${plan.id}.html"/>">${plan.name}</a>
										(${plan.seasonName} ${plan.seasonYear})
									<a title="Edit Plan Title" href="<c:url value="/plan/edit-info/${plan.id}.html"/>"><span class="glyphicon glyphicon-edit"></span></a>
									</span>
									
									<label class="label override label-success">Published</label>
									<a title="Unpublish Plan" href="<c:url value="/admin/plan/unpublish.html?planId=${plan.id}" />"><i class="fa fa-undo "></i></a>
									</h5>
									
								</div>
								<div class="col-xs-offset-5 ">
								      <div id="successMessage" style="color:#090;display:none;"><h5>Orders updated successfully</h5></div>
								</div>

								<security:authorize access="authenticated and hasRole('ADMIN')">
									<a href="<c:url value="/plan/view/${plan.id}.html"/>" class="btn override btn-warning pull-right">Back</a>
									
									<div class="btn-group pull-right" style="margin-right:5px;">
										<button class="btn override btn-primary">Add To Plan</button>
										<button data-toggle="dropdown"
											class="btn override btn-primary dropdown-toggle">
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<%--
											<li><a
												href="<c:url value="/admin/plan/add-runway.html?planId=${plan.id}"/>">Another
													Runway</a></li>
											<li><a
												href="<c:url value="/admin/plan/add-stage.html?planId=${plan.id}"/>">Another
													Stage</a></li>
											 --%>
											<li><a
												href="<c:url value="/admin/plan/add-checkpoint.html?planId=${plan.id}"/>">Another
													Milestone</a></li>
										</ul>
									</div>
									
								</security:authorize>
								<div style="clear: both;"></div>
							</div>

							<div class="panel-body">
							</div>
						</div>
						
						
						<div class="">
									<table id="sortable" class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th>
													<input type="hidden" id="planId" value="${plan.id}" />
												</th>
												<c:forEach items="${plan.runways}" var="runway">
													
													<c:if test="${not empty runway}">
													
													<th class="accept" id="${runway.id}">${runway.name} 
													<security:authorize access="hasRole('ADMIN')">
														<a title="Edit Runway" href="<c:url value="/admin/plan/edit-runway.html?id=${runway.id}&planId=${plan.id}"/>"> <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> </a>
													</security:authorize>
													</th>
													
													</c:if>
													
												</c:forEach>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${plan.stages}" var="stage" varStatus="counter">
												
												<c:if test="${not empty stage}">
												
												<tr class="state-default" id="${stage.id}" order="${counter.count}">
													<th class="">${stage.name} 
													<security:authorize access="hasRole('ADMIN')">
														<a title="Edit Stage" href="<c:url value="/admin/plan/edit-stage.html?id=${stage.id}&planId=${plan.id}"/>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
													</security:authorize>
													</th>
													<c:forEach items="${plan.runways}" var="runway">
														
														<c:if test="${not empty runway}">
														
														<td>
																<span class="add_milestone_btn">
																<a title="Add Milestone" href="<c:url value="/admin/plan/add-checkpoint.html?planId=${plan.id}&r=${runway.id}&s=${stage.id}" />"><i class="fa fa-plus"></i></a>
																</span>
																<c:forEach items="${plan.cells}" var="cell">
																	<c:if
																		test="${cell.runway.id == runway.id && cell.stage.id == stage.id }">
																		<ul id="${cell.id}" class="checkpoint_list list">
																		<c:forEach items="${cell.checkpoints}" var="checkpoint">
																		<li id="${checkpoint.id}" class="list">
																		<c:set var="userCheckedPoint"
																				value="0" /> <c:forEach
																				items="${currUserObj.checkpoints}" var="userChk">

																				<c:if test="${userChk.id == checkpoint.id }">
																					<c:set var="userCheckedPoint" value="1" />
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
																			</c:choose> 
																			<span class="checkpoint_information pull-left">
																				${checkpoint.name}
																			</span>
																			<security:authorize access="authenticated and hasRole('ADMIN')">
																				<a title="Edit Checkpoint" class=""
																					href="<c:url value="/admin/plan/edit-checkpoint.html?id=${checkpoint.id}&cellId=${cell.id}&planId=${plan.id}" />"
																					class="btn btn-link"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
																			</security:authorize>
																			</li>
																			</c:forEach>
																			</ul>
																	</c:if>
																</c:forEach>
														</td>
														
														</c:if>
													</c:forEach>

												</tr>
												</c:if>

											</c:forEach>
										</tbody>
									</table>
									
									<div class="pull-right">
										
									</div>	
									
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


	<jsp:include page="includes/footer.jsp" />

<security:authorize access="hasRole('ADMIN')">

<script type="text/javascript">

$( ".checkpoint_list" ).sortable({
	cursor: "move",
	update: function( event, ui ) {
		var planId = $('#planId').val();
		var cellId = $(this).attr("id");
		//alert(cellId);
		var checkIds = $(this).sortable('toArray');
		$.ajax({ url : '<c:url value="/admin/plan/reorder-checkpoints.html" />',
			 method : 'POST',
			 data: {"planId" : planId, "cellId" : cellId, "checkpointIds" : checkIds},
			 success : function(response){
				 // customAlert(response, 'information');
				 $("#successMessage").show();
         		setTimeout(function(){
						$("#successMessage").hide();
					},3000);
			}
		});
	}
});

function publishPlan(planID) {
	
	smoke.confirm("Are you sure you want to publish this plan?", function(e){
		if (e){
			top.location.href = '<c:url value="/admin/plan/publish.html?planId='+planID+'" />';
		}else{
			
		}
	}, {
		ok: "Yes",
		cancel: "No",
		classname: "custom-class",
		reverseButtons: true
	});	
}

</script>
</security:authorize>

</body>
</html>
