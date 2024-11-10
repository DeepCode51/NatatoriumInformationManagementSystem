<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/inc_css.jsp" %>
<body>
	<!--Top-->
	<%@include file="inc/inc_head.jsp" %>
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="product">
						<div class="col-md-6">
							<div class="image">
								<img src="${ctx}/${map.productPic1}" />
								<div class="image-more">
									 <ul class="row">
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${ctx}/${map.productPic1}"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${ctx}/${map.productPic2}"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${ctx}/${map.productPic3}"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="${ctx}/${map.productPic4}"></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="caption">
								<div class="name"><h3>${map.productName }</h3></div>
							</div>
						</div>
						<div class="clear"></div>
					</div>	
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#description">描述</a></li>
							<%----%><li><a href="#review">评论</a></li> 
						</ul>
						<div class="tab-content">
							<div id="description" class="tab-pane fade in active">
								<p>${map.content }</p>
							</div>
							<div id="review" class="tab-pane fade">
							  <div class="review-text">
								
								<c:forEach items="${list }" var="lists">
									<p>${lists.customerName }:${lists.content }(${lists.insertDate })</p>
								</c:forEach>
							  </div>
							  <div class="review-form">
								<form name="form1" id="form1" method="post">
								<input type="hidden" name="productId" value="${map.id }"/>
									<label>
									<span>评论内容:</span>
									<textarea name="content" id="content"></textarea>
									</label>
									<div class="text-right">
										<input class="btn btn-default" type="reset" name="reset" value="清空">
										<input class="btn btn-default" onclick="save(this);" type="button" name="Submit" value="发表评论">
									</div>
								</form>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<%@include file="inc/inc_foot.jsp" %>
</body>
<script type="text/javascript">
	function addShopCar(){
		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/register.html';
			return false;
		}
		var id = '${map.id}';
		var num = $("input[name='numbs']").val();
		$.post("addShopcar.html", {id:id,num:num}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('添加成功');
				window.location.reload();
			} else {
				
			}
		});
	}

function save(src) {
  		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/register.html';
			return false;
		}
		$.post("productPinglunSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
</script>
</html>
