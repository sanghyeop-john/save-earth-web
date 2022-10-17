<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js_css/home/jquery.easing.1.3.js"></script>
<script src="/js_css/home/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/js_css/home/jquery.bxslider.css" type="text/css">
<style>
	#imgSlider img{width:100%; height:800px; }
	ul,li{margin:0; padding:0;list-style-type:none;}
	.bx-wrapper{
		border:0;
	}
	.bxslider{
		width:100%;
	}
	.bx-wrapper .bx-controls-auto, .bx-wrapper .bx-pager{
		bottom:30px;
	}
	#imgSlider .text1{
		font-size:58px;
		color:white;
	}
	#imgSlider .text2{
		font-size:40px;
		color:white;
	}
	#imgSlider .more_btn{
		width:120px;
		font-size: 18px;
	    height: 50px;
	    line-height: 48px;
	    color: #fff;
	    background-color: #e98300;
	    border: 1px solid #e98300;
	    display: inline-block;
	    text-align: center;
	    padding: 0 10px;
	}
	#imgSlider .more_btn:hover{
		background-color: #222;
    	border: 1px solid #ddd;
	}
</style>
<script>
	$(function(){
		$("#imgSlider").bxSlider({
			mode:'horizontal' //화면전환방식 'horizontal'(기본) 'vertical' 'fade'
			 //슬라이드 폭
			 //슬라이드 높이
			,speed:3000 //속도
			,auto:true //자동시작 true, false(기본)
			,randomStart:true //랜덤 시작 true, false(기본)
			,captions:true //title속성의 값을 설명으로 표시 true,false(기본)
			,infiniteLoop:true //반복여부
			,hideControlOnEnd:true //좌우컨트롤 보여주기 true:처음과마지막에 컨트롤 표시안함
			,useCSS:false //easing 사용여부 true(easing사용안함),false(사용)
			,easing:'linear'
		});
	})
</script>
<div id = "main_container">
	<div id="banner">
		<ul id="imgSlider">
			<li><a href="#">
				<div style="position:absolute; left:40%;top:280px;"><h1 class="text1">Save The Earth</h1></div>
				<a href="#" class="more_btn" style="position:absolute; top:450px;left:48%;">MORE</a>
				<img src="/img/banner1.jpg" ></a>
			</li>
			<li><a href="/content/climate">
				<div style="position:absolute; left:30%;top:300px;"><h1 class="text2">STE와 함께 만드는 사람과 자연이 조화로운 미래</h1></div>
				<a href="/content/climate" class="more_btn" style="position:absolute; top:450px;left:48%;">MORE</a>
				<img src="/img/banner3.jpg" ></a>
			</li>
			<li><a href="#">
				<div style="position:absolute; left:40%;top:300px;"><h1 class="text2">행동을 통한 긍정적인 변화</h1></div>
				<a href="#" class="more_btn" style="position:absolute; top:450px;left:48%;">MORE</a>
				<img src="/img/banner5.jpg" ></a>
			</li>
			<li><a href="#">
				<div style="position:absolute; left:36%;top:300px;"><h1 class="text2">STE의 다양한 활동에 참여하세요.</h1></div>
				<a href="#" class="more_btn" style="position:absolute; top:450px;left:48%;">MORE</a>
				<img src="/img/banner4.jpg" ></a>
			</li>
		</ul>
	</div>
	<div id="main_exer">
		<div><h2>STE 활동분야</h2>
			<p id="sub">STE는 사람과 자연이 조화로운 미래를 만들어가기 위해 아래 3개 보전 영역에 걸쳐 활동하고 있습니다.</p>
		</div>
		<div id="exerList">
			<div class="exerItem">
				<a href="/content/climate">
					<img src="/img/climate2.jpg">
					<div class="en" style="position:relative; top:-150px;">CLIMATE</div>
					<div class="kor" style="position:relative; top:-150px;">기후</div>
				</a>
			</div>
			<div class="exerItem">
				<a href="/content/oceans">
					<img src="/img/ocean.jpg">
					<div class="en" style="position:relative; top:-150px;">OCEANS</div>
					<div class="kor" style="position:relative; top:-150px;">해양</div>
				</a>
			</div>
			<div class="exerItem">
				<a href="/content/wildlife">
					<img src="/img/wildlife3.jpg">
					<div class="en" style="position:relative; top:-150px;">WILDLIFE</div>
					<div class="kor" style="position:relative; top:-150px;">야생동물</div>
				</a>
			</div>
		</div>
	</div>
	<div id="donation">
		<div>
			<div style="position:relative; left:45%;top:340px;"><h3 id="text3">함께라면 가능합니다.</h3></div>
			<div style="position:relative; left:36%;top:300px;"><h1 id="text4">TOGETHER POSSIBLE</h1></div>
			<a href="" id="donation_btn" style="position:relative; top:300px;left:46%;">후원하기</a>
			<img src="/img/dn_img2.jpg" style="width:100%; height:400px;">
		</div>
	</div>
	<!-- <div id="content">
		<div><h2>STE 활동분야</h2></div>
	</div> -->
	
</div>
