<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<style>

	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	button{
		border: 10px;
	}
</style>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script>
	$(function(){
		CKEDITOR.replace("content", {
			width: '80%',
			height: '400px',
			filebrowserUploadUrl:  "fileupload.do"
		});
		
		$("#newsContent").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글 내용을 입력하세요.");
				return false;
				
			}
			return true;
		});
	});
</script>



<div class="container">
	<h1>소식 쓰기</h1>
		<form method="post" action="/news/newsWriteOk" id="newsContent" enctype="multipart/form-data"> <!-- 이미지 파일업로드 -->
	       <ul>
		       	<li>뉴스제목</li>
		       	<li><input type="text" name="subject" id="subject"></li>
		       	<li>뉴스내용</li>
		       	<li><textarea name="content" id="content"></textarea></li>
		       	<li>썸네일</li>
		       	<li><input type="file" name="filename" id="filename1"></li>	
		       	<br/>
		       	<li>
		       		<button type="submit" class="btn btn-primary whyBtn">글 작성</button>
	       			<button type="button" class="btn btn-primary CancleBtn">취 &nbsp; 소</button>
		       	</li>
	       </ul>
	       <br/>
	    </form>
</div>
