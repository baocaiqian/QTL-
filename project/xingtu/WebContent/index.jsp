<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>行途</title>
    <!-- Bootstrap -->
    <link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/css/home/swiper.min.css" rel="stylesheet">
    <link href="${ctx }/css/home/main.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>
<!--*********************** banner start ***************************-->
<section>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${ctx }/img/b1.jpg" alt="banner">
                <div class="carousel-caption" style="text-align: center;">
                    <h2 style="font-size: 45px;margin-top: 0">看攻略好累？来一场定制旅行！</h2>
                    <p class="banner_text">这里有各地的景色的介绍，有各个旅游者发布的攻略和行程日志</p>
                    <p class="banner_text">拒绝漫无目的的无聊行程！</p>
                    <p class="banner_text">你可以参考他们的行程和攻略，自行定制属于自己的出行计划，让您的每一次出行，都能够妥当安排</p>
                    <c:if test="${isSigned==false or isSigned==null }">
                    <a href="${ctx }/sign.jsp"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                    <c:if test="${isSigned==true}">
                    <a href="${ctx }/journey/citylist"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="${ctx }/img/b2.jpg" alt="banner">
                <div class="carousel-caption" style="text-align: center;">
                    <h2 style="font-size: 45px;margin-top: 0">看攻略好累？来一场定制旅行！</h2>
                    <p class="banner_text">这里有各地的景色的介绍，有各个旅游者发布的攻略和行程日志</p>
                    <p class="banner_text">拒绝漫无目的的无聊行程！</p>
                    <p class="banner_text">你可以参考他们的行程和攻略，自行定制属于自己的出行计划，让您的每一次出行，都能够妥当安排</p>
                     <c:if test="${isSigned==false or isSigned==null }">
                    <a href="${ctx }/sign.jsp"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                    <c:if test="${isSigned==true}">
                    <a href="${ctx }/journey/citylist"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="${ctx }/img/b3.jpg" alt="banner">
                <div class="carousel-caption" style="text-align: center;">
                    <h2 style="font-size: 45px;margin-top: 0;font-family: fantasy;">看攻略好累？来一场定制旅行！</h2>
                    <p class="banner_text">这里有各地的景色的介绍，有各个旅游者发布的攻略和行程日志</p>
                    <p class="banner_text">拒绝漫无目的的无聊行程！</p>
                    <p class="banner_text">你可以参考他们的行程和攻略，自行定制属于自己的出行计划，让您的每一次出行，都能够妥当安排</p>
                    <c:if test="${isSigned==false or isSigned==null }">
                    <a href="${ctx }/sign.jsp"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                    <c:if test="${isSigned==true}">
                    <a href="${ctx }/journey/citylist"><button class="bubbly-button">定制行程</button></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!--************************* banner end **********************************************-->
<!--************************* 主体第一部分 **********************************************-->
<div class="blue_title text-center">
        <span>行途中，随心行</span>
    </div>
	<div class="row">
		<div
			style="width: 100%; position: static; background-image: url('${ctx}/img/bg.jpg'); margin-bottom: 1%;">
			<span style="font-size: 2em;">热门地点</span><span
			style="margin-left: 80%"><a href="${ctx }/sence/allsence">更多</a></span>
		</div>
		<c:forEach var="scelist" items="${scelist }">
		<div class="col-md-6 col-lg-4">
			<div class="category-item effect-1">
				<img src="${scelist.img }" alt="img12">
				<div class="caption">
					<div>
						<p class="title">${scelist.sname }</p><!-- 景点名称 -->
						<p class="description">地址：${scelist.address }</p><!-- 景点地址 -->
					</div>
					<a href="${ctx }/sence/singlesence?id=${scelist.sceneId}">View more</a>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<!-- *******************************上半部分**************************** -->
