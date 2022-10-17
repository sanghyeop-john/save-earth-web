<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<script type="text/javascript" src = "/js_css/manager/managerSearch.js"></script>
<script type="text/javascript" src = "/js_css/manager/managerDelete.js"></script>
<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerUserInfo">회원관리</a>
			<li><a href = "/manager/managerForm" class = "active">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1">자료</a></li>
			<li><a href = "/manager/managerDonation">후원</a></li>
		</ul>
	</div>
	
	<h1><b>매니저 관리</b></h1>
	<div id = "manager_bottom">
		<div id = "manager_insert">
			<form method = "post" action = "/manager/managerInsert" id = "managerInsertForm">
				추가할 아이디 : 
				<input type = "text" name = "userid" id = "userid">
				<input type = "hidden" name = "username" id = "username">
				<input type = "button" value = "유저찾기" id = "managerSearch">
				<input type = "submit" value = "매니저 추가">
			</form>
		</div>
		<div id = "manager_list_div">
			<form method = "get" action = "/manager/managerDelete" id = "managerDeleteForm">
				<ul id = "manager_list">
					<li class = "userid">아이디</li>
					<li class = "username">이름</li>
					<li class = "blank">&nbsp;</li>
					
					<c:forEach var = "managerList" items = "${managerList }">
						<li class = "userid">${managerList.userid }</li>
						<li class = "username">${managerList.username }</li>
						<li class = "managerDelete">삭제</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	</div>
</div>
