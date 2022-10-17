<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo">회원관리</a>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1">자료</a></li>
			<li><a href = "/manager/managerDonation" class = "active">후원</a></li>
		</ul>
	</div>
	<h1><b>후원 통계</b></h1>
	<div id = "donation_sta_div">
		<ul id = "donation_sta">
			<li><a href = "/manager/managerDonationByUser" title = "1">유저</a></li>
			<li><a href = "/manager/managerDonationByMonth" title = "2">기간</a></li>
			<li><a href = "/manager/managerDonationByCategory" title = "3">카테고리</a></li>
		</ul>
	</div>
	
	<div id = "donation_div">
			<form method = "get" action = "" id = "">
				<ul id = "donation">
					<li class = "userid">아이디</li>
					<li class = "amount">금액</li>
					<li class = "donate_date">후원일시</li>
					<li class = "frequency">정기/일시후원</li>
					<li class = "category">후원종류</li>
					
					<c:forEach var = "donateVO" items = "${donateVO }">
						<li class = "userid">${donateVO.userid }</li>
						<li class = "amount">${donateVO.amount }</li>
						<li class = "donate_date">${donateVO.donate_date }</li>
						<li class = "frequency">
							<c:if test="${donateVO.frequency == 1 }">정기후원</c:if>
							<c:if test="${donateVO.frequency == 2 }">일시후원</c:if>
						</li>
						<li class = "category">
							<c:if test="${donateVO.category == 1 }">북극곰보호</c:if>
							<c:if test="${donateVO.category == 2 }">멸종동물보호</c:if>
							<c:if test="${donateVO.category == 3 }">기후변화</c:if>
							<c:if test="${donateVO.category == 4 }">플라스틱프리</c:if>
						</li>
					</c:forEach>
				</ul>
				후원 총액 : ${dsum }
			</form>
		</div>
</div>