<!--  div class="container blue_still">
    <div class="row">
        <div class="col-md-3 col-xs-6">
            <div class="blue_bg blue_still_box" style="background-image: url('${ctx}/img/bg.jpg');">
                <div class="blue_still_img">
                    <img src="${ctx }/img/shanbei.jpg" alt="">
                </div>
                 <h2 style="font-size: 2em;font-weight: 400">各色小吃</h2>
                <p style="font-weight: 600">时光将味道烙在了我们的味蕾上，随生而生，永不磨灭</p>
                <a href="#">查看更多>></a>
            </div>
        </div>
        <div class="col-md-3 col-xs-6">
            <div class="blue_bg blue_still_box" style="background-image: url('${ctx}/img/bg.jpg');">
                <div class="blue_still_img">
                    <img src="${ctx }/img/cha.png" alt="">
                </div>
                 <h2 style="font-size: 2em;font-weight: 400">精美茶点</h2>
                <p style="font-weight: 600">最美的时光，不过午后的是一杯茶，一本书，三两闺蜜，或执手之人，浪漫惬意</p>
                <a href="#">查看更多>></a>
            </div>
        </div>
        <div class="col-md-3 col-xs-6">
            <div class="blue_bg blue_still_box" style="background-image: url('${ctx}/img/bg.jpg');">
                <div class="blue_still_img">
                    <img src="${ctx }/img/qixing.jpg" alt="">
                </div>
                 <h2 style="font-size: 2em;font-weight: 400">周边美景</h2>
                <p style="font-weight: 600">没有值得分享的感伤爱情故事，唯有讲述此间途经的美景，分享没有男主角的相片。</p>
                <a href="#">查看更多>></a>
            </div>
        </div>
        <div class="col-md-3 col-xs-6">
            <div class="blue_bg blue_still_box" style="background-image: url('${ctx}/img/bg.jpg');">
                <div class="blue_still_img">
                    <img src="${ctx }/img/motianlun.jpg" alt="">
                </div>
                 <h2 style="font-size: 2em;font-weight: 400">游玩场所</h2>
                <p style="font-weight: 600">欢快的游乐场，烧脑的密室，恐怖的鬼屋，热闹的演唱会，邀三两好友，一起进入欢乐世界</p>
                <a href="#">查看更多>></a>
            </div>
        </div>
    </div>
</div-->
<div id = "type">
<div class="container-fluid">
    <div class="blue_title text-center">
        <span>出行类型</span>
    </div>

    <div class="container">
        <div class="blue_type">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=家庭出游">
                            <div class="blue_img">
                                <img src="${ctx }/img/type_1.jpg" alt="">
                            </div>
                            <p>家庭出游</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=独自一人">
                            <div class="blue_img">
                                <img src="${ctx }/img/type_2.jpg" alt="">
                            </div>
                            <p>个人旅游</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=情侣">
                            <div class="blue_img">
                                <img src="${ctx }/img/type_3.jpg" alt="">
                            </div>
                            <p>情侣出游</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=毕业游">
                            <div class="blue_img">
                                <img src="${ctx }/img/byy.jpg" alt="">
                            </div>
                            <p>毕业游</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=三五好友">
                            <div class="blue_img">
                                <img src="${ctx }/img/type_5.jpg" alt="">
                            </div>
                            <p>朋友相聚</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="${ctx }/strategy/findbyTag?tag=团队团建">
                            <div class="blue_img">
                                <img src="${ctx }/img/type_6.jpg" alt="">
                            </div>
                            <p>团队团建</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="swiper-button swiper-button-prev"><span class="glyphicon glyphicon-menu-left"></span></div>
            <div class="swiper-button swiper-button-next"><span class="glyphicon glyphicon-menu-right"></span></div>
        </div>
    </div>
</div>
</div>
 <div class="blue_title text-center">
        <span>不知道怎么玩儿？看看他们！</span>
    </div>
