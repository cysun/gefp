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
					<li><a href="<c:url value="/admin/list-users.html"/>">Users</a></li>
					<li class="active">Add New User</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />


				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add new User</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form action="" method="post">
											<div class="form-group col-md-6">
												<label>First Name <span class="compulsary">*</span>
												</label> <input type="text" name="firstName" class="form-control" />
											</div>
											<div class="form-group col-md-6">
												<label>Last Name <span class="compulsary">*</span></label> <input
													type="text" name="lastName" class="form-control" />
											</div>
											<div class="form-group col-md-6">
												<label>CIN (optional)</label> <input type="text" name="cin"
													class="form-control" />
											</div>
											<div class="form-group col-md-6">
												<label>Email ID <span class="compulsary">*</span></label> <input
													type="text" name="email" class="form-control" />
											</div>

											<div class="form-group col-md-6">
												<label>Roles <span class="compulsary">*</span></label>

												<c:forEach var="role" items="${roles}">
													<div class="checkbox">
														<label> <input type="checkbox" name="roles"
															value="${role.id }" /> ${role.name}
														</label>
													</div>
												</c:forEach>
											</div>

											<div class="form-group col-md-6">
												<label>Department <span class="compulsary">*</span></label>
												<select name="department" class="form-control">
													<option value="">--Select Department--</option>
													<c:forEach var="department" items="${departments}">
														<option value="${department.id }">${department.name}</option>
													</c:forEach>
												</select>
											</div>

											<div class="clearfix"></div>

											<div class="form-group col-md-6">
												<label>User Name <span class="compulsary">*</span></label> <input
													type="text" name="username" class="form-control" />
											</div>
											<div class="form-group col-md-6">
												<label>Password <span class="compulsary">*</span></label> <input
													type="password" name="password" class="form-control" />
											</div>

											<div class="form-group col-md-6">
												<input type="submit" class="btn override btn-primary" value="Save" />
												<!-- <button type="reset" class="btn btn-primary">Reset Button</button> -->
												<br />
												<span class="errMsg">${errMsg}</span>
											</div>
											
											<c:remove var="errMsg" />
										</form>
									</div>
									<div class="pull-right" style="padding: 0 15px 0 0;">
										<span class="compulsary">*</span> Required
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
