package com.jxnu.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsonUse.ReadBookInfoJson;
import com.jxnu.lib.Connecting_To_Database;;

@WebServlet("/FindBooks.do")
public class BooksFindServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		try {

			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding( "utf-8" );
			String bookname = req.getParameter("bookname");
			
			if(bookname=="")
			    req.getRequestDispatcher("Search_page.jsp").forward(req,resp);//空查询返回原页面
			
			Connection conn = Connecting_To_Database.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from book_info where Book_Name like '%"+bookname+"%' order by Borrowd desc";
			ResultSet rs = stmt.executeQuery(sql);
			
			String[] book_info = new String[2];
			ReadBookInfoJson r = new ReadBookInfoJson();//json数据解析准备
			
			ArrayList<Book>list = new ArrayList<Book>();
			while (rs.next()) {
				Book book = new Book();
				book.setBook_Id(rs.getInt("Book_Id"));
				book.setBook_Name(rs.getString("Book_Name"));
				book.setAuthor(rs.getString("Author"));
				book.setTypes_Of_Book(rs.getString("Types_Of_Book"));
				book.setDate_Issued(rs.getString("Date_Issued"));
				book.setBorrowd(rs.getInt("Borrowd"));
				
				String RealPath = req.getServletContext().getRealPath("/")+rs.getString("Book_Info");//获取真实路径
				
				book_info = r.ReadJsonFile(RealPath);
				book.setBook_Info(book_info[1]);
				list.add(book);
			}
			
			req.setAttribute("list", list);
			
			rs.close();
			stmt.close();
			conn.close();
			
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			
		}
		
		req.getRequestDispatcher("Search_page.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doGet(req, resp);
	}
	
	protected void readTxt(){
		
	}
	
	
	
}
