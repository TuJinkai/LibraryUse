package com.jxnu.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserMain")
public class UserMainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		try{
			//获取用户收藏图书数量
			int CollectNumber = CollectNumberView(req.getSession().getAttribute("Id").toString());
			
			//连接数据库
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "select * from user where Id ='"+req.getSession().getAttribute("Id").toString()+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				req.setAttribute("Name", rs.getString("Name"));
				req.setAttribute("Nick_Name", rs.getString("Nick_Name"));
				req.setAttribute("User_Info", rs.getString("User_Info"));
				req.setAttribute("Img", rs.getString("Img"));
				req.setAttribute("CollectNumber", CollectNumber);
				
				req.getRequestDispatcher("User_yonghu.jsp").forward(req, resp);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			

			}catch (Exception e){
			e.printStackTrace();
			//出现异常时直接转入Please_Login.jsp
			resp.sendRedirect("Please_Login.jsp");
			}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	//获取用户收藏图书数量
	protected static int CollectNumberView(String Id){
		
		int CollectNumber = 0;
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from collect_record where  User_Id = '"+Id+"'";
			ResultSet ps = stmt.executeQuery(sql);
			
			while(ps.next()){
				CollectNumber++;
			}

			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return CollectNumber;
	}
	

}
