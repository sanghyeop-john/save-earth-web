<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">

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
	
	<div id = "report_view">
	<ul>
		<li id = "subject"><h2>${reportVO.subject }</h2></li>
		<li id = "hit">보고서 다운로드 횟수 : ${reportVO.hit }, 보고서 : <a href = "/upload/report/${reportVO.filename_t }" download> &nbsp;${reportVO.filename_t }</a></li>
		<li id = "content">${reportVO.content }</li>
	</ul>
		<!--  
		<ul>
			<li class = "no">번호</li>
			<li class = "no">${reportVO.no }</li>
			<li class = "hit">조회수 : ${reportVO.hit }</li>
			<li class = "report">첨부 보고서 : <a href = "/upload/report/${reportVO.filename_t }" download>${reportVO.filename_t }</a></li>
			<li class = "subject">제목</li>
			<li class = "subjectDB">${reportVO.subject }</li>
			<li class = "content">글내용</li>
			<li class = "content">${reportVO.content }</li>
		</ul>
		-->
	</div>
	<div style = "margin-left: 113px; margin-top: 20px;">
		<a href = "/manager/managerReport?category=${reportVO.category }&nowPage=${prvo.nowPage }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">목록</a>
		<c:if test = "${ManagerStatus == 'Y' }">
			<a href = "/manager/managerReportEdit/${reportVO.no }">수정</a>
			<a href = "/manager/managerReportDelete/${reportVO.no}">삭제</a>
		</c:if>
	</div>
</div>
