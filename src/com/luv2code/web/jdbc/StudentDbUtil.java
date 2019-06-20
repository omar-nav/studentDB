package com.luv2code.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;
	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Student> getStudents() throws Exception{
		
		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create a SQL statement
			String sql = "SELECT * FROM STUDENT ORDER BY LAST_NAME";
			
			myStmt = myConn.createStatement();
			
			// execute query 
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from a result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("FIRST_NAME");
				String lastName = myRs.getString("LAST_NAME");
				String email = myRs.getString("email");
				
				// create new student object
				Student tempStudent = new Student(id, firstName, lastName, email);
				
				// add it to the list of students
				students.add(tempStudent);
			}
			
			return students;
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
		
	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
			if (myConn != null) {
				myConn.close(); // doesn't really close...just puts back in connection pool
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
		
	}

	public void addStudent(Student theStudent) throws Exception {
		// add jdbc 
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get DB connection
			myConn = dataSource.getConnection();
		
			// create SQL for insert
			String sql = "INSERT INTO STUDENT "
					+ "(FIRST_NAME, LAST_NAME, EMAIL)"
					+ "VALUES (?, ?, ?)";
			myStmt = myConn.prepareStatement(sql);
			// set the parameter values for the student
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			// execute SQL insert
			myStmt.execute();
		}
		finally {
		// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public Student getStudent(String theStudentId) throws Exception {
		Student theStudent = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int studentId;
		
		try {
			// convert student id to int
			studentId = Integer.parseInt(theStudentId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create SQL to get selected student 
			String sql = "SELECT * FROM STUDENT WHERE ID=?";
			
			// create prepared statement 
			myStmt = myConn.prepareStatement(sql);
			
			// set parameters
			myStmt.setInt(1, studentId);
			
			// execute
			myRs = myStmt.executeQuery();
			if (myRs.next()) {
				String firstName = myRs.getString("FIRST_NAME");
				String lastName = myRs.getString("LAST_NAME");
				String email = myRs.getString("EMAIL");
				
				// use the studentId during construction
				theStudent = new Student(studentId, firstName, lastName, email);
			}
			else {
				throw new Exception("Could not find student id: " + studentId);
			}
			
			return theStudent;
		}
		finally {
			
			// clean up JDBC object
			// close statement and result set
			close(myConn, myStmt, myRs);
		
		}
		
	}

	public void updateStudent(Student theStudent) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
			// get DB connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "UPDATE STUDENT " 
						+ "SET FIRST_NAME=?, LAST_NAME=?, EMAIL=? "
						+ "WHERE ID=?"; 
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set parameters
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			myStmt.setInt(4, theStudent.getId());
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC object
			close(myConn, myStmt, null);
		}
	}

	public void deleteStudent(String theStudentId) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// convert student id to int
			int studentId = Integer.parseInt(theStudentId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create SQL to delete student
			String sql = "DELETE FROM STUDENT WHERE ID=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set parameters
			myStmt.setInt(1, studentId);
			
			// execute SQL statement
			myStmt.execute();
		} finally {
			// clean up JDBC code
			close(myConn, myStmt, null);
		}
	}
}













