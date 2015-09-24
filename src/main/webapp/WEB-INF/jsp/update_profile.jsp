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

		<div id="page-wrapper" style="margin-left: 0px;">
			<div id="page-inner">

				<ol class="breadcrumb">
					<li><a href="<c:url value="#"/>">Home</a></li>
					<li class="active">Profile Information</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />


				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							
							<div class="panel-heading">Update Profile
							
							<div class="pull-right" style="padding: 0 15px 0 0;">
										<span class="compulsary">*</span> Required
									</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form action="" method="post">
											<table class="table table-striped">
												<tbody>
													<tr>
														<th>First Name: <span class="compulsary">*</span></th>
														<td><input type="text" id="firstNameInp"
															name="firstName" class="form-control"
															value="${currUserObj.firstName}" /> <span
															style="color: #900">${fnameErr}</span> <c:remove
																var="fnameErr" /></td>
														<th>Last Name: <span class="compulsary">*</span></th>
														<td><input type="text" id="lastNameInp"
															name="lastName" class="form-control"
															value="${currUserObj.lastName}" /> <span
															style="color: #900">${lnameErr}</span> <c:remove
																var="lnameErr" /></td>
													</tr>
													<tr>
														<th>Middle Name (Optional)</th>
														<td><input type="text" id="lastNameInp"
															name="middleName" class="form-control"
															value="${currUserObj.middleName}" /> 
														<th>Email: <span class="compulsary">*</span></th>
														<td><input type="text" id="emailInp" name="email"
															class="form-control" value="${currUserObj.email}" />
															<span style="color: #900">${emailErr}</span> <c:remove
																var="emailErr" />
															</td>
													</tr>
													<tr>
														<th>CIN: <span class="compulsary">*</span></th>
														<td><input type="text" id="cinInp" name="cin"
															class="form-control" value="${currUserObj.cin}" />
															<span style="color: #900">${cinErr}</span> <c:remove
																var="cinErr" />
															</td>
														<th>Major: <span class="compulsary">*</span></th>
														<td>
														
														 
														<select class="form-control" name="departmentID"
															id="majorInp">
																<option value="">--Select Major--</option>

																<c:forEach var="dept" items="${departments}">
																	<c:if test="${dept.defaultPlan != null}">
																		<c:choose>
																			<c:when
																				test="${currUserObj.department.id == dept.id}">
																				<option selected="selected" value="${dept.id}">${dept.name}</option>
																			</c:when>
																			<c:otherwise>
																				<option value="${dept.id}">${dept.name}</option>
																			</c:otherwise>
																		</c:choose>
																	</c:if>
																</c:forEach>

														</select> <span style="color: #900">${deptErr}</span> <c:remove
																var="deptErr" />
																</td>
													</tr>

													<tr>
														<td colspan="2">
															<span
															id="successMsg" style="color: #090">${successMsg}</span>
															<c:remove var="successMsg" />
														</td>
														<td colspan="2" align="right">
														
														<input type="hidden"
															name="uid" value="${currUserObj.id}" id="userId" /> <input
															id="SaveInformation" type="submit"
															class="btn override btn-info" value="Continue" /> </td>
													</tr>

												</tbody>
											</table>

										</form>
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
