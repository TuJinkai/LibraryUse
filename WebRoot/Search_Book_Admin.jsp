<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改图书信息</title>
    
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

    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/materialize/js/materialize.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
    <script src="assets/js/easypiechart.js"></script>
    <script src="assets/js/easypiechart-data.js"></script>
    <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
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
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="User_admin.jsp">
                <i class="large material-icons">insert_chart</i>
                <strong>Mansins</strong></a>
            <div id="sideNav" class="waves-effect waves-dark" href="">
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
        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
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
                    <a href="#" class="active-menu waves-effect waves-dark"><i class="fa fa-sitemap"></i> 管理<span class="fa arrow"></span></a>
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
            <h1 class="page-header">搜索图书</h1>
            <ol class="breadcrumb">
                <li><a href="User_admin.jsp">Mansins</a></li>
                <li><a>管理</a></li>
                <li><a>搜索图书</a></li>
            </ol>
        </div>

        <div id="page-inner">

            <div class="row">
                <div class="widthmax col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="card-action">搜索图书：</div>
                        <form class="card-content" action="ShowBookInfo" method="post" accept-charset="UTF-8">
                            <input name="book_id" class="form-control"  placeholder="请输入图书编号" required />
                            <div align="right">
                                <input class="waves-effect waves-light btn" name="搜索" type="submit" />
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>


</body>
</html>
