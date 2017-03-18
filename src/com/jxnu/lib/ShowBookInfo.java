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

@WebServlet("/ShowBookInfo")
public class ShowBookInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding( "utf-8" );
			
			
			Connection conn = Connecting_To_Database.getConnection();//��������
			Statement stmt = conn.createStatement();//������ѯʵ��
			
			//�������
			String book_id = req.getParameter("book_id");
			if(book_id == null)//��Servlet��ֵ�����
				book_id = req.getAttribute("book_id").toString();
			
			System.out.println("���޸ĵ���ţ�"+book_id);//�������
			String sql = "select * from book_info where Book_Id = '"+book_id+"'";//sql���
			ResultSet rs = stmt.executeQuery(sql);//��ѯ
			
		while(rs.next()){
				
			System.out.println(rs.getString("Book_Info"));
			String ppkt =rs.getString("Book_Info");//���浱ǰ·��
			
			String[] bookinfo = new String[2];
			ReadBookInfoJson r = new ReadBookInfoJson();
			
		if(ppkt.equals("book_info\\Book_Info_demo.json")  )//�״��ļ�����
			{
					System.out.println("�״��ļ�����");
					UseJsonFile ujf = new UseJsonFile();
					bookinfo = r.ReadJsonFile(req.getServletContext().getRealPath("/")+rs.getString("Book_Info"));
					bookinfo[0]=req.getParameter("book_id");
					
					ujf.CreatJsonFile("Book_Info_"+req.getParameter("book_id")+".json", req.getServletContext().getRealPath("/")+"book_info", bookinfo);
					
					String sql_update = "update book_info set Book_Info=? where Book_Id='"+req.getParameter("book_id")+"'";
					PreparedStatement ps = conn.prepareStatement(sql_update);
					ppkt =  "book_info\\"+"Book_Info_"+req.getParameter("book_id")+".json";//���µ�ǰ·��
					ps.setString(1,ppkt);//�������ݿ�·��
					ps.executeUpdate();
					ps.close();
			}
		

			String RealPath =req.getServletContext().getRealPath("/")+ppkt;//��ȡ��ʵ·��
			System.out.println(RealPath);
			bookinfo = r.ReadJsonFile(RealPath);//����json�ļ������䴢��������  bookinfo ��
			req.setAttribute("book_id", bookinfo[0]);
			req.setAttribute("Book_Id", bookinfo[0]);
			req.setAttribute("Book_Name", rs.getString("Book_Name"));
			req.setAttribute("Author", rs.getString("Author"));
			req.setAttribute("Types_Of_Book", rs.getString("Types_Of_Book"));
			req.setAttribute("Borrowd", rs.getString("Borrowd"));
			req.setAttribute("Price", rs.getString("Price"));
			req.setAttribute("Book_Img", rs.getString("Book_Img"));
			req.setAttribute("Date_Issued", rs.getString("Date_Issued"));
			req.setAttribute("infos", bookinfo[1]);
			


			req.getRequestDispatcher("Change_BookInfo.jsp").forward(req, resp);		
					
		  }
			
		
		rs.close();
		conn.close();
			
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
