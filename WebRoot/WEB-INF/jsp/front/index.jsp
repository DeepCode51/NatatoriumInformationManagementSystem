<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="inc/inc_css.jsp" %>

<body>
	<!--Top-->
	<%@include file="inc/inc_head.jsp" %>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" ></a></div>
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<c:forEach items="${list3 }" var="lists" varStatus="vs">
								<div class="item ${vs.index==0?'active':'' }">
									<img  style="width: 100%" src="${ctx}/${lists.pic}" alt="First slide">
									<!-- Static Header -->
									<div class="header-text hidden-xs">
										<div class="col-md-12 text-center">
										</div>
									</div><!-- /header-text -->
								</div>
							</c:forEach>
							
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			<div class="row">
				<div id="sidebar" class="col-md-12">
					<div class="widget wid-categories">
						<div class="heading"><h4>最新新闻资讯</h4></div>
						<div class="content">
							<ul>
								<c:forEach items="${list }" var="listss">
									<li><a href="zxShow.html?id=${listss.id }">${listss.title }</a></li>
                                </c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="inc/inc_foot.jsp" %>
</body>
</html>
