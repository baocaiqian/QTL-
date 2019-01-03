<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${CenterOwn }的空间</title>
<link href="${ctx }/css/user/myuse.css" rel="stylesheet">
<link href="${ctx }/css/user/myhead.css" rel="stylesheet">
<link href="${ctx }/css/home/header.css" rel="stylesheet">
<link href="${ctx }/css/home/bootstrap.min.css" rel="stylesheet">
<script src="${ctx }/js/home/jquery-1.11.3.min.js"></script>
<script src="${ctx }/js/home/bootstrap.min.js"></script>
<script src="${ctx }/js/home/swiper.min.js"></script>
<script src="${ctx }/js/home/main.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="qn-header">
		<div class="main-zt">
			<div class="user-info">
				<dt class="flpic">
					<%-- <img src="${ctx }/${CenterOwn.icon }" /> --%>
					<div style="width: 80px;height: 80px;border-radius:50%;border: solid 1px #555;" id="replaceImg"  >
                     <img id="finalImg" src="${ctx }/${CenterOwn.icon }" width="80px" height="80px" style="border-radius:50%;">
                </div>
					<div style="float:left;" class="gz"> 
					
					<!-- 如果未关注 -->
					<c:if test="${ifGuanzhu==false }">
					    <c:if test="${isSigned==true }">
					    <a href="${ctx }/guanzhuController?bepersonemail=${CenterOwn.email}"> +&nbsp;关注  </a>
					    </c:if> 
					    <c:if test="${isSigned==false or isSigned==null }">
					    <a href="${ctx }/sign.jsp"> +&nbsp;关注  </a>
					    </c:if>
					</c:if>
					<!-- 如果已关注 -->
					<c:if test="${ifGuanzhu==true }">
					    <a href="${ctx }/tonoGuanzhu?bepersonemail=${CenterOwn.email}"> 已关注</a> 
					</c:if>
			
					</div>  <!-- 在此处传入了被关注人的邮箱 -->
				</dt><!-- 个人头像 -->

				<dd class="flintro">
				
					<h3 class="intro-title">
						<span class="name" title="QTL">${CenterOwn.username }</span>
					</h3>
					
				</dd>
			</div>
			
		
			<div class="fruser-fans">
				<div class="fz">
					<div class="shu">${FGCount }</div>
					<div class="guzh">关注</div>  <!-- 从这里跳到控制器，然后再跳转到关注页面 -->
				</div>
				<div class="hz">|</div>
				<div class="fy">
					<div>${fansCount }</div>
					<div>粉丝</div>
				</div>			
			</div>
			
			
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
				          <c:if test="${CenterOwn.journeys!=null }">
				          <c:forEach items="${CenterOwn.journeys }" var="journey">
				          <div class="xich1">
				              <div class="wcj1">我创建了行程计划</div>
				              <div class="rq1">
				                    <div class="ts1">共1天</div>
				                    <div class="mycf1">${journey.jtime }出发</div>
				              </div>
				              <div class="zbt1"><a href="${ctx }/journey/singleJour?jid=${journey.jid}">${journey.jtitle}</a></div>
				          </div>
				          </c:forEach>
				          </c:if>
				          
				    </div>
				    <div id="mygl">
				          <div class="zdgl">我的攻略</div>
				          <c:if test="${CenterOwn.st!=null }">
				          <c:forEach items="${CenterOwn.st }" var="strategy">
				          <div class="gol1">
				              <div class="glbt1"><a href="${ctx }/strategy/singleStrategy?StrategyId=${strategy.sId}">${strategy.title }</a></div>
				              <div class="tpic1"><img src="${ctx }/${strategy.img}"></img></div>
				          </div>
				          </c:forEach>
				          </c:if>
				          <c:if test="${CenterOwn.st == null }">
				          <div class="nostrategy">攻略空空如也~</div>
				          </c:if>
				    </div>
					<div id="mysc">
						<div class="zdsc">攻略收藏</div>
						<c:if test="${CenterOwn.glshoucang!=null }">
				        <c:forEach items="${CenterOwn.glshoucang}" var="mygl">
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
				         <c:if test="${CenterOwn.glshoucang== null }">
				         <div class="nostrategy">您的收藏清单空空如也~</div>
				         </c:if>
						
					</div>
					<div id="mygz">
					    <div class="zdgz">心愿清单</div>
						<c:if test="${CenterOwn.sceneshoucang!=null }">
				        <c:forEach items="${CenterOwn.sceneshoucang }" var="myscene">
				        <div class="xiny1">
				              <div class="xyimg"><img src="${myscene.scene.img}"></img></div>
				              <div class="myx1"><a href="${ctx }/sence/singlesence?id=${myscene.scene.sceneId}">${myscene.scene.sname}</a></div>
				       
				         </div>
				         </c:forEach>
				         </c:if>
				         <c:if test="${CenterOwn.sceneshoucang == null }">
				         <div class="nostrategy">您的心愿清单空空如也~</div>
				         </c:if>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>