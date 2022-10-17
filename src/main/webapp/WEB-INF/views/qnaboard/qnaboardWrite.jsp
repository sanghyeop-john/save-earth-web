<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>

<style>
	#subject{
		width:90%;
	}
	ul{
	list-style:none;
	}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#qnaFrm").on("submit", function(){
			if($("#subject").val()==""){
				alert("게시글의 제목을 입력해주세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("게시글 내용을 입력해주세요.");
				return false;
			}
			return true;
		});
	});
</script>
<div class="container">
	<h1>질문게시글 작성</h1>
	<form method="post" action="/qnaboard/writeOk" id="qnaFrm">
		<ul>
			<li>제목</li>
			<li>
				<input type="text" name="subject" id="subject"/>
			</li>
			<li>글내용</li>
			<li>
				<textarea name="content" id="content"></textarea>
			</li>
			<li>
				<input type="submit" value="글등록"/>
<!-- 				<input type="reset" value="다시쓰기"/> -->
			</li>
		</ul> 
	</form>
</div>



