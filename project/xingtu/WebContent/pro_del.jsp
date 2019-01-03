<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>产品详情</title>

<!-- 轮播图的style和script -->
<link href="css/meishi/lunbo.css" rel="stylesheet" type="text/css">

<link href="css/meishi/about.css" rel="stylesheet" type="text/css">
<!-- 引入头部和尾部的文件 -->
<link href="css/home/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/home/header.css" rel="stylesheet" type="text/css">
<link href="css/home/swiper.min.css" rel="stylesheet" type="text/css">

<script src="js/home/jquery-1.11.3.min.js"></script>
<script src="js/home/bootstrap.min.js"></script>
<script src="js/home/swiper.min.js"></script>
<script src="js/home/main.js"></script>

<!-- 轮播图的js -->
<script src="js/lunbo.js"></script>
<!-- 引入关于评论的css和js -->
<link  rel="stylesheet" href="css/meishi/main.css" />
<link rel="stylesheet" type="text/css" href="css/meishi/sinaFaceAndEffec.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>


</head>
<body>

<jsp:include page="header.jsp" flush="true"></jsp:include>

<div class="news_del" style="margin-top: 3%">
	<div class="main">
    	<h3>光明渔港（中铁店）</h3>
        <h6>海鲜类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;营业时间：周一至周日11:00-21:00</h6>
        
        <div style="margin-left:15%" id="container">
            <div class="wrap" style="left: -500px;" id="list">
               
                <img src="img/ms4.jpg" alt="1"/>
                <img src="img/ms1.jpg" alt="2"/>
                <img src="img/ms3.jpg" alt="3"/>
                <img src="img/ms2.jpg" alt="4"/>
                <img src="img/ms3.jpg" alt="5"/>
                
			</div>
			<div id="buttons">
                 <span index="1" class="on"></span>
                 <span index="2"></span>
                 <span index="3"></span>
                 <span index="4"></span>
                 <span index="5"></span>
    </div>
    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
    <a href="javascript:;" id="next" class="arrow">&gt;</a>
			
          
			
        </div>
        <div class="act" style="margin-top:5%">
        	<p>【地址】  <span style="color:#d7000f;">石家庄市裕华东路56号</span></p>
        	
			<p>【电话】  0311-67660399/67660699</p>
			<p>【人均】 90元</p>
			
            <p>【评分】 4.4分</p>
        </div>
        <p>光明渔港主打海鲜，适合情侣约会、家庭聚会、商务宴请、朋友聚餐。物美价廉，环境优美。剁椒鱼头，葱烧虎皮参和砂锅杏鲍菇值得推荐。可以刷卡，有包厢，有停车位，提供在线菜单，有最低消费。</p><br/>
        
        
        <!-- 评论框 -->
        <div id="content" style="width: 700px; height: auto;margin-left:70px;margin-top:40px">
	<div class="wrap">
		<div class="comment">
			<div class="head-face">
				<img src="img/icon11.jpg" />
				<p>我是鸟</p>
			</div>
			<div class="content">
				<div class="cont-box">
					<textarea class="text" placeholder="请输入..."></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon" style="padding-top:9px;">▧</span></div>
					<div class="submit-btn"><input type="button" onClick="out()"value="提交评论" /></div>
				</div>
			</div>
		</div>
		<div id="info-show">
			<ul></ul>
		</div>
	</div>
</div>
 </div>
<!-- 评论框结束 --> 
   
     <div class="rec" style="margin-top: 3%">
    	<h3 class="biaoti" style="padding-bottom:20px;">美食推荐</h3>
        <!--  div id="scrollDiv" style="height:510px;overflow:hidden;">
        	<div class="bd"-->
        		<ul class="dd">
        			<li class="recommend" style="padding-bottom:12px">
       					<a href="pro_del.html"><div class="xx"><img src="img/f_9.png" style="width:120px;height:100px"></div></a>
            			<div class="conl">
               				<a href="news_details.html">凉拌三丝</a>
                			<span>2016-8-24</span>
                			<div class="small" style="padding-right:12px">凉菜，香脆，红绿白三色，鲜咸酸三味，低热量</div>
            			</div>
            			<div class="clearfix"></div>
        			</li>
        			<li class="recommend" style="padding-bottom:12px;">
       					<a href="news_details.html"><div class="xx"><img src="img/f_10.png" style="width:120px;height:100px"></div></a>
            			<div class="conl">
                			<a href="news_details.html">炭烤排骨</a>
                			<span>2016-8-24</span>
                			<div class="small" style="padding-right:12px">猪排，酸甜，口味清新，滑嫩可口，甘香绵长</div>
            			</div>
            			<div class="clearfix"></div>
        			</li>
        			<li class="recommend" style="padding-bottom:12px">
       					<a href="news_details.html"><div class="xx"><img src="img/f_11.png" style="width:120px;height:100px"></div></a>
            			<div class="conl">
                			<a href="news_details.html" style="padding-right:12px">混拌猪头</a>
                			<span>2016-8-24</span>
                			<div class="small" >猪头肉，尖椒，酸辣，滑嫩可口，家常</div>
            			</div>
            			<div class="clearfix"></div>
        			</li>
        			<li class="recommend" style="padding-bottom:12px;">
       					<a href="news_details.html"><div class="xx"><img src="img/f_12.png" style="width:120px;height:100px"></div></a>
            			<div class="conl">
                			<a href="news_details.html">酸汤鱼锅</a>
                			<span>2016-8-24</span>
                			<div class="small" style="padding-right:12px">鱼片，酸辣，平火益肝，口感独具，香味扑鼻</div>
            			</div>
            			<div class="clearfix"></div>
        			</li>
        			<li class="recommend" style="padding-bottom:12px;">
       					<a href="news_details.html"><div class="xx"><img src="img/f_13.png" style="width:120px;height:100px"></div></a>
            			<div class="conl">
                			<a href="news_details.html">爆炒肥肠</a>
                			<span>2016-8-24</span>
                			<div class="small" style="padding-right:12px">大肠，青椒，酸菜，鲁菜系，口感香辣</div>
            			</div>
            			<div class="clearfix"></div>
        			</li>
        			
        		</ul>
         	<!-- /div>
        </div-->
    </div>
    <div class="clearfix"></div>
</div>

<jsp:include page="footer.jsp" flush="true"></jsp:include>


<script type="text/javascript" src="js/meishi/main1.js"></script>
<script type="text/javascript" src="js/meishi/sinaFaceAndEffec.js"></script>
<script type="text/javascript">
	// 绑定表情
	$('.face-icon').SinaEmotion($('.text'));
	// 测试本地解析
	function out() {
		var inputText = $('.text').val();
		$('#info-show ul').append(reply(AnalyticEmotion(inputText)));
	}
	
	var html;
	function reply(content){
		html  = '<li>';
		html += '<div class="head-face">';
		html += '<img src="img/icon11.jpg" / >';
		html += '</div>';
		html += '<div class="reply-cont">';
		html += '<p class="username">小小红色飞机</p>';
		html += '<p class="comment-body">'+content+'</p>';
		html += '<p class="comment-footer">2016年10月5日　回复　点赞54　转发12</p>';
		html += '</div>';
		html += '</li>';
		return html;
	}
</script>




</body>

</html>
