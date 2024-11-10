<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link href="${ctx}/css/validate.css" rel="stylesheet" type="text/css" />
<html>
<head>
<title>信息内容功能</title>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		<input type="hidden" value="${param.flag }" name="flag" /> <input
			type="hidden" value="${map.id }" name="id" id="id" />
		<center>
			<table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2"><strong>信息处理</strong></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">活动名称： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="productName"
						value="${map.productName }" name="productName" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片1： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg0" name="cmfile"
						onchange="triggerUploadImg0(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="productPic1"
						id="bbbbbImg0" value="${map.productPic1 }"> <c:if
							test="${map.productPic1!=null }">
							<img style='width:100px;' src="${ctx }/${map.productPic1}"
								id="aaaaaImg0" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片2： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg1" name="cmfile"
						onchange="triggerUploadImg1(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="productPic2"
						id="bbbbbImg1" value="${map.productPic2 }"> <c:if
							test="${map.productPic2!=null }">
							<img style='width:100px;' src="${ctx }/${map.productPic2}"
								id="aaaaaImg1" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片3： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg2" name="cmfile"
						onchange="triggerUploadImg2(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="productPic3"
						id="bbbbbImg2" value="${map.productPic3 }"> <c:if
							test="${map.productPic3!=null }">
							<img style='width:100px;' src="${ctx }/${map.productPic3}"
								id="aaaaaImg2" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片4： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg3" name="cmfile"
						onchange="triggerUploadImg3(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="productPic4"
						id="bbbbbImg3" value="${map.productPic4 }"> <c:if
							test="${map.productPic4!=null }">
							<img style='width:100px;' src="${ctx }/${map.productPic4}"
								id="aaaaaImg3" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">内容： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><textarea rows="5" id="content"
							cols="50" name="content">${map.content }</textarea></td>
				</tr>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">积分： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="jf" type="text"
						value="${map.jf }" name="jf" /></td>
				</tr> --%>
				<tr height="25">
					<td class="outDetail" style="width: 30%">状态： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="status" name="status">
							<option value="上架" ${map.status=='上架'?'selected':'' }>上架</option>
							<option value="下架" ${map.status=='下架'?'selected':'' }>下架</option>
					</select></td>
				</tr>
				<c:if test="${1==1 }"></c:if>
				<%--<input name="newDate" id="newDate" value="${map.newDate }" type="text" onClick="WdatePicker()"/> --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2"><input id="f_file" name="cmfile"
						onchange="triggerUpload(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="img" value="${map.img }">
						<img id="imgUrlShow" style="width: 100px;" src="${ctx}/${map.img }" />
					</td>
				</tr>
				--%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">是否特价： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="isSale">
							<option value="是" ${map.isSale=='是'?'selected':'' }>是</option>
							<option value="否" ${map.isSale=='否'?'selected':'' }>否</option>
					</select>
				</tr>
				 --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图书分类的外键： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="typeId">
							<c:forEach items="${typeList }" var="lists">
								<option value="${lists.id }" ${map.typeId==lists.id?'selected':'' }>${lists.typeName
									}</option>
							</c:forEach>
					</select>
				</tr>
				 --%>
			</table>
		</center>
		<p align="center">
			<br>
			<c:if test="${param.method!='show' }">
				<input type="button" class="btn" value="保  存" onclick="save(this);" />
			</c:if>
			<input type="button" class="btn" value="关  闭"
				onclick="window.close();" />
		</p>
	</form>
</body>
<script type="text/javascript">
	function save(src) {
		$.post("editSave.html",$("#form1").serializeArray(),
		       function(result){
		        	result = eval("("+result+")");
		    		if(result.status == "true" || result.status == true){
		    			alert('成功');
		    			saveAnd();
		    		}else{
		    			alert('保存失败，请重试');
		    		}
		        }
			);
	}
	function triggerUploadImg0(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg0',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg0").val(data.data.filepath);
				$("#aaaaaImg0").remove();
				$("#bbbbbImg0").after("<img  id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
	function triggerUploadImg1(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg1',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg1").val(data.data.filepath);
				$("#aaaaaImg1").remove();
				$("#bbbbbImg1").after("<img  id='aaaaaImg1' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
	function triggerUploadImg2(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg2',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg2").val(data.data.filepath);
				$("#aaaaaImg2").remove();
				$("#bbbbbImg2").after("<img  id='aaaaaImg2' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
	function triggerUploadImg3(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg3',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg3").val(data.data.filepath);
				$("#aaaaaImg3").remove();
				$("#bbbbbImg3").after("<img  id='aaaaaImg3' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
	function triggerUpload(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_file',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("input[name='img']").val(data.data.filepath);
				$("#imgUrlShow").attr("src",
						"${ctx}/" + data.data.filepath + "");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
</script>
</html>
