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
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
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
    
    <script type="text/javascript" src="js/Password.js"></script>

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
                        <a href="User_shoucang.jsp" class="waves-effect waves-dark"><i class="fa fa-book fa-fw"></i> 收藏</a>
                    </li>
                    <li>
                        <a href="User_ChangeInfo.jsp" class="active-menu waves-effect waves-dark"><i class="fa fa-gear fa-fw"></i> 修改资料</a>
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
                <h1 class="page-header">修改密码</h1>
                <ol class="breadcrumb">
                    <li><a href="User_yonghu.jsp">Mansins</a></li>
                    <li><a>修改密码</a></li>
                </ol>
            </div>

            <div id="page-inner">
                <div class="row">

                    <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="card-action">修改密码：</div>
                        <div class="card-content">
                            <form action="" method="post" accept-charset="UTF-8" onSubmit="return Validator.Validate(this,2)">
                                <div class="zitiyanse">
                                    <p>旧密码：</p>
                                    <input type="password" name="" class="form-control" placeholder="旧密码" required />
                                    <p>新密码：</p>
                                    <input type="password" onblur="if(this.value.length<6){alert('密码不能小于6位')}" name="Password" dataType="SafeString" msg="密码不符合安全规则（密码要求大写字母、小写字母、数字、特殊字符中最少包含2种）" class="form-control" placeholder="新密码" required>
                                    <p>确认新密码：</p>
            						<input type="password" name="Repeat" dataType="Repeat" to="Password" msg="两次输入的密码不一致" class="form-control" placeholder="确认密码" required>
                                </div>
                                <div align="right">
                                    <input class="waves-effect waves-light btn" type="submit" value="确定" />
                                </div>
                            </form>
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
