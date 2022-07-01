package com.admin.result.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.result.bean.responses;
import com.admin.topic.bean.TopicBean;

public class responseDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345";
	private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

	private static final String INSERT_RESPONSE_SQL = "insert into results ( resultId, name, email, qid, qTopic, ques, correctOption, optionSelected, sessionId, time) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL_RESPONSES = "select * from results ;";

	public responseDao() {
		
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

	public List<responses> selectAllResponses() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<responses> responseList = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RESPONSES);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int resultId = rs.getInt("resultId");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String qid = rs.getString("qid");
				String qTopic = rs.getString("qTopic");
				String ques = rs.getString("ques");
				String correctOption = rs.getString("correctOption");
				String optionSelected = rs.getString("optionSelected");
				String sessionId = rs.getString("sessionId");
				String time = rs.getString("time");
				responseList.add(new responses(resultId, name, email, qid, qTopic, ques, correctOption, optionSelected, sessionId, time));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return responseList;
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
