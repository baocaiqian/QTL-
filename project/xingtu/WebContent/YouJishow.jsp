<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/css/home/swiper.min.css" rel="stylesheet">
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/css/home/header.css" rel="stylesheet">
<link href="${ctx }/css/user/showYJ.css" rel="stylesheet">
<title>${strategy.title }</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="header">
<img alt="" src="${ctx }/${strategy.img}" style="width: 100%;height: 450px;">
<div class="title">
	<a href="${ctx }/user/otherUserCenter?useremail=${strategy.user.email}">
	      <div style="width: 100px;height: 100px;border-radius:50%;border: solid 1px #555; float: left" id="replaceImg"  >
              <img id="finalImg" src="${ctx }/${strategy.user.icon}" width="100px" height="100px" style="border-radius:50%;">
          </div>
    </a>
	<span id="stt" style="margin-top:3%;margin-top:10px">${strategy.title }</span>
	
	
</div>
<c:if test="${isSigned==false or isSigned==null }">
	<a href="${ctx }/sign.jsp" id="glsc"><img alt="" src="${ctx }/img/guzh.png">&nbsp&nbsp<span>收藏</span></a>
</c:if>
<c:if test="${isSigned==true}">
	<!-- 如果还未收藏 -->
	<c:if test="${ifShoucanggl==false }">
		 <a href="${ctx }/strategy/addshoucang?StrategyId=${strategy.sId}" id="glsc"><img alt="" src="${ctx }/img/guzh.png">&nbsp&nbsp<span>收藏</span></a>
	 </c:if>
	 <!-- 如果已收藏 -->
	 <c:if test="${ifShoucanggl==true }">
		 <a href="${ctx }/strategy/noshoucang?StrategyId=${strategy.sId}" id="glsc"><img alt="" src="${ctx }/img/guzhed.png">&nbsp&nbsp<span>收藏</span></a>
	 </c:if>
 </c:if>
</div>
<div class="showleft">
<div class="概览">
<c:forEach items="${strategy.sd }" var="gailan">
	<div class="ltitle">
		<img alt="" src="${ctx }/img/icon/title.png"><span style="margin-left: 10px;">${gailan.title }</span><br/>
	</div>
	<div class="zuji">
		<img alt="" src="${ctx }/img/icon/zu.png"><span style="margin-left: 10px;">${gailan.address }</span>
	</div>
</c:forEach>
</div>
<div>
	<img src="${ctx }/img/icon/tag.png"><span>${strategy.tag }</span>
</div>
</div>
<div class="showright">
<c:forEach items="${strategy.sd }" var="xiangqing">
<div class="xtitle"><h3><img src="${ctx }/img/icon/t.png">${xiangqing.title }</h3></div>
<div class="didian"><h4><img src="${ctx }/img/icon/dizhi.png">${xiangqing.address }</h4></div>
<div class="context">
${xiangqing.context }
</div>
</c:forEach>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>