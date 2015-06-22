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
					<li><a href="<c:url value="/admin/list-plans.html"/>">Flight
							Plans</a></li>
					<li class="active">Check Milestone</li>
				</ol>

				<jsp:include page="includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<hr />

				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add a comment for the Milestone</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form action="" class="form-horizontal" method="post">
											
											<div class="form-group">
												<label class="col-sm-2 control-label">Milestone:</label>
												<div class="col-sm-9">
													<h4>${checkpoint.name}</h4>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">Comment:</label>
												<div class="col-sm-9">
													<textarea name="message" class="ckeditor form-control"></textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-11">
													<input type="hidden" name="id" value="${flightplan.id}" />
													<input type="hidden" name="userId" value="${userId}" /> <input
														type="submit"
														class="btn override btn-primary pull-right ml10"
														value="Save" /> <a
														class="btn override btn-primary pull-right"
														href="<c:url value=""/>">Cancel</a>
													<!-- <button type="reset" class="btn btn-primary">Reset Button</button> -->
												</div>
											</div>
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

	<script type="text/javascript">

$(function(){
	$("textarea").each(function(){
    CKEDITOR.replace( $(this).attr("id"), {
      toolbar : "Default"
    });
});

</script>

</body>
</html>