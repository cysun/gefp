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
<title>Golden Eagle Flight Plan | List of Departments</title>
<jsp:include page="includes/styles.jsp" />
</head>
<body>

	<div id="wrapper">

		<jsp:include page="includes/header.jsp" />

		<jsp:include page="includes/left_menu.jsp" />

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<security:authorize access="authenticated and hasRole('ADMIN')">
					<ol class="breadcrumb">
						<li><a href="<c:url value="/admin/dashboard.html"/>">Home</a></li>
						<li class="active">Departments</li>
					</ol>
				</security:authorize>

				<security:authorize access="authenticated and hasRole('ADVISOR')">
					<ol class="breadcrumb">
						<li><a href="<c:url value="/advisor/dashboard.html"/>">Home</a></li>
						<li class="active">Departments</li>
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
									<h5>List of Departments</h5>
								</div>

								<security:authorize access="authenticated and hasRole('ADMIN')">
									<div class="pull-right">
										<h5><a title="Add New Department" href="<c:url value="/admin/department/add.html"/>"
											class=""><i class="fa fa-plus-square-o "></i> Add Department</a></h5>
									</div>
								</security:authorize>
								<div class="clearfix"></div>
							</div>

							<div class="panel-body">
								<div class="table-responsive__">
									<table id="dataTables" class="table-responsive table table-striped table-bordered dataTable table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Department Name</th>
												<!-- <th>Active Plan Name</th> -->
												<th>Operations</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${departments}" var="dept" varStatus="index">

												<tr>
													<td>${index.count}</td>
													<td>
													
													<security:authorize access="hasRole('ADMIN')">
													<a title="List Flight Plan(s)"
																href="<c:url value="/admin/department/list-plans.html?id=${dept.id}" />"
																class="">
													${dept.name}
													</a>
													</security:authorize>
													
													<security:authorize access="hasRole('ADVISOR')">
														<a title="View Students(s)"
																href="<c:url value="/department/list-students.html?id=${dept.id}" />"
																class="">${dept.name}</a>
													</security:authorize>
													
													</td>
													<!-- <td>Computer Science Plan</td> -->

													<td><security:authorize
															access="authenticated and hasRole('ADMIN')">
															<a title="List Flight Plan(s)"
																href="<c:url value="/admin/department/list-plans.html?id=${dept.id}" />"
																class=""><i class="fa fa-list"></i>
																</a>
																
																|
														</security:authorize> <a title="View Student(s)"
														href="<c:url value="/department/list-students.html?id=${dept.id}" />"
														class=""><i class="fa fa-user "></i>
															</a>
															|	
															<security:authorize
															access="authenticated and hasRole('ADMIN')">
															<a title="Edit Department"
																href="<c:url value="/admin/department/edit.html?id=${dept.id}" />"
																class=""><i class="fa fa-edit "></i>
																</a>
																
																|
																
																<a href="javascript:void(0)" onClick="deleteDepartment(${dept.id})"><i class="fa fa-trash-o "></i></a>																
														</security:authorize></td>
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


<script type="text/javascript">

function deleteDepartment(departmentId) {
	
	smoke.confirm("Are you sure you want to delete this department?", function(e){
		if (e){
			top.location.href = '<c:url value="/admin/department/delete.html?departmentId='+departmentId+'" />';
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