<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script type="text/javascript" src = "/js_css/report/report_list.js"></script>

<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo">회원관리</a>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1" class = "active">자료</a></li>
			<li><a href = "/manager/managerDonation">후원</a></li>
		</ul>
	</div>
	
	<div id = "report_category">
		<ul id = "category">
			<li><a href = "/manager/managerReport?category=1" title = "1" class = "active">연례보고서</a></li>
			<li><a href = "/manager/managerReport?category=2" title = "2">지구생명보고서</a></li>
			<li><a href = "/manager/managerReport?category=3" title = "3">국문보고서</a></li>
			<li><a href = "/manager/managerReport?category=4" title = "4">영문보고서</a></li>
		</ul>
	</div>
	
	<div id = "search">
		
		<form method = "get" action = "/manager/managerReport" id = "searchFrm">
			<select class = "searchbox" name = "searchKey">
				<option value = "subject">제목</option>
				<option value = "content">글내용</option>
			</select>
			<input type = "hidden" name = "category" value = "${prvo.category }">
			<input type = "text" name = "searchWord" id = "searchWord" placeholder = "검색어를 입력하세요.">
			<input type = "image" name = "Search" src = "/js_css/report/icon_search.png">
		</form>
	</div>
	
	<div id = "report_list">
		
		<ul id = "report">
			
				<li>번호</li>
				<li>제목</li>
				<li>등록일</li>
			
			<c:forEach var = "reportList" items = "${reportList }">
				<li class = "no">${reportList.no }</li>
				<li class = "subject"><a href = "/manager/managerReportView?no=${reportList.no }&nowPage=${prvo.nowPage}<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>" alt = "${reportList.no }">${reportList.subject }</a></li>
				<li class = "writedate">${reportList.writedate }</li>
			</c:forEach>
		</ul>
	</div>
	<div style = "width : 75%; margin: auto; margin-top: 200px;">
		<c:if test = "${ManagerStatus == 'Y'}">
			<a href = "/manager/managerReportWrite">보고서 등록</a>
		</c:if>
	</div>
	<div id = "paging">
		<ul id = "page">
			<c:if test = "${prvo.nowPage > 1 }"><!-- 이전 page가 있을 때 -->
				<li><a href = "/manager/managerReport?category=${prvo.category }&nowPage=${prvo.nowPage-1 }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>" class = "prev">prev</a></li>
			</c:if>
			<c:forEach var = "p" begin = "${prvo.startPage }" end = "${prvo.startPage + prvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= prvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == prvo.nowPage }">
						style = "background-color : #000;"
					</c:if>
					
					><a href = "/manager/managerReport?category=${prvo.category }&nowPage=${p }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>"
					<c:if test = "${p == prvo.nowPage }">
						style = "color : #fff;"
					</c:if>
					>${p }</a></li>
					
				</c:if>
			</c:forEach>
			<!-- 다음 page -->
			<c:if test = "${prvo.nowPage < prvo.totalPage }">
				<li><a href = "/manager/managerReport?category=${prvo.category }&nowPage=${prvo.nowPage + 1 }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>" class = "next">next</a></li>
			</c:if>
		</ul>
		
	</div>
</div>
