package com.jxnu.lib.collectUse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jxnu.lib.Connecting_To_Database;

@WebServlet("/DeleteCollect")
public class DeleteCollectServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		String page = req.getParameter("page");//不同页面跳转控制
		System.out.println("取消收藏请求来自"+page);
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "delete from collect_record where Book_Id=?  and User_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("Book_Id"));
			ps.setString(2, req.getSession().getAttribute("Id").toString());
			
			int row = ps.executeUpdate();
			if(row>0){
				ps.close();
				conn.close();
				


				if(page.equals("User_shoucang.jsp"))//跳转回原页面 User_shoucang.jsp
					resp.sendRedirect("ShowCollect");
				else if(page.equals("BookInfo.jsp"))//跳转回原页面 BookInfo.jsp
				    resp.sendRedirect("BookMain?book_id="+req.getParameter("Book_Id"));

				
				
			}
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("取消收藏失败");
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
