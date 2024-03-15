package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcParparedStatement {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public JdbcParparedStatement() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anubhav", "root", "");
			pstmt = conn.prepareStatement("SELECT id, name, gender, dob, email FROM employ");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.print(rs.getInt("id")+"  ");
				System.out.print(rs.getString("name")+"  ");
				System.out.print(rs.getString("gender")+"  ");
				System.out.print(rs.getString("dob")+"  ");
				System.out.println(rs.getString("email"));
			}
			conn.close();
		} catch(ClassNotFoundException e) {
		} catch(SQLException e) {
		} catch(Exception e) {
		}
	}
	
	public static void main(String[] args) {
		new JdbcParparedStatement();
	}

}
