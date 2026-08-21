package com.ashmitaryan.Database;

import java.util.ArrayList;
import java.util.List;

import com.ashmitaryan.Model.Students;

import java.sql.*;

public class StudentDAO implements StudentDAOInterface {
	
	private static final String INSERT_SQL = "INSERT INTO Students(sname,semail,sphone,scourse,age,sbatch) VALUES(?,?,?,?,?,?)";
	private static final String GET_STUDENTS = "SELECT * FROM Students";
	@Override
	public int insertStudent(Students student) throws SQLException{
		
		try(Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)){
			stmt.setString(1,student.getName());
			stmt.setString(2,student.getEmail());
			stmt.setString(3,student.getPhone());
			stmt.setString(4,student.getCourse());
			stmt.setInt(5, student.getAge());
			stmt.setString(6,student.getBatch());
			
			int rowAffected = stmt.executeUpdate();
			return rowAffected;
		}
		
	}

	@Override
	public List<Students> getAllStudents() throws SQLException {
		List<Students> studentList = new ArrayList<>();
		
		try(
		Connection conn = DBConnection.getConnection();PreparedStatement stmt = conn.prepareStatement(GET_STUDENTS)){
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Students st = new Students();
				
				st.setName(rs.getString("sname"));
				st.setEmail(rs.getString("semail"));
				st.setAge(rs.getInt("age"));
				st.setPhone(rs.getString("sphone"));
				st.setCourse(rs.getString("scourse"));
				st.setBatch(rs.getString("sbatch"));
				
				studentList.add(st);
			}

		}
		
		return studentList;
		

	}

	@Override
	public Students getStudentById(int ID)throws SQLException {
		return null;
	}

	@Override
	public int updateStudent(Students student)throws SQLException {
		return 0;
	}

	@Override
	public int deleteStudent(int ID)throws SQLException {
		return 0;
	}

}
