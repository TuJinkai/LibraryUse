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
 * @Target ����������ʾbookinfoҳ�� Ҳ����ͼ������
 *
 */
@WebServlet("/BookMain")
public class BookMainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding( "utf-8" );
		
		
		//�ж����������ղ�
		String collectd = "0";
		try {
			collectd = UseCollect(req.getSession().getAttribute("Id").toString(), req.getParameter("book_id"));
		} catch (Exception e) {
			System.out.println("����δ��¼�û��ķ���");
		}
		//��ֹδ��¼״̬���ֵ��쳣��ʹ��try-catch��
		
		try {
			Connection conn = Connecting_To_Database.getConnection();
			String Book_Id = req.getParameter("book_id");
			
			Statement stmt = conn.createStatement();
			String sql = "select * from book_info where Book_Id = '"+Book_Id+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			
			String[] book_info = new String[2];
			ReadBookInfoJson r = new ReadBookInfoJson();//json���ݽ���׼��
			

			while (rs.next()) {
				String Book_Name = rs.getString("Book_Name");
				String Author = rs.getString("Author");
				String Types_Of_Book = rs.getString("Types_Of_Book");
				String Date_Issued = rs.getString("Date_Issued");
				int Price = rs.getInt("Price");
				int Borrowd = rs.getInt("Borrowd");
				
				//ͼ������ֽ���
				String RealPath = req.getServletContext().getRealPath("/")+rs.getString("Book_Info");//��ȡ��ʵ·��
				book_info = r.ReadJsonFile(RealPath);
				String Book_Img =rs.getString("Book_Img");//ͼƬ·��
				
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
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	//�����жϸ����Ƿ��ղأ�������һ��String���� 0����1 ��ʾ�Ƿ��ղ�
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
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
		return collect;	
	}
	
	

}
