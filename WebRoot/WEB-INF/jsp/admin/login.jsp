<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
var ctx='${ctx}';
</script>
<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>游泳馆信息管理</title>
<link rel="stylesheet" href="${ctx }/resource/login/one/css/style.css">
<script src="${ctx}/resource/admin/js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<body>
<div class="login-container">
	<h1>游泳馆信息管理</h1>
	<form action="" method="post" id="login_form">
		<div>
			<input type="text" id="login_username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" id="login_password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
				<div>
            <select class="username" name="type" id="type">
            	<option value="用户">用户</option>
            	<option value="员工">员工</option>
            	<option value="超级管理员">超级管理员</option>
            </select>
		</div>
		<button id="submit" onclick="loginCheck();" type="button">登陆</button>
			<%--
			<a href="javascript:showRegistercustomer();">
			<button type="button" class="register-tis">用户注册</button>
			</a>
			<a href="javascript:showRegisteremployee();">
			<button type="button" class="register-tis">员工注册</button>
			</a>
			 --%>
	</form>
	<form action="" method="post" id="registerFormcustomer" style="display: none;">
		<div>
			<input type="text" id="customer_username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" id="customer_password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
<input type="text" class="username" placeholder="姓名" id="customerName" name="customerName"/>
		</div>
		<div>
<input type="text" class="username" placeholder="电话" id="phone" name="phone"/>
		</div>
		<div>
<input type="text" class="username" placeholder="年龄" id="age" name="age"/>
		</div>
		<div>
<select class="username" id="sex" name="sex">
								<option value="男">男</option>
								<option value="女">女</option>
					</select>
		</div>
		<button id="submit" type="button" onclick="registerSavecustomer();">点击注册</button>
		<a href="javascript:showLogin();">
		<button type="button" class="register-tis">我有账号，我要登录</button>
	</a>
	</form>
	<form action="" method="post" id="registerFormemployee" style="display: none;">
		<div>
			<input type="text" id="employee_username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" id="employee_password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
<input type="text" class="username" placeholder="姓名" id="employeeName" name="employeeName"/>
		</div>
		<div>
<input type="text" class="username" placeholder="电话" id="phone" name="phone"/>
		</div>
		<div>
<input type="text" class="username" placeholder="年龄" id="age" name="age"/>
		</div>
		<div>
<select class="username" id="sex" name="sex">
								<option value="男">男</option>
								<option value="女">女</option>
					</select>
		</div>
		<button id="submit" type="button" onclick="registerSaveemployee();">点击注册</button>
		<a href="javascript:showLogin();">
		<button type="button" class="register-tis">我有账号，我要登录</button>
	</a>
	</form>
</div>
<script src="${ctx }/resource/login/one/js/jquery.min.js"></script>
<!--背景图片自动更换-->
<script src="${ctx }/resource/login/one/js/supersized.3.2.7.min.js"></script>
</body>
<script type="text/javascript">
jQuery(function($){
    $.supersized({
        // 功能
        slide_interval     : 4000,    // 转换之间的长度
        transition         : 1,    // 0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马
        transition_speed   : 1000,    // 转型速度
        performance        : 1,    // 0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）
        // 大小和位置
        min_width          : 0,    // 最小允许宽度（以像素为单位）
        min_height         : 0,    // 最小允许高度（以像素为单位）
        vertical_center    : 1,    // 垂直居中背景
        horizontal_center  : 1,    // 水平中心的背景
        fit_always         : 0,    // 图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸）
        fit_portrait       : 1,    // 纵向图像将不超过浏览器高度
        fit_landscape      : 0,    // 景观的图像将不超过宽度的浏览器
        // 组件
        slide_links        : 'blank',    // 个别环节为每张幻灯片（选项：假的，'民'，'名'，'空'）
        slides             : [    // 幻灯片影像
                                 {image : '${ctx}/resource/1.jpg'}
                       ]
    });
});
	function showRegistercustomer(){
		$("#login_form").hide();
		$("#registerFormcustomer").show();
		$("#registerFormemployee").hide();
	}
	function showRegisteremployee(){
		$("#login_form").hide();
		$("#registerFormemployee").show();
		$("#registerFormcustomer").hide();
	}
	function showLogin(){
		$("#login_form").show();
		$("#registerFormcustomer").hide();
		$("#registerFormemployee").hide();
	}	
	function loginCheck(){
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		var type = $("#type").val();
		if(username==''||password==''){
			alert('用户名和密码必须填写');
			return false;
		}
		var aa="";
		var bb="";
		if(type=='用户'){
			aa="${ctx}/customerLogin/save.html";
			bb="${ctx}/customer/index.html";
		}else if(type=='员工'){
			aa="${ctx}/employeeLogin/save.html";
			bb="${ctx}/employee/index.html";
		}else{
			aa="${ctx}/adminLogin/save.html";
			bb="${ctx}/admin/index.html";
		}
		$.ajax({
		      type: "POST",
		      async:false,  // 设置同步方式
		      cache:false,
		      url: aa,
				data:$("#login_form").serializeArray(),
				success:function(result){
				result = eval("("+result+")");
				if(result.status=='true'||result.status==true){
					if(result.msg=='1'){
						alert('登录成功');
						window.location.href=bb;
					}else if(result.msg=='0'){
						alert('密码或用户名错误');
					}
				}
		      }
			});
	}
	function registerSavecustomer(){
		var username = $("#customer_username").val();
		var password = $("#customer_password").val();
		if(username==''||password==''){
			alert('用户名和密码必须填写');
			return false;
		}
		$.ajax({
		      type: "POST",
		      async:false,  // 设置同步方式
		      cache:false,
		      url: "${ctx}/customerLogin/registerSave.html",
				data:$("#registerFormcustomer").serializeArray(),
				success:function(result){
				result = eval("("+result+")");
				if(result.status=='true'||result.status==true){
						alert('注册成功');
						window.location.href="${ctx}/customer/index.html";
				}
		      }
			});
	}
	function registerSaveemployee(){
		var username = $("#employee_username").val();
		var password = $("#employee_password").val();
		if(username==''||password==''){
			alert('用户名和密码必须填写');
			return false;
		}
		$.ajax({
		      type: "POST",
		      async:false,  // 设置同步方式
		      cache:false,
		      url: "${ctx}/employeeLogin/registerSave.html",
				data:$("#registerFormemployee").serializeArray(),
				success:function(result){
				result = eval("("+result+")");
				if(result.status=='true'||result.status==true){
						alert('注册成功');
						window.location.href="${ctx}/employee/index.html";
				}
		      }
			});
	}
</script>
</html>
