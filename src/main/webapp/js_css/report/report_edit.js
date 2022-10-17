$(function(){
	CKEDITOR.replace("content");
	
	$(".del").click(function(){
		$(this).parent().css("display", "none");
		
		$(this).parent().next().attr("type", "file");
		
		$(this).parent().next().next().attr("name", "delFilename");
		
		$("input[name=filecount]").val($("input[name=filecount]").val()-1);
	});
	
		$("#reportForm").submit(function(){
		if($("#subject").val() == ""){
			alert("제목을 입력하십시오.");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력하십시오.");
			return false;
		}
		
		var filecount = $("input[name=filecount]").val();
		if($("#filename").val()!=""){
			filecount++;
		}
		
		if(filecount < 1){
			alert("보고서를 첨부하십시오");
			return false;
		}
		
		return true;
	});
});