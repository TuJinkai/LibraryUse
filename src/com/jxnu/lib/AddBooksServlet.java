package com.jxnu.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.print.DocFlavor.READER;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddBooks")
public class AddBooksServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String sql = "insert into book_info(Book_Name,Author,Types_Of_Book,Price,Date_Issued, Borrowd) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, req.getParameter("Book_Name"));
			ps.setString(2, req.getParameter("Author"));
			ps.setString(3, req.getParameter("Types_Of_Book"));
			ps.setString(4, req.getParameter("Price"));
			ps.setString(5, req.getParameter("Date_Issued"));
			ps.setString(6, req.getParameter("Borrowd"));
			
			int row = ps.executeUpdate();
			if(row>0){
				ps.close();
				conn.close();
				resp.sendRedirect("AddBookSuccessful.jsp");
			}
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println("注册失败");
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
