<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>meishi</title>
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
              <div class="col-md-9">
              <!--// Blog Large //-->
                <div class="kd-section-title"><h3>美景</h3></div>
                <div class="kd-blog-list kd-bloggrid">
                  <div class="row">
                    <c:forEach items="${page.list }" var="scene">
                    <article class="col-md-3">
                      <div class="bloginner">
                        <figure><a href="/sence/singlesence?id=${scene.sceneId }"><img src="${scene.img }" alt=""></a>
                          <figcaption><a href="#" class="fa fa-plus-heart"></a></figcaption>  
                        </figure>
                        <section class="kd-bloginfo">
                          <h2 class="tiezi_text"><a href="${ctx }/sence/singlesence?id=${scene.sceneId }">${scene.sname }</a></h2>
                          <ul class="kd-postoption">
                            <li><a href="#" class="thcolorhover"></a>建议游玩时长：${scene.playtime }</li>
                          </ul>
                          <div class="kd-usernetwork">
                            <ul class="kd-blogcomment">
                                <li><i class="fa fa-eye"></i>${scene.looktimes }</li>
                              <li><i class="fa fa-heart-o"></i>${scene.shoucangtimes }</li>
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
                    <a href="${ctx }/sence/allsence?pageNum=1">首页</a>
                    <a href="${ctx }/sence/allsence?pageNum=${page.prePageNum }">上一页</a>
                    <a href="${ctx }/sence/allsence?pageNum=${page.nextPageNum }">下一页</a>
                    <a href="${ctx }/sence/allsence?pageNum=${page.totalPageNum }">末页</a>
                  </div>
                </div>
              </div>
              <!--// Blog Large //-->

              <aside class="col-md-3">
                
               <div class="widget widget_search">
                  <div class="kd-section-title"><h3>搜索地点</h3></div>
                  <form action="${ctx }/sence/findbyname" method="post">
                    <input type="text" placeholder="搜索地名" name="name">
                    <input type="submit" value="">
                    <i class="fa fa-search"></i>
                  </form>
                </div>
                
                <div class="widget widget_tab">
                  <div class="kd-section-title"><h4>热门景点</h4></div>
                  <div class="kd-bookingtab">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">热门景点</a></li>
                      
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="widget-blogpost">
                          <ul>
                          <c:forEach items="${hotscene }" var="hots">
                            <li>
                              <figure><a href="${ctx }/sence/singlesence?id=${hots.sceneId}"><img alt="" src="${hots.img}"/></a></figure>
                              <div class="kd-post-info">
                                <h6><a href="${ctx }/sence/singlesence?id=${hots.sceneId}">${hots.sname }</a></h6>
                                
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
                  <div class="kd-widget-title"><h4>标签</h4></div>
                  <div class="kd-tag">
                    <a href="#"><H6>跟团游览</H6></a>
                    <a href="#"><h6>夜生活</h6></a>
                    <a href="#"><h6>音乐会与演出</h6></a>
                    <a href="#"><h6>自然与公园</h6></a>
                    <a href="#"><h6>动物园与水族馆</h6></a>
                    <a href="#"><h6>适合拍照</h6></a>
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
