<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script type="text/javascript" src = "/js_css/report/report_edit.js"></script>

<div class = "report_container">
	<form method = "post" action = "/report/reportEditOk" id = "reportForm" enctype = "multipart/form-data">
		<input type = "hidden" name = "category" value = "2">
		<input type = "hidden" name = "no" value = "${reportVO.no }">
		<ul>
			<li>제목</li>
			<li><input type = "text" name = "subject" id = "subject" value = "${reportVO.subject }"></li>
			<li>글내용</li>
			<li><textarea name = "content" id = "content">${reportVO.content }</textarea></li>
			<li>첨부파일</li>
			<li>
				<div>${reportVO.filename_t } &nbsp;<b class = "del">X</b></div>
				<input type = "hidden" name = "filename" id = "filename">
				<input type = "hidden" name = "" value = "${reportVO.filename_t }">
				<input type = "hidden" name = "filecount" value = "1">
				
			</li>
			<li><input type = "submit" value = "등록"></li>
		</ul>
	</form>
</div>