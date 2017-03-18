<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>请先登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/Registered_Success.css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <style>
        * {
            font-family: 微软雅黑;
        }
        body{
            padding-top: 200px;
            background-color: #eee;
        }
        .navbar-nav > li > a {
            font-size: 18px;
        }
    </style>

</head>
<body>

<nav class="mavbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <div class="navbar-header">
                    <img src="images/P4.png">
                </div>
                <li><a href="index.jsp">首页</a></li>
				<li><a href="others/NewBook_HOT.jsp">新书热搜</a></li>
				<li><a href="others/OldBook_HOT.jsp">名人名著</a></li>
				<li><a href="others/XueXi_ZiLiao.jsp">学习资料</a></li>
            </ul>
        </div>
    </div>
</nav>

<div>
    <div style="font-weight: bold;font-size: 18px" align="center">
        <img src="images/GTH.png">
        <p>尊敬的用户，请您<span style="color: #dd4d40;font-size: 20px;">登录</span>后再进行操作！</p>
    </div>
    <div align="center">
        <a href="Login.html"><button class="btn btn-lg btn-info bt2" type="submit">去登录</button></a>
    </div>
</div>

    

</body>
</html>
