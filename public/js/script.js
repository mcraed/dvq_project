$(document).ready(function(){

	$('.opbackground').hide();
	$('#sign-in').hide();
	$('#sign-up').hide();


	$("#login").click(function(){
	  $("#sign-in").show();
	});
	    
	$("#signup-button").on('click',function(){
		$("#sign-up").show();
	});

	$(".esc").click(function(){
	  $(".opbackground").hide();
	});
});