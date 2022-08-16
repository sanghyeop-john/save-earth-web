<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js_css/jquery.easing.1.3.js"></script>
<script src="/js_css/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/js_css/jquery.bxslider.css" type="text/css">
<style>
	#imgSlider img{width:100%; height:700px; }
	ul,li{margin:0; padding:0;}
</style>
<script>
	$(function(){
		$("#imgSlider").bxSlider({
			mode:'horizontal' //화면전환방식 'horizontal'(기본) 'vertical' 'fade'
			,slideWidth:1688 //슬라이드 폭
			,slideHeight:700 //슬라이드 높이
			,speed:3000 //속도
			,auto:true //자동시작 true, false(기본)
			,randomStart:true //랜덤 시작 true, false(기본)
			,captions:true //title속성의 값을 설명으로 표시 true,false(기본)
			,infiniteLoop:true //반복여부
			,hideControlOnEnd:true //좌우컨트롤 보여주기 true:처음과마지막에 컨트롤 표시안함
			,useCSS:false //easing 사용여부 true(easing사용안함),false(사용)
			,easing:'linear'
			/*,onSliderLoad: function(){ //slide가 로딩이 완료되면 호출되는 콜백함수
				alert("onSliderLoad 콜백함수 실행됨..")
			}*/
			,onSlideAfter:function(){//슬라이드가 움직인 후 호출되는 콜백함수
				console.log("onSlideAfter 실행됨...")
			}
		});
	})
</script>
<div class = "container">
	<div id="banner">
		<ul id="imgSlider">
			<li><a href="https://www.nate.com"><img src="/img/05.jfif" ></a></li>
			<li><a href="https://www.naver.com"><img src="/img/06.jpg" ></a></li>
			<li><a href=""><img src="/img/07.jpg" ></a></li>
			<li><a href=""><img src="/img/08.jpg" ></a></li>
		</ul>
	</div>
	<div id="recent_news">
		<div><h2>최신 소식</h2></div>
		<div>
			
		</div>
	</div>
</div>
