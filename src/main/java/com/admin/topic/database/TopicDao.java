package com.admin.topic.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.admin.topic.bean.TopicBean;

public class TopicDao {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345";
	private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

	private static final String INSERT_QUESTION_SQL = "insert into topicdata (topicName, question, choiceA, choiceB, choiceC, choiceD, answer) values (?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_QUESTION_BY_ID = "select topicName,questionId,question,choiceA,choiceB,choiceC,choiceD,answer  from topicdata where questionId =?;";
	private static final String SELECT_ALL_QUESTIONS = "select * from topicdata ;";
	private static final String DELETE_QUESTION_SQL = "delete from topicdata where questionId = ?;";
	private static final String UPDATE_QUESTION_SQL = "update topicdata set topicName = ?, question = ?, choiceA = ?, choiceB = ?, choiceC = ?, choiceD = ?, answer = ? where questionId = ?;";

	public TopicDao() {
		
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

	public void insertQuestion(TopicBean topicBean) throws SQLException {
		System.out.println(INSERT_QUESTION_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUESTION_SQL)) {
			preparedStatement.setString(1, topicBean.getTopicName());
			preparedStatement.setString(2, topicBean.getQuestion());
			preparedStatement.setString(3, topicBean.getChoice1());
			preparedStatement.setString(4, topicBean.getChoice2());
			preparedStatement.setString(5, topicBean.getChoice3());
			preparedStatement.setString(6, topicBean.getChoice4());
			preparedStatement.setString(7, topicBean.getAnswer());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public TopicBean selectQuestionById(int id) {
		TopicBean topicBean = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_QUESTION_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String topicName = rs.getString("topicName");
				int questionId = rs.getInt("questionId");
				String question = rs.getString("question");
				String choiceA = rs.getString("choiceA");
				String choiceB = rs.getString("choiceB");
				String choiceC = rs.getString("choiceC");
				String choiceD = rs.getString("choiceD");
				String answer = rs.getString("answer");
				topicBean = new TopicBean(topicName, questionId, question, choiceA, choiceB, choiceC, choiceD, answer);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return topicBean;
	}

	public List<TopicBean> selectAllQuestions() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<TopicBean> topicBeans = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_QUESTIONS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int questionId = rs.getInt("questionId");
				String topicName = rs.getString("topicName");
				String question = rs.getString("question");
				String choiceA = rs.getString("choiceA");
				String choiceB = rs.getString("choiceB");
				String choiceC = rs.getString("choiceC");
				String choiceD = rs.getString("choiceB");
				String answer = rs.getString("answer");
				topicBeans.add(new TopicBean(topicName, questionId, question, choiceA, choiceB, choiceC, choiceD, answer));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return topicBeans;
	}

	public boolean deleteQuestion(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_QUESTION_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateQuestion(TopicBean topicBean) throws SQLException {
		boolean rowUpdated = false;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_QUESTION_SQL);) {
			statement.setString(1, topicBean.getTopicName());
			statement.setString(2, topicBean.getQuestion());
			statement.setString(3, topicBean.getChoice1());
			statement.setString(4, topicBean.getChoice2());
			statement.setString(5, topicBean.getChoice3());
			statement.setString(6, topicBean.getChoice4());
			statement.setString(7, topicBean.getAnswer());
			statement.setInt(8, topicBean.getQuestionId());
			System.out.println("Updated Question: "+statement);

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
