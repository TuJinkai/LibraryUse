<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>

<base href="<%=basePath%>">
<title>学习资料</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- CSS样式 -->
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
<!-- //CSS样式 -->

<!-- 字体 -->
<link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //字体 -->

<!-- JS样式 -->
<script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/move-top.js"></script>
<script type="text/javascript" src="./js/easing.js"></script>
<!-- //JS样式 -->

	<style>
		body{
			background-color:#fffff9;
		}
		.nav{
			font-family: 微软雅黑;
		}
	</style>

</head>
	
<body>

<!-- 导航栏 -->
<nav class="mavbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<div class="navbar-header">
					<img src="./images/P4.png">
				</div>
				<li><a href="./index.jsp">首页</a></li>
				<li><a href="others/NewBook_HOT.jsp">新书热搜</a></li>
				<li><a href="others/OldBook_HOT.jsp">名人名著</a></li>
				<li class="active"><a href="others/XueXi_ZiLiao.jsp">学习资料</a></li>
			</ul>
			<form class="navbar-form navbar-right" role="form" action="./FindBooks.do" accept-charset="UTF-8" method="post">
				<div class="form-group">
					<input placeholder="搜索图书" name="bookname" class="form-control">
				</div>
				<button type="submit" class="btn btn-group-lg">搜索</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					
					<%Cookie[] cookies = request.getCookies();
							String values = null;
							String url = null;
							boolean judge = false; //判断cookie是否存在和是否符合规范的Boolean值
							if(cookies != null){  %>
							
							<%							
								
								
								for(Cookie cookie : cookies){
								if(cookie.getName().equals("Name")){
								values = cookie.getValue();
								judge = true;
								}
								if(cookie.getName().equals("url")){
								url = cookie.getValue();
								}
								
							
							
						    }} %>
						    
						    <%String Id = (String)request.getSession().getAttribute("Id"); if(Id==null) judge=false;else judge=true; %>
						     
						     
						     <%if(judge==true) {%>
						     
						     <a class="dropdown-toggle" data-toggle="dropdown" ><%  out.println(URLDecoder.decode(values, "UTF-8")); %><span class="caret"></span></a>
						     
						     <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							 	<li><a href="<%=url %>" role="menuitem">信息界面</a></li>
								<li class="divider"></li>
								<li><a href="Logout" role="menuitem">退出登录</a></li>
							</ul>
						     
						     <% } %>
							
							
					<%if (judge==false){ %>
					<a class="dropdown-toggle" data-toggle="dropdown">登录/注册<span class="caret"></span></a>

					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						<li><a href="Login.html?LastUrl=index.jsp" role="menuitem">登录</a></li>
						<li><a href="registered.html" role="menuitem">注册</a></li>
					</ul>
					
					<%} %>

					
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- //导航栏 -->

<!-- 新书速递 -->
	<div class="portfolio" id="portfolio">
		<div class="container">
			<h3>新进资料</h3>
			<div class="width70 portfolio_grid_w3lss">
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //新书速递 -->

<!-- 热搜图书 -->
<div class="portfolio" id="portfolio">
	<div class="container">
		<h3>资料热搜</h3>
		<div class="width70 portfolio_grid_w3lss">
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="">
							<img src="./images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
	</div>
</div>
<!-- //热搜图书 -->

<!-- 返回顶部 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
			});
	</script>
<!-- //返回顶部 -->

</body>
</html>