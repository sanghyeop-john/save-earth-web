$(function(){
	$(".managerDelete").click(function(){
		var userid = $(this).prev().prev().text();
		
		$.ajax({
			url: "/manager/managerDelete",
			data: "userid="+userid,
			success: function(){
				alert("삭제되었습니다");
				window.location.href = '/manager/managerForm';
			}, error: function(e){
				console.log(e.responseText);
			}
		});
	});
});