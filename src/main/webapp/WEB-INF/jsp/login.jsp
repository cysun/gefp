<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan</title>
<jsp:include page="includes/styles.jsp" />

</head>
<body>
	<div class="container">
		<div class="row text-center ">
			<div class="col-md-12">
				<br />
				<br />
				<h2>GEFP</h2>
				<h5>( Login yourself to get access )</h5>
				<br />
			</div>
		</div>
		<div class="row ">

			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Enter Details To Login </strong>
					</div>
					<div class="panel-body">
						<form name="f" action="<c:url value="j_spring_security_check" />" method="post">
							<br />
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" name="j_username" class="form-control"
									placeholder="Your Username " />
							</div>
							
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" name="j_password" class="form-control"
									placeholder="Your Password" />
							</div>
							
							<!-- <div class="form-group">
								<label class="checkbox-inline"> <input type="checkbox" />
									Remember me
								</label> <span class="pull-right"> <a href="#">Forget
										password ? </a>
								</span>
							</div> -->

							
							<input type="submit" name="submit" class="btn btn-primary" value="Login Now" />
							<div class="pull-right errMsg" style="line-height:30px;">${errorLogin}</div>
							<!-- Not register ? <a href="registeration.html">click here </a> -->
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


<!-- JQUERY SCRIPTS -->
<script src="<c:url value="/assets/js/jquery-1.10.2.js" />"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
<!-- METISMENU SCRIPTS -->
<script src="<c:url value="/assets/js/jquery.metisMenu.js" />"></script>
<!-- CUSTOM SCRIPTS -->
<script src="<c:url value="/assets/js/custom.js" />"></script>

</body>
</html>