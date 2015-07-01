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
				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Edit Department</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form:form class="form-horizontal" modelAttribute="department"
											action="/gefp/admin/department/edit.html" method="post">
											<div class="form-group">
												<label class="col-sm-2 control-label">Department
													Name</label>

												<div class="col-sm-10">
													<form:input class="form-control" path="name" />
													<c:if test="${error == true }">
														<span class="errMsg">Please enter Department Name</span>
													</c:if>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<button type="submit"
														class="btn pull-right override btn-primary ml10">Save</button>
													<a href="<c:url value="/admin/list-departments.html"/>"
														class="btn pull-right override btn-primary">Cancel</a>
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


</body>
</html>
