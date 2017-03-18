<%@page import="java.net.URLDecoder"%>
<%@page import="javax.activation.URLDataSource"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.jxnu.lib.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/styleS.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="css/Main.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/Main_bright.css" rel="stylesheet" type="text/css" media="all" />

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<style>
		@font-face {
			font-family: 'ziti';
			src: url('fonts/ziti.eot'),
			url('fonts/ziti.woff'),
			url('fonts/ziti.ttf'),
			url('fonts/ziti.svg#ziti');
		}
		table{
			table-layout: fixed;
			width: 100%;
		}
		body{
			padding-top: 50px;
		}
		.nav{
			font-family: 微软雅黑;
		}
	</style>

</head>
<body>

	<!-- 导航栏 -->
	<nav class="mavbar navbar-fixed-top" style="background-color: #949494">
	

		<div class="">
			<div id="navbar" class="navs collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<div class="navbar-header">
						<img src="images/P5_White.png">
					</div>
					<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="index.jsp">返回主页</a>
					</li>
				</ul>
				<form class="navbar-form" role="form" action="FindBooks.do" accept-charset="UTF-8" method="post">
					<input  placeholder="搜索图书" name="bookname" class="search-control">
					<button type="submit" value="Search" class="button" >查询</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- //导航栏 -->

	<div id="main-panel" style="">
		<div id="result-panel">
			<div><br><br><br></div>

				<!--左边的空div-->
				<div id="result-panel-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
				<!--//左边的空div-->

				<!--搜索结果-->
				<div id="google-panel" class="google-panel-width-narrow" style="vertical-align:top; display: inline-block;">
					<table style="width:100%">
						<tbody>
							<tr>
								<td style="height: 20px;">
									<span id="priced-filter1"><h4>搜索结果</h4></span>
								</td>
							</tr>
							<tr>
								<td style="width: 100%">
									<div id="google-div">
										<div id="google-result-div" style="position: relative">
											<ul id="result-ul">
												<li style="line-height: 1.4;">
													<%
														// 获取图书信息集合
															ArrayList<Book>list = (ArrayList<Book>)request.getAttribute("list");
														// 判断集合是否有效
															if(list == null || list.size() < 1){
																out.print("Sorry！没有找到相关书籍~");
															}else{
														// 遍历图书集合中的数据
															for(Book book : list){
													%>

													<div style="margin-bottom: 22px;">
														<div>
															<a href="BookMain?book_id=<%=book.getBook_Id() %>" onclick="return localbook_click(this);" ;="">
																<span id="d1" class="span-d" style="font-family: 'ziti';" onmouseover="this.style.color='#747474'" onmouseout="this.style.color='black'"><%=book.getBook_Name()%></span>
															</a>
														</div>
														<div class="span-de" style="overflow-y:hidden;max-height:60px;">简介：<%=book.getBook_Info() %></div>
														<div class="span-des">作者：<%=book.getAuthor() %>&nbsp;&nbsp;类型：<%=book.getTypes_Of_Book() %>&nbsp;&nbsp;出版日期:<%=book.getDate_Issued()%>&nbsp;&nbsp;书号:<%=book.getBook_Id()%>&nbsp;&nbsp;历史借阅人数:<%=book.getBorrowd()%> </div>
													</div>
														<%
																}
															}
														%>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--//搜索结果-->

				<!--右边的空div-->
				<div id="result-panel-right">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
				<!--//右边的空div-->

			</div>
		</div>

</body>
</html>
