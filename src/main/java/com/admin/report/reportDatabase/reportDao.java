package com.admin.report.reportDatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.report.reportItems.reportCard;
import com.admin.result.bean.responses;
import com.admin.topic.bean.TopicBean;
import com.admin.usermanagement.bean.User;

public class reportDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345";
	private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

	private static final String INSERT_REPORT_SQL = "insert into reports ( date, name, email, topic, passScore, score, grade, remark, sessionId) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL_REPORTS = "select * from reports ;";
	
	public reportDao() {
		
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

	public void insertReport(reportCard card) throws SQLException {
		System.out.println(INSERT_REPORT_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REPORT_SQL);) {
			preparedStatement.setString(1, card.getDate());
			preparedStatement.setString(2, card.getName());
			preparedStatement.setString(3, card.getEmail());
			preparedStatement.setString(4, card.getTopic());
			preparedStatement.setString(5, card.getPassScore());
			preparedStatement.setString(6, card.getScore());
			preparedStatement.setString(7, card.getGrade());
			preparedStatement.setString(8, card.getRemark());
			preparedStatement.setString(9, card.getSessionId());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	public List<reportCard> selectAllReports() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<reportCard> reportList = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REPORTS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int reportId = rs.getInt("reportId");
				String date = rs.getString("date");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String topic = rs.getString("topic");
				String passScore = rs.getString("passScore");
				String score = rs.getString("score");
				String grade = rs.getString("grade");
				String remark = rs.getString("remark");
				String sessionId = rs.getString("sessionId");
				reportList.add(new reportCard(reportId, date, name, email, topic, passScore, score, grade, remark, sessionId));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return reportList;
	}
	
	public boolean hasAttemptedBefore(String topicName, String userName, String email) {

		Connection con = getConnection();
		
		boolean status = false;
	
		String sql = "select * from reports where name=? and email=? and topic=? ";
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
//			ps.setString(3, loginBean.getAdminName());
//			ps.setString(1, loginBean.getAdminEmail());
//			ps.setString(2, loginBean.getPassword());
			
			ps.setString(1, userName);
			ps.setString(2, email);
			ps.setString(3, topicName);
			
			System.out.println(ps);
			
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return status;		
		
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
