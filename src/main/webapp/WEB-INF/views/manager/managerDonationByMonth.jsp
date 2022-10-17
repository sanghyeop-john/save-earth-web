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
			<li><a href = "/manager/managerDonationByMonth" title = "2" class = "active">기간</a></li>
			<li><a href = "/manager/managerDonationByCategory" title = "3">카테고리</a></li>
		</ul>
	</div>
	
	<div id = "donation_div">
			<form method = "get" action = "" id = "">
				<ul id = "donationbymonth">
					<li class = "month">년-월</li>
					<li class = "amount">금액</li>

					<c:forEach var = "donatebymonthVO" items = "${donatebymonthVO }">
						<li class = "month">${donatebymonthVO.donate_date }</li>
						<li class = "amount">${donatebymonthVO.amount }</li>
					</c:forEach>
				</ul>
			</form>
		</div>
</div>