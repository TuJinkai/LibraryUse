package com.jxnu.lib;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jxnu.lib.Connecting_To_Database;;

@WebServlet("/login.do")
public class Login extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String Id = req.getParameter("Id");
		String Password = req.getParameter("Password");
		
		 Connecting_To_Database ctd = new Connecting_To_Database();
		
		try {
			  if(checkLogin(Id, Password)){
				System.out.println("��֤�ɹ�");
				Connection conn = ctd.getConnection();
				String sql = "select * from user where Id='"+Id+"'"+" and Password='"+Password+"'";
				Statement stmt = conn.createStatement();//��ȡStatement����
				ResultSet rs = stmt.executeQuery(sql);
				
				//�Ự
				HttpSession session = req.getSession();
				session.setAttribute("Id", Id);
				session.setMaxInactiveInterval(60*45);
				

				
				while(rs.next()){
					
					Cookie cookie = new Cookie("Name",URLEncoder.encode(rs.getString("Name"), "UTF-8"));
					cookie.setMaxAge(60*60*2);
					Cookie password = new Cookie("password", rs.getString("Password"));//����cookie����
					password.setMaxAge(60*60*2);
					Cookie id = new Cookie("id", rs.getString("Id"));//�˺�cookie����
					id.setMaxAge(60*60*2);
					resp.addCookie(cookie);
					resp.addCookie(id);
					resp.addCookie(password);
					
					//���û����Ž�session��
					session.setAttribute("User_Name", rs.getString("Name"));
					session.setMaxInactiveInterval(60*45);
					
					//����Ա���
					if(rs.getInt("Level")==1){
						Cookie url = new Cookie("url", "User_admin.jsp");//����Ա��ת��ַ
						url.setMaxAge(60*60*12);
						resp.addCookie(url);
						session.setAttribute("level", rs.getInt("Level"));//��Ȩ��д��session
						resp.sendRedirect("User_admin.jsp");
					}
					
					Cookie url = new Cookie("url", "UserMain");//��ͨ�û���ת��ַ
					url.setMaxAge(60*60*12);
					resp.addCookie(url);
					session.setAttribute("level", rs.getInt("Level"));//��Ȩ��д��session
					
					
					resp.sendRedirect("index.jsp");//�ض���ص���ҳ
					
				}
				rs.close();
				stmt.close();
				conn.close();

				
			}			
			else{
				System.out.println("��֤ʧ��");
				resp.sendRedirect("Permission_Denied.jsp");
			}
		} catch (Exception e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
			
		
		destroy();
			
			
			
			
			
			
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		//super.doPost(req, resp);
		 doGet(req,resp); 
	}
	

	private boolean checkLogin(String Id,String Password) throws Exception{
		
		//���ݿ������
		        Connecting_To_Database ctd = new Connecting_To_Database();
		        Connection conn = ctd.getConnection();
			try {
				String sql = "select Id from user where Id='"+Id+"'"+" and Password='"+Password+"'";
				
				Statement stmt = conn.createStatement();//��ȡStatement����
				ResultSet rs = stmt.executeQuery(sql);
//				System.out.println(sql+"!!"+rs);
				
				if(rs.next()){
					stmt.close();
					conn.close();
					return true;
				}
					
				else 
					return false;
				
				
				
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
				System.out.print("����ʧ��");
			}
			

			
			
		
		return false;
		
	}
	
	

}
