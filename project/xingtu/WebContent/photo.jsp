<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<link rel="stylesheet" href="${ctx }/css/user/demo.css"/>
<link rel="stylesheet" href="${ctx }/css/user/cropper.min.css"/>
<title>${user.username }</title>
<link href="${ctx }/css/user/myhead.css" rel="stylesheet"/>
<link href="${ctx }/css/home/header.css" rel="stylesheet"/>
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet"/>
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
<script src="${ctx }/js/photo/main.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css"  href="${ctx }/css/style.css"/>
<script type="text/javascript">
$(function () {
    H_miaoshu = {};
    H_miaoshu.openmiaoshu = function(){
        $('.photo').click(function(){
            $('.miaoshu').show();
            $('.miaoshu-bg').show();
            $("#photoid").attr("value",this.id);
        });
    };
    H_miaoshu.closemiaoshu = function(){
        $('.close-miaoshu').click(function(){
            $('.miaoshu').hide();
            $('.miaoshu-bg').hide();
        });
    };
    H_miaoshu.run = function () {
        this.closemiaoshu();
        this.openmiaoshu();
    };
    H_miaoshu.run();
});
function showphoto(id){
    $('#info'+id).show();
    $('.miaoshushow-bg').show();
}
$(document).on('click','.close-miaoshushow',function(){
	$('.miaoshushow').hide();
    $('.miaoshushow-bg').hide();
});
</script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="qn-header">
		<div class="main-zt">
			<div class="user-info">
				<dt class="flpic">
				<div style="width: 100px;height: 100px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${user.icon}" width="100px" height="100px" style="border-radius:50%;/">
                </div>
				</dt><!-- 个人头像 -->
				<dd class="flintro">
					<h3 class="intro-title">
						<span class="name" title="QTL">${user.username }</span>
					</h3>
					<div class="intro-body">
						<form action="">
						    <input type="text" placeholder="编辑个人签名" style="width:400px;"/>
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
	<div class="theleft" style="width: 20%;float: left;border-right: 1px solid #ededed; height: 600px;">
		<form action="${ctx }/photo/findallphoto">
		<img src="${ctx }/img/zi2.png" style="display: block"/>
		<!--  h2 class="type">按照人物搜索:</h2-->
			<input type="submit" class="sousuo" value="查询" style="clear:both;"/><input type="text" placeholder="输入人物姓名" class="shurukuang" name="searchpeople"/>
		<!--h2 class="type" >按照时间搜索:</h2-->
			<input type="submit" class="sousuo" value="查询" style="clear:both;"/><input type="text" placeholder="输入拍照时间" class="shurukuang" name="searchdate"/>
		<!--h2  class="type">按照地点搜索:</h2-->
			<input type="submit" class="sousuo" value="查询" style="clear:both;"/><input type="text" placeholder="输入地点名称" class="shurukuang" name="searchaddress"/>
		</form>
	</div>
	<div style="margin-bottom: 25px;width: 75%;margin: auto;margin-left: 20.5%; height: 600px;">
		<a href="${ctx }/upphoto.jsp"><img src="${ctx }/img/up.png" width="15%" height="150px" style="margin: 10px;"/></a>
		<c:forEach items="${photos.list}" var="photo">
		<c:if test="${photo.address==null&&photo.people==null&&photo.phototime==null }">
		<a href="javascript:void(0);">
			<img src="${ctx }/${photo.src}"class="photo" alt="" width="15%" height="150px" style="margin: 10px;" id="${photo.id }"/>
		</a>
		</c:if>
		<c:if test="${photo.address!=null||photo.people!=null||photo.phototime!=null }">
		<a>
			<img src="${ctx }/${photo.src}" alt="" width="15%" height="150px" style="margin: 10px;" id="${photo.id }" onclick="showphoto(this.id)"/>
		</a>
		</c:if>
		<div class="miaoshushow" id="info${photo.id }">
    		<div class="miaoshuimg">
    		<img src="${ctx }/${photo.src}" />
    		</div>
    		<div class="miaoshuinfo">
    		<div class="miaoshushow-title">照片描述信息<span><a href="javascript:void(0);" class="close-miaoshushow" onclick="close()">关闭</a></span></div>
    		<div class="miaoshushow-input-content">
        	<div class="miaoshushow-input">
        		<label>地&nbsp;点&nbsp;：<span id="address">${photo.address }</span></label>
        	</div>
        	<div class="miaoshushow-input">
            <label>出行人物：<span id="people">${photo.people }</span></label>
        	</div>
        <div class="miaoshushow-input">
            <label>拍摄时间：<span id="time">${photo.phototime }</span></label>
        </div>
        </div>
    </div>
</div>
<div class="miaoshushow-bg"></div>
</c:forEach>
	</div>
	<div class="miaoshu">
	<form action="${ctx }/photo/photoinfo" method="post">
    <div class="miaoshu-title">照片描述信息<span><a href="javascript:void(0);" class="close-miaoshu">关闭</a></span></div>
    <div class="miaoshu-input-content">
        <div class="miaoshu-input">
        	<input type="text" name="photoid" style="display: none" id="photoid" value=""/>
            <label>地&nbsp;点&nbsp;：</label>
            <input type="text" placeholder="为照片添加地点"  name="address" class="list-input"/>
        </div>
        <div class="miaoshu-input">
            <label>出行人物：</label>
            <input type="text" placeholder="记录一下同行的人" name="people" class="list-input"/>
        </div>
        <div class="miaoshu-input">
            <label>拍摄时间：</label>
            <input type="text" placeholder="2018-12-30"  name="phototime" class="list-input"/>
        </div>
    </div>
    <input type="submit" value="提交" style="width: 100%;height: 50px; text-align: center;background-color: #c0f560"/>
</form>
</div>
<div class="miaoshu-bg"></div>

<div style="width: 40%;margin: auto; text-align: center;">
         <div class="pagination">
            <a href="${ctx }/photo/findallphoto?pageNum=1">首页</a>
            <a href="${ctx }/photo/findallphoto?pageNum=${photos.prePageNum }">上一页</a>
            <a href="${ctx }/photo/findallphoto?pageNum=${photos.nextPageNum }">下一页</a>
            <a href="${ctx }/photo/findallphoto?pageNum=${photos.totalPageNum }">末页</a>
        </div>
</div>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>


	

           
	
	
	
	</body>
</html>
