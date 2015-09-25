<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan | List Department FLight Plans</title>
<jsp:include page="includes/styles.jsp" />
</head>
<body>

	<div id="wrapper">

		<jsp:include page="includes/header.jsp" />

		<jsp:include page="includes/left_menu.jsp" />

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<security:authorize access="hasRole('ADMIN')">
				<ol class="breadcrumb">
					<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
					<li><a href="<c:url value="/admin/list-departments.html"/>">Majors</a></li>
					<li class="active">${department.name}</li>
				</ol>
				</security:authorize>
				
				<security:authorize access="hasRole('ADVISOR')">
				<ol class="breadcrumb">
					<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
					<li><a href="<c:url value="/advisor/list-departments.html"/>">Majors</a></li>
					<li class="active">${department.name}</li>
				</ol>
				</security:authorize>
				
				

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h5>Major: <b>${department.name}</b></h5>
								</div>
								<div class="pull-right">
									
									<security:authorize access="hasRole('ADMIN')">
									<a
										href="<c:url value="/admin/plan/add.html?departmentId=${department.id }"/>"
										class=""><i class="fa fa-plus-square-o "></i>
										Create Plan</a>
									</security:authorize>
								</div>
								<div class="clearfix"></div>
							</div>



							<div class="panel-body">
								<div class="table-responsive__">
									<table id="dataTables" class="table table-striped table-bordered dataTable table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>List of Flight Plans</th>
												<th>Publish</th>
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${plans}" var="plan"
												varStatus="index">

												<tr>
													<td>${index.count}</td>
													<td><a title="View Flight Plan"
														href="<c:url value="/plan/view/${plan.id}.html" />"
														class=""> ${plan.name} (${plan.seasonName}
															${plan.seasonYear}) </a> <c:choose>
															<c:when test="${plan.id == department.defaultPlan.id}">
																<span class="label override label-success">Official
																	Plan</span>
															</c:when>
															<c:otherwise>
																<security:authorize access="hasRole('ADMIN')">
																| 
																<a
																	href="<c:url value="/admin/department/set-official-plan.html?dept_id=${department.id}&plan_id=${plan.id}"/>"
																	class="btn override btn-link">Make Official Plan</a>
																</security:authorize>
															</c:otherwise>

														</c:choose></td>

													<td><c:choose>
															<c:when test="${plan.published == false}">
																<security:authorize access="hasRole('ADMIN')">
																<a class="label override handCursor label-primary"
																	href="<c:url value="/admin/plan/publish.html?planId=${plan.id}"/>">
																	Publish Now </a>
																</security:authorize>
															</c:when>
															<c:otherwise>
																<label class="label override label-success">Published</label>
															</c:otherwise>

														</c:choose></td>

													<td>
													<a title="View Flight Plan"
														href="<c:url value="/plan/view/${plan.id}.html" />"
														class=""><i class="fa fa-expand "></i> </a>
														
														<security:authorize access="hasRole('ADMIN')">
														 | <a
														title="Copy Flight Plan"
														href="<c:url value="/plan/clone.html?planId=${plan.id}" />"
														class=""><i class="fa fa-copy "></i> </a> | <a
														title="Delete Flight Plan" href="javascript:void(0);"
														onClick="deletePlan(${plan.id})" class=""><i
															class="fa fa-trash-o "></i> </a>
														</security:authorize>
															
															</td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

						</div>

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
	<script>

function deletePlan(planID) {
	
	smoke.confirm("Are you sure you want to delete this plan?", function(e){
		if (e){
			top.location.href = '<c:url value="/admin/plan/delete.html?planId='+planID+'" />';
		}else{
			
		}
	}, {
		ok: "Yes",
		cancel: "No",
		classname: "custom-class",
		reverseButtons: true
	});	
}

</script>
</body>
</html>
