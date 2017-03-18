<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Struct"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jxnu.lib.Connecting_To_Database"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jxnu.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%//权限验证
try{
if(request.getSession().getAttribute("level").toString().equals("0") )
response.sendRedirect("Permission_Denied.jsp");
}
catch(Exception e){
response.sendRedirect("Permission_Denied.jsp");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
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
                <a class="navbar-brand waves-effect waves-dark" href="User_admin.jsp">
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
                        <b>Admin</b>
                        <i class="material-icons right">arrow_drop_down</i>
                    </a>
                </li>
            </ul>

        </nav>
		<!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="index.jsp"><i class="fa fa-desktop fa-fw"></i> 返回主页</a>
            </li>
            <li><a href="UserMain"><i class="fa fa-user fa-fw"></i> 个人信息</a>
            </li>
            <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
            </li>
        </ul>
	    <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a class="waves-effect waves-dark" href="User_admin.jsp"><i class="fa fa-dashboard"></i> 数据总揽</a>
                    </li>
					<li>
                        <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 图表</a>
                    </li>

                    <li>
                        <a class="active-menu waves-effect waves-dark"><i class="fa fa-sitemap"></i> 管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="Add_Books.jsp">添加图书</a>
                            </li>
                            <li>
                                <a href="Search_Book_Admin.jsp">修改图书信息</a>
                            </li>
                            <li>
                                <a href="Add_User_Admin.jsp">添加用户</a>
                            </li>
                            <li>
                                <a href="Search_User_Admin.jsp">修改用户信息</a>
                            </li>
                            <li>
                                <a href="Manage_Others_Admin.jsp">分页面数据管理</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        
        <div id="page-wrapper">
            <div class="header">
                <h1 class="page-header">修改用户信息</h1>
                <ol class="breadcrumb">
                    <li><a href="User_admin.jsp">Mansins</a></li>
                    <li><a>管理</a></li>
                    <li><a>修改用户信息</a></li>
                </ol>
            </div>
            
            <div id="page-inner">
                <div class="row">

                	<div class="col-md-6 col-sm-12 col-xs-12">
                    	<div class="card">
                        	<div class="card-action">基本信息：</div>
                        	<div class="height500 card-content">
                            	<form action="" method="post" accept-charset="UTF-8">
                                	<div class="zitiyanse">
                                    	<p>密码：</p>
                                    	<input name="" class="form-control"  value="密码" required />
                                    	<p>昵称：</p>
                       	             	<input name="" class="form-control"  value="昵称" required />
                                    	<p>联系方式：</p>
                                    	<input name="" class="form-control"  value="联系方式" required />
                                    	<p>称号：</p>
                                    	<input name="" class="form-control"  value="书虫" required />
                                	</div>
                                	<div align="right">
                                    	<input class="waves-effect waves-light btn" name="搜索" type="submit" />
                                	</div>
                            	</form>
                        	</div>
                    	</div>
                	</div>

                	<div class="col-md-4 col-sm-12 col-xs-12">
                    	<div class="card">
                        	<div class="card-action">头像：</div>
                        	<form class="card-content" action="Change_UserImg.jsp" method="post" accept-charset="UTF-8">
                            	<img class="tupian" src="images/5.jpg">
                            	<div align="right">
                                	<input class="waves-effect waves-light btn" name="搜索" type="submit" />
                            	</div>
                        	</form>
                    	</div>
                	</div>

                	<div class="col-md-4 col-sm-12 col-xs-12">
                    	<div class="card">
                        	<div class="card-action">个性签名：</div>
                        	<form class="card-content" name="" action="" method="post" accept-charset="UTF-8">
                            	<p><textarea name="infos" style="resize: none;width:100%;height:165px;" value="　个性签名">　　这个人很懒（°Д°）什么都没有留下！</textarea></p>
                            	<div align="right" style="margin-top:10px;">
                                	<input class="waves-effect waves-light btn" type="submit" />
                            	</div>
                        	</form>
                    	</div>
                	</div>
                	
                </div>
        	</div>
            
        </div>
      
		
    </div>
    <!-- /. WRAPPER  -->
 
  
  </body>
</html>
