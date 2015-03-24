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


				<c:choose>
					<c:when test="${not empty StudentUser}">

						<ol class="breadcrumb">
							<li><a href="<c:url value="#"/>">Home</a></li>
							<li class="active">My Profile</li>
						</ol>

					</c:when>
					<c:otherwise>
						<ol class="breadcrumb">
							<li><a href="<c:url value="/user/dashboard.html"/>">Home</a></li>
							<li><a href="<c:url value="/user/list.html"/>">Users</a></li>
							<li class="active">Add New User</li>
						</ol>
					</c:otherwise>
				</c:choose>


				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />


				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">My Profile</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form:form modelAttribute="user">
											<!-- div class="form-group">
												<label>ID</label>
												<form:input path="id" class="form-control" />
											</div -->
											<div class="form-group">
												<label>Name</label>
												<form:input path="name" class="form-control" />
												<span style="color:#900"><form:errors path="name" /></span>
											</div>
											<div class="form-group">
												<label>Password</label>
												<form:password path="password" class="form-control" />
												
												<span style="color:#900"><form:errors path="password" /></span>

											</div>
											
											<div class="form-group">
												<label>Department</label>
												<select name="departmentID" class="form-control">
														<option value="">--Select Department--</option>
														<c:forEach var="dept" items="${departments}">
															
															<c:choose>
															<c:when test="${user.department.id == dept.id}">
																<option selected="selected" value="${dept.id}">${dept.name}</option>
															</c:when>
															<c:otherwise>
																<option value="${dept.id}">${dept.name}</option>
															</c:otherwise>
															</c:choose>
															
														</c:forEach>
													</select>
													<span style="color:#900">${deptErr}</span>
												
											</div>
											
											<form:hidden path="id" />
											<input type="submit" class="btn btn-default" value="Save" />
											<span id="successMsg" style="color:#090">${successMsg}</span>
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
