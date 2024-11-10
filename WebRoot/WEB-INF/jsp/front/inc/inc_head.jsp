<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script>
	var ctx = '${ctx}';
</script>
<nav id="top">
		<div class="container">
			<div class="row">
				
				<div class="col-xs-6">
					<%--<select class="language">
						<option value="English" selected>English</option>
						<option value="France">France</option>
						<option value="Germany">Germany</option>
					</select>
					<select class="currency">
						<option value="USD" selected>USD</option>
						<option value="EUR">EUR</option>
						<option value="DDD">DDD</option>
					</select>--%>
				</div> 
				<div class="col-xs-6">
					<ul class="top-link">
					
						<c:if test="${customerBean!=null }">
					    	<li><a href="${ctx }/front/wdxxList.html">我的帖子</a></li>
					    	<li><a href="${ctx }/front/mine.html">我的信息</a></li>
					    	<li><a href="${ctx }/front/myOrder.html">我的消费记录</a></li>
					    	<li><a href="${ctx }/front/out.html">注销</a></li>
					    </c:if>
					    <c:if test="${customerBean==null }">
					    	<li><a href="register.html"><span class="glyphicon glyphicon-user"></span>我的账号</a></li>
					    </c:if>
						<li><a href="contact.html"><span class="glyphicon glyphicon-envelope"></span>网站建议</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
		<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="logo" style="font-size: 30px;">基于Java的游泳馆信息管理网站的设计与实现</div>
			</div>
		</div>
	</header>
	<!--Navigation-->
    <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.html">首页</a></li>
					<li><a href="all.html">活动</a></li>
					<li><a href="zxList.html">新闻资讯</a></li>
					<li><a href="lt.html">论坛</a></li>
					<li><a href="v1.html">规章制度</a></li>
					<li><a href="v2.html">关于我们</a></li>
					<li><a href="v3.html">常见问题</a></li>
				</ul>
			</div>
		</div>
	</nav>