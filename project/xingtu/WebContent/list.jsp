<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Travel</title>
    <!-- Css Folder -->
    <link href="${ctx }/css/list/bootstrap.css" rel="stylesheet">
    <link href="${ctx }/css/list/font-awesome.css" rel="stylesheet">
    <link href="${ctx }/css/list/color.css" rel="stylesheet">
    <link href="${ctx }/css/list/style.css" rel="stylesheet">
    <link href="${ctx }/css/list/themetypo.css" rel="stylesheet">
    <link href="${ctx }/css/home/header.css" rel="stylesheet">
    <link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx }/css/home/swiper.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
  </head>
  <body>
  <jsp:include page="header.jsp" flush="true"></jsp:include>
    <!--// Content //-->
    <div class="kd-content">
      <!--// Page Section //-->
      <section class="kd-pagesection" style=" padding: 0px 0px 0px 0px; background: #ffffff; ">
        <div class="container">
          <div class="row">

            <div class="col-md-12">
              <div class="col-md-8">
              <!--// Blog Large //-->
                <div class="kd-section-title"><h3>热门攻略</h3></div>
                <div class="kd-blog-list kd-bloggrid">
                  <div class="row">
                  <c:forEach items="${allstrategy.list }" var="strategy">
                    <article class="col-md-6">
                      <div class="bloginner">
                        <figure><a href="${ctx }/strategy/singleStrategy?StrategyId=${strategy.sId}"><img src="${ctx }/${strategy.img}" alt="" style="width: 100%;height: 200px;"></a>
                          <figcaption><a href="#" class="fa fa-plus-heart"></a></figcaption>  
                        </figure>
                        <section class="kd-bloginfo">
                          <h2 class="tiezi_text"><a href="${ctx }/strategy/singleStrategy?StrategyId=${strategy.sId}">${strategy.title }</a></h2>
                          <ul class="kd-postoption">
                            <li><a href="${ctx }/user/otherUserCenter?useremail=${strategy.user.email}" class="thcolorhover">${strategy.user.username }</a></li>
                            <li><time datetime="2008-02-14 20:00">|${strategy.stime }</time></li>
                          </ul>
                          <p>${strategy.tag }</p>
                          <div class="kd-usernetwork">
                            <ul class="kd-blogcomment">
                                <li><i class="fa fa-eye"></i>${strategy.looktimes }</li>
                              <li><i class="fa fa-heart-o"></i>${strategy.shoucangtimes }</li>
                            </ul>
                          </div>
                        </section>
                      </div>
                    </article>
                  </c:forEach>  
                  </div>
                </div>
                <div class="pagination-wrap">
                  <div class="pagination">
                    <a href="${ctx }/strategy/allStrategy?pageNum=1">首页</a>
                    <a href="${ctx }/strategy/allStrategy?pageNum=${allstrategy.prePageNum }">上一页</a>
                    <a href="${ctx }/strategy/allStrategy?pageNum=${allstrategy.nextPageNum }">下一页</a>
                    <a href="${ctx }/strategy/allStrategy?pageNum=${allstrategy.totalPageNum }">末页</a>
                  </div>
                </div>
              </div>
              <!--// Blog Large //-->

              <aside class="col-md-4">
                
               <div class="widget widget_search">
                  <div class="kd-section-title"><h3>搜索</h3></div>
                  <form action="${ctx }/strategy/findbyaddress" method="post">
                    <input type="text" placeholder="搜索要去的地名" name="address">
                    <input type="submit" value="">
                    <i class="fa fa-search"></i>
                  </form>
                </div>
                
                <div class="widget widget_tab">
                  <div class="kd-section-title"><h3>更多攻略</h3></div>
                  <div class="kd-bookingtab">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">最热攻略</a></li>
                      <li><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="new_gonglv">最新攻略</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="widget-blogpost">
                          <ul>
                            <c:forEach items="${hotstrategy }" var="hots">
                            <li>
                              <figure><a href="${ctx }/strategy/singleStrategy?StrategyId=${hots.sId}"><img alt="" src="${ctx }/${hots.img}" style="width: 50px;height: 50px;"></a></figure>
                              <div class="kd-post-info">
                                <h6><a href="${ctx }/strategy/singleStrategy?StrategyId=${hots.sId}">${hots.title }</a></h6>
                                <time datetime="2008-02-14 20:00">${hots.stime }</time>
                              </div>
                            </li>
                            </c:forEach>
                          </ul>
                        </div>
                      </div>
                      <div role="tabpanel" class="tab-pane" id="profile">
                        <div class="widget-blogpost">
                          <ul>
                          <c:forEach items="${newstrategy }" var="news">
                            <li>
                              <figure><a href="${ctx }/strategy/singleStrategy?StrategyId=${news.sId}"><img alt="" src="${ctx }/${news.img}" style="width: 50px;height: 50px;"></a></figure>
                              <div class="kd-post-info">
                                <h6><a href="${ctx }/strategy/singleStrategy?StrategyId=${news.sId}">${news.title }</a></h6>
                                <time datetime="2008-02-14 20:00">${news.stime }</time>
                              </div>
                            </li>
                            </c:forEach>
                          </ul>
                        </div>
                      </div>
                      
                    </div>

                  </div>
                </div>
              
                <div class="widget widget_tag">
                    <!--kd-widget-title-->
                  <div class="kd-widget-title"><h3>标签</h3></div>
                  <div class="kd-tag">
                  	<a href="${ctx }/strategy/findbyTag?tag=家庭出游"><H6>家庭出游</H6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=独自一人"><h6>独自一人</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=摄影"><h6>摄影</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=学生"><h6>学生</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=徒步"><h6>徒步</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=三五好友"><h6>三五好友</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=情侣"><H6>情侣</H6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=独自一人"><h6>独自一人</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=自驾"><h6>自驾</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=学生"><h6>人文</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=毕业游"><h6>毕业游</h6></a>
                    <a href="${ctx }/strategy/findbyTag?tag=美食"><h6>美食</h6></a>
                  </div>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </section>
    </div>
    <!--// Content //-->
    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    
  </body>
  
</html>

