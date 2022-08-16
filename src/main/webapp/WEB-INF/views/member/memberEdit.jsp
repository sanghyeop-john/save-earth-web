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
		padding-bottom:60px;
		padding-left:40px;
		padding-right:40px;
		background-color:#fff;
		width:700px;
		overflow:auto;
		border:1px solid #ebecee;
		border-radius:15px;
	}
	#mFrm li{
		float:left;
		height:40px;
		line-height:40px;
		width:30%;
		font-size:15px;
		font-weight:bold;
		margin-bottom:10px;
	}
	#mFrm li:nth-child(2n){width:70%;}
	#mFrm li:last-of-type{
		width:100%; 
		text-align:center;
		margin:20px;
	}
	#mFrm input{
		height:30px;
		padding:0 13px;
		border:1px solid #ccc;
		border-radius:4px;
		font-size:15px;
		font-weight:bold;
		line-weight:40px;
		color:#444;
	}
	#mFrm input[type=submit]{
		padding: 7px 12px;
		height:auto;
		border:none;
		border-radius:3px;
		background-color:#33c24d;
		color:white;
		font-size:17px;
		font-weight:bold;
	}
	.reg{
		font-size:13px;
		font-weight:bold;
		color:#33c24d;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		
		//우편번호 찾기
		$("#zipSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	document.getElementById("zipcode").value= data.zonecode;
		        	document.getElementById("addr").value = data.address;
		        }
		    }).open();
		});
		
		//유효성 검사
		$("#mFrm").submit(function(){
			
			//비밀번호 - 수정시 본인확인용
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			//연락처
			if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
				alert("연락처를 입력하세요.");
				return false;
			}
			//이메일
			if($("#email").val()==""){
				alert("이메일을 입력하세요.");
				return false;
			}			
			//우편번호
			if($("#zipcode").val()==""){
				alert("우편번호를 입력하세요.");
				return false;
			}
			//주소
			if($("#addr").val()==""){
				alert("주소를 입력하세요.");
				return false;
			}
			return true;
		});		
});
</script>
<div class="container">
	<h1>회원정보수정</h1>
	<form method="post" action="/member/memberEditOk" id="mFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" value="${vo.userid }" readonly/></li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" value="${vo.username }" readonly/></li>
			<li>연락처</li>
			<li><input type="text" name="tel1" id="tel1" size="4" value="${vo.tel1 }"/> -
				<input type="text" name="tel2" id="tel2" size="4" value="${vo.tel2 }"/> -
				<input type="text" name="tel3" id="tel3" size="4" value="${vo.tel3 }"/></li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" value="${vo.email}"/></li>
			<li>우편번호</li>
			<li><input type="text" name="zipcode" id="zipcode" value="${vo.zipcode }"/>
				<input type="button" value="우편번호찾기" id="zipSearch"/></li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr" value="${vo.addr }" style="width:90%"/></li>
			<li>상세주소</li>
			<li><input type="text" name="detailaddr" id="detailaddr" value="${vo.detailaddr }"/></li>
			<li>
				<input type="submit" value="회원정보수정"/>
			</li>	
		</ul>
	</form>	
		
</div>
