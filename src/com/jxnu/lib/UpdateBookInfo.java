package com.jxnu.lib;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsonUse.ReadBookInfoJson;
import jsonUse.UseJsonFile;

@WebServlet("/UpdateBookInfo")
public class UpdateBookInfo extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		String[] bookinfo = new String[2];
		bookinfo[0] = req.getParameter("book_id");
		bookinfo[1] = req.getParameter("infos");

			

			UseJsonFile usj = new UseJsonFile();
			usj.UpdateJsonFile("Book_Info_"+req.getParameter("book_id")+".json", req.getServletContext().getRealPath("/")+"book_info", bookinfo);

			
			req.setAttribute("book_id", bookinfo[0]);
			req.setAttribute("infos", bookinfo[1]);
			req.getRequestDispatcher("ShowBookInfo").forward(req, resp);
			
			


	}


		
	

}
