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
		
		var checkId = RegExp(/^[a-zA-z0-9]{6,12}$/);
		var checkPwd = RegExp(/^[a-zA-z0-9]{8,16}$/);
		
		$("#idChk").click(function(){
			window.open("/member/idCheck?userid="+$("#userid").val(),"idchk","width=400, height=200");
		});
		
		$("#userid").change(function(){
			$("#idCheckState").val("N");
		});
		
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
			//아이디
			if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}
			//아이디 6~12 영어,숫자
			if(!checkId.test($("#userid").val())){
				alert("아이디를 형식에 맞게 입력해주세요.");
				$("#userid").val("");
				$("#userid").focus();
				return false;
			}
			
			//아이디 중복검사여부
			if($("#idCheckState").val()!='Y'){
				alert("아이디를 중복검사하세요.");
				return false;
			}
			//비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			//비밀번호 8~16 영어,숫자
			if(!checkPwd.test($("#userpwd").val())){
				alert("비밀번호를 형식에 맞게 입력해주세요.");
				$("#userpwd").val("");
				$("#userpwd").focus();
				return false;
			}
			//비밀번호 일치
			if($("#userpwd").val() != $("#userpwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름
			if($("#username").val()==""){
				alert("이름을 입력하세요.");
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
	<h1>회원가입</h1>
	<form method="post" action="/member/memberWrite" id="mFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid"/>
				<input type="button" value="중복확인" id="idChk"/>
				<span class="reg">&nbsp;6~12자 영문/숫자 사용</span>
				<input type="hidden" id="idCheckState" value="N"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"/>
				<span class="reg">&nbsp;8~16자 영문/숫자 사용</span>
			</li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username"/></li>
			<li>연락처</li>
			<li><input type="text" name="tel1" id="tel1" size="4"/> -
				<input type="text" name="tel2" id="tel2" size="4"/> -
				<input type="text" name="tel3" id="tel3" size="4"/></li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email"/></li>
			<li>우편번호</li>
			<li><input type="text" name="zipcode" id="zipcode"/>
				<input type="button" value="우편번호찾기" id="zipSearch"/></li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr" style="width:90%"/></li>
			<li>상세주소</li>
			<li><input type="text" name="detailaddr" id="detailaddr"/></li>
			<li>
				<input type="submit" value="가입하기"/>
			</li>	
		</ul>
	</form>	
		
</div>
