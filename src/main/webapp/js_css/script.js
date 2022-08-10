$(function(){
	$(".top_menu li a").hover(function(){
		$(this).css("color", "yellow");
	}, function(){
		$(this).css("color", "rgb(255,255,255)");
	});
});