<div style="width: 80%;margin: auto">
<c:forEach items="${indexStrategy }" var="strategy">
		<div class="col-md-6 col-lg-4" style="background-color: white;">
            <div class="category-item effect-1">
              <img src="${ctx }/${strategy.img }" alt="img12" style="width: 110%;height: 300px;">
              <div class="caption" style="width: 100%;">
                <div>
                  <p class="title">${strategy.title }</p>
                  <p class="description"><a href="${ctx }/user/otherUserCenter?useremail=${strategy.user.email}" style="color: white;">作者：${strategy.user.email }</a></p>
                  <p class="description">游玩儿地：
                  <c:forEach items="${strategy.sd }" var="sd">
                  	<span>${sd.address }&nbsp&nbsp&nbsp</span>
                  </c:forEach>
                  </p>
                </div>
                <a href="${ctx }/strategy/singleStrategy?StrategyId=${strategy.sId}">View more</a>
              </div>     
            </div>
          </div>
</c:forEach>
</div>
<div class="container-fluid blue_bg" style="margin-bottom: 5%; clear: both">
    <div class="blue_title text-center">
        <span>是什么让我们与众不同</span>
    </div>
    <div class="container">
        <article class="text-center col-md-10 col-md-offset-1">
            <div class="blue_article_before">
                <p>
                  行途不仅仅是一个推荐旅游景点以及美食的网站，他还可以帮我们记录我们旅途的点点滴滴，建立自己的相册，记录自己的旅游心得，与大家分享自己的一些新鲜体验，查找旅游攻略，
                  为自己的每一次出行指定完美计划......
                    <a class="btn_article_before" href="javascript:;">了解更多</a>
                </p>
            </div>
            <div class="blue_article_after">
                <p>我们有对您周边的景点和美食场所的介绍，还有来自其他人对一些景点或者餐饮地点的推荐和评价，让您在出行之前了解好每一个景点最好玩儿的地方。不浪费每每一分时光</p>
                <p>我们有让您自己指定旅游攻略的功能，您可以自行创建属于您自己的攻略，为出行提前做一个完美的计划。同时，您还可以将自己的攻略发布出去，分享给其他人。与此同时，您也可以参考其他人的旅游攻略来制定适合自己的出行计划</p>
                <p>我们还设有相册和游记板块，让您记录下每一次出行的心得体会，相册中保存着您出行过程中每一个难忘的瞬间，为您营造一个浪漫的回忆空间</p>
                <p>我们还设有一些活动的推荐，让您及时关注到您想要看的一些比赛，演唱会等活动。
                    <a class="btn_article_after" href="javascript:;">返回</a>
                </p>
            </div>
        </article>
    </div>
</div>
<!-- ********************分类介绍 /吃喝玩玩儿乐*************************-->

<!-- ****************************footer******************************* -->
<jsp:include page="footer.jsp" flush="true"></jsp:include>



<!-- 浮框 
<div class="blue_fixed">
    <span class="btn_fixed_close"></span>
    <h2>优惠精选</h2>
    <p>还没有找到你的下一个旅行吗，我们这里有一些高性价比的</p>
    <a href="#">查看更多</a>
</div>
<div class="blue_share">
    <div class="blue_share_btn">
        <div class="blue_share_icon blue_wx"></div>
        <div class="blue_share_icon blue_mail"></div>
    </div>   
    <div class="blue_share_wx">
        <img src="img/share-wx.png" alt="">
        <p>扫描二维码即刻关注我们</p>
    </div>
    <div class="blue_share_mail">
        <p>地址: 北京市朝阳区望京园402号楼<br>东亚望京中心B座3802</p>
        <p>电话: +86-010-8476-6802</p>
        <p>邮箱: contactus@bluespiritvoyages.com</p>
    </div>
</div>
-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
<script>
var animateButton = function(e) {

  e.preventDefault;
  //reset animation
  e.target.classList.remove('animate');
  
  e.target.classList.add('animate');
  setTimeout(function(){
    e.target.classList.remove('animate');
  },700);
};

var classname = document.getElementsByClassName("bubbly-button");

for (var i = 0; i < classname.length; i++) {
  classname[i].addEventListener('click', animateButton, false);
}</script>
</body>
</html>