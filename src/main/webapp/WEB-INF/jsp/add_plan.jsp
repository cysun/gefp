<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<li class="active">Add New Plan</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add new Plan</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form:form modelAttribute="flightplan">
											<div class="form-group">
												<label>Plan Title</label>
												<form:input path="name" class="form-control" placeholder="Plan title here" />
											</div>
											<div class="form-group">
												<label>Select Term:</label>
												<form:select path="seasonName" class="form-control">
													<form:option value="">Select Term</form:option>
													<form:option value="Fall">Fall</form:option>
													<form:option value="Winter">Winter</form:option>
													<form:option value="Spring">Spring</form:option>
													<form:option selected="selected" value="Summer">Summer</form:option>
												</form:select>
											</div>
											
											<div class="form-group">
												<label>Select Year:</label>
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
												<form:select path="seasonYear" class="form-control">
													<form:option value="">Select Year</form:option>
													<c:forEach var="i" begin="2014" end="${year + 20}">
													<c:choose>
														<c:when test="${i == year }">
															<form:option selected="selected" value="${i}">${i}</form:option>
														</c:when>
														<c:otherwise>
															<form:option value="${i}">${i}</form:option>
														</c:otherwise>
														
													</c:choose>
													</c:forEach>
												</form:select>
											</div>

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