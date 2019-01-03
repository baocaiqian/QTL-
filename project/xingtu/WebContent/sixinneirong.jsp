<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="topdiv" id="xinxi">
	      <div style="margin-bottom: 20px;"><a href="sixin.jsp">我的私信</a> >我与${otherpeople.username }的私信</div> 
	      
	      <!-- 下方聊天框 -->
	      <div> 
	             <!-- 最上方大聊天框 -->
	             <div style="margin-bottom:200px;">
	             
	                 <form id="submitRequest" action="sxController2" method="post">
	                     <!-- 上方的交谈框 -->
	                     <div style="width:100%">
	                      <input name="otheremail" value="${otherpeople.email } " style="display:none"/><!-- 为了获取对方是谁 -->
	                         <div style="float:left;margin-left:15%">
	                            
	                             <textarea  rows="5" cols="15" name="content" class="textarea-box emotion"></textarea><br/>
	                             <!-- 提交按钮 -->
	                             
	                             <a style="border:1px solid #f90;  background-color:#f90;margin-top:1%;margin-left:79%;width:53px;height:27px;" href="javascript:send()">发送</a>
                                 <!-- 表情按钮 -->
                                 <div style="float:left;margin-top:1%" id="face">表情</div>
                             </div>
                             <div style="float:left">
                                 <img src="img/icon11.png"/>
                             </div>
                         </div>
                         <br/>
                     </form>                      
                 </div>
                 
                 <!-- 下方的小聊天框 -->
                 
                 
                     <!-- 如果是登录用户发的，则放在左侧 -->
                     
                     <div style="float:left;width:90%;height: 580px; overflow: hidden; margin-bottom: 20px;" id="xinxi">
                     <c:forEach items="${list }" var="list1">
                     <c:if test="${list1.fromUserEm==user.email }">
                       <div style="margin-left:9%;margin-top:20px;float:left;width:50%">
                         <div style="width:6%;float:left"><img src="img/icon11.png"/></div>
                         <div class="chatContent">${list1.content }</div>
                       </div>
                     </c:if>
                     <!-- 如果是对方发的，则放在右侧 -->
                     <c:if test="${list1.fromUserEm==otherpeople.email}">
                       <div style="margin-top:20px;float:right;width:50%;margin-right:300px;">
                         <div class="chatContent" style="text-align:right">${list1.content }</div>
                         <div style="width:6%;float:right"><img src="img/icon11.png"/></div>                     
                       </div>
                     </c:if>
                     
                     </c:forEach>
                     </div>
                     <div style="width: 80%"><span id="zhankai">展开</span></div>    
                 	 <div style="width: 80%"><span id="shousuo" style="display: none">收缩</span></div>  
	      </div>
	</div>
</body>
</html>