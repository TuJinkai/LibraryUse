<%@page import="java.util.Date"%>
<%@page import="org.omg.CORBA.Current"%>
<%@page import="java.text.Format"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddUser-bean.jsp' starting page</title>
    
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
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="user" class="com.jxnu.lib.User"></jsp:useBean>
    <jsp:setProperty property="*" name="user"/>
    
    <%
    	try{
    			Class.forName("com.mysql.jdbc.Driver");
       			String url = "jdbc:mysql://tjkftp.top:3507/demo?useSSL=false&characterEncoding=UTF-8";
       			String username = "root";
       			String password = "";
       			Connection conn = DriverManager.getConnection(url, username, password);//创建连接
       			String sql = "insert into user(Id,Name,Password,Tel,Registration_time) values(?,?,?,?,?)";
       			
       			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       			Date time = new Date();
       			String Registration_time = time.toString();
       			
       			String Pages = request.getParameter("Pages");//来自页面的标记参数Pages
       			
       			//out.print(R_time);
       			PreparedStatement ps = conn.prepareStatement(sql);
       			ps.setString(1, request.getParameter("Id") );
       			ps.setString(2, request.getParameter("Name") );
       			ps.setString(3, request.getParameter("Password") );
       			ps.setString(4, request.getParameter("Tel"));
       			ps.setString(5, Registration_time);
       			int row = ps.executeUpdate();
       			if(row>0){
       			out.print("注册成功");
       			}
       			ps.close();
       			conn.close();

       				response.sendRedirect("Registered_Success.html");
     
       		}
       		catch (Exception e){
       		out.print("注册失败"+"  "+request.getParameter("Id")+"：该帐号已存在或为空");
       		e.printStackTrace();
       		}
       			
     %>
  </body>
</html>
