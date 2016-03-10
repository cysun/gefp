/*=============================================================
 Authour URI: www.binarycart.com
 Version: 1.1
 License: MIT

 http://opensource.org/licenses/MIT

 100% To use For Personal And Commercial Use.

 ========================================================  */

function customAlert(text, type) {
	var n = noty({
		text : text,
		type : type,
		layout : 'bottomRight',
		animation : {
			open : 'animated bounceInRight',
			close : 'animated bounceOutRight',
			theme : 'defaultTheme',
			easing : 'swing',
			speed : 500
		}
	});
	console.log(n);
	setTimeout(function() {
		$.noty.close(n);
	}, 3000);
}

function ShowStudentsPlan(studentid) {
	top.location.href = "/gefp/advisor/view-student-plan/" + studentid
			+ ".html";
}

(function($) {
	"use strict";
	// AJAX function to save user checkpoints ///

	$(document).ready(function() {

		$("#page-wrapper").css({
			"min-height" : window.innerHeight - 115
		});

		$(".accordion").accordion({
			collapsible : true,
			active : false,
			heightStyle : "content"
		});

		$(".CommentIconClick").click(function(e) {

			smoke.alert($(this).attr("data-comment"));
		});

		$(".flightplan_checkpoints").on('click', function(e) {

			var curr = this;
			var checked = curr.checked;
			
			if (checked != true) {
				$.ajax({
					url : '/gefp/plan/saveStudentCheckpoint.html',
					data : {
						message : "",
						userId : $(curr).attr("data-userId"),
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
					url : '/gefp/plan/saveStudentCheckpoint.html',
					data : {
						message : "",
						userId : $(curr).attr("data-userId"),
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
		
		
		$(".flightplan_checkpoints_mobile").on('change', function(e) {
			//console.log("Perfectly clicked", changeCheckbox.checked);
			var curr = this;
			var checked = curr.checked;
			
			alert("Switch clicked");
			
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

		/*
		 * $("#search").autocomplete({ source: "autocomplete/user.html' />",
		 * select: function(event, ui) { if( ui.item ) window.location.href =
		 * "advisor/view-student-plan/"+ui.item.id+".html"; } }) .autocomplete(
		 * "instance" )._renderItem = function(ul, item){ var li = $("<li>");
		 * return li.append(item.label).appendTo(ul); };
		 */

	});

	setTimeout(function() {
		$("#successMsg").fadeOut();
	}, 3000);

}(jQuery));