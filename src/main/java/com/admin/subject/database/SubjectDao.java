package com.admin.subject.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.subject.bean.SubjectBean;
import com.admin.topic.bean.TopicBean;
import com.admin.topic.database.TopicDao;
import com.mysql.cj.Session;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;

public class SubjectDao {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345";
	private String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	
	private static final String INSERT_SUBJECT_SQL = "insert into subjectlist (subjectName) values (?);";
	private static final String SELECT_SUBJECT_BY_ID = "select subjectId,subjectName from subjectlist where subjectId =?;";
	private static final String SELECT_ALL_SUBJECTS = "select * from subjectlist;";
	private static final String DELETE_SUBJECT_SQL = "delete from subjectlist where subjectId = ?;";
	private static final String UPDATE_SUBJECT_SQL = "update subjectlist set subjectName=? where subjectId = ?;";
	
	public SubjectDao() {
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	

	public void insertSubject(SubjectBean subjectBean) throws SQLException {
		System.out.println(INSERT_SUBJECT_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUBJECT_SQL)) {
			preparedStatement.setString(1, subjectBean.getSubjectName());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public SubjectBean selectSubject(int id) {
		SubjectBean subjectBean = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUBJECT_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String subjectName = rs.getString("subjectName");
				subjectBean = new SubjectBean(id, subjectName);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return subjectBean;
	}	

	public List<SubjectBean> selectAllSubjects() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<SubjectBean> subjectBeans = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUBJECTS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int subjectId = rs.getInt("subjectId");
				String subjectName = rs.getString("subjectName");
				subjectBeans.add(new SubjectBean(subjectId, subjectName));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return subjectBeans;
	}
	
	public boolean deleteSubject(int id, String subjectName) throws SQLException {
		boolean rowDeleted;
		List<TopicBean> selectedquestions = new ArrayList<>();
		TopicDao topicDao = new TopicDao();
		selectedquestions = topicDao.selectAllQuestionsWithSubjectName(subjectName);
		for(TopicBean topicBean : selectedquestions){
			System.out.println("TopicName: " + topicBean.getTopicName() + "Question: " + topicBean.getQuestion() + "Question Id: " + topicBean.getQuestionId() + "ChoiceA: " + topicBean.getChoice1() + "ChoiceB: " + topicBean.getChoice2() + "Choice3: " + topicBean.getChoice3() + "ChoiceD" + topicBean.getChoice4() + "Answer: " + topicBean.getAnswer());
			topicDao.deleteQuestion(topicBean.getQuestionId());
		}
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_SUBJECT_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateSubject(int id, String subjectName, String prevSubName) throws SQLException {
		boolean rowUpdated;
		List<TopicBean> selectedquestions = new ArrayList<>();
		TopicDao topicDao = new TopicDao();
		selectedquestions = topicDao.selectAllQuestionsWithSubjectName(prevSubName);
		for(TopicBean topicBean : selectedquestions){
			System.out.println("TopicName: " + topicBean.getTopicName() + "Question: " + topicBean.getQuestion() + "Question Id: " + topicBean.getQuestionId() + "ChoiceA: " + topicBean.getChoice1() + "ChoiceB: " + topicBean.getChoice2() + "Choice3: " + topicBean.getChoice3() + "ChoiceD" + topicBean.getChoice4() + "Answer: " + topicBean.getAnswer());
			topicDao.updateQuestionTopicName(topicBean.getQuestionId(), subjectName);
		}
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_SUBJECT_SQL);) {
			System.out.println("updated Subject: "+statement);
			statement.setString(1, subjectName);
			statement.setInt(2, id);

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
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
}
