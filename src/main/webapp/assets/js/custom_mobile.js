/*=============================================================
 Authour URI: www.binarycart.com
 Version: 1.1
 License: MIT

 http://opensource.org/licenses/MIT

 100% To use For Personal And Commercial Use.

 ========================================================  */


/*(function($) {
	"use strict";*/
	// AJAX function to save user checkpoints ///

	$(document).ready(function() {

		$(".accordion").accordion({
			collapsible : true,
			active : false,
			heightStyle : "content"
		});
		
		$(".flightplan_checkpoints_mobile").on('change', function(e) {
			//console.log("Perfectly clicked", changeCheckbox.checked);
			var curr = this;
			var checked = curr.checked;
			
			if (checked != true) {
				$.ajax({
					url : '/gefp/api/plan/saveStudentCheckpoint.html',
					data : {
						message : "",
						userId : $(curr).attr("data-userId"),
						accessKey : $("#accessKey").val(),
						id : $(curr).val(),
						checked : checked
					},
					type : 'POST',
					success : function(response) {
						// console.log(response);
						/*
						 * $("#successMessage").show(); setTimeout(function(){
						 * $(curr).parent().find(".CommentIcon").remove();
						 * $("#successMessage").hide(); },3000);
						 */
					}
				});
			} else {

				$.ajax({
					url : '/gefp/api/plan/saveStudentCheckpoint.html',
					data : {
						message : "",
						userId : $(curr).attr("data-userId"),
						accessKey : $("#accessKey").val(),
						id : $(curr).val(),
						checked : checked
					},
					type : 'POST',
					success : function(response) {
						// console.log(response);
						/*
						 * $("#successMessage").show(); setTimeout(function(){
						 * $("#successMessage").hide(); },3000);
						 */
					}
				});
			}

			// console.log("Checkpoint ID is : " + $(this).val() + " state is "
			// + this.checked );
		});
	});

	

/*}(jQuery));*/