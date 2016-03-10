<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/assets/css/switchery.css" />">
</head>
<body>


<input type="checkbox" class="js-switch flightplan_checkpoints_mobile" checked />
<input type="checkbox" class="js-switch flightplan_checkpoints_mobile" checked />
<input type="checkbox" class="js-switch flightplan_checkpoints_mobile" checked />
<input type="checkbox" class="js-switch flightplan_checkpoints_mobile" checked />

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<!-- BOOTSTRAP SCRIPTS -->
<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/assets/js/switchery.js" />"></script>
<script src="<c:url value="/assets/js/custom_mobile.js" />"></script>

<script>

var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  // var switchery = new Switchery(html, { size: 'small' });
	var switchery = new Switchery(html);
});
	
</script>



</body>
</html>