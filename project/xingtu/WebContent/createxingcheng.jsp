<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${ctx }/css/user/createxc.css" rel="stylesheet">
<link href="${ctx }/css/home/header.css" rel="stylesheet">
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="${ctx }/journey/journeylist?is=${true}"  method="post" >
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="all">
		<div class="left" style="margin-top: 1.5%;border-right: 1px solid #ccc;">
			<div class="tit">已选目的地</div>
			<div id="titna">
			    <div id="did0" >
			         <div id="xu">从右侧添加想去的地方</div>
			    </div>
			</div>
			<input type="submit" value="开始编辑" class="bj" style="width: 50%; height: 25px" ></inupt>
				
		</div>
		<div class="myright">
			<div class="shang">
				<div class="ti1">热门推荐</div>
				<!--div class="ssk">
					<form action="${ctx }/journey/findcitybyname" method="post">
						<input type="text" style="width: 75%; height: 25px" placeholder="搜索想去的城市" name="ctname"> 
						 input type="submit" style="width: 20%; height: 25px" value="搜索"/>
 					</form>
				</div -->
			</div>
			<div id="jd9">
			<c:forEach var="citylist" items="${citylist }">
				<div class="dian1" id="dd${citylist.ctid }" onclick="addcity(this)">
					<img src="${citylist.ctimg }">
					<div class="ming1" id="cna${citylist.ctid }">${citylist.ctname }</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</form>
</body>
</html>
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/user/jquery.min.js"></script>
<script src="${ctx }/js/user/ajaxfileupload.js"></script>
<script src="${ctx }/js/user/createxc.js"></script>