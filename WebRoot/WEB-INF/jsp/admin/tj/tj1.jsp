<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@include file="/taglibs.jsp"%>
<%@taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<style type="text/css">
@import url("${ctx}/resource/admin/displaytag/zdisplaytag.css");
@import url("${ctx}/resource/admin/displaytag/alternative.css");
</style>
<html>
	<body>
		<display:table name="list"
			requestURI="tj1.html" class="list"
			id="row" cellspacing="0" cellpadding="0" >
			<display:column title="用户" property="customerName"/>
			<display:column title="卡号" property="num"/>
			<display:column title="消费总金额" property="fees"/>
		</display:table>
	</body>
</html>
