<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">

<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo" class = "active">회원관리</a>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1">자료</a></li>
			<li><a href = "/manager/managerDonation">후원</a></li>
		</ul>
	</div>
	<h1><b>회원 관리</b></h1>
	<div id = "user_list_div">
			<form method = "get" action = "" id = "">
				<ul id = "user_list">
					<li class = "userid">아이디</li>
					<li class = "username">이름</li>
					<li class = "tel">전화번호</li>
					<li class = "email">이메일</li>
					<li class = "addr">주소</li>
					
					<c:forEach var = "memberVO" items = "${memberVO }">
						<li class = "userid">${memberVO.userid }</li>
						<li class = "username">${memberVO.username }</li>
						<li class = "tel">${memberVO.tel }</li>
						<li class = "email">${memberVO.email }</li>
						<li class = "addr">${memberVO.addr }</li>
					</c:forEach>
				</ul>
			</form>
		</div>
</div>
