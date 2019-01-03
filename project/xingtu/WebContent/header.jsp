<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- header start -->
<header>
    <!-- nav start -->
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <div class="blue_nav" style="display: inline-block;">
                    <ul class="nav navbar-nav col-md-12 col-sm-12">
                    <li class="logo">
                		<img src="${ctx }/img/logo.png">
                    </li>
                        <li class="col-md-nav"><a href="${ctx }/index/scelist">首页</a></li>
                        <li class="col-md-nav"><a href="${ctx }/sence/allsence">景点</a></li>
                        <li class="col-md-nav"><a href="${ctx }/strategy/allStrategy">他人攻略</a></li>
                        <c:if test="${isSigned==false or isSigned==null }">
                        <li class="col-md-nav"><a href="${ctx }/sign.jsp"> 个性定制</a>
                        </c:if>
                        <c:if test="${isSigned==true}">
                        <li class="col-md-nav"><a href="${ctx }/user/usercenter"> 个性定制</a>
                        </c:if>
                    </ul>
                </div>
                <div style="width: 20%;display: inline-block;position: relative;margin: auto;float: right;text-align: right;">
                    <div style="width: 50%;height: 1.25%;position:relative;display: inline-block;">
                 	<img src="${ctx }/img/addpeople.png" style="width: 30%">
                    <c:if test="${isSigned==false or isSigned==null }">
                    <span style="font-size: 1em;"><a href="${ctx }/sign.jsp">登录/注册</a></span>
                    </c:if>
                    <c:if test="${isSigned==true }">
                    <span style="font-size: 1em;"><a href="${ctx }/user/usercenter">个人空间</a></span>
                    </c:if>
                   </div>
              </div>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid --> 
    </nav>
    <!-- nav end -->
</header>
<!-- header end -->