package com.jxnu.lib.CommentsUse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jxnu.lib.Connecting_To_Database;

@WebServlet("/AddComments")
public class AddCommentsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		Date time = new Date();
		String Time = time.toString();//提取系统时间
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "insert into comments (Book_Id,User_Id,Comments_Time,Comments_Info,User_Name,User_Img) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("Book_Id"));
			ps.setString(2, req.getSession().getAttribute("Id").toString());
			ps.setString(3, Time);
			ps.setString(4, req.getParameter("Comments_Info"));
			ps.setString(5, req.getSession().getAttribute("User_Name").toString());
			ps.setString(6, FindUserImg(req.getSession().getAttribute("Id").toString()));
			
			int row = ps.executeUpdate();
			if(row>0){
				ps.close();
				conn.close();
				resp.sendRedirect("BookMain?book_id="+req.getParameter("Book_Id"));
			}
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("失败");
			req.setAttribute("Book_Id", req.getParameter("Book_Id"));
			req.getRequestDispatcher("Collect_BeDefeated.jsp").forward(req, resp);
			e.printStackTrace();
		}
		
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	//搜索人物头像并返回
	protected String FindUserImg(String User_Id){
		
		String User_Img = "images/Book_Main_imgs/demo.jpg";
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "select * from user where Id='"+User_Id+"'";
			Statement stmt = conn.createStatement();//获取Statement对象
			ResultSet rs = stmt.executeQuery(sql);
			
			
			while(rs.next()){
				User_Img = rs.getString("Img");
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return User_Img;
		
		
		
	}
	
	

}
