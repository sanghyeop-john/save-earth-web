<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	function qnaboardDel() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/qnaboard/qnaboardDel?no=${viewVO.no}";
		}
	}
</script>
<style>
#view li {
	border-bottom: 1px solid #ddd;
	margin: 10px 0 10px;
}
</style>

<div class="container">
	<h1>게시글 확인</h1>
	<ul id="view">
		<li>번호 : ${viewVO.no}</li>
		<li>작성자 : ${viewVO.userid}</li>
		<li>등록일 : ${viewVO.writedate}, 조회수 : ${viewVO.hit}</li>
		<li>제목 : ${viewVO.subject}</li>
		<li>${viewVO.content}</li>
	</ul>
	<div>
		<a
			href="/qnaboard/qnaboardList?nowPage=${pvo.nowPage }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">목록</a>
		<c:if test="${viewVO.userid == logId}">
			<a href="/qnaboard/qnaboardEdit/${viewVO.no }">수정</a>
			<a href="javascript:qnaboardDel();">삭제</a>
		</c:if>
	</div>

</div>