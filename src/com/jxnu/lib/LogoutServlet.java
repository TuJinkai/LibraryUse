package com.jxnu.lib;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//���cookie
		Cookie newCookieId = new Cookie("Name", null);
		Cookie newCookieUrl = new Cookie("url", null);
		newCookieId.setMaxAge(0);
		newCookieUrl.setMaxAge(0);
		resp.addCookie(newCookieId);
		resp.addCookie(newCookieUrl);
		
		
		req.getSession().invalidate();
		
		
		//�ض���
		resp.sendRedirect("index.jsp");
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		doGet(req, resp);
	}
		
}
