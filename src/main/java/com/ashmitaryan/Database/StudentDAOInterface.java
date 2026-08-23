package com.ashmitaryan.Database;
import java.sql.SQLException;
import java.util.List;

import com.ashmitaryan.Model.*;
public interface StudentDAOInterface {
	
	public int insertStudent(Students student) throws SQLException;
	
	public List<Students> getAllStudents() throws SQLException;
	
	public Students getStudentById(int ID) throws SQLException;
	
	public int updateStudent(Students student) throws SQLException;
	
	public int deleteStudent(int ID) throws SQLException;
	
	public int getStudentByCourse(String course) throws SQLException;
	
	List<Students> getRecentStudents() throws SQLException;
}
