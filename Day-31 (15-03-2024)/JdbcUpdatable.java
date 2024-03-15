package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUpdatable {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public JdbcUpdatable() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anubhav", "root", "");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery("SELECT id, name, gender, dob, email FROM employ");
			while(rs.next()) {
				System.out.print(rs.getInt("id")+"  ");
				System.out.print(rs.getString("name")+"  ");
				System.out.print(rs.getString("gender")+"  ");
				System.out.print(rs.getString("dob")+"  ");
				System.out.println(rs.getString("email"));
			}
			
			rs.absolute(2);
			rs.updateString("name", "Priyanka Gandhi");
			rs.updateString("gender", "F");
			rs.updateString("dob", "2000-03-06");
			rs.updateRow();

			System.out.println();
			rs.beforeFirst();
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
		}
	}

	public static void main(String[] args) {
		new JdbcUpdatable();
	}

}
