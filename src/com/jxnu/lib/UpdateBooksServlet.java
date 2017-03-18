package com.jxnu.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 * 本程序用于更新图书信息
 *
 */
@WebServlet("/UpdateBooks")
public class UpdateBooksServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		Connecting_To_Database ctd = new Connecting_To_Database();
		try {
			Connection conn = ctd.getConnection();
			String sql = "update book_info set Book_Name=?,Author=?,Types_Of_Book=?,Price=?,Date_Issued=?, Borrowd=? where Book_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,req.getParameter("Book_Name") );
			ps.setString(2,req.getParameter("Author") );
			ps.setString(3,req.getParameter("Types_Of_Book") );
			ps.setString(4,req.getParameter("Price") );
			ps.setString(5,req.getParameter("Date_Issued") );
			ps.setString(6,req.getParameter("Borrowd") );
			ps.setString(7,req.getParameter("Book_Id"));
			ps.executeUpdate();
			ps.close();
			conn.close();
			
			req.setAttribute("book_id", req.getParameter("Book_Id"));
			req.getRequestDispatcher("ShowBookInfo").forward(req, resp);	
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
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
