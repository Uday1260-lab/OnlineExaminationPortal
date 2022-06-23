package com.admin.usermanagement.web;

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
import com.admin.usermanagement.bean.User;
import com.admin.usermanagement.dao.UserDao;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		
		String userName = request.getParameter("username");
		String userEmail = request.getParameter("useremail");
		String userPassword = request.getParameter("userpassword");
		ServletContext context=getServletContext();
		
		User user = new User();
		
		user.setName(userName);		
		user.setEmail(userEmail);
		user.setUserPassword(userPassword);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		 
		context.setAttribute("isUser",false);
		context.setAttribute("userDetails", null);
		UserDao userDao = new UserDao();
		if(userDao.validate(user)) {			 
			context.setAttribute("isUser",true);
			context.setAttribute("userDetails", user);			 
			context.setAttribute("isAdmin",false);
			context.setAttribute("adminDetails", null);
			response.sendRedirect("user-exam-welcome-page.jsp");
			
		}else {			 
			context.setAttribute("isUser",false);
			context.setAttribute("userDetails", null);
			out.println("<meta http-equiv='refresh' content='5';URL='login.jsp'>");//redirects after 3 seconds
			out.println("<h1 style='color:red; text-align:center; font-size:4rem;'>Either the name, email or password is wrong. Please login again!!!</h1>");			
			response.sendRedirect("login.jsp");
			
		}
	}

}
