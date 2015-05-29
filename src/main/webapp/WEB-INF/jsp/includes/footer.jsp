<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-default navbar-cls-top" role="navigation"
	style="margin-bottom: 0; min-height:30px;">
	<div class="navbar-header footerStyle" style="">
		This site is designed for CalStateLa CS520 &copy; All Rights Reserved @Harsh Gadhia
	</div>
</nav>


<!-- JQUERY SCRIPTS -->
<!--
<script src="<c:url value="/assets/js/jquery-1.10.2.js" />"></script>
 -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<!-- BOOTSTRAP SCRIPTS -->
<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
<!-- METISMENU SCRIPTS -->
<script src="<c:url value="/assets/js/jquery.metisMenu.js" />"></script>
<!-- CUSTOM SCRIPTS -->
<script src="<c:url value="/assets/js/custom.js" />"></script>
<script src="<c:url value="/assets/js/angular.min.js" />"></script>
<script src="<c:url value="/assets/js/gefp.app.js" />"></script>
<script src="<c:url value="/assets/js/smoke.min.js" />"></script>
<script src="<c:url value="/assets/ckeditor/ckeditor.js" />"></script>
<script src="<c:url value="/assets/js/jquery.dragtable.js"/>"></script>
<script src="<c:url value="/assets/js/jquery.noty.packaged.min.js"/>"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="<c:url value="/assets/js/dataTables/jquery.dataTables.js" />"></script>
<script src="<c:url value="/assets/js/dataTables/dataTables.bootstrap.js" />"></script>



<script>
$(document).ready(function(){
	$('#dataTables').dataTable({
		"lengthMenu": [5, 10, 20, 50, 100],
        "pageLength": 5
	});
	$("#search").autocomplete({
        source: "<c:url value='/autocomplete/user.html' />",
        select: function(event, ui) {
            if( ui.item )
                window.location.href = "<c:url value='/advisor/view-student-plan/"+ui.item.id+".html' />";
        }
    })
    .autocomplete( "instance" )._renderItem = function(ul, item){
        var li = $("<li>");
        return li.append(item.label).appendTo(ul);
    };

    setTimeout(function(){
		$('body').addClass('loaded');
	}, 100);

});

</script>