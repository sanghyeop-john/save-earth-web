<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		padding-bottom:20px;
		padding-left:40px;
		padding-right:40px;
		background-color:#fff;
		width:700px;
		height:400px;
		overflow:auto;
		border:1px solid #ebecee;
		border-radius:15px;
	}
	.box {
	    width: 180px;
	    height: 180px; 
	    border-radius: 70%;
	    overflow: hidden;
	    margin:20px;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.info{
		width:250px;
		position:relative;
		top:-180px;
		left:300px;
	}
	.info li{
		float:left;
		height:40px;
		line-height:40px;
		width:30%;
		font-size:15px;
		font-weight:bold;
		margin-bottom:10px;
	}
	.info li:nth-child(2n){width:70%;}
	.link li{
		text-align:left;
		font-size:16px;
		font-weight:bold;
		margin:10px;
		position:relative;
		left:-200px;
		top:20px;
		
	}
	#editBtn input{
		padding: 5px 10px;
		position:relative;
		left:132px;
		top:-30px;
		font-size:15px;
		font-weight:bold;
		background-color:#33c24d;
		color:white;
		border:none;
		border-radius:3px;
	}
</style>
<div class="container">
	<h1 style="text-align:center;">마이페이지</h1>
	<div class="box" style="background: #BDBDBD;">
    	<img class="profile" src="/img/profile.jfif">
	</div>
	<ul class="info">
		<li>이름</li>
		<li><input type="text" name="username" id="username" value="${vo.username }" readonly/></li>
		<li>아이디</li>
		<li><input type="text" name="userid" id="userid" value="${vo.userid }" readonly/></li>
		<li>연락처</li>
		<li><input type="text" name="tel" id="tel" value="${vo.tel }" readonly/></li>
		<li>이메일</li>
		<li><input type="text" name="email" id="email" value="${vo.email}" readonly/></li>	
	</ul>
	<ul class="link">
		<li><a href="#" style="color:#444;">나의 질문 보기</a></li>
		<li><a href="#" style="color:#444;">나의 후원 보기</a></li>
	</ul>
	<div id="editBtn"><input type="button" onclick="location.href='/member/memberEdit';" value="회원정보수정"/></div>
</div>
</body>
</html>