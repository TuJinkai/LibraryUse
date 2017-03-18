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


<%
if(request.getAttribute("Name")==null){
response.sendRedirect("UserMain");
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
                        <b><%=request.getAttribute("Name") %></b>
                        <i class="material-icons right">arrow_drop_down</i>
                    </a>
                </li>
            </ul>

        </nav>
		<!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
        	<li><a href="index.jsp"><i class="fa fa-desktop fa-fw"></i> 返回主页</a>
        	</li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
            </li>
            <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
            </li>
        </ul>
	    <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                
                    <li>
                        <a href="User_yonghu.jsp" class="active-menu waves-effect waves-dark"><i class="fa fa-user fa-fw"></i> 个人中心</a>
                    </li>
					<li>
                        <a href="ShowCollect" class="waves-effect waves-dark"><i class="fa fa-book fa-fw"></i> 收藏</a>
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
                <h1 class="page-header">个人中心</h1>
                <ol class="breadcrumb">
                    <li><a href="User_yonghu.jsp">Mansins</a></li>
                    <li><a>个人中心</a></li>
                </ol>
            </div>

            <div id="page-inner">
                <div class="row">

                    <div class="width65 col-md-6 col-sm-12 col-xs-12">
                    	<div class="card">
                    	
                        	<div class="height500 card-content">
                        	    <div class="">
            						<img class="cover shadow-cover" src="<%=request.getAttribute("Img") %>">
        							<div class="username">
        								<p class="article-title"><b><%=request.getAttribute("Name") %></b></p>
										<div class="article-meta">
                							<p><b>称号:</b>
                    							<span class="labeled-text"><%=request.getAttribute("Nick_Name") %></span>
                							</p>
                							<p><b>ID:</b>
                    							<span class="labeled-text"><%=request.getSession().getAttribute("Id")%></span>
                							</p>
            							</div>
        							</div>
                        	    </div>
                        	    <div class="Martop20">
                        	    	<br><p><b>个人简介：</b></p>
                            		<textarea disabled="disabled" style="resize: none;border:none;background:#fffff9;width:100%;height:60%;">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("User_Info") %></textarea>
                        		</div>
                        	</div>
						    
						</div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark">
						   	<div class="card-image red">
						        <i class="fa fa-book fa-5x"></i>
						    </div>
                            <div class="card-stacked">
						     	<div class="card-content">
						    		<h3><%=request.getAttribute("CollectNumber") %></h3>
						   		</div>
						  		<div class="card-action">
						        	<strong> 已收藏</strong>
						        </div>
						    </div>
						</div>
					</div>
               		
                </div>
                <!-- /. ROW  -->
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
 
  
  </body>
</html>
