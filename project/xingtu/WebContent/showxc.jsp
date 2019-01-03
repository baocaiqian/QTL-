<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>QTL的空间</title>
<link href="${ctx }/css/user/showxc.css" rel="stylesheet"/>
<link href="${ctx }/css/home/header.css" rel="stylesheet"/>
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet"/>
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
    <div class="shxcall" style="margin-top:5%">
        <div class="shhead">
             <div class="shimg"><img src="${ctx }/${user.icon}"></div>
             <div class="shtit">${journey.jtitle }<br />
                 <div class="shxij">${user.username }&nbsp;&nbsp;&nbsp;|${journey.jtime }出发&nbsp;&nbsp;&nbsp;&nbsp;|共一天</div>
             </div>
             <div class="shbj">编辑</div>
        </div>
        <div class="shcon">
             <div class="shgs">
                 <div class="shz">行程概述</div>
                 <div class="shdt">查看地图</div>
             </div>
             <div class="shzy">
                  <div class="shimg1"><img src="${ctx }/img/shtb.jpg"></div>
                  <c:forEach items="${journey.jd}" var="myjour">
                  <span style="font-size: 30px;">${myjour.scene.sname}-></span>
                  </c:forEach>
                  <span style="font-size: 30px;">终</span>
             </div>
		</div>
		<div class="shxj">
			<div class="shxq">行程详情</div>
			<c:forEach items="${journey.jd}" var="myjour">
			<div class="xian1">
				<img src="${myjour.scene.img}"/>
					<div class="di1">${myjour.scene.sname}</div>
					<p class="pj1">地址：${myjour.scene.address}</p> <a href="#" class="ck">查看地图</a>
			</div>
			</c:forEach>
		</div>
	</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
