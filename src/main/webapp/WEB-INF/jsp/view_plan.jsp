<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

							<li class="active">View Plan</li>
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
												<span class="planTitle">${plan.name} <security:authorize
														access="hasAnyRole('ADMIN','ADVISOR')">
												(${plan.seasonName} ${plan.seasonYear})
											</security:authorize>
												</span>

												<security:authorize access="hasRole('ADMIN')">
													<c:if test="${student_mode != true}">
														<c:if test="${plan.published == true }">
															<label class="label override label-success">Published</label>
														</c:if>
														<c:if test="${plan.published == false }">
															<a onClick="publishPlan(${plan.id})"
																class="pull-right btn btn-warning"
																href="javascript:void(0);">Publish Now</a>
														</c:if>
													</c:if>
												</security:authorize>
											</h5>
										</div>

										<div class="col-xs-offset-5 ">
											<div id="successMessage" style="color: #090; display: none;">
												<h5>Checkpoint saved successfully</h5>
											</div>
										</div>

										<security:authorize access="hasRole('ADMIN')">

											<c:if test="${student_mode != true}">
												<div class="pull-right">
													<a title="Edit Plan" class=""
														href="<c:url value="/plan/edit/${plan.id}.html" />"><i
														class="fa fa-edit "></i></a>
												</div>
											</c:if>
										</security:authorize>

										<c:if test="${not empty StudentUser}">
											<div class="pull-right">
												<a style="text-decoration: underline;"
													class="btn override btn-link"
													href="<c:url value="/user/profile.html"/>">Edit Profile</a>
											</div>

										</c:if>

										<div style="clear: both;"></div>
									</div>


									<div class="panel-body"></div>
								</div>

								<div class="">
									<table id="sortable"
										class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th><input type="hidden" id="planId" value="${plan.id}" /></th>
												<c:forEach items="${plan.runways}" var="runway">
													<c:if test="${not empty runway}">
														<th>${runway.name}</th>
													</c:if>
												</c:forEach>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${plan.stages}" var="stage"
												varStatus="counter">

												<c:if test="${not empty stage}">
													<tr class="state-default">
														<th>${stage.name}</th>
														<c:forEach items="${plan.runways}" var="runway">

															<c:if test="${not empty runway}">
																<td><c:forEach items="${plan.cells}" var="cell">
																		<c:if
																			test="${cell.runway.id == runway.id && cell.stage.id == stage.id }">
																			<ul id="${cell.id}" class="checkpoint_list list">
																				<c:forEach items="${cell.checkpoints}"
																					var="checkpoint">

																					<c:if test="${not empty checkpoint}">
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

																									<input checked type="checkbox"
																										name="checkpoints"
																										data-userId="${currUserObj.id}"
																										value="${checkpoint.id}"
																										class="flightplan_checkpoints pull-left" />

																									<c:if test="${not empty checkMessage }">
																										<!-- <i class="fa fa-comments-o "></i> -->

																										<img data-comment="${checkMessage}"
																											class="CommentIcon CommentIconClick"
																											src="<c:url value="/assets/img/comment-icon.png" />" />
																									</c:if>
																								</c:when>
																								<c:otherwise>
																									<input type="checkbox" name="checkpoints"
																										data-userId="${currUserObj.id}"
																										value="${checkpoint.id}"
																										class="flightplan_checkpoints pull-left" />
																								</c:otherwise>
																							</c:choose> <span class="checkpoint_information pull-left">
																								${checkpoint.name} <security:authorize
																									access="hasAnyRole('ADMIN','ADVISOR')">
																								&nbsp;<a
																										href="<c:url value="/plan/statistics-details.html?planId=${plan.id}" />">
																										(20)</a>
																								</security:authorize>

																						</span>
																						
																						<%-- <img
																									class="CommentIcon"
																									src="<c:url value="/assets/img/comment-icon.png" />" /> --%>
																						
																						 <security:authorize access="hasRole('STUDENT')">
																						 <span> <!-- <i class="fa fa-comments-o "></i> --> <a
																								href="<c:url value="/plan/milestone/add-comment.html?planId=${plan.id}&checkpointId=${checkpoint.id}&userId=${StudentUser.id }"/>">
																								<i class="fa fa-comments-o "></i>
																								</a></span>
																						 </security:authorize>

																						</li>

																					</c:if>
																				</c:forEach>
																			</ul>
																		</c:if>
																	</c:forEach></td>

															</c:if>
														</c:forEach>

													</tr>
												</c:if>

											</c:forEach>
										</tbody>
									</table>

								</div>


								<div class="row">Comments:</div>

								<div class="row">
									<table id="sortable"
										class="table table-striped table-bordered sar-table table-responsive">
										<thead>
											<tr>
												<th>Author</th>
												<th>Comment</th>
												<th>Commented On</th>
											</tr>
										</thead>
										<tbody>

											<tr class="state-default">
												<th>jdoe2</th>
												<td>Lorem Ipsum is simply dummy text of the printing
													and typesetting industry. Lorem Ipsum has been the
													industry's standard dummy text ever since the 1500s, when
													an unknown printer took a galley of type and scrambled it
													to make a type specimen book. It has survived not only five
													centuries</td>
												<td><span style="font-size: 12px; font-weight: normal;">Posted
														On: 14:33 Sep 03, 2015 </span></td>
											</tr>
											<tr class="state-default">
												<th>tfox</th>
												<td>Lorem Ipsum is simply dummy text of the printing
													and typesetting industry. Lorem Ipsum has been the
													industry's standard dummy text ever since the 1500s, when
													an unknown printer took a galley of type and scrambled it
													to make a type specimen book. It has survived not only five
													centuries</td>
												<td><span style="font-size: 12px; font-weight: normal;">Posted
														On: 14:33 Sep 03, 2015 </span></td>
											</tr>
											<tr class="state-default">
												<th>jdoe2</th>
												<td>Lorem Ipsum is simply dummy text of the printing
													and typesetting industry. Lorem Ipsum has been the
													industry's standard dummy text ever since the 1500s, when
													an unknown printer took a galley of type and scrambled it
													to make a type specimen book. It has survived not only five
													centuries</td>
												<td><span style="font-size: 12px; font-weight: normal;">Posted
														On: 14:33 Sep 03, 2015 </span></td>
											</tr>
											<tr class="state-default">
												<th>tfox</th>
												<td>Lorem Ipsum is simply dummy text of the printing
													and typesetting industry. Lorem Ipsum has been the
													industry's standard dummy text ever since the 1500s, when
													an unknown printer took a galley of type and scrambled it
													to make a type specimen book. It has survived not only five
													centuries</td>
												<td><span style="font-size: 12px; font-weight: normal;">Posted
														On: 14:33 Sep 03, 2015 </span></td>
											</tr>
											<tr class="state-default">
												<th>jdoe2</th>
												<td>Lorem Ipsum is simply dummy text of the printing
													and typesetting industry. Lorem Ipsum has been the
													industry's standard dummy text ever since the 1500s, when
													an unknown printer took a galley of type and scrambled it
													to make a type specimen book. It has survived not only five
													centuries</td>
												<td><span style="font-size: 12px; font-weight: normal;">Posted
														On: 14:33 Sep 03, 2015 </span></td>
											</tr>


											<security:authorize access="hasAnyRole('ADMIN','ADVISOR')">
												<form:form modelAttribute="comment">
												<tr>
													<td colspan="3"><textarea
															class="ckeditor form-control" placeholder=""></textarea></td>
												</tr>
												<tr>
													<td colspan="3" align="right"><input type="submit"
														class="btn btn-primary override" value="Add Comment" /></td>
												</tr>
												</form:form>
											</security:authorize>
										</tbody>
									</table>

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

	<script type="text/javascript">

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

</body>
</html>
