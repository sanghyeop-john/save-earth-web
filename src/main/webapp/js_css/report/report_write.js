$(function(){
	CKEDITOR.replace("content");
	
	$("#reportForm").submit(function(){
		if($("#subject").val() == ""){
			alert("제목을 입력하십시오.");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력하십시오.");
			return false;
		}
		
		if($("#filename").val()==""){
			alert("보고서를 첨부하십시오.");
			return false;
		}
		
		return true;
	});
});