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
<title>404 Page not found</title>
<jsp:include page="/WEB-INF/jsp/includes/styles.jsp" />

</head>
<body>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/jsp/includes/header.jsp" />

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<jsp:include page="/WEB-INF/jsp/includes/dashboard_title.jsp" />
				<!-- /. ROW  -->

				<div class="col-md-6">
					<h3>Page Not found</h3>
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
