<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<h1>소식</h1>
	<ul>
		<li>번호</li>
		<li>${newsVO.no }</li>
		<li>작성자</li>
		<li>${newsVO.userid }</li>
		<li>제목</li>
		<li>${newsVO.subject }</li>
		<li>조회수 : ${newsVO.hit }, 등록일 : ${newsVO.writedate }</li>
		<li>글내용</li>
		<li>${newsVO.content }</li>
		<li class = "down">첨부파일 : <a href = "/upload/thumbnail/${newsVO.filename1 }" download>${newsVO.filename1 }</a> 
		</li>
	</ul>
	<div>
		<a href = "/news/newsList?nowPage=${pvo.nowPage }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">목록</a>
		
		<c:if test = "${ManagerStatus == 'Y'}">
			<a href = "/news/newsEdit/${vo.no }">수정</a>
			<a href = "javascript:newsDel();">삭제</a>
		</c:if>
		
		 
	</div>
</div>
