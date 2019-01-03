<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 
<title>index</title>
<link rel="stylesheet" href="css/index/reset.css" type="text/css" />
<link rel="stylesheet" href="css/index/style.css" type="text/css" />
<script src="js/index/modernizr.js"></script>
 -->
 <title>index</title>
 <link rel="stylesheet" href="${ctx }/css/covercss/reset.css" type="text/css"/>
 <link rel="stylesheet" href="${ctx }/css/covercss/style.css" type="text/css"/>
 <script type="text/javascript" src="${ctx }/js/coverjs/modernizr.js"></script>
</head>
<body>
<section class="cd-slider-wrapper">
	<ul class="cd-slider">
		<li class="visible">
			<div>
				<h1 class="text-1">新发现</h1><br>
			    <a href="${ctx }/index/scelist" class="text-uppercase header-btn">Let's Go Now</a>
			</div>
		</li>
		<li>
			<div>
				<h1 class="text-1">新美食</h1><br>
				<a href="${ctx }/index/scelist" class="text-uppercase header-btn">Let's Go Now</a>
			</div>
		</li>
		<li>
			<div>
				<h1 class="text-1">新乐趣</h1><br>
				<a href="${ctx }/index/scelist" class="text-uppercase header-btn">Let's Go Now</a>
			</div>
		</li>
		<li>
			<div>
				<h1 class="text-1">新大陆</h1><br>
				<a href="${ctx }/index/scelist" class="text-uppercase header-btn">Let's Go Now</a>
			</div>
		</li>
	</ul> <!-- .cd-slider -->
	<ol class="cd-slider-navigation">
		<li class="selected"><a href="#0"><em>Item 1</em></a></li>
		<li><a href="#0"><em>Item 2</em></a></li>
		<li><a href="#0"><em>Item 3</em></a></li>
		<li><a href="#0"><em>Item 4</em></a></li>
	</ol> <!-- .cd-slider-navigation -->
	<div class="cd-svg-cover" data-step1="M1402,800h-2V0.6c0-0.3,0-0.3,0-0.6h2v294V800z" data-step2="M1400,800H383L770.7,0.6c0.2-0.3,0.5-0.6,0.9-0.6H1400v294V800z" data-step3="M1400,800H0V0.6C0,0.4,0,0.3,0,0h1400v294V800z" data-step4="M615,800H0V0.6C0,0.4,0,0.3,0,0h615L393,312L615,800z" data-step5="M0,800h-2V0.6C-2,0.4-2,0.3-2,0h2v312V800z" data-step6="M-2,800h2L0,0.6C0,0.3,0,0.3,0,0l-2,0v294V800z" data-step7="M0,800h1017L629.3,0.6c-0.2-0.3-0.5-0.6-0.9-0.6L0,0l0,294L0,800z" data-step8="M0,800h1400V0.6c0-0.2,0-0.3,0-0.6L0,0l0,294L0,800z" data-step9="M785,800h615V0.6c0-0.2,0-0.3,0-0.6L785,0l222,312L785,800z" data-step10="M1400,800h2V0.6c0-0.2,0-0.3,0-0.6l-2,0v312V800z">
		<svg height='100%' width="100%" preserveAspectRatio="none" viewBox="0 0 1400 800">
			<title>SVG cover layer</title>
			<desc>an animated layer to switch from one slide to the next one</desc>
			<path id="cd-changing-path" d="M1402,800h-2V0.6c0-0.3,0-0.3,0-0.6h2v294V800z"/>
		</svg>
	</div> <!-- .cd-svg-cover -->
</section> <!-- .cd-slider-wrapper -->
<script src="${ctx }/js/coverjs/jquery-2.1.4.js"></script>
<script src="${ctx }/js/coverjs/snap.svg-min.js"></script>
<script src="${ctx }/js/coverjs/main.js"></script> <!-- Resource jQuery -->
</body>
</html>