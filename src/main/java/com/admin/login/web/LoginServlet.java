package com.admin.login.web;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.admin.login.bean.LoginBean;
import com.admin.login.database.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/adminLogin")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adminName = request.getParameter("adminName");
		String adminEmail = request.getParameter("adminEmail");
		String password = request.getParameter("password");
		ServletContext context=getServletContext();
		
		LoginBean loginBean = new LoginBean();
		
		loginBean.setAdminName(adminName);		
		loginBean.setAdminEmail(adminEmail);
		loginBean.setPassword(password);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		 
		context.setAttribute("isAdmin",false);
		context.setAttribute("adminDetails", null);
		LoginDao loginDao = new LoginDao();
		if(loginDao.validate(loginBean)) {			 
			context.setAttribute("isAdmin",true);
			context.setAttribute("adminDetails", loginBean);
			response.sendRedirect("user-list.jsp");
			
		}else {			 
			context.setAttribute("isAdmin",false);
			context.setAttribute("adminDetails", null);
			out.println("<meta http-equiv='refresh' content='5';URL='login.jsp'>");//redirects after 3 seconds
			out.println("<h1 style='color:red; text-align:center; font-size:4rem;'>Either the name, email or password is wrong. Please login again!!!</h1>");			
			response.sendRedirect("login.jsp");
			
		}
		
		
		
		
	}

}
