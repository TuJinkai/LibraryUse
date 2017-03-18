package com.jxnu.lib.CommentsUse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jxnu.lib.Connecting_To_Database;

@WebServlet("/DeleteComments")
public class DeleteCommentsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "delete from comments where Book_Id=?  and User_Id=? and Comments_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("Book_Id"));
			ps.setString(2, req.getParameter("User_Id"));
			ps.setString(3, req.getParameter("Comments_Id"));
			ps.executeUpdate();
			
			ps.close();
			conn.close();
			
			resp.sendRedirect("BookMain?book_id="+req.getParameter("Book_Id"));
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("É¾³ýÆÀÂÛÊ§°Ü");
			resp.sendRedirect("BookMain?book_id="+req.getParameter("Book_Id"));
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
