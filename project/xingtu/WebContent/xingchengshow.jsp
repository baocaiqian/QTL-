<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${ctx }/css/user/showxc.css" rel="stylesheet"/>
<link href="${ctx }/css/user/xcshow.css" rel="stylesheet"/>
<link href="${ctx }/css/home/header.css" rel="stylesheet"/>
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet"/>
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="shhead">
    <div style="width: 80px;height: 80px;border-radius:50%;border: solid 1px #555; float: left;margin-top:5%;margin-left:20%" id="replaceImg">
        <img id="finalImg" src="${ctx }/${user.icon}" width="80px" height="80px" style="border-radius:50%;">
    </div>
    <div class="shtit">${journey.jtitle }<br />
       <div class="shxij">${user.username }&nbsp;&nbsp;&nbsp;|${journey.jtime }出发&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
    </div>
    
</div>
<div class="shcon">
   <div class="shgs">
       <div class="shz">行程概述</div>
   </div>
   <div class="shzy">
       <div class="shimg1"><img src="${ctx }/img/shtb.jpg"></div>
			<c:forEach items="${journey.jd}" var="myjour">
                  <span style="font-size: 30px;">${myjour.scene.sname}-></span>
            </c:forEach>
                  <span style="font-size: 30px;">终</span>
   </div>
</div>
<div class="xingchengtable">
	<table>
		<thead>
			<tr style="width: 100%;text-align: center;height: 50px;font-size:25px; font-weight: 600;">
				<td colspan="3" style="width: 100%;text-align: center;height: 50px;font-size:25px; font-weight: 600;">${journey.jtitle }</td>
			</tr>
		</thead>
		<%!int count = 0; %>
		<c:forEach items="${journey.jd}" var="myjour">
		<%
		request.setAttribute("count", count);
		%>
		<tr height="200px">
			<td width="40%">
				<div class="scene">
					<img src="${myjour.scene.img}" style="margin-left:15px; margin-top: 15px;" width="90%" height="auto;"/>
					<div style="margin-left:15px; text-align: left; width: 90%; margin-top: auto;margin-bottom: auto;">
						<span>地点：${myjour.scene.sname}</span><br>
						<span>地址：</span><span style="text-align: left;">${myjour.scene.address}</span>
					</div>
				</div>
			</td>
			<td style="padding-left: 60px;">游玩儿时长:<input type="text" style="border: none; display: inline;" value="建议${myjour.scene.playtime }"/></td>
			<td style="text-align: left;line-height: 30px;">
				<span>${myjour.scene.route}</span>
			</td>
		</tr>
		<c:if test="${count>=0 }">
			<c:if test="${juli[count]!=null }">
			<tr>
			<td colspan="3" style="text-align: center;">${juli[count] }</td>
			</tr>
			</c:if>
		</c:if>
		<%count++; %>
		</c:forEach>
		<%count=0; %>
	</table>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>