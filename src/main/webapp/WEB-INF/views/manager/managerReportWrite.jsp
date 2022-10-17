<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script type="text/javascript" src = "/js_css/report/report_write.js"></script>

<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo">회원관리</a>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1" class = "active">자료</a></li>
			<li><a href = "/manager/managerDonation">후원</a></li>
		</ul>
	</div>
<div id = "report_write">
	<form method = "post" action = "/manager/managerReportWriteOk" id = "reportForm" enctype = "multipart/form-data">
		<ul>
			<li>제목</li>
			<li><input type = "text" name = "subject" id = "subject"></li>
			<li>카테고리</li>
			<li>
				<select name = "category">
					<option value = "1">연례보고서</option>
					<option value = "2">지구생명보고서</option>
					<option value = "3">국문보고서</option>
					<option value = "4">영문보고서</option>
				</select>
			</li>
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
</div>
