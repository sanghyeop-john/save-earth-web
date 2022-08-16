<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script type="text/javascript" src = "/js_css/report/report_write.js"></script>

<div class = "report_container">
	<form method = "post" action = "/report/reportWriteOk" id = "reportForm" enctype = "multipart/form-data">
		<input type = "hidden" name = "category" value = "2">
		<ul>
			<li>제목</li>
			<li><input type = "text" name = "subject" id = "subject"></li>
			<li>글내용</li>
			<li><textarea name = "content" id = "content"></textarea></li>
			<li>첨부파일</li>
			<li>
				<input type = "file" name = "filename" id = "filename">
			</li>
			<li><input type = "submit" value = "등록"></li>
		</ul>
	</form>
</div>
