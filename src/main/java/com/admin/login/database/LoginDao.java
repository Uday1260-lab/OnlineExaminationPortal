package com.admin.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.admin.login.bean.LoginBean;

public class LoginDao {

	private String dbUrl = "jdbc:mysql://localhost:3306/userdb";
	private String dbUname = "root";
	private String dbPassword = "12345";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		
		try {
			
			Class.forName(dbDriver);
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			
		}		
		
	}
	
	
	public Connection getConnection() {
		
		Connection con = null;
		
		try {
			
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return con;
		
	}
	
	public boolean validate(LoginBean loginBean) {

		loadDriver(dbDriver);

		Connection con = getConnection();
		
		boolean status = false;
	
		String sql = "select * from adminlist where adminName=? and adminEmail=? and password=? ";
		
//		String sql = "SELECT * FROM adminlist WHERE adminEmail=? AND password=? ;";
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
//			ps.setString(3, loginBean.getAdminName());
//			ps.setString(1, loginBean.getAdminEmail());
//			ps.setString(2, loginBean.getPassword());
			
			ps.setString(1, loginBean.getAdminName());
			ps.setString(2, loginBean.getAdminEmail());
			ps.setString(3, loginBean.getPassword());
			
			System.out.println(ps);
			
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return status;		
		
	}


	public ResultSet getDetails(LoginBean loginBean) {
		
		loadDriver(dbDriver);

		Connection con = getConnection();
	
		String sql = "select * from adminlist where adminName=? and adminEmail=? and password=? ";
		
		ResultSet rs = null;
		
		PreparedStatement ps;
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, loginBean.getAdminName());
			ps.setString(2, loginBean.getAdminEmail());
			ps.setString(3, loginBean.getPassword());
			
			System.out.println(ps);
			
			rs = ps.executeQuery();
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		}
		
		return rs;
	}
	
	
	
}
