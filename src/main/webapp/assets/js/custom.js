/*=============================================================
 Authour URI: www.binarycart.com
 Version: 1.1
 License: MIT

 http://opensource.org/licenses/MIT

 100% To use For Personal And Commercial Use.

 ========================================================  */

function customAlert(text, type) {
	var n = noty({
        text        : text,
        type        : type,
        layout      : 'bottomRight',
        animation   : {
            open  : 'animated bounceInRight',
            close : 'animated bounceOutRight',
            theme : 'defaultTheme',
            easing: 'swing',
            speed : 500
        }
    });
	console.log(n);
	setTimeout(function(){
		$.noty.close(n);
	},3000);
}

(function($) {
	"use strict";
	// AJAX function to save user checkpoints ///

	$(document).ready(function() {

		$(".flightplan_checkpoints").click(function(e) {
			
			smoke.prompt("Do you want to add a comment?", function(e){
				if (e){
					console.log("YES");
					top.location.href = '/gefp/plan/add-milestone-comment.html';
				}else{
					console.log("NO");
					$.ajax({
						url : '/gefp/plan/saveStudentCheckpoint.html',
						data : {
							userId : $(this).attr("data-userId"),
							id : $(this).val(),
							checked : this.checked
						},
						type : 'POST',
						success : function(response) {
							console.log(response);
							$("#successMessage").show();
							setTimeout(function(){
								$("#successMessage").hide();
							},3000);
						}
					});
				}
			}, {
				ok: "Yes",
				cancel: "No",
				classname: "custom-class",
				reverseButtons: true,
				value: ""
			});
			// console.log("Checkpoint ID is : " + $(this).val() + " state is "
			// + this.checked );
		});
		
		/*$("#search").autocomplete({
	        source: "autocomplete/user.html' />",
	        select: function(event, ui) {
	            if( ui.item )
	                window.location.href = "advisor/view-student-plan/"+ui.item.id+".html";
	        }
	    })
	    .autocomplete( "instance" )._renderItem = function(ul, item){
	        var li = $("<li>");
	        return li.append(item.label).appendTo(ul);
	    };*/

	});
	
	setTimeout(function(){
		$("#successMsg").fadeOut();
	},3000);
	
}(jQuery));