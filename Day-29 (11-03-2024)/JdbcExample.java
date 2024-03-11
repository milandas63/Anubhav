package com.db;

// Step-1
import java.sql.*;

public class JdbcExample {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public JdbcExample() {
		try {
			//	Load & Register
			Class.forName("org.gjt.mm.mysql.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anubhav","root","");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM employ");
			while(rs.next()) {
				System.out.println(rs.getInt("id")+" "+
								   rs.getString("name")+" "+
								   rs.getString("gender")+" "+
								   rs.getDate("dob")+" "+
								   rs.getString("email")
						);
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch(ClassNotFoundException e) {
		} catch(SQLException e) {
			
		}
	}

	public static void main(String[] args) {
		new JdbcExample();
	}

}
