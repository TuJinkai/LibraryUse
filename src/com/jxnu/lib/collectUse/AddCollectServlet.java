package com.jxnu.lib.collectUse;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jxnu.lib.Connecting_To_Database;

@WebServlet("/AddCollect")
public class AddCollectServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		Date time = new Date();
		String Time = time.toString();//提取系统时间
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "insert into collect_record (Book_Id,User_Id,Record_Time) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("Book_Id"));
			ps.setString(2, req.getSession().getAttribute("Id").toString());
			ps.setString(3, Time);
			
			int row = ps.executeUpdate();
			if(row>0){
				ps.close();
				conn.close();
				resp.sendRedirect("BookMain?book_id="+req.getParameter("Book_Id"));
			}
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("收藏失败");
			req.setAttribute("Book_Id", req.getParameter("Book_Id"));
			req.getRequestDispatcher("Collect_BeDefeated.jsp").forward(req, resp);
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doGet(req, resp);
	}
	

}
