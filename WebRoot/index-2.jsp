<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	
	
	
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <%=request.getServletContext().getRealPath("/") %>
  <br><%=Thread.currentThread().getContextClassLoader().getResource("").getPath()%>
    This is my JSP page. <br>
     
     <form action="ShowBookInfo" method="post" accept-charset="UTF-8">
     	输入图书编号：<input name="book_id"  type="1" class="form-control"  placeholder="请输入图书编号" required />
     	<input name="搜索" type="submit" />
     </form>
     
     <form action="" method="post" enctype="multipart/form-data">
       <input type="file">
     </form>
     
     <br> <a href="http://localhost:8080/LibraryUse/AddUser.jsp">注册</a>
  </body>
</html>
