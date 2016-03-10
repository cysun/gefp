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

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" class="fullscreen">
			<div id="page-inner">

				<div class="row">
					<a class="link" href="/gefp/api/mobile-user-plan.html?user_id=${userId}&stage_id=${stageId}&runway_id=${runwayId}&accessKey=${accessKey}">&laquo; Back</a>
				</div>
				
				<div class="row">
									
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
												<input type="hidden" name="runwayId" value="${runwayId}" />
												<input type="hidden" name="stageId" value="${stageId}" />
												<input type="hidden" name="userId" value="${userId}" />
												<input type="hidden" name="checkpointId" value="${checkpointId}" />
												<input type="submit" value="Save Comment" class="btn btn-primary override" />
												</td>
											</tr>

										</tbody>
									</table>
									</form:form>

								</div>


			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

</body>
</html>
