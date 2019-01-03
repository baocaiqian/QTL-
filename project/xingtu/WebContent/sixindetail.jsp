<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 设置这个页面每20秒更新一次 -->
<meta http-equiv="refresh" content="15"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="css/user/demo.css">
<link rel="stylesheet" href="css/user/cropper.min.css">
<title>QTL的空间</title>
<link href="css/user/myhead.css" rel="stylesheet">
<link href="css/user/pho.css" rel="stylesheet">
<link href="css/home/header.css" rel="stylesheet">
<link href="css/home/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/user/home.css">
<script src="js/home/jquery-1.11.3.min.js"></script>
<script src="js/home/bootstrap.min.js"></script>
<script src="js/home/swiper.min.js"></script>
<script src="js/home/main.js"></script>
<script type="text/javascript" src="js/user/jquery.min.js"></script>
<script type="text/javascript" src="js/user/up.js"></script>
<!-- 关于表情 -->
<link rel="stylesheet" type="text/css" href="js/emoji/jquery.sinaEmotion.css" />
<style>
    .topdiv{
        font-size:12px;
        font-family:'微软雅黑';
        margin-left:12%;
        margin-top:2%;
    }
  
    
    .textarea-box{
        position:relative;
        width:553px;
        height:125px;
        margin-right:21px;
        border:1px solid #e0e0e0;
        border-radius:3px;
        background:#fdfdfd;
    }
    
    .chatContent{
        float:left;
        margin-top:20px;
        margin-left:20px;
        height:auto;
        background-color:#FDFDFD;
        width:90%;
        padding-top:1%;
        padding-left:2%;
        font-family:'微软雅黑';
        font-size:16px;
    }
</style>
</head>
<body>

<div  id="fortext1">

<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="qn-header">
		<div class="main-zt">
			<div class="user-info">
				<dt class="flpic">
				<div style="width: 100px;height: 100px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${user.icon}" width="100px" height="100px" style="border-radius:50%;">
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
	      <div style="margin-bottom: 20px;"><a href="sixin.jsp">我的私信</a> >我与${otherpeople.username }的私信</div> 
	      
	      <!-- 下方聊天框 -->
	      <div> 
	             <!-- 最上方大聊天框 -->
	             <div style="margin-bottom:200px;">
	             
	                 <form id="submitRequest" action="sxController" method="post">
	                     <!-- 上方的交谈框 -->
	                     <div style="width:100%">
	                      <input name="otheremail" value="${otherpeople.email } " style="display:none"/><!-- 为了获取对方是谁 -->
	                         <div style="float:left;margin-left:15%">
	                            
	                             <textarea  rows="5" cols="15" name="content" class="textarea-box emotion"></textarea><br/>
	                             <!-- 提交按钮 -->
	                             
	                             <input style="border:1px solid #f90;  background-color:#f90;margin-top:1%;margin-left:79%;width:53px;height:27px;"  type="submit" value="发送" onclick="out()"/>
                                 <!-- 表情按钮 -->
                                 <div style="float:left;margin-top:1%" id="face">表情</div>
                             </div>
                             
                             
                             
                             
                             <div style="width:6%;float:left"><div style="width: 50px;height: 50px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${user.icon}" width="50px" height="50px" style="border-radius:50%;">
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
                         <div style="width:6%;float:left"><div style="width: 50px;height: 50px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${user.icon}" width="50px" height="50px" style="border-radius:50%;">
                		</div>
                </div>
                         <div class="chatContent">${list1.content }</div>
                       </div>
                     </c:if>
                     
                     
                     <!-- 如果是对方发的，则放在右侧 -->
                     <c:if test="${list1.fromUserEm==otherpeople.email}">
                       <div style="margin-top:20px;float:right;width:50%;margin-right:300px;">
                         <div class="chatContent" style="text-align:right">${list1.content }</div>
                         <div style="width:6%;float:right"><div style="width: 50px;height: 50px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${otherpeople.icon}" width="50px" height="50px" style="border-radius:50%;">
                		</div></div>                     
                       </div>
                     </c:if>
                     
                     </c:forEach>
                     
                     </div>
                    
	      </div>
	   
	</div>
	
	</div>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
		<script src="js/user/jquery.min.js"></script>
		<script src="js/user/upload.js"></script>
		<script src="js/user/demo.js"></script>
		
		<!-- 关于表情 -->
		<script type="text/javascript" src="js/emoji/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="js/emoji/jquery.sinaEmotion.js"></script>
        <script type="text/javascript">
          // 绑定表情
           $('#face').SinaEmotion($('.emotion'));

           // 测试本地解析
           function out(){
	          var inputText = $('.emotion').val();
	          $('#out').html(AnalyticEmotion(inputText));
        }
        </script>
        
         <!-- 控制展开和收缩 -->
		 <script type="text/javascript">
		 $("#zhankai").click(function(){
			 $("#xinxi").css({"height":"auto"});
			 $("#zhankai").css({"display":"none"})
			 $("#shousuo").css({"display":""})
		 })
		 $("#shousuo").click(function(){
			 $("#xinxi").css({"height":"580px"});
			 $("#zhankai").css({"display":""})
			 $("#shousuo").css({"display":"none"})
		 })
		 
        </script>
        
       
        <!-- 引入jquery-form.js（这个是必须的，否则绑定form提交事件不会生效，还有一些jquery必需文件不再多说）-->
<script src="js/user/jquery.form.js"></script>

<!-- 实现局部刷新js -->
<script type="text/javascript">
    $(document).ready(function(){
        var options = {   
            //需要刷新的区域id 
            target:'#fortext1',
        };
        //绑定FORM提交事件  
        $('#submitRequest').submit(function() {  
            $(this).ajaxSubmit(options);   
            return false;   
        }); 
    });     
</script>

           
        
			
		
		
	</body>
</html>
