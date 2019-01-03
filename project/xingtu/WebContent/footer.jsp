<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <!-- footer -->
<footer class="container-fluid blue_footer" style="background-image: url('${ctx}/img/bg.jpg');clear: both">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-12">
                <div class="blue_footer_title">行途</div>
                <div class="row blue_footer_list">
                    <ul>
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">使用攻略</a></li>
                        <li><a href="#">提供意见</a></li>
                        <li><a href="#">补充内容</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 col-xs-12">
                <div class="blue_footer_title">订阅</div>
                <div class="col-md-8 col-xs-12 blue_footer_take">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="填写邮箱地址">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">发送</button>
                        </span>
                    </div>
                    <p>发送邮箱订阅我们，我们会根据您的喜好来进行定制旅程</p>
                </div>
            </div>
            <div class="col-md-4 col-xs-12">
                <div class="blue_footer_title">联系我们</div>
                <div class="blue_footer_tel">
                    <p>地址: 河北省石家庄市河北师范大学<br>软件学院C座302室</p>
                    <p>电话: +86-010-8888-8888</p>
                    <p>邮箱: contactus@hbsfdxrjxyqtl.com</p>
                </div>
            </div>
        </div>
        <div class="row blue_link">
            <div class="col-md-8 col-xs-12">
                <div style="width: 40%;height: 30%">
                    <a href="#"><img src="${ctx}/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-4 col-xs-6 blue_code">
                <div class="col-md-3 col-xs-12">
                    <img src="${ctx}/img/sdm.jpg" alt="">
                    <p>官方公众号</p>
                    <p>河北师范大学</p>
                </div>
                <div class="col-md-3 col-xs-6">
                    <img src="${ctx}/img/WM.png" alt="">
                    <p>官方微博</p>
                    <p>@QQ倩倩小仙女</p>
                </div>
            </div>
        </div>
    </div>
</footer>
<section class="blue_copy">
    <div class="container">© 2018 HEBEI NORMAL UNIVERSITY. DESIGNED BY BIGDATA QTL TEAM</div>
</section>