<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	ul, li{
		margin : 0;
		padding : 0;
		list-style-type : none;
	}
	
	.container {
		padding: 100px;
	}
	.gall_list{
		overflow:auto;
	}

	#news li:nth-child(6n+3){
		width: 55%;
		/* 말줄임 */
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	/* page */
	.paging{
		box-align: center;
	}
	#page li{
		float: left;
		padding: 10px;
	}
	.gall_item{
		margin: 5px;
		border: 1px solid #ccc;
		float: left;
		width: 25%;
	}
	.gall_item:hover{
		border: 1px solid orange;
	}
	.gall_item img {
		width:100%;
		height: auto;
	}
	.gall_infos{
		padding: 15px;
		text-align: center;
	}
	
	
	
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력하세요.");
				return false;				
			}
			return true;
		});
	});
</script>

<div class="container">
	<h1>소식</h1>
	<!-- 관리자 로그인 된 경우 글쓰기-->
	<c:if test="${logStatus=='Y' }">
		<div><a href="/news/newsWrite">글쓰기</a></div>
	</c:if>
	
	<!-- 필터 및 검색 -->
	<div>
		총 게시물  ${pvo.totalRecord }건
	</div>
	
	<div>
		<form method="get" action="/news/newsList" id="searchFrm">
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="userid">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord">
			<input type="submit" name="Search">
		</form>
	</div>
	
	
	<!-- 썸네일 리스트 -->
	<ul class="gall_list">
		<c:forEach var="vo" items="${list }">
			<li class="gall_item">
				<div>
					<a href="/news/newsView?no=${vo.no }&nowPage=${pvo.nowPage}<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">
						<div class="gall_thum_wrap">
							<!-- <img src="/img/03.jpg" class="gall_thum"> -->
							<img src="/js_css/upload/thumbnail/${vo.filename1 }" class="card-img-top">
						</div>
						<div class="gall_infos">
							<div class="gall_cate">제목: ${vo.subject}</div>	
							<div class="gall_no">${vo.no }번 게시물</div>					
							<div class="gall_date">${vo.writedate}</div>
							<div class="gall_hit">조회수: ${vo.hit}</div>
							<div class="gall_cont">${vo.content}</div>
						</div>
					</a>
				</div>
			</li>
		</c:forEach>
	</ul>
	
	<!-- page 번호 -->
	<div class = "paging">
		<ul id = "page">
			<c:if test = "${pvo.nowPage > 1 }"><!-- 이전 page가 있을 때 -->
				<li><a href = "/news/newsList?nowPage=${pvo.nowPage-1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">prev</a></li>
			</c:if>
			
			<c:forEach var = "p" begin = "${pvo.startPage }" end = "${pvo.startPage + pvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= pvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == pvo.nowPage }">
						style = "background-color : orange"; color : #fff;"
					</c:if>
					
					><a href = "/news/newsList?nowPage=${p }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">${p }</a></li>
					
				</c:if>
			</c:forEach>
			
			<!-- 다음 page -->
			<c:if test = "${pvo.nowPage < pvo.totalPage }">
				<li><a href = "/news/newsList?nowPage=${pvo.nowPage + 1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>
	
	<div>
	</div>
</div>
