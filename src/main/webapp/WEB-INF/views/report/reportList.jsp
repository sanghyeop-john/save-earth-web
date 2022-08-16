<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">

<div class = "report_container">
	
	<div id = "temp_write">
		<a href = "/report/reportWrite">글쓰기</a>
	</div>
	<div id = "report_list">
		<ul>
			<li>번호</li>
			<li>제목</li>
			<li>등록일</li>
			
			<c:forEach var = "reportList" items = "${reportList }">
				<li>${reportList.no }</li>
				<li>${reportList.subject }</li>
				<li>${reportList.writedate }</li>
			</c:forEach>
		</ul>
	</div>
</div>
