package com.admin.login.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.admin.login.bean.LoginBean;
import com.admin.login.database.LoginDao;
import com.mysql.cj.Session;

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
		
		LoginBean loginBean = new LoginBean();
		
		loginBean.setAdminName(adminName);		
		loginBean.setAdminEmail(adminEmail);
		loginBean.setPassword(password);
		
		LoginDao loginDao = new LoginDao();
		if(loginDao.validate(loginBean)) {
//			request.setAttribute("isAdmin", true);
//			request.setAttribute("adminDetails",loginDao.getDetails(loginBean));
			response.sendRedirect("user-list.jsp");
			
		}else {
			
			response.sendRedirect("login.jsp");
			
		}
		
		
		
		
	}

}
