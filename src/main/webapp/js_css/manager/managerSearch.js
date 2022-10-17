$(function(){
	$("#managerSearch").click(function(){
		window.open("/manager/managerSearch", "managerSearch", "width=500, height=400");
	});
	
	$("#managerForm").submit(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			return false
		}
		return true;
	});
	
	$(".userid").click(function(){
		opener.$("#userid").val($(this).text());
		opener.$("#username").val($(this).next().text());
		window.close();
	});
	
	$("#managerInsertForm").submit(function(){
		if($("#userid").val()=="" || $("#username").val()==""){
			alert("아이디를 찾아 입력하세요.");
			return false;
		}
		return true;
	});
});