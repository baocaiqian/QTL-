<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<link rel="stylesheet" href="${ctx }/css/user/demo.css"/>
<link rel="stylesheet" href="${ctx }/css/user/cropper.min.css"/>
<title>QTL的空间</title>
<link href="${ctx }/css/user/myhead.css" rel="stylesheet"/>
<link href="${ctx }/css/user/pho.css" rel="stylesheet"/>
<link href="${ctx }/css/home/header.css" rel="stylesheet"/>
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx }/css/user/home.css"/>
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
<script type="text/javascript" src="${ctx }/js/user/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/user/up.js"></script>

<style>
    .topdiv{
        font-size:12px;
        font-family:'微软雅黑';
        margin-left:150px;
        margin-top:25px;
    }
    
    .secondiv{
        width:730px;
        height:120px;
        border:1px solid #C0C0C0;
        margin-bottom:20px;
    }
</style>



</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="qn-header">
		<div class="main-zt">
			<div class="user-info">
				<dt class="flpic">
					<div style="width: 100px;height: 100px;border-radius:50%;border: solid 1px #555;" id="replaceImg">
                     <img id="finalImg" src="${ctx }/${user.icon}" width="100px" height="100px" style="border-radius:50%;"/>
                	</div>
				</dt><!-- 个人头像 -->
				<dd class="flintro">
					<h3 class="intro-title">
						<span class="name" title="QTL">${user.username }</span>
					</h3>
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
					<div><a href="${ctx }/fansUser">粉丝</a></div>
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
	
	
	
	<!-- 关于私信的内容 -->
	<div class="topdiv">
	      <div style="margin-bottom: 20px;">我的私信(${allConversionNum })</div>
	          
	      <c:forEach items="${finallXinxi }" var="fx">
	      <a href="${ctx }/sxPerson?otheremail=${fx.fromUserEm }">
	          <div class="secondiv">
	              <!-- 左边的div -->
	              <div style="float:left">
	                  <div style="float:left;width:480px;">
	                      <div style="float:left;margin-left:30px;margin-top:28px;">
	                           <div style="width: 50px;height: 50px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${fx.icon}" width="50px" height="50px" style="border-radius:50%;"> <!-- 对方的头像 -->
                </div>
	                      </div>
	                  <div style="float:left;margin-left:20px;">
	                      <div style="margin-top:25px;">${fx.username }</div>
	                      <div style="color:gray;margin-top:15px;">${fx.content }</div>
	                  </div>
	                  </div>
	             </div>
	             <!-- 右边的div -->
	             <div style="float:left;margin-left:80px;margin-top:25px;">
	                   <div style="color:black;">${fx.sxtime }</div>
	                   <div style="margin-left:100px;margin-top:40px">回复</div>
	             </div>

	          </div>
	      </a>
	      </c:forEach>
	
	</div>
	

	<div style="float:left;text-align:center;font-family:'microsoft yahei'; font-size:14px;margin-left:46%;margin-top:5%;margin-bottom:5%">
	    <a href="#">首页</a> 
	    <a href="#">上一页</a>
	    <a href="#">下一页 </a>
	    <a href="#">末页 </a>
	</div>
	

	<jsp:include page="footer.jsp" flush="true"></jsp:include>
	
		<script src="${ctx }/js/user/jquery.min.js"></script>
		<script src="${ctx }/js/user/upload.js"></script>
		<script src="${ctx }/js/user/demo.js"></script>
	</body>
</html>
