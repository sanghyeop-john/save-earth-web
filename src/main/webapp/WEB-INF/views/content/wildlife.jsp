<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.container{
		width : 100%;
		padding : 0;
		margin: 0;
	}
	#top_title>img{
		width:100%;
		height:400px;
	}
	#top_title #title_wildlife{
		font-size:70px;
		color:white;
	}
	#top_title #eng_wildlife{
		font-size:30px;
		color:white;
	}
	#top_title a{
		font-size:20px;
		color:white;
		font-weight:500;
	}
	#main_content{
		margin: 0 auto;
   		width: calc(100% - 40px);
    	max-width: 1480px;
	}
	#main_content h2{
		font-size: 58px;
    	line-height: 54px;
    	font-weight: 700;
    	padding-bottom: 34px;
    	position: relative;
    	text-align:center;
	}
	#main_content h2:after{
		content: "";
    	display: block;
    	width: 32px;
    	height: 4px;
    	background-color: #e98300;
    	position: absolute;
    	bottom: 0;
    	left: 50%;
    	transform: translateX(-50%);
	}
	#content_list{
		width:100%;
		overflow:hidden;
	}
	.content_item{
		width: 30%;
		height:450px;
    	margin-right: 24px;
    	margin-top: 20px;
    	position: relative;
    	float:left;
    	border:2px solid #ddd;
	}
	.content_item img{
		width:100%;
		height:450px;
	}
</style>
<div class="container">
	<div id="top_title">
		<img src="/img/wildlife4.jpg">
		<a href="/content/oceans" style="position:relative; left:10%;top:-390px;">< 해양</a>
		<a href="/content/climate" style="position:relative; left:80%;top:-390px;">기후 ></a>
		<div style="position:relative; left:41%;top:-380px;"><h3 id="title_wildlife">야생동물</h3></div>
		<div style="position:relative; left:48%;top:-390px;"><h3 id="eng_wildlife">wildlife</h3></div>
	</div>
	<div>
		<img src="/img/intro3.jpg" style="position:relative; top:-200px; height:320px; width:100%">
	</div>
	<div id="main_content" style="position:relative; top:-200px;">
		<div><h2>STE가 하는 일</h2></div>
		<div id="content_list">
			<div class="content_item"><img src="/img/wildlife_con1.jpg"/></div>
			<div class="content_item"><img src="/img/wildlife_con2.jpg"/></div>
			<div class="content_item"><img src="/img/wildlife_con3.jpg"/></div>
		</div>
	</div>	
</div>
</body>
</html>