<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html ng-app="gefpApp" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Golden Eagle Flight Plan</title>
<jsp:include page="/WEB-INF/jsp/includes/styles.jsp" />

</head>
<body>
	
	<div id="wrapper">

		<nav class="navbar brdt10 brdb10 navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		
		<div class="logoIconImg">
			<img src="<c:url value="/assets/img/eaglehead_4c.png" />" />
		</div>
		<a class="navbar-brand navtitle">Golden Eagle Flight Plan</a>
	</div>

	</nav>

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" style="margin-left:0px;">
			<div id="page-inner">

				<div class="row text-center" style="height:120px;">
			<%-- <div class="col-md-12">
				<br />
				<br />
				<h2>GEFP</h2>
				<h5>( Login yourself to get access )</h5>
				<br />
			</div> --%>
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
							
							<div class="pull-left errMsg" style="line-height:30px;">${errorLogin}</div>
							<input type="submit" name="submit" class="pull-right btn override btn-primary" value="Login Now" />
							
						</form>
					</div>

				</div>
			</div>
		</div>
			
			
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->


	<jsp:include page="/WEB-INF/jsp/includes/footer.jsp" />

</body>
</html>
