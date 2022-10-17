<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<script type="text/javascript" src = "/js_css/manager/managerSearch.js"></script>
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
			<li><a href = "/manager/managerDonationByUser" title = "1" class = "active">유저</a></li>
			<li><a href = "/manager/managerDonationByMonth" title = "2">기간</a></li>
			<li><a href = "/manager/managerDonationByCategory" title = "3">카테고리</a></li>
		</ul>
	</div>
	<div id = "donation_search">
		<form method = "post" action = "/manager/managerDonationSearch" id = "managerDonationSearchForm">
			검색할 아이디 : 
			<input type = "text" name = "userid" id = "userid">
			<input type = "button" value = "유저찾기" id = "managerSearch">
			<input type = "submit" value = "후원내역검색">
		</form>
	</div>
	<div id = "donation_div">
			<form method = "get" action = "" id = "">
				<ul id = "donationbyuser">
					<li class = "userid">아이디</li>
					<li class = "amount">금액</li>

					<c:forEach var = "donatebyuserVO" items = "${donatebyuserVO }">
						<li class = "userid">${donatebyuserVO.userid }</li>
						<li class = "amount">${donatebyuserVO.amount }</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	
</div>