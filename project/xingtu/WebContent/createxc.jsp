<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${ctx }/js/user/upload1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx }/css/home/swiper.min.css" rel="stylesheet">
    <link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/css/home/header.css" rel="stylesheet">
    <link href="${ctx }/css/user/xingcheng.css" rel="stylesheet">
    <script src="${ctx }/js/user/xingcheng.js"></script>
<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
<script src="${ctx }/js/user/jquery.min.js"></script>
<script src="${ctx }/js/user/bootstrap.min.js"></script>

<style>
	.m{ width: 100%; margin-left: auto; margin-right: auto; }
</style>

	<link rel="stylesheet" href="${ctx }/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${ctx }/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="${ctx }/kindeditor/kindeditor-all.js"></script>
	<script charset="utf-8" src="${ctx }/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="${ctx }/kindeditor/plugins/code/prettify.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="move"></div>
<form action="${ctx }/strategy/create" method="post" enctype="multipart/form-data">
<div class="header">
<img src="${ctx }/img/banner2.jpg" style="width: 100%;height: 450px;" id="timg"/>
<input type="file" style="opacity: 0; position:absolute;top:20px; width:100%;height: 350px;" id="cimg" name="headerimg" multiple/>
<span class="spanchange">点击更换头图片</span>
<div class="title">
	<div style="width: 100px;height: 100px;border-radius:50%;border: solid 1px #555; float: left" id="replaceImg"  >
          <img id="finalImg" src="${ctx }/${user.icon}" width="100px" height="100px" style="border-radius:50%;">
     </div>
	<input type="text" name="title" placeholder="为你的游记起一个名字吧!" class="title_text" style="margin-left:3%;margin-top:30px"/>
</div>
</div>
<div class="create">
	<div class="create_left">
		<div id="add_f_title"  onmouseover="jia()" onmouseout="qjia()" onclick="jia()" >
			<img src="${ctx }/img/icon/jia.png" id="jia1">
			<span style="margin-left: 7px;">添加目录</span>
		</div>
		<div id="dt"  onmouseover="deleteed4()" onmouseout="qdeeted4()">
			<img src="${ctx }/img/icon/delete.png" id="d4">
			<span>删除目录</span>
		</div>
		<div class="RadioStyle">
		<h3>添加标签</h3>
    		<div class="Block PaddingL">
        		<input type="checkbox" id="love1" name="tag" value="家庭出游"/>
        		<label for="love1">家庭出游</label>
        		<input type="checkbox" id="love2" name="tag" value="绘画"/>
        		<label for="love2">绘画</label>
        		<input type="checkbox" id="love3" name="tag" value="摄影"/>
        		<label for="love3">摄影</label>
        		<input type="checkbox" id="love4" name="tag" value="骑行"/>
        		<label for="love4">骑行</label>
        		<input type="checkbox" id="love5" name="tag" value="情侣出行"/>
        		<label for="love5">情侣出行</label>
        		<input type="checkbox" id="love6" name="tag" value="独自一人"/>
        		<label for="love6">独自一人</label>
        		<input type="checkbox" id="love7" name="tag" value="毕业游"/>
        		<label for="love7">毕业游</label>
        		<input type="checkbox" id="love8" name="tag" value="穷游"/>
        		<label for="love8">穷游</label>
        		<input type="checkbox" id="love9" name="tag" value="徒步"/>
        		<label for="love9">徒步</label>
    		</div>
    		<div style="clear: both; width: 80px;margin: auto"><a id="changeTag">换一批</a></div>
		</div>
		<!--  
		<div id="add_address"  onmouseover="jia4()" onmouseout="qjia4()" onclick="jia4()">
			<img src="${ctx }/img/icon/jia.png" id="jia4">
			<span style="margin-left: 7px;">添加地点</span>
		</div>
		<div id="add_text"  onmouseover="jia2()" onmouseout="qjia2()" onclick="jia2()">
			<img src="${ctx }/img/icon/jia.png" id="jia2">
			<span style="margin-left: 7px;">添加内容</span>
		</div>
		-->
		<!-- 
		<div id="add_img"  onmouseover="jia3()" onmouseout="qjia3()">
			<img src="${ctx }/img/icon/jia.png" id="jia3">
			<input type="file" style="opacity: 0; display: inline; width:5px;" id="uploadimg">
			<span>添加图片</span>
		</div>
		<div id="di"  onmouseover="deleteed()" onmouseout="qdeeted()">
			<img src="${ctx }/img/icon/delete.png" id="d1">
			<input type="file" style="opacity: 0; display: inline; width:5px;" id="uploadimg">
			<span>删除图片</span>
		</div>
		
		 
		<div id="dtext"  onmouseover="deleteed3()" onmouseout="qdeeted3()">
			<img src="${ctx }/img/icon/delete.png" id="d3">
			<input type="file" style="opacity: 0; display: inline; width:5px;" id="uploadimg">
			<span>删除内容</span>
		</div>
		<div id="da"  onmouseover="deleteed2()" onmouseout="qdeeted2()">
			<img src="${ctx }/img/icon/delete.png" id="d2">
			<input type="file" style="opacity: 0; display: inline; width:5px;" id="uploadimg">
			<span>删除地点</span>
		</div>
		-->
		<div class="mulu">
			<h3>游记概览</h3>
			<div id="gailan">
			<div id="g0">
			<span class="lt">T：</span><span id="ltitle0" class="lt">前言</span><br>
			<span class="dz">地点：</span><span id="dizhi0" class="dz">add0</span><br>
			</div>
			</div>
		</div>
	</div>
	<div id="create_right">
		<div id="xingcheng">
		<div id="part0">
		<div class="ltitle">
		<input type="text" class="f_title" placeholder="前言" onchange="changetitle()" id="title0" name="ltitle">
		</div>
			<div class="didian">
				<img src="${ctx }/img/icon/dizhi.png">
				<input class="address" type="text" placeholder='添加地点' id="didian0" onchange="changeaddress()" name="address">
			</div>
			<div class="neirong">
			<textarea id="content0" cols="100" rows="8" style="width:85%;height:200px;visibility:hidden;" name="text"></textarea>
			<!--
			<textarea maxlength="2000" onkeydown="this.value=this.value.substring(0,2000)" onkeyup="this.value=this.value.substring(0,2000)" name="context">记录下这段旅途中那些美好的点点滴滴吧~</textarea>
              -->
            </div>
            <!-- 
            <input type="file"  name="file" id="doc0" multiple="multiple" onchange="javascript:setImagePreviews();" accept="image/*" />
     		<div id="dd0"></div>
     		 -->
     		</div>
		</div>
		<div><input type="submit" value="创建行程"></div>

</div>
</div>
</form>	
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
<script src="${ctx }/js/user/ajaxfileupload.js"></script>
<script src="${ctx }/js/user/xingcheng.js"></script>
<script src="${ctx }/js/user/upload1.js"></script>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>