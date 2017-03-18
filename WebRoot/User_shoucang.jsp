<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Struct"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jxnu.lib.Connecting_To_Database"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jxnu.*" %>
<%@page import="com.jxnu.lib.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
try{
//登录验证
String Session = request.getSession().getAttribute("Id").toString();
if(Session==null)
	response.sendRedirect("Please_Login.jsp");}
	catch(Exception e){
	//出现异常时直接转入Please_Login.jsp
	response.sendRedirect("Please_Login.jsp");
	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
    <link href="assets/css/User.css" rel="stylesheet" />

    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/easypiechart.js"></script>
    <script src="assets/js/easypiechart-data.js"></script>
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    <!-- echarts Js -->
    <script src="assets/js/echarts.js"></script>

    <style>
        *{
            font-family: 微软雅黑;
        }
    </style>
	

  </head>
  
  <body>
  
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="User_yonghu.jsp">
                    <i class="large material-icons">insert_chart</i>
                    <strong>Mansins</strong>
                </a>
                <div id="sideNav" href="">
                    <i class="material-icons dp48">toc</i>
                </div>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <a class="dropdown-button waves-effect waves-dark" data-activates="dropdown1">
                        <i class="fa fa-user fa-fw"></i>
                        <b>User</b>
                        <i class="material-icons right">arrow_drop_down</i>
                    </a>
                </li>
            </ul>

        </nav>
		<!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
        	<li><a href="#"><i class="fa fa-desktop fa-fw"></i> 返回主页</a>
        	</li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
            </li>
            <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
            </li>
        </ul>
	    <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                
                    <li>
                        <a href="User_yonghu.jsp" class="waves-effect waves-dark"><i class="fa fa-user fa-fw"></i> 个人中心</a>
                    </li>
					<li>
                        <a href="ShowCollect" class="active-menu waves-effect waves-dark"><i class="fa fa-book fa-fw"></i> 收藏</a>
                    </li>
                    <li>
                        <a href="ShowUserInfo" class="waves-effect waves-dark"><i class="fa fa-gear fa-fw"></i> 修改资料</a>
                    </li>
                    <li>
                        <a class="waves-effect waves-dark"><i class="fa fa-sitemap fa-fw"></i> 消息<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#"> 系统消息</a>
                            </li>
                            <li>
                                <a href="#"> 评论消息</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
            <div class="header">
                <h1 class="page-header">收藏</h1>
                <ol class="breadcrumb">
                    <li><a href="User_yonghu.jsp">Mansins</a></li>
                    <li><a>收藏</a></li>
                </ol>
            </div>

            <div id="page-inner">
                <div class="row">
					
					<div class="widthmax col-md-6 col-sm-12 col-xs-12">
                    	<div class="card">
                        	<div class="card-action">已收藏：</div>
                        	<div class="minheight500 card-content">
                        	
                        	<%
								// 获取图书信息集合
										ArrayList<Book>list = (ArrayList<Book>)request.getAttribute("list");
								// 判断集合是否有效
										if(list == null || list.size() < 1){
												out.print("你暂时没有收藏哦~");
											}else{
									// 遍历图书集合中的数据
									for(Book book : list){
							%>
                        	
								<div class="col-md-4 Marbottom40">
            						<img class="cover_shoucang shadow-cover" src="<%=book.getBook_Img() %>">
        							<div class="username">
        								<p class="article-title"style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><b><%=book.getBook_Name() %></b></p>
										<div class="article-meta">
                							<p><b>定价</b>
                    							<span class="labeled-text"><%=book.getPrice()%>￥</span>
                							</p>
                							<p><b>借阅次数</b>
                    							<span class="labeled-text"><%=book.getBorrowd() %></span>
                							</p>
                							<a class="btn" href="BookMain?book_id=<%=book.getBook_Id()%>">详情</a>
                							<a class="btn btnred " href="DeleteCollect?Book_Id=<%=book.getBook_Id()%>&page=User_shoucang.jsp">删除</a>
                						</div>
                					</div>
                				</div>
                				
                				<%
									}
										}
						%>

                				

                				
                			</div>
                        </div>
					</div>
					
                </div>
                <!-- /row -->
            </div>
            <!-- /page-inner -->
            
        </div>
        <!-- /page-wrapper -->
    </div>
    <!-- /wrapper -->
 
  
  </body>
</html>
