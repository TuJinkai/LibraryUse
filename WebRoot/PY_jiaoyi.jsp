<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BookInfo</title>
    
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
    <link href="css/BookInfo.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/star.css" rel="stylesheet" type="text/css" media="all" />

    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/FX.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        table{
            table-layout: fixed;
            width: 100%;
        }
        body{
            background-color: #fffff9;
        }
        .nav{
            font-family: 微软雅黑;
        }
    </style>

  </head>
  
  <body>
<!-- 导航栏 -->
<nav class="bigM">
    <div class="m">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <div class="navbar-header">
                    <img class="P4" src="images/P4_White.png">
                </div>
                <div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
            </ul>
            <form class="navbar-form" role="form"  action="FindBooks.do"   method="post" accept-charset="UTF-8">
                    <input type="text" placeholder="书名/作者/出版社/类型/专栏" class="search-control bt1" name="bookname">
                    <a class="bt1" href=""><input type="image" class="BT" src="images/BT.jpg" border="0" onmouseover="this.src='images/BT1.jpg'" onmouseout="this.src='images/BT.jpg'"></a>
            </form>
        </div>
    </div>
</nav>
<!-- //导航栏 -->

<!-- 二级导航栏 -->
<nav class="bigm">
    <div class="m2">
        <ul class="nav2 nav">
            <a href="" class="n1">原创</a>
            <a href="" class="n1">分类</a>
            <a href="" class="n1">专栏</a>
            <a href="" class="n1">连载</a>
            <a href="" class="n1">免费</a>
            <a href="Login.html"  class="n2">登录</a>
			<a href="index.jsp" class="n2">返回主页</a>
        </ul>
    </div>
</nav>
<!-- //二级导航栏 -->

<div style="margin-top:100px">
    <div style="font-weight: bold;font-size: 18px;" align="center">
        <img style="max-width:15%" src="images/PY_jiaoyi.jpg">
        <p>扫描上方<span style="color: #2196f3;font-size: 20px;">二维码</span>即可进行支付！</p>
    </div>
    <div align="center">
        <a href="index.jsp"><button class="btn btn-lg btn-info bt2" type="submit">返回首页</button></a>
    </div>
</div>

</body>
</html>
