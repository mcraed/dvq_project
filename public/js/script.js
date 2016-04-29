$(document).ready(function(){
console.log ("hey ")

    $(".button").click(function(){
        $(".opbackground").show();
    });
    
$(" .opbackground").on('click',function(){
    $("#boxclose").hide();
     });

$(".button2").click(function(){
        $(".opbackground2").show();
    });
    
$(".opbackground2"). on('click',function(){
    $("#boxclose").hide();
     });
});
