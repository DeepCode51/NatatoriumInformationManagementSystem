<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
var ctx='${ctx}';
</script>
<!DOCTYPE>
<html>
<head>
<title>游泳馆信息管理</title>
<link type="text/css" rel="stylesheet" href="${ctx }/resource/index/one/css/style.css" />
<script type="text/javascript" src="${ctx }/resource/index/one/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/index/one/js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">游泳馆信息管理</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">${adminBean.username }</a></li>
			<%--
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li> --%>
			<li><a href="${ctx }/adminLogin/out.html">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
	<ul id="nav_dot">
			<li>
	          <h4 class="M1"><span></span>个人中心</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/password.html' target="page">修改密码</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>人员管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/customer/frame.html?flag=1' target="page">用户管理</a>
	            <a href='${ctx}/admin/employee/frame.html?flag=1' target="page">员工管理</a>
	          </div>
	        </li>
	        <li>
	          <h4 class="M1"><span></span>游泳馆场地管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/changdi/frame.html?flag=1' target="page">游泳馆场地列表</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>游泳馆费用管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/feiyong/frame.html?flag=1' target="page">游泳馆费用列表</a>
	            <a href='${ctx}/admin/tj/tj2.html' target="page">游泳馆费统计</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>工资管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/gongzi/frame.html?flag=1' target="page">工资列表</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>会员卡管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/huiyuan/frame.html?flag=1' target="page">会员卡列表</a>
	            <a href='${ctx}/admin/huiyuanxf/frame.html?flag=1' target="page">会员卡消费列表</a>
	             <a href='${ctx}/admin/huiyuanyw/frame.html?flag=1' target="page">会员卡业务列表</a>
	             <a href='${ctx}/admin/tj/tj1.html' target="page">会员卡消费统计表</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>留言管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/liuyan/frame.html?flag=1' target="page">留言列表</a>
	          </div>
	        </li>
			<li>
	          <h4 class="M1"><span></span>消息管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/xiaoxi/frame.html?flag=1' target="page">消息列表</a>
	          </div>
	        </li>
	        <li>
	          <h4 class="M1"><span></span>首页新闻资讯</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/zx/frame.html?flag=1' target="page">首页新闻资讯</a>
	          </div>
	        </li>
	        <li>
	          <h4 class="M1"><span></span>首页轮播图</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/lbt/frame.html?flag=1' target="page">首页轮播图</a>
	          </div>
	        </li>
	        
	        
	         <li>
	          <h4 class="M1"><span></span>活动管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/product/frame.html?flag=1' target="page">活动列表</a>
	          </div>
	        </li> 
	        <li>
	          <h4 class="M1"><span></span>帖子管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/wdxx/frame.html?flag=1' target="page">帖子列表</a>
	          </div>
	        </li> 
	        <li>
	          <h4 class="M1"><span></span>帖子回复管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/pinglun/frame.html?flag=1' target="page">帖子回复列表</a>
	          </div>
	        </li> 
	         <li>
	          <h4 class="M1"><span></span>网站建议管理</h4>
	          <div class="list-item none">
	            <a href='${ctx}/admin/contact/frame.html?flag=1' target="page">网站建议列表</a>
	          </div>
	        </li> 
 	 </ul>
 	 
		</div>
		<div class="m-right">
			<div class="main">
				<iframe src="${ctx }/admin/main.html" width="100%" height="100%" frameborder="0" scrolling="yes" name="page"></iframe>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>游泳馆信息管理</p></div>
<script>navList(12);</script>
</body>
</html>

