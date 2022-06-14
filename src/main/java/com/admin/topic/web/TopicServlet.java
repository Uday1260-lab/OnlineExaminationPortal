package com.admin.topic.web;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletContext;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.util.List;
//
//import com.admin.login.bean.LoginBean;
//import com.admin.topic.bean.TopicBean;
//import com.admin.topic.database.TopicDao;
//
///**
// * Servlet implementation class TopicServlet
// */
//@WebServlet("/topicData")
//
//public class TopicServlet extends HttpServlet {
//	
//	private static final long serialVersionUID = 1L;
//	private TopicDao topicDao;
//
//	public void init() throws ServletException {
//
//		topicDao = new TopicDao();
//
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		doGet(request, response);
//		
//	}
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		String action = request.getServletPath();
//		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		ServletContext context = getServletContext();
//		Boolean isLoggedIn = false;
//		if (context.getAttribute("isAdmin") == null) {
//			isLoggedIn = false;
//		} else {
//			isLoggedIn = (Boolean) context.getAttribute("isAdmin");
//		}
//		LoginBean loginBean = (LoginBean) context.getAttribute("adminDetails");
//		System.out.println(loginBean);
//		System.out.println(isLoggedIn);
//		if (loginBean != null) {
//			try {
//				switch (action) {
//				case "/newQuestion":
//					showNewQuestionForm(request, response);
//					break;
//				case "/insertQuestion":
//					insertNewQuestion(request, response);
//					break;
//				case "/deleteQuestion":
//					deleteQuestion(request, response);
//					break;
//				case "/editQuestion":
//					showEditQuestionForm(request, response);
//					break;
//				case "/updateQuestion":
//					updateQuestion(request, response);
//					break;
//				default:
//					listQuestions(request, response);
//					break;
//				}
//			} catch (SQLException ex) {
//			
//				throw new ServletException(ex);
//			
//			}
//		} else if (loginBean == null) {
//		
//			out.println("<meta http-equiv='refresh' content='5;URL=login.jsp'>");//redirects after 3 seconds
//			out.println("<h1 style='color:red; text-align:center; font-size:4rem;'>No Admin Found. Please Login!!!</h1>");
//			
////			out.println("<script type=\"text/javascript\">");
////			out.println("alert('Please Login!!!');");
////			out.println("location='login.jsp';");
////			out.println("</script>");
////			response.sendRedirect("login.jsp");
//		}
//		
//	}
//	
//	private void listQuestions(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException, ServletException {
//		
//		List<TopicBean> topicBeans = topicDao.selectAllQuestions();
//		request.setAttribute("questionsList", topicBeans);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
//	
//	}
//
//	private void showNewQuestionForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("question-form.jsp");
//		dispatcher.forward(request, response);
//	
//	}
//
//	private void showEditQuestionForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		
//		int id = Integer.parseInt(request.getParameter("questionId"));
//		TopicBean existingQuestion = topicDao.selectQuestionById(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("question-form.jsp");
//		request.setAttribute("question", existingQuestion);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertNewQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		
//		String topicName = request.getParameter("topicName");
//		String question = request.getParameter("question");
//		String choiceA = request.getParameter("choiceA");
//		String choiceB = request.getParameter("choiceB");
//		String choiceC = request.getParameter("choiceC");
//		String choiceD = request.getParameter("choiceD");
//		String answer = request.getParameter("answer");
//		TopicBean newTopicBean = new TopicBean(topicName, question, choiceA, choiceB, choiceC, choiceD, answer);
//		topicDao.insertQuestion(newTopicBean);
//		response.sendRedirect("list");
//	
//	}
//
//	private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		
//		int questionId = Integer.parseInt(request.getParameter("questionId"));		
//		String topicName = request.getParameter("topicName");
//		String question = request.getParameter("question");
//		String choiceA = request.getParameter("choiceA");
//		String choiceB = request.getParameter("choiceB");
//		String choiceC = request.getParameter("choiceC");
//		String choiceD = request.getParameter("choiceD");
//		String answer = request.getParameter("answer");
//		
//		TopicBean topicBean = new TopicBean(topicName, questionId, question, choiceA, choiceB, choiceC, choiceD, answer);
//		topicDao.updateQuestion(topicBean);
//		response.sendRedirect("list");
//	}
//
//	private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		int questionId = Integer.parseInt(request.getParameter("questionId"));
//		topicDao.deleteQuestion(questionId);
//		response.sendRedirect("list");
//
//	}
//
//}
