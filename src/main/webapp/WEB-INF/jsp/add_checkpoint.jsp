<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

		<jsp:include page="includes/header.jsp" />
		<!-- /. NAV TOP  -->
		<jsp:include page="includes/left_menu.jsp" />
		<!-- /. NAV SIDE  -->

		<div id="page-wrapper">
			<div id="page-inner">

				<ol class="breadcrumb">
					<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
					<li><a href="<c:url value="/admin/list-plans.html"/>">Flight
							Plans</a></li>
					<li class="active">Add New Checkpoint</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add new Checkpoint</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form:form modelAttribute="checkpoint" class="form-horizontal" method="post">

											<div class="form-group">
												<label class="col-sm-2 control-label">Runway Name:</label>
												<div class="col-sm-9">
													
													<select name="runwayId" class="form-control">
														<option value="">--Select Runway--</option>
														<c:forEach var="runway" items="${flightplan.runways}">
															<c:choose>
															<c:when test="${runway.id == r}">
																<option selected value="${runway.id}">${runway.name}</option>
															</c:when>
															<c:otherwise>
																<option value="${runway.id}">${runway.name}</option>
															</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>										
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">Stage Name:</label>
												<div class="col-sm-9">
													
													<select name="stageId" class="form-control">
														<option value="">--Select Stage--</option>
														<c:forEach var="stage" items="${flightplan.stages}">
															<c:choose>
															<c:when test="${stage.id == s}">
																<option selected value="${stage.id}">${stage.name}</option>
															</c:when>
															<c:otherwise>
																<option value="${stage.id}">${stage.name}</option>
															</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-2 control-label">Milestone
													Info:</label>
												<div class="col-sm-9">
													<form:textarea path="name" class="ckeditor form-control" placeholder="Checkpoint Name" ></form:textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-11">
												<input type="hidden" name="chkId" value="${checkpoint.id }" />
												<input type="hidden" name="planId" value="${flightplan.id }" />
												<input type="submit" class="btn override btn-primary pull-right ml10" value="Save" />
												<a class="btn override btn-primary pull-right" href="<c:url value="/plan/edit/${flightplan.id }.html"/>">Cancel</a>
													<!-- <button type="reset" class="btn btn-primary">Reset Button</button> -->
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
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

$(function(){
	$("textarea").each(function(){
    CKEDITOR.replace( $(this).attr("id"), {
      toolbar : "Default"
    });
});

</script>

</body>
</html>