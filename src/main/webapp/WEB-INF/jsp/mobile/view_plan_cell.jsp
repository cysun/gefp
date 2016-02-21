<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | List of Milestones</title>
<jsp:include page="../includes/styles.jsp" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
</head>
<body>
	<div id="wrapper">
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" class="fullscreen">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<c:choose>
							<c:when test="${not empty cell }">
								<table id="${cell.id}"
									class="checkpoint_list list milestone_list_table">
									<c:forEach items="${cell.checkpoints}" var="checkpoint">
										<c:if test="${not empty checkpoint}">
											<tr>
												<td id="${checkpoint.id}" class="list first"><c:set
														var="userCheckedPoint" value="0" /> <c:set
														var="checkMessage" value="" /> <c:forEach
														items="${currUserObj.checkpointsInfo}" var="userChkInfo">

														<c:if
															test="${userChkInfo.checkpoint.id == checkpoint.id }">
															<c:set var="userCheckedPoint" value="1" />
															<c:set var="checkMessage" value="${userChkInfo.message}" />
														</c:if>

													</c:forEach> <c:choose>

														<c:when test="${userCheckedPoint == 1}">

															<input checked type="checkbox" name="checkpoints"
																data-userId="${currUserObj.id}" value="${checkpoint.id}"
																class="flightplan_checkpoints_mobile pull-left" />

															<c:if test="${not empty checkMessage }">
																<!-- <i class="fa fa-comments-o "></i> -->

																<img data-comment="${checkMessage}"
																	class="CommentIcon CommentIconClick"
																	src="<c:url value="/assets/img/comment-icon.png" />" />
															</c:if>
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="checkpoints"
																data-userId="${currUserObj.id}" value="${checkpoint.id}"
																class="flightplan_checkpoints_mobile pull-left" />
														</c:otherwise>
													</c:choose></td>
												<td><span class="checkpoint_information pull-left">
														${checkpoint.name} </span></td>
												<td class="plan_controls"><span> <!-- <i class="fa fa-comments-o "></i> -->
														<a
														href="<c:url value="/plan/milestone/add-comment.html?planId=${plan.id}&checkpointId=${checkpoint.id}&userId=${currUserObj.id }"/>">
															<i class="fa fa-comments-o "></i>
													</a></span></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</c:when>
							<c:otherwise>
								<div class="">No Milestones available</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

	<!-- BOOTSTRAP SCRIPTS -->
	<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/custom.js" />"></script>

</body>
</html>
