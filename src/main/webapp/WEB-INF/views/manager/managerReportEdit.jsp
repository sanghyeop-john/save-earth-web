<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script type="text/javascript" src = "/js_css/report/report_edit.js"></script>
<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo">회원관리</a>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1" class = "active">자료</a></li>
			<li><a href = "/manager/managerDonation">후원</a></li>
		</ul>
	</div>
	
	<form method = "post" action = "/manager/managerReportEditOk" id = "reportForm" enctype = "multipart/form-data">
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
