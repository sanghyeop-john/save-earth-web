<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<script type="text/javascript" src = "/js_css/manager/managerSearch.js"></script>
<style>
#seu_header, #footer{
	display: none;
}
</style>
<div class = "container">
	<p>
		매니저로 추가할 아이디를 입력하세요
	</p>
	
	<form method = "get" action = "/manager/managerSearch" id = "managerForm">
		아이디 : <input type = "text" name = "userid" id = "userid">
		<input type = "submit" value = "유저찾기">
	</form>
		<ul id = "userList">
			<li>아이디</li>
			<li>이름</li>
			
			<c:forEach var = "userList" items = "${userList }">
				<li class = "userid">${userList.userid }</li>
				<li>${userList.username }</li>
			</c:forEach>
		</ul>
	
</div>
