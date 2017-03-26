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
<title>Home</title>

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
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
<!-- //CSS样式 -->

<!-- 字体 -->
<link href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //字体 -->

<!-- JS样式 -->
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!-- //JS样式 -->

	<style>
		body{
			padding-top: 50px;
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
					<img src="images/P4.png">
				</div>
				<li class="active"><a href="#">首页</a></li>
				<li><a href="others/NewBook_HOT.jsp">新书热搜</a></li>
				<li><a href="others/OldBook_HOT.jsp">名人名著</a></li>
				<li><a href="others/XueXi_ZiLiao.jsp">学习资料</a></li>
			</ul>
			<form class="navbar-form navbar-right" role="form" action="FindBooks.do" accept-charset="UTF-8" method="post">
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
						<li><a href="loginPage.action" role="menuitem">登录</a></li>
						<li><a href="registered.html" role="menuitem">注册</a></li>
					</ul>
					
					<%} %>

					
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- //导航栏 -->

	<div class="banner">
		<div class="container">
			<div class="banner-info">
				<h2>店铺名称</h2>
				<p>漫行，因你而存在</p>
			</div>
		</div>
	</div>

<!-- 欢迎介绍 -->
	<div class="about" id="about">
		<div class="container">
			<div class="about-grids">
				<div class="col-md-5 w3_about_grid_left">
					<h3>Welcome <span>To</span> <i>Mansins</i></h3>
				</div>
				<div class="col-md-7 about_grid_right_w3agile">
					<p>介绍语：某某书店致力于为广大读者营造更加舒适、宁静的阅读环境，让读者能够在快节奏的生活当中静下心来，享受阅读的快乐
						<span>宣传语：即使要爬到最高的山上，一次也只能脚踏实地地迈一步，选择一本合适的书则是每一步的基础，为你的成功奠定最最坚实的基础
						宣传语：即使要爬到最高的山上，一次也只能脚踏实地地迈一步，选择一本合适的书则是每一步的基础，为你的成功奠定最最坚实的基础
						宣传语：即使要爬到最高的山上，一次也只能脚踏实地地迈一步，选择一本合适的书则是每一步的基础，为你的成功奠定最最坚实的基础</span></p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //欢迎介绍 -->

<!-- 新书速递 -->
	<div class="portfolio" id="portfolio">
		<div class="container">
			<h3>新书速递</h3>
			<p class="aut">这里有最快的资讯！</p>
			<div class="width70 portfolio_grid_w3lss">
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/img2014002033.jpg">
							<img src="images/Book_Main_imgs/img2014002033.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/demo.jpg">
							<img src="images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/img2014002025.jpg">
							<img src="images/Book_Main_imgs/img2014002025.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/demo.jpg">
							<img src="images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/demo.jpg">
							<img src="images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/img2014002034.jpg">
							<img src="images/Book_Main_imgs/img2014002034.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/demo.jpg">
							<img src="images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/img2014002033.jpg">
							<img src="images/Book_Main_imgs/img2014002033.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/img2014002022.jpg">
							<img src="images/Book_Main_imgs/img2014002022.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="col-md-4 portfolio_grid_w3ls photoHOT marright20">
					<div class="view second-effect photoHOT">
						<a class="zb photoHOT" href="images/Book_Main_imgs/demo.jpg">
							<img src="images/Book_Main_imgs/demo.jpg" class="photoHOT img-responsive" />
							<div class="mask photoHOT">
								<p>那些事（东方大厦）</p>
							</div>
						</a>	
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
				<script type="text/javascript" src="js/jquery.zbox.min.js"></script>
				<script type="text/javascript">
				  jQuery(document).ready(function(){
					jQuery(".zb").zbox( { margin:40 } );
				  });
				</script>
		</div>
	</div>
<!-- //新书速递 -->

<!-- 视频 -->
	<div class="portfolio-video">
		<div class="container">
			<h3>书店宣传视频</h3>
			<p>这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介
				这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介
				这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介这里是宣传视频的简介</p>
			<h4>观看视频</h4>
			<a class="play-icon popup-with-zoom-anim" href="#small-dialog"><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span></a>
					<!-- pop-up-box -->    
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" property="" media="all" />
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!--//pop-up-box -->
					<div id="small-dialog" class="mfp-hide">
						<iframe src=""></iframe>
					</div>
					<script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
						});
					</script>
		</div>
	</div>
<!-- //视频 -->

<!-- 致信 -->
	<div class="contact" id="mail">
		<div class="container">
			<h3>致信书店</h3>
			<p class="aut">请向我们书店提出您宝贵的建议吧！</p>
			<div class="contact-grids">
				<div class="col-md-6 contact-grid">
					<form action="#" method="post">
						<input type="text" value="姓名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '姓名';}">
					</form>
				</div>
				<div class="col-md-6 contact-grid">
					<form action="#" method="post">
						<input type="text" value="联系方式" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '联系方式';}">
					</form>
				</div>
				<div class="clearfix"> </div>
				<form action="#" method="post">
					<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '内容...';}">内容...</textarea>
					<input type="submit" value="发送">
				</form>
			</div>
		</div>
	</div>
<!-- //致信 -->

<!-- 作品相关 -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid">
					<h3>关于我们</h3>
					<p>制作：Mansins 小组<span>作品：Mansins 漫行</span></p>
				</div>
				<div class="col-md-3 footer-grid">
					<h3>关于作品</h3>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>诞生地：江西师大 先骕楼X3507</li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>邮箱：保密</li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>联系方式：保密</li>
					</ul>
				</div>
				<div class="col-md-4 footer-grid">
					<h3>联系我们</h3>
					<form action="#" method="post">
						<input type="email" name="Phone" value="联系方式" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '联系方式';}" required="">
						<input type="submit" value="发送">
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //作品相关 -->

<!-- 返回顶部 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
			});
	</script>
<!-- //返回顶部 -->

</body>
</html>