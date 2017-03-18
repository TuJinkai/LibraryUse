package com.jxnu.lib;
import java.sql.*;

public class Connecting_To_Database {
	public static Connection getConnection() throws Exception{
		
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://tjkftp.top:3507/demo?useSSL=false&characterEncoding=UTF-8";
			String username = "root";
			String password = "";
			Connection conn = DriverManager.getConnection(url, username, password);//创建连接
			if(conn != null)
			System.out.println("数据库连接成功");
			return conn;
		
	}

}
