<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="css/user/demo.css">
<link rel="stylesheet" href="css/user/cropper.min.css">
<title>QTL的空间</title>
<link href="${ctx }/css/user/myhead.css" rel="stylesheet">
<link href="${ctx }/css/user/pho.css" rel="stylesheet">
<link href="${ctx }/css/home/header.css" rel="stylesheet">
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx }/css/user/home.css">
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
<script type="text/javascript" src="${ctx }/js/user/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/user/up.js"></script>
<style type="text/css">
    .topdiv{
        width:100%;
        font-family:'microsoft yahei'; 
        font-size:14px;
    }
    
    .seconddiv{
        width:480px;
        height:155px;
        background-color:white;
        margin-left:150px;
        margin-top:20px;
        float:left;
        border:1px solid #f7f7f7;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="qn-header">
		<div class="main-zt">
			<div class="user-info">
				<dt class="flpic">
					<div>
	            <div style="width: 100px;height:100px;border-radius:50%;border: solid 1px #555; id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${user.icon}" width="100px" height="100px" style="border-radius:50%;">
                </div>   <!-- 等插入头像之后添加 -->
	          </div>
				</dt><!-- 个人头像 -->
				<dd class="flintro">
					<h3 class="intro-title">
						<span class="name" title="QTL">${user.username }</span>
					</h3>
					<div class="intro-body">
						<form action="">
						    <input type="text" placeholder="编辑个人签名" style="width:400px;">
						</form>
					</div>
				</dd>
			</div>
			<div class="fruser-fans">
				<div class="fz">
					<div class="shu">${FGCount }</div>
					<div class="guzh"><a href="${ctx }/guanzhuUser">关注</a></div>
				</div>
				<div class="hz">|</div>
				<div class="fy">
					<div>${fansCount }</div>
					<div><a href="#">粉丝</a></div>
				</div>
			</div>
		</div>
		<div class="mynav">
			<ul id="mydao">
				<li class="item item-hover item-active" data-beacon="myhomepage"><a
					href="${ctx }/user/usercenter">首页</a></li>
				<li class="item"><a
					href="${ctx }/photo/findallphoto"
					data-beacon="photos">相册</a></li>
				<li class="item"><a
					href="${ctx }/sixinPage"
					data-beacon="letter">消息</a></li>
				<li class="item"><a
					href="${ctx }/journey/citylist"
					data-beacon="letter">创建行程</a></li>
				<li class="item"><a
					href="${ctx }/strategy/opencreate"
					data-beacon="letter">创建攻略</a></li>
			</ul>
		</div>
	</div>
	
	
	
	<!-- 在此处写我的关注的页面 -->
	<div class="topdiv">
	    <div style="padding-top:50px;margin-bottom:20px;">

	           <span style="margin-left:150px;margin-right:20px;"><a href="${ctx }/guanzhuUser">我的关注(${FGCount })</a></span>   
	             <span><a href="${ctx }/fansUser" style="color:black">我的粉丝(${fansCount })</a></span>

	    </div>
	    <c:forEach items="${fansPerson }" var="fpn">
	    <!-- 粉丝1 -->
	    <div class="seconddiv">
	        <div style="float:left;width:480px;">
	          <div>
	            <div style="width: 50px;height: 50px;border-radius:50%;border: solid 1px #555; float:left;margin-left:20px;margin-top:25px;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${fpn.icon}" width="50px" height="50px" style="border-radius:50%;"/>
                </div>   <!-- 等插入头像之后添加 -->
	          </div>
	          <div style="float:left;margin-left:20px;">
	            <div style="margin-top:25px;">${fpn.username }</div>
	            <div style="color:gray;margin-top:10px;">攻略&nbsp;${fpn.strategyCount }  &nbsp;&nbsp;&nbsp;  行程&nbsp;${fpn.routeCount } &nbsp;&nbsp;&nbsp;  关注&nbsp;${fpn.guanzhuCount }  &nbsp;&nbsp;&nbsp; 粉丝&nbsp;${fpn.fansCount }</div>
	          </div>
	        </div>      
	        <br/>
	        <div style="float:left;margin-left:200px;margin-top:17px;">
	            <a href="${ctx }/sxPerson?otheremail=${fpn.email }"><input style="opacity: 0.9;background-color:white;border:1px solid gray;width:60px;height:30px;" type="button" value="私信"/></a>
	        </div>   
	    </div>
	    </c:forEach>
	<!-- div style="float:left;text-align:center;font-family:'microsoft yahei'; font-size:14px;margin-left:46%;margin-top:5%;margin-bottom:5%">
	    <a href="#">首页</a> 
	    <a href="#">上一页</a>
	    <a href="#">下一页 </a>
	    <a href="#">末页 </a>
	</div-->
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
		<script src="${ctx }/js/user/jquery.min.js"></script>
		<script src="${ctx }/js/user/upload.js"></script>
		<script src="${ctx }/js/user/demo.js"></script>
	</body>
</html>
