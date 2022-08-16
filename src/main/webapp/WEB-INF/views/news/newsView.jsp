<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<h1>소식</h1>
	<ul>
		<li>번호</li>
		<li>${vo.no }</li>
		<li>작성자</li>
		<li>${vo.userid }</li>
		<li>제목</li>
		<li>${vo.subject }</li>
		<li>조회수 : ${vo.hit }, 등록일 : ${vo.writedate }</li>
		<li>글내용</li>
		<li>${vo.content }</li>
		<li class = "down">썸네일 : <a href = "/upload/thumbnail/${vo.filename1 }" download>${vo.filename1 }</a> 
		</li>
	</ul>
	<div>
		<a href = "/news/newsList?nowPage=${pvo.nowPage }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">목록</a>
		<%--  관리자 모드에서 가능
		<c:if test = "${vo.userid == logId}">
			<a href = "/news/newsEdit/${vo.no }">수정</a>
			<a href = "javascript:newsDel();">삭제</a>
		</c:if>
		 --%>
		 
	</div>
</div>
