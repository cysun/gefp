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

			<ol class="breadcrumb">
				<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
				<li><a href="<c:url value="/admin/list-departments.html"/>">Departments</a></li>
				<li class="active">Add New Department</li>
			</ol>


			<div id="page-inner">
				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />


				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add new Department</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form:form modelAttribute="department">
											<div class="form-group">
												<label class="col-sm-2 control-label">Department Name <span class="compulsary">*</span></label>
												
												<div class="col-sm-9">
												<form:input path="name" class="form-control" />
												<c:if test="${error == true }">
												<span class="errMsg">Please enter Department Name</span>
												</c:if>
												</div>
												<!-- <p class="help-block">Enter department name.</p> -->
											</div>

											
											<button type="submit" class="btn pull-right override btn-primary ml10">Save</button>
											<a href="<c:url value="/admin/list-departments.html"/>" class="btn pull-right override btn-primary">Cancel</a>
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
