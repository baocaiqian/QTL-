<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>${user.username }的空间</title>
<link href="${ctx }/css/user/myuse.css" rel="stylesheet"/>
<link href="${ctx }/css/user/myhead.css" rel="stylesheet"/>
<link href="${ctx }/css/home/header.css" rel="stylesheet"/>
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ctx }/css/touxiang/cropper.min.css"/>
<link rel="stylesheet" href="${ctx }/css/touxiang/ImgCropping.css"/>
</head>
<body>
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
	<div class="qn-skin">
		<div class="qn-page">
		    <div class="flmainbox-left">
		          <div class="xxz1"><a href="#myxc">我的行程</a></div>
		          <div class="xxz2"><a href="#mygl">我的攻略</a></div>
		          <div class="xxz3"><a href="#mysc">攻略收藏</a></div>
		          <div class="xxz4"><a href="#mygz">心愿清单</a></div>
		    </div>
			<div class="flmainbox-right">
				<div class="b-home-detail">
				    <div id="myxc">
				          <div class="zjxc">最近行程</div>
				          <c:if test="${journeys!=null }">
				          <c:forEach items="${journeys }" var="journey">
				          <div class="xich1">
				          <span style="float: right;font-size: 25px;"><a href="${ctx }/journey/deletJour?jid=${journey.jid}">X</a></span>
				              <div class="wcj1">我创建了行程计划</div>
				              <div class="rq1">
				                    <div clas="ts1" style="background-color: white; text-align: center;">共1天</div>
				                    <div class="mycf1">${journey.jtime }出发</div>
				              </div>
				              <div class="zbt1"><a href="${ctx }/journey/singleJour?jid=${journey.jid}">${journey.jtitle}</a></div>
				          </div>
				          </c:forEach>
				          </c:if>
				    </div>
				    <div id="mygl">
				          <div class="zdgl">我的攻略</div>
				          <c:if test="${strategys!=null }">
				          <c:forEach items="${strategys }" var="strategy">
				          <div class="gol1">
				              <div class="glbt1"><a href="${ctx }/strategy/singleStrategy?StrategyId=${strategy.sId}">${strategy.title }</a></div>
				              <div class="tpic1"><img src="${ctx }/${strategy.img}"></img></div>
				          </div>
				          </c:forEach>
				          </c:if>
				          <c:if test="${strategys == null }">
				          <div class="nostrategy">您的攻略空空如也~</div>
				          </c:if>
				    </div>
					<div id="mysc">
						<div class="zdsc">攻略收藏</div>
						<c:if test="${glshous!=null }">
				        <c:forEach items="${glshous }" var="mygl">
				           <div class="sphoto1">
				              <div class="sc1"><img src="${ctx }/${mygl.strategy.img}"></img></div>
				              <div class="sz1">
				                   <div style="width: 70px;height: 70px;border-radius:50%;border: solid 1px #555; float: left" id="replaceImg"  class="zztt">
                                      <img id="finalImg" src="${ctx }/${mygl.strategy.user.icon}" width="70px" height="70px" style="border-radius:50%;">
                                   </div>
				                   <div class="zzmz">${mygl.strategy.user.username}</div>
				                   <a href="${ctx }/strategy/singleStrategy?StrategyId=${mygl.strategy.sId}" class="glmz">${mygl.strategy.title}</a>
				                   <div class="glbq">${mygl.strategy.tag }</div>
				              </div>
				        
				         </div>
				         </c:forEach>
				         </c:if>
				         <c:if test="${glshous== null }">
				         <div class="nostrategy">您的收藏清单空空如也~</div>
				         </c:if>
						
					</div>
					<div id="mygz">
					    <div class="zdgz">心愿清单</div>
						<c:if test="${scenes!=null }">
				        <c:forEach items="${scenes }" var="myscene">
				        <div class="xiny1">
				              <div class="xyimg"><img src="${myscene.scene.img}"></img></div>
				              <div class="myx1"><a href="${ctx }/sence/singlesence?id=${myscene.scene.sceneId}">${myscene.scene.sname}</a></div>
				         </div>
				         </c:forEach>
				         </c:if>
				         <c:if test="${scenes == null }">
				         <div class="nostrategy">您的心愿清单空空如也~</div>
				         </c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>






<!--图片裁剪框 start-->

<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onClick="closeTailor(this)"></div>
    
    <form action="${ctx}/iconController" enctype="multipart/form-data" name="myform" method="post">
    <div class="tailoring-content">
            <div class="tailoring-content-one">
                <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                 
                    <!-- 从此处能上传头像 -->
                    <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onChange="selectImg(this)">
                    选择图片
                </label>
                <div class="close-tailoring"  onclick="closeTailor(this)">×</div>
            </div>
            <div class="tailoring-content-two">
                <div class="tailoring-box-parcel">
                    <img id="tailoringImg">
                </div>
                <div class="preview-box-parcel">
                    <p>图片预览：</p>
                    <div class="square previewImg"></div>
                    <div class="circular previewImg"></div>
                </div>
            </div>
            <div class="tailoring-content-three">
                <button class="l-btn cropper-reset-btn">复位</button>
                <button class="l-btn cropper-rotate-btn">旋转</button>
                <button class="l-btn cropper-scaleX-btn">换向</button>
                <!-- 从此处能提交 -->
                <button class="l-btn sureCut" id="sureCut" onclick="check(this.form)">确定</button> 
            </div>
        </div>
        
        </form>
</div>








<!--图片裁剪框 end-->
<script type="text/javascript" src="${ctx }/js/touxiang/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/touxiang/cropper.min.js"></script>
<script type="text/javascript">
    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768){
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": 0
            });
        }else{
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": (win_width - $(".tailoring-content").outerWidth())/2
            });
        }
    })();

    //弹出图片裁剪框
    $("#replaceImg").on("click",function () {
        $(".tailoring-container").toggle();
    });
    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]){
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace',replaceSrc,false);//默认false，适应高度，不失真           
        }
        reader.readAsDataURL(file.files[0]);
    }
    //cropper图片裁剪
    $('#tailoringImg').cropper({
        aspectRatio: 1/1,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function(e) {
            // 输出结果数据裁剪图像。
        }
    });
    //旋转
    $(".cropper-rotate-btn").on("click",function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click",function () {
        $('#tailoringImg').cropper("reset");
    });
    //换向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click",function () {
        if(flagX){
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        }else{
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });

    //裁剪后的处理
    $("#sureCut").on("click",function () {
        if ($("#tailoringImg").attr("src") == null ){
            return false;
        }else{
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/png');//转换为base64地址形式
            $("#finalImg").prop("src",base64url);//显示为图片的形式

            //关闭裁剪框
            closeTailor();
        }
    });
    
    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
    }
    
    //点击表单，表单提交
    function check(form){
    	document.myform.submit();
    }
    
    
</script>