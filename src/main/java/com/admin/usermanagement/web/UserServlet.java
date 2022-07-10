package com.admin.usermanagement.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.admin.login.bean.LoginBean;
import com.admin.report.reportDatabase.reportDao;
import com.admin.report.reportItems.reportCard;
import com.admin.result.bean.responses;
import com.admin.result.dao.responseDao;
import com.admin.subject.bean.SubjectBean;
import com.admin.subject.database.SubjectDao;
import com.admin.topic.bean.TopicBean;
import com.admin.topic.database.TopicDao;
import com.admin.usermanagement.bean.User;
import com.admin.usermanagement.dao.UserDao;
import com.mysql.cj.Session;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("/")

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private TopicDao topicDao;
	private SubjectDao subjectDao;
	private responseDao responseDao;
	private reportDao ReportDao;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {

		userDao = new UserDao();
		topicDao = new TopicDao();
		subjectDao = new SubjectDao();
		responseDao = new responseDao();
		ReportDao = new reportDao();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		Boolean isLoggedIn = false;
		if (context.getAttribute("isAdmin") == null) {
			isLoggedIn = false;
		} else {
			isLoggedIn = (Boolean) context.getAttribute("isAdmin");
		}
		Boolean isUserLoggedIn = false;
		if (context.getAttribute("isUser") == null) {
			isUserLoggedIn = false;
		} else {
			isUserLoggedIn = (Boolean) context.getAttribute("isUser");
		}
		LoginBean loginBean = (LoginBean) context.getAttribute("adminDetails");
		User user = (User) context.getAttribute("userDetails");
		System.out.println("loginBean= " + loginBean);
		System.out.println("isLoggedIn= " + isLoggedIn);
		System.out.println("user= " + user);
		System.out.println("isUserLoggedIn= " + isUserLoggedIn);
		if (loginBean != null ) {
			try {
				switch (action) {
				case "/new":
					showNewForm(request, response);
					break;
				case "/insert":
					insertUser(request, response);
					break;
				case "/delete":
					deleteUser(request, response);
					break;
				case "/edit":
					showEditForm(request, response);
					break;
				case "/update":
					updateUser(request, response);
					break;
				case "/showResponses":
					showUsersResponsesList(request, response);
					break;
				case "/showReports":
					showUsersReportList(request, response);
					break;
				case "/newQuestion":
					showNewQuestionForm(request, response);
					break;
				case "/insertQuestion":
					insertNewQuestion(request, response);
					break;
				case "/deleteQuestion":
					deleteQuestion(request, response);
					break;
				case "/insertSubject":
					insertNewSubject(request, response);
					break;
				case "/updateSubjectForm":
					showUpdateSubjectForm(request, response);
					break;
				case "/updateSubject":
					updateSubject(request, response);
					break;
				case "/deleteSubject":
					deleteSubject(request, response);
					break;
				case "/editQuestion":
					showEditQuestionForm(request, response);
					break;
				case "/updateQuestion":
					updateQuestion(request, response);
					break;
				case "/showSubjectPage":
					showSubjectsPage(request, response);
					break;
				case "/showSubjectQuestionInspectionPage":
					showSubjectQuestionInspectionPage(request, response);
					break;
				case "/showUserTablePage":
					showUserTablePage(request, response);
					break;
				default:
					request.setAttribute("reloaded", true);
					listSubjects(request, response);
					listQuestions(request, response);
					listUser(request, response);
					break;
				}
			} catch (SQLException ex) {
				throw new ServletException(ex);
			}
		} else if (user != null) {
			try {
				switch (action) {
				case "/subjectList":
					listSubjects(request, response);
					showChooseTopicForm(request, response);
					break;
				case "/examServer1":
					showExamPage1(request, response);
					break;
				case "/saveResult":
					saveExamAnswers(request, response);
					break;
				default:
					listSubjects(request, response);
					listQuestions(request, response);
					break;
					
				}
				
			} catch (SQLException ex) {
				throw new ServletException(ex);
			}
		} 
		
		else if (loginBean == null && user == null) {
			out.println("<meta http-equiv='refresh' content='5;URL=login.jsp'>");//redirects after 3 seconds
			out.println("<h1 style='color:red; top-margin: 10rem; text-align:center; font-size:4rem;'>No Admin Found. Please Login!!!</h1>");
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Please Login!!!');");
//			out.println("location='login.jsp';");
//			out.println("</script>");
//			response.sendRedirect("login.jsp");
		}
	}

	private void saveExamAnswers(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException {
		int index = Integer.parseInt(request.getParameter("index"));
		System.out.println("index: " + index);
		int marks = Integer.parseInt(request.getParameter("marks"));
		System.out.println("Initial marks: " + marks);
		int noOfQuestions = Integer.parseInt(request.getParameter("noOfQuestions"));
		System.out.println("No. Of Questions: " + noOfQuestions);
		String operation = request.getParameter("operation");
		System.out.println("Operation: " + operation);
		long startTime = Long.parseLong(request.getParameter("startTime"));
		request.setAttribute("startTime", startTime);
		long examDuration = Long.parseLong(request.getParameter("examDuration"));
		request.setAttribute("examDuration", examDuration);

		
		if(operation.equals("Next")) {
			if (index < (noOfQuestions - 1)) {
				index = index + 1;
			}
			request.setAttribute("marks", marks);
			request.setAttribute("index", index);
			System.out.println("index: " + index);
			showExamPage2(request, response,index);
		} else if(operation.equals("Previous")) {
			if (index > 0) {
				index = index - 1;
			}
			request.setAttribute("marks", marks);
			request.setAttribute("index", index);
			System.out.println("index: " + index);
			showExamPage2(request, response,index);
		} else if (operation.equals("Save")) {

			String name = request.getParameter("userName");
			String qid = request.getParameter("questionId");
			String qTopic = request.getParameter("questionTopic");
			String ques = request.getParameter("question");
			String time = request.getParameter("time");
			String email = request.getParameter("userEmail");
			String optionSelected = request.getParameter("option");
			String sessionId = request.getParameter("sessionId");
			String correctOption = request.getParameter("answer");
			System.out.println("time: "+ time);
			System.out.println("name: " + name);
			System.out.println("email: " + email);
			System.out.println("qid: " + qid);
			System.out.println("qTopic: " + qTopic);
			System.out.println("ques: " + ques);
			System.out.println("correctOption: " + correctOption);
			System.out.println("optionSelected: " + optionSelected);
			System.out.println("sessionId: " + sessionId);
			if (index < noOfQuestions) {
				index = index + 1;
			}
			request.setAttribute("index", index);
			if( optionSelected.equals(correctOption) ) {
				if (marks < 100) {
					marks = marks + 10;				
				}
				if(marks > 100) {
					marks = 100;
				}
				System.out.println("Final marks: " + marks);
				request.setAttribute("marks", marks);
			}else {
				System.out.println("Wrong Answer Chosen");
				marks = marks - 3;
				System.out.println("Final marks: " + marks);
				request.setAttribute("marks", marks);
				
			}
			if( isResultPresent(name, email, qid, qTopic, ques, sessionId) ) {
				
				int resultId = getResultId(name, email, qid, qTopic, ques, sessionId);
				
				try {
					Connection con = null;
					PreparedStatement pstmt = null;
					response.setContentType("text/html");
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345");
					
					pstmt = con.prepareStatement(
							"update results set optionSelected = ?, time=? where resultId = ?;");
					pstmt.setString(1, optionSelected);
					pstmt.setString(2, time);
					pstmt.setInt(3, resultId);
					System.out.println(pstmt);

					pstmt.executeUpdate();
				} catch (ClassNotFoundException cnfe) {
					System.out.println("Class Not Found");
				} catch (SQLException ex) {
					printSQLException(ex);
				}
				
			}else {
				try {
					Connection con = null;
					PreparedStatement pstmt = null;
					response.setContentType("text/html");
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345");
					
					pstmt = con.prepareStatement(
							"insert into results (name,email,qid,qTopic,ques,correctOption,optionSelected,sessionId,time) values(?,?,?,?,?,?,?,?,?)");
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					pstmt.setString(3, qid);
					pstmt.setString(4, qTopic);
					pstmt.setString(5, ques);
					pstmt.setString(6, correctOption);
					pstmt.setString(7, optionSelected);
					pstmt.setString(8, sessionId);
					pstmt.setString(9, time);
					System.out.println(pstmt);

					pstmt.executeUpdate();
				} catch (ClassNotFoundException cnfe) {
					System.out.println("Class Not Found");
				} catch (SQLException ex) {
					printSQLException(ex);
				}
			}
			
			if(index < noOfQuestions) {
				showExamPage2(request, response,index);		
			}else if(index == noOfQuestions) {
				index = index-1;
				showExamPage2(request, response,index);		
			}
		}
		else if (operation.equals("Submit")) {
			String sessionId = request.getParameter("sessionId");
			String name = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			marks = 0;
			request.setAttribute("marks", marks);
			List<responses> responseList = new ArrayList<>();
			// Step 1: Establishing a Connection
			try (Connection connection = getConnection();

					// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("select * from results where sessionId=? and name=? and email=?;");) {
				preparedStatement.setString(1, sessionId);
				preparedStatement.setString(2, name);
				preparedStatement.setString(3, email);
				System.out.println(preparedStatement);
				// Step 3: Execute the query or update query
				ResultSet rs = preparedStatement.executeQuery();

				// Step 4: Process the ResultSet object.
				while (rs.next()) {
					int resultId = rs.getInt("resultId");
					String userName = rs.getString("name");
					String userEmail = rs.getString("email");
					String qid = rs.getString("qid");
					String qTopic = rs.getString("qTopic");
					String ques = rs.getString("ques");
					String correctOption = rs.getString("correctOption");
					String optionSelected = rs.getString("optionSelected");
					String time = rs.getString("time");
					if(correctOption.equals(optionSelected)) {
						marks = marks +10;
					}else if(!correctOption.equals(optionSelected)) {
						marks = marks -5;
					}
					responseList.add(new responses(resultId, userName, userEmail, qid, qTopic, ques, correctOption, optionSelected, sessionId, time));
				}
				request.setAttribute("marks", marks);
			} catch (SQLException e) {
				printSQLException(e);
			}
			String passScore = "40";
			int totalMarks = 10 * noOfQuestions;
			int percentage = (marks * 100) / totalMarks;
			String score = String.valueOf(percentage);
			String grade = "Not Evaluated";
			String remark = "Not Evaluated";
			String classSelector = "";
			if (percentage >= 90) {
				grade = "A+ Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 85) {
				grade = "A Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 80) {
				grade = "A- Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 75) {
				grade = "B+ Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 70) {
				grade = "B Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 65) {
				grade = "C+ Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 60) {
				grade = "C Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 55) {
				grade = "D+ Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 50) {
				grade = "D Grade";
				remark = "PASS";
				classSelector = "";
			} else if (percentage >= 40) {
				grade = "E Grade";
				remark = "PASS";
				classSelector = "";
			} else {
				grade = "F Grade";
				remark = "FAIL";
				classSelector = "";
			}
			String qid = request.getParameter("questionId");
			String qTopic = request.getParameter("questionTopic");
			String ques = request.getParameter("question");
			String time = request.getParameter("time");
			String optionSelected = request.getParameter("option");
			String correctOption = request.getParameter("answer");
			System.out.println("time: "+ time);
			System.out.println("name: " + name);
			System.out.println("email: " + email);
			System.out.println("qid: " + qid);
			System.out.println("qTopic: " + qTopic);
			System.out.println("ques: " + ques);
			System.out.println("correctOption: " + correctOption);
			System.out.println("optionSelected: " + optionSelected);
			System.out.println("sessionId: " + sessionId);
			reportCard card = new reportCard(time, name, email, qTopic, passScore, score, grade, remark, sessionId);
			ReportDao.insertReport(card);
			request.setAttribute("report", card);
			request.setAttribute("qTopic", qTopic);				
			RequestDispatcher dispatcher = request.getRequestDispatcher("Exam-Complete-Page.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "12345");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public boolean isResultPresent(String name, String email,String qid,String qTopic,String ques, String sessionId) {

		Connection con = getConnection();
		
		boolean isPresent = false;
	
		String sql = "select * from results where name=? and email=? and qid=? and qTopic=? and ques=? and sessionId=?;";
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
//			ps.setString(3, loginBean.getAdminName());
//			ps.setString(1, loginBean.getAdminEmail());
//			ps.setString(2, loginBean.getPassword());
			
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, qid);
			ps.setString(4, qTopic);
			ps.setString(5, ques);
			ps.setString(6, sessionId);
			
			System.out.println(ps);
			
			ResultSet rs = ps.executeQuery();
			isPresent = rs.next();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return isPresent;		
		
	}
	public int getResultId(String name, String email,String qid,String qTopic,String ques, String sessionId) {

		Connection con = getConnection();
		ResultSet rs = null;
		int resultId = -1;
	
		String sql = "select * from results where name=? and email=? and qid=? and qTopic=? and ques=? and sessionId=?;";
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
//			ps.setString(3, loginBean.getAdminName());
//			ps.setString(1, loginBean.getAdminEmail());
//			ps.setString(2, loginBean.getPassword());
			
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, qid);
			ps.setString(4, qTopic);
			ps.setString(5, ques);
			ps.setString(6, sessionId);
			
			System.out.println(ps);
			
			rs = ps.executeQuery();
			if(rs.next()){
				   resultId = rs.getInt("resultId");
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return resultId;		
		
	}
	
	private void showExamPage1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String topicName = request.getParameter("subjectName");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		if(ReportDao.hasAttemptedBefore(topicName, userName, email) == false) {	
			
			Date date = new Date();
			int examDuration = 120000;
			request.setAttribute("examDuration", examDuration);
			request.setAttribute("startTime", date.getTime());
			request.setAttribute("topicName", topicName);	
			request.setAttribute("selectedChoice", null);
			List<TopicBean> selectedQuestions = topicDao.selectAllQuestionsWithSubjectName(topicName);
			int index =0;
			int marks =0;
			request.setAttribute("index", index);
			request.setAttribute("marks", marks);
			request.setAttribute("noOfQuestions", selectedQuestions.size());
			request.setAttribute("oneByOneQuestion", selectedQuestions.get(index));
			request.setAttribute("selectedQuestions", selectedQuestions);
			RequestDispatcher dispatcher = request.getRequestDispatcher("user-exam-page.jsp");
			dispatcher.forward(request, response);			
		} else if(ReportDao.hasAttemptedBefore(topicName, userName, email) == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("user-exam-already-attempted.jsp");
			dispatcher.forward(request, response);			
		}
		
	}
	
	private void showExamPage2(HttpServletRequest request, HttpServletResponse response, int index)
			throws ServletException, IOException {
		String topicName = request.getParameter("questionTopic");
		List<TopicBean> selectedQuestions = topicDao.selectAllQuestionsWithSubjectName(topicName);
		request.setAttribute("noOfQuestions", selectedQuestions.size());
		request.setAttribute("oneByOneQuestion", selectedQuestions.get(index));
		request.setAttribute("selectedQuestions", selectedQuestions);
		request.setAttribute("topicName", topicName);
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String sessionId = request.getParameter("sessionId");
		String selectedChoice = null;

		Connection con = getConnection();
		ResultSet rs = null;
	
		String sql = "select * from results where name=? and email=? and qid=? and qTopic=? and ques=? and sessionId=?;";
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, String. valueOf(selectedQuestions.get(index).getQuestionId()));
			ps.setString(4, selectedQuestions.get(index).getTopicName());
			ps.setString(5, selectedQuestions.get(index).getQuestion());
			ps.setString(6, sessionId);
			
			System.out.println(ps);
			
			rs = ps.executeQuery();
			if(rs.next()){
				selectedChoice = rs.getString("optionSelected");
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}	
		request.setAttribute("selectedChoice", selectedChoice);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-exam-page.jsp");
		dispatcher.forward(request, response);	
		
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	private void showChooseTopicForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-exam-topic-page.jsp");
		dispatcher.forward(request, response);	
	}
	

	private void listQuestions(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		List<TopicBean> topicBeans = topicDao.selectAllQuestions();
		request.setAttribute("questionsList", topicBeans);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
	
	}
	
	private void showUsersResponsesList(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		List<responses> responseList = responseDao.selectAllResponses();
		request.setAttribute("responseList", responseList);		
		RequestDispatcher dispatcher = request.getRequestDispatcher("User-Response-List-Table.jsp");
		dispatcher.forward(request, response);
	
	}

	private void showUsersReportList(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		List<reportCard> reportCardList = ReportDao.selectAllReports();
		request.setAttribute("reportList", reportCardList);		
		RequestDispatcher dispatcher = request.getRequestDispatcher("User-Report-List-Table.jsp");
		dispatcher.forward(request, response);
	
	}

	
	private void listSubjects(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		List<SubjectBean> subjectBeans = subjectDao.selectAllSubjects();
		request.setAttribute("subjects", subjectBeans);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
	
	}
	
	private void showSubjectsPage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		List<TopicBean> topicBeans = topicDao.selectAllQuestions();
		request.setAttribute("questionsList", topicBeans);
		List<SubjectBean> subjectBeans = subjectDao.selectAllSubjects();
		request.setAttribute("subjects", subjectBeans);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Manage-Subject-Page.jsp");
		dispatcher.forward(request, response);	
	}	
	private void showUserTablePage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		List<User> listUser = userDao.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User-List-Table.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showSubjectQuestionInspectionPage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		String subjectId =request.getParameter("subjectId");
		request.setAttribute("subjectId", subjectId);		
		String subjectName =request.getParameter("subjectName");
		request.setAttribute("subjectName", subjectName);		
		List<TopicBean> topicBeans = topicDao.selectAllQuestions();
		request.setAttribute("questionsList", topicBeans);
		List<SubjectBean> subjectBeans = subjectDao.selectAllSubjects();
		request.setAttribute("subjects", subjectBeans);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SubjectWise-Questions-Inspection-Page.jsp");
		dispatcher.forward(request, response);	
	}

	private void showNewQuestionForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String subject = request.getParameter("subject");
		request.setAttribute("subject", subject);
		RequestDispatcher dispatcher = request.getRequestDispatcher("question-form.jsp");
		dispatcher.forward(request, response);
	
	}

	private void showUpdateSubjectForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		String subjectName = request.getParameter("subjectName");
		System.out.println("showUpdateSubjectForm Subject Id: " + subjectId + " Subject Name: " + subjectName);
		ServletContext context=getServletContext();
		context.setAttribute("subId", subjectId);
		context.setAttribute("subName", subjectName);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SubjectUpdateForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditQuestionForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		System.out.println("Question Id: " + questionId);
		TopicBean existingQuestion = topicDao.selectQuestionById(questionId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("question-form.jsp");
		request.setAttribute("questions", existingQuestion);
		dispatcher.forward(request, response);

	}

	private void insertNewQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String topicName = request.getParameter("topicName");
		String question = request.getParameter("question");
		String choiceA = request.getParameter("choiceA");
		String choiceB = request.getParameter("choiceB");
		String choiceC = request.getParameter("choiceC");
		String choiceD = request.getParameter("choiceD");
		String answer = request.getParameter("answer");
		TopicBean newTopicBean = new TopicBean(topicName, question, choiceA, choiceB, choiceC, choiceD, answer);
		topicDao.insertQuestion(newTopicBean);
		response.sendRedirect("list");
	
	}
	
	private void insertNewSubject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		String subjectName = request.getParameter("subjectName");
		SubjectBean newSubjectBean = new SubjectBean(subjectName);
		subjectDao.insertSubject(newSubjectBean);
		response.sendRedirect("list");
	
	}

	private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));		
		String topicName = request.getParameter("topicName");
		String question = request.getParameter("question");
		String choiceA = request.getParameter("choiceA");
		String choiceB = request.getParameter("choiceB");
		String choiceC = request.getParameter("choiceC");
		String choiceD = request.getParameter("choiceD");
		String answer = request.getParameter("answer");
		
		System.out.println( "Topic Name: " + topicName + " question: " + question + " choice A: " + choiceA + " choice B: " + choiceB + " choice C: " + choiceC+ " choice D: " + choiceD + " answer: " + answer );
		
		TopicBean updatedTopicBean = new TopicBean(topicName, questionId, question, choiceA, choiceB, choiceC, choiceD, answer);
		System.out.println( "Topic Name: " + updatedTopicBean.getTopicName() + " question: " + updatedTopicBean.getQuestion() + " choice A: " + updatedTopicBean.getChoice1() + " choice B: " + updatedTopicBean.getChoice2() + " choice C: " + updatedTopicBean.getChoice3()+ " choice D: " + updatedTopicBean.getChoice4() + " answer: " + updatedTopicBean.getAnswer() );
		topicDao.updateQuestion(updatedTopicBean);
		response.sendRedirect("list");
	}

	private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		topicDao.deleteQuestion(questionId);
		response.sendRedirect("list");

	}
	
	private void deleteSubject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		String subjectName = request.getParameter("subjectName"); 
		subjectDao.deleteSubject(subjectId,subjectName);
		response.sendRedirect("list");

	}
	
	private void updateSubject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		String subjectName = request.getParameter("subjectName");
		String prevSubjectName = request.getParameter("prevSubName");
		System.out.println("updateSubject " + prevSubjectName);
		subjectDao.updateSubject(subjectId,subjectName,prevSubjectName);
		response.sendRedirect("list");

	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<User> listUser = userDao.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDao.selectUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User newUser = new User(name, email, password);
		userDao.insertUser(newUser);
		response.sendRedirect("list");
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User book = new User(id, name, email, password);
		userDao.updateUser(book);
		response.sendRedirect("list");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDao.deleteUser(id);
		response.sendRedirect("list");

	}

}
