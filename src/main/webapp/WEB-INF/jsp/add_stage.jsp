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
					<li><a href="<c:url value="/admin/list-plans.html"/>">Flight Plans</a></li>
					<li class="active">Add New Stage</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add new Stage</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form:form modelAttribute="stage">
											<div class="form-group">
												<label>Stage Name</label>
												<form:input path="name" class="form-control" />
												<c:if test="${error == true }">
												<span class="errMsg">Please enter Stage Name</span>
												</c:if>
											</div>

											<input type="hidden" name="planId" value="${flightplan.id}" />
											<input type="submit" class="btn override btn-primary" value="Save" />
											<!-- <button type="reset" class="btn btn-primary">Reset Button</button> -->
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

</body>
</html>