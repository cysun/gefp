<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | Edit Flight Plan Information</title>
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
					<li class="active">Edit Plan</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Edit Flight Plan</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form:form modelAttribute="flightplan" method="post">
											<div class="col-md-12">
												<div class="form-group">
													<label>Plan Title <span class="compulsary">*</span></label>
													<form:input path="name" class="form-control"
														placeholder="Plan title here" />
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Select Season: <span class="compulsary">*</span></label>
													<form:select path="seasonName" class="form-control">
														<form:option value="">Select Season</form:option>
														<form:option value="Fall">Fall</form:option>
														<form:option value="Winter">Winter</form:option>
														<form:option value="Spring">Spring</form:option>
														<form:option value="Summer">Summer</form:option>
													</form:select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Select Year: <span class="compulsary">*</span></label>
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
													<form:select path="seasonYear" class="form-control">
														<form:option value="">Select Year</form:option>
														<c:forEach var="i" begin="2014" end="${year + 20}">
															<c:choose>
																<c:when test="${i == flightplan.seasonYear }">
																	<form:option selected="selected" value="${i}">${i}</form:option>
																</c:when>
																<c:otherwise>
																	<form:option value="${i}">${i}</form:option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</form:select>
												</div>
											</div>

											<div class="col-md-12">
												<input type="submit" class="btn override btn-primary ml10 pull-right"
													onClick="this.form.submit();this.disabled=true; this.value='Saving...';"
													value="Save" /> <a class="btn override btn-primary pull-right"
													href="<c:url value="/plan/edit/${flightplan.id }.html"/>">Cancel</a>
											</div>

										</form:form>
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