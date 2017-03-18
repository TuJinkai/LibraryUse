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

import jsonUse.ReadBookInfoJson;
import jsonUse.UseJsonFile;

@WebServlet("/ShowUserInfo")
public class ShowUserInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding( "utf-8" );
			
			
			Connection conn = Connecting_To_Database.getConnection();//��������
			Statement stmt = conn.createStatement();//������ѯʵ��
			
			String sql = "select * from user where Id = '"+req.getSession().getAttribute("Id").toString()+"'";//sql���
			ResultSet rs = stmt.executeQuery(sql);//��ѯ
			
		while(rs.next()){
				
			req.setAttribute("User_Id",rs.getString("Id"));
			req.setAttribute("Name",rs.getString("Name"));
			req.setAttribute("User_Tel",rs.getString("Tel"));
			req.setAttribute("User_Img",rs.getString("Img"));
			req.setAttribute("User_Info",rs.getString("User_Info"));				
		  }
			
		
		rs.close();
		conn.close();
		req.getRequestDispatcher("User_ChangeInfo.jsp").forward(req, resp);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		doGet(req, resp);
	}
}
