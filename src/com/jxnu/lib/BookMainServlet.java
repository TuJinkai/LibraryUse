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

/**
 * @author Tujk
 * @Target 函数用于显示bookinfo页面 也就是图书详情
 *
 */
@WebServlet("/BookMain")
public class BookMainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		
		//判定该书属否被收藏
		String collectd = "0";
		try {
			collectd = UseCollect(req.getSession().getAttribute("Id").toString(), req.getParameter("book_id"));
		} catch (Exception e) {
			System.out.println("来自未登录用户的访问");
		}
		//防止未登录状态出现的异常，使用try-catch块
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String Book_Id = req.getParameter("book_id");
			
			Statement stmt = conn.createStatement();
			String sql = "select * from book_info where Book_Id = '"+Book_Id+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			
			String[] book_info = new String[2];
			ReadBookInfoJson r = new ReadBookInfoJson();//json数据解析准备
			

			while (rs.next()) {
				String Book_Name = rs.getString("Book_Name");
				String Author = rs.getString("Author");
				String Types_Of_Book = rs.getString("Types_Of_Book");
				String Date_Issued = rs.getString("Date_Issued");
				int Price = rs.getInt("Price");
				int Borrowd = rs.getInt("Borrowd");
				
				//图像和文字介绍
				String RealPath = req.getServletContext().getRealPath("/")+rs.getString("Book_Info");//获取真实路径
				book_info = r.ReadJsonFile(RealPath);
				String Book_Img =rs.getString("Book_Img");//图片路径
				
				req.setAttribute("Book_Name", Book_Name);
				req.setAttribute("Book_Id", rs.getString("Book_Id"));
				req.setAttribute("Author", Author);
				req.setAttribute("Types_Of_Book", Types_Of_Book);
				req.setAttribute("Date_Issued", Date_Issued);
				req.setAttribute("Price", Price);
				req.setAttribute("Borrowd", Borrowd);
				req.setAttribute("book_info", book_info[1]);
				req.setAttribute("Book_Img", Book_Img);
				req.setAttribute("collectd", collectd);
				
				req.getRequestDispatcher("BookInfo.jsp").forward(req, resp);
				
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	//用于判断该书是否被收藏，并返回一个String类型 0或者1 表示是否被收藏
	private static String UseCollect(String Id,String Book_Id){
		
		String collect="0";
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from collect_record where Book_Id = '"+Book_Id+"' and User_Id = '"+Id+"'";
			ResultSet ps = stmt.executeQuery(sql);
			if(ps.next())
				collect="1";
			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		return collect;	
	}
	
	

}
