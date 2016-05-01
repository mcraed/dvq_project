$(document).ready(function(){

	$('.opbackground').hide();
	$('#sign-in').hide();
	$('#sign-up').hide();
	$('#acct-details').hide();
	$('#create_post').hide();

	$("#login").click(function(){
	  $("#sign-in").show();
	});
	    
	$("#signup-button").click(function(){
		$("#sign-up").show();
	});

	//declaring variable 'clicked' to toggle click event handler
	var post_clicked = false
	var post_open = false
	var acct_clicked = false
	var acct_open = false
	$("#create-post").click(function(){
		if (post_clicked == false){
				if (acct_open == false){
					$("#create_post").slideDown(1000);
					post_clicked = true
					post_open = true
				}
				else{
					$("#acct-details").slideUp(1000);
					$("#create_post").slideDown(1000);
					post_clicked = true
					post_open = true
					acct_clicked = false
					acct_open = false
				}
		}
		else{
			$("#create_post").slideUp(1000);
			post_clicked = false
			post_open = false
		};	
	});

	$("#acct-det").click(function(){
		if (acct_clicked == false){
			if (post_open == false){
					$("#acct-details").slideDown(1000);
					acct_clicked = true
					acct_open = true
				}
				else{
					$("#create_post").slideUp(1000);
					$("#acct-details").slideDown(1000);
					acct_clicked = true
					acct_open = true
					post_clicked = false
					post_open = false
				}
		}

		else{
			$("#acct-details").slideUp(1000);
			acct_clicked = false
			acct_open = false
		}	
	});

	$(".esc").click(function(){
	  $(".opbackground").hide();
	  $("#acct-details").slideUp(1000);
	  $("#create_post").slideUp(1000);
	  post_clicked = false
	 	post_open = false
	 	acct_clicked = false
	 	acct_open = false
	});
});