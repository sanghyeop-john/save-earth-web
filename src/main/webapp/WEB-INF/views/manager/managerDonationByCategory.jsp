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
			<li><a href = "/manager/managerDonationByUser" title = "1" >유저</a></li>
			<li><a href = "/manager/managerDonationByMonth" title = "2">기간</a></li>
			<li><a href = "/manager/managerDonationByCategory" title = "3" class = "active">카테고리</a></li>
		</ul>
	</div>
	
	<div id = "donation_div">
			<form method = "get" action = "" id = "">
				<ul id = "donationbycategory">
					<li class = "category">카테고리</li>
					<li class = "amount">금액</li>

					<c:forEach var = "donatebycategoryVO" items = "${donatebycategoryVO }">
						<li class = "category">
							<c:if test="${donatebycategoryVO.category == 1 }">북극곰보호</c:if>
							<c:if test="${donatebycategoryVO.category == 2 }">멸종동물보호</c:if>
							<c:if test="${donatebycategoryVO.category == 3 }">기후변화</c:if>
							<c:if test="${donatebycategoryVO.category == 4 }">플라스틱프리</c:if>
						</li>
						<li class = "amount">${donatebycategoryVO.amount }</li>
					</c:forEach>
				</ul>
			</form>
		</div>
</div>