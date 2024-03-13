package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class JdbcExample2 {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private ResultSetMetaData rsmd;
	
	public JdbcExample2() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anubhav", "root", "");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT id, name, gender, dob, email FROM employ");
			rsmd = rs.getMetaData();

			for(int i=1; i<=rsmd.getColumnCount(); i++) {
				System.out.print(rsmd.getColumnLabel(i)+" ");
			}
			System.out.println();
			
			System.out.println("SCROLL-FORWARD");
			while(rs.next()) {
				System.out.print(rs.getInt("id")+" ");
				System.out.print(rs.getString("name")+" ");
				System.out.print(rs.getString("gender")+" ");
				System.out.print(rs.getString("dob")+" ");
				System.out.println(rs.getString("email"));
			}
			System.out.println("SCROLL-BACKWARD");
			while(rs.previous()) {
				System.out.print(rs.getInt("id")+" ");
				System.out.print(rs.getString("name")+" ");
				System.out.print(rs.getString("gender")+" ");
				System.out.print(rs.getString("dob")+" ");
				System.out.println(rs.getString("email"));
			}
			conn.close();
		} catch(Exception e) {
		}
	}

	public static void main(String[] args) {
		new JdbcExample2();
	}

}
