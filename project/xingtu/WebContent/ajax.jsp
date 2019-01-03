<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx }/css/user/youer.css">
</head>
<body>
<div id="fenye">
        <div class="dao" id="dao1" style="display:block">
               <div class="dian"><a href="#">景点</a></div>
               <div class="shi"><a href="#">美食</a></div>
               <div class="duo"><a href="#">更多</a></div>
               <div class="sou">
                   <form>
                        <input type="text" style="width:140px;height:23px">
                        <input type="submit" style="width:50px;height:25px" value="搜索" >
                   </form>
               </div>
               <c:forEach var="journeylist" items="${page.list }">
               <div class="jing1" id="jing${journeylist.sceneId}" onclick="addxq(this)">
                   <div class="jd1"><img id="im${journeylist.sceneId}" src="${journeylist.img}"></div>
                   <div class="jx1" id="jx${journeylist.sceneId}">${journeylist.sceneId}</div>
                   <div class="jie1" id="ji${journeylist.sceneId}">${journeylist.sname}</div>
                   <div class="biao1">标签：美景</div>
                   <div class="ping1">评论（300+）</div>
                   <div class="dizh1">${journeylist.address}</div>
                   <div class="jia1" id="jrbj${journeylist.sceneId}" >加入编辑</div>
               </div>
               </c:forEach>
               <div class="pagination-wrap">
                   <div class="pagination">
                    <a href="javascript:doPage(1,1)">首页</a>
                    <a href="javascript:doPage(${page.prePageNum },1);">上一页</a>
                    <a href="javascript:doPage(${page.nextPageNum },1);">下一页</a>
                    <a href="javascript:doPage(${page.totalPageNum },1);">末页</a>
                  </div>
                </div>
        </div>
        <div class="dao" id="dao2" style="display:none">
               <c:forEach var="shoucanglist" items="${mypage.list }">
               <div class="jing1" id="jing${shoucanglist.scene.sceneId}" onclick="addxq(this)">
                   <div class="jd1"><img id="im${shoucanglist.scene.sceneId}" src="${shoucanglist.scene.img}"></div>
                   <div class="jx1" id="jx${shoucanglist.scene.sceneId}">${shoucanglist.scene.sceneId}</div>
                   <div class="jie1" id="ji${shoucanglist.scene.sceneId}">${shoucanglist.scene.sname}</div>
                   <div class="biao1">标签：美景</div>
                   <div class="ping1">评论（300+）</div>
                   <div class="dizh1">${shoucanglist.scene.address}</div>
                   <div class="jia1" id="jrbj${shoucanglist.scene.sceneId}" >加入编辑</div>
               </div>
               </c:forEach>
               <div class="pagination-wrap">
                  <div class="pagination">
                    <a href="javascript:doPage(1,1)">首页</a>
                    <a href="javascript:doPage(1,${mypage.prePageNum });">上一页</a>
                    <a href="javascript:doPage(1,${mypage.nextPageNum });">下一页</a>
                    <a href="javascript:doPage(1,${mypage.totalPageNum });">末页</a>
                  </div>
                </div>
        </div>
</div>
</body>
</html>
