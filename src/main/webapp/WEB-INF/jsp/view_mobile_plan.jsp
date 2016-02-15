<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html ng-app="gefpApp" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | View Flight Plan</title>
<jsp:include page="includes/styles.jsp" />

</head>
<body>

	<div id="wrapper">
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" class="fullscreen">
			<div id="page-inner">

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
									</h5>
								</div>

								<div class="col-xs-offset-5 ">
									<div id="successMessage" style="color: #090; display: none;">
										<h5>Checkpoint saved successfully</h5>
									</div>
								</div>

								<div style="clear: both;"></div>
							</div>


							<div class="panel-body">
								Major: <b>${plan.department.name}</b>

							</div>
						</div>
						
						</div>
						
						</div>
				<!-- /. ROW  -->

						<div class="row">
						<div class="col-md-12">
						<c:choose>

							<c:when test="${not empty plan }">
								
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
																			<table id="${cell.id}" class="checkpoint_list list milestone_list_table">
																				<c:forEach items="${cell.checkpoints}"
																					var="checkpoint">

																					<c:if test="${not empty checkpoint}">
																						<tr>
																						<td id="${checkpoint.id}" class="list first"><c:set
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
																							</c:choose>
																							</td>
																							<td>
																							<span class="checkpoint_information pull-left">
																								${checkpoint.name}
																							</span>
																							</td>
																							
																							<td class="plan_controls">

																						 <%-- <img
																									class="CommentIcon"
																									src="<c:url value="/assets/img/comment-icon.png" />" /> --%>

																								<span> <!-- <i class="fa fa-comments-o "></i> -->
																									<a
																									href="<c:url value="/plan/milestone/add-comment.html?planId=${plan.id}&checkpointId=${checkpoint.id}&userId=${StudentUser.id }"/>">
																										<i class="fa fa-comments-o "></i>
																								</a></span>
																							</td>
																							</tr>
																					</c:if>
																				</c:forEach>
																			</table>
																		</c:if>
																	</c:forEach></td>

															</c:if>
														</c:forEach>

													</tr>
												</c:if>

											</c:forEach>
										</tbody>
									</table>

							</c:when>
							<c:otherwise>
								<div class="">Plan not available</div>
							</c:otherwise>

						</c:choose>
						</div>
						
						</div>

						<div class="row">
						
							<div class="col-md-12">Comments:</div>

							<div class="col-md-12">
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


										<c:forEach var="cmt" items="${currUserObj.comments}">

											<tr class="state-default">
												<th>${cmt.commentedBy.username }</th>
												<td>${cmt.comment}</td>
												<td><span style="font-size: 12px; font-weight: normal;"><fmt:formatDate
															dateStyle="medium" timeStyle="medium" type="BOTH"
															value="${cmt.datetime}" /> </span></td>
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

</body>
</html>
