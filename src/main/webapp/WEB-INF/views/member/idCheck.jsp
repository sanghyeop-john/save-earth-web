<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#seu_header, #footer{
		display:none;
	}
	.container{
		text-size:15px;
		margin:10px;
	}
</style>
<script>
	$(function(){
		//조회한 id를 opener에 셋팅하고 현재 window를 닫아야한다.
		$("#setId").click(function(){
			opener.$('#userid').val('${userid}'); //원래창(opener)의 userid를 팝업창의 userid값으로 셋팅한다
			opener.$('#idCheckState').val('Y');
			window.close();
		});
	});
</script>
<div class="container">
	<c:if test="${idCnt==0 }">
		<b>${userid }</b>는 사용가능한 아이디 입니다.
		<input type="button" value="아이디사용하기" id="setId">
	</c:if>
	<c:if test="${idCnt>0 }">
		<b>${userid }는 사용불가능한 아이디 입니다.</b>
	</c:if>
	<hr/>
	<form method="get" action="/member/idCheck">
		아이디 : <input type="text" name="userid" id="userid"/>
		<input type="submit" value="아이디중복검사하기"/>	
	</form>
</div>
