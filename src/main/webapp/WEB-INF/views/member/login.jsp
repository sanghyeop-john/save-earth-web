<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#footer #btm_newsletter{
		display:none;
	}
	body, ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	body{
		background-color:#ebecee;
	}
	h1{
		font-size:27px;
		font-weight:bold;
	}
	.container{
		margin:60px auto;
		padding-top:40px;
		padding-bottom:60px;
		background-color:#fff;
		width:500px;
		border:1px solid #ebecee;
		border-radius:15px;
	}
	#log ul{
		width:300px;
		margin:0 auto;
	}
	#log li{margin-bottom:10px;}
	#log input{
		width:100%;
		height:42px;
		padding:0 13px;
		border:1px solid #ccc;
		border-radius:4px;
		font-size:15px;
		font-weight:normal;
		line-weight:40px;
		color:#444;
	}
	#log input[type=submit]{
		padding: 13px 5px;
		width:328px;
		height:auto;
		text-align:center;
		text-decoration:none;
		border:none;
		border-radius:3px;
		background-color:#33c24d;
		color:white;
		font-size:20px;
		font-weight:bold;
		margin-bottom:15px;
	}
	.join{
		text-align:center;
		font-size:13px;
		font-weight:bold;
	}
	
</style>
<div class="container">
	<h1 style="text-align:center">로그인</h1>
	<form method="post" action="/member/loginOk" id="log">
		<ul>
			<li><input type="text" name="userid" id="userid" placeholder="아이디"></li>
			<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"></li>
			<li><input type="submit" value="로그인"></li>
		</ul>
	</form>
		<div class="join">
			<a href="/member/memberForm">회원가입하기</a>
		</div>	
</div>
