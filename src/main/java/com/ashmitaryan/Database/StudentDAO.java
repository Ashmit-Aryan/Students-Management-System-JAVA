package com.ashmitaryan.Database;

import java.util.ArrayList;
import java.util.List;

import com.ashmitaryan.Model.Students;

import java.sql.*;

public class StudentDAO implements StudentDAOInterface {

	private static final String INSERT_STUDENT = "INSERT INTO Students(sname,semail,sphone,scourse,age,sbatch) VALUES(?,?,?,?,?,?)";
	private static final String GET_STUDENTS = "SELECT * FROM Students";
	private static final String GET_STUDENT_BY_ID = "SELECT * FROM Students WHERE id = ?";
	private static final String UPDATE_STUDENT = "UPDATE Students SET sname=?,semail=?,sphone=?,scourse=?,age=?,sbatch=? WHERE id = ?";
	private static final String DELETE_STUDENT = "DELETE FROM Students WHERE id = ?";
	private static final String RECENT_STUDENTS = "SELECT * FROM Students " + "ORDER BY id DESC LIMIT 5";
	private static final String GET_STUDENT_BY_COURSE = "SELECT COUNT(*) FROM Students WHERE scourse = ?";

	@Override
	public int insertStudent(Students student) throws SQLException {

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_STUDENT)) {
			stmt.setString(1, student.getName());
			stmt.setString(2, student.getEmail());
			stmt.setString(3, student.getPhone());
			stmt.setString(4, student.getCourse());
			stmt.setInt(5, student.getAge());
			stmt.setString(6, student.getBatch());

			int rowAffected = stmt.executeUpdate();
			return rowAffected;
		}

	}

	@Override
	public List<Students> getAllStudents() throws SQLException {
		List<Students> studentList = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(GET_STUDENTS)) {

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Students st = new Students();
				st.setId(Integer.parseInt(rs.getString("id")));
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
	public Students getStudentById(int ID) throws SQLException {
		Students student = null;

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(GET_STUDENT_BY_ID)) {
			stmt.setInt(1, ID);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				student = new Students();
				student.setId(Integer.parseInt(rs.getString("id")));
				student.setName(rs.getString("sname"));
				student.setEmail(rs.getString("semail"));
				student.setAge(rs.getInt("age"));
				student.setPhone(rs.getString("sphone"));
				student.setCourse(rs.getString("scourse"));
				student.setBatch(rs.getString("sbatch"));
			}
		}

		return student;
	}

	@Override
	public int updateStudent(Students student) throws SQLException {
		int rows = 0;
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE_STUDENT)) {
			stmt.setString(2, student.getName());
			stmt.setString(3, student.getEmail());
			stmt.setString(4, student.getPhone());
			stmt.setString(5, student.getCourse());
			stmt.setInt(6, student.getAge());
			stmt.setString(7, student.getBatch());

			rows = stmt.executeUpdate();
		}

		return rows;
	}

	@Override
	public int deleteStudent(int ID) throws SQLException {
		int rows = 0;
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_STUDENT)) {
			stmt.setInt(1, ID);

			rows = stmt.executeUpdate();
		}

		return rows;
	}

	@Override
	public int getStudentByCourse(String course) throws SQLException {
		// TODO Auto-generated method stub
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(GET_STUDENT_BY_COURSE)) {

			statement.setString(1, course);

			try (ResultSet resultSet = statement.executeQuery()) {

				if (resultSet.next()) {
					return resultSet.getInt(1);
				}
			}

		}
		return 0;
	}

	@Override
	public List<Students> getRecentStudents() throws SQLException {
		List<Students> students = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(RECENT_STUDENTS);
				ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {

				Students student = new Students();

				student.setId(resultSet.getInt("id"));

				student.setName(resultSet.getString("sname"));

				student.setEmail(resultSet.getString("semail"));

				student.setPhone(resultSet.getString("sphone"));

				student.setAge(resultSet.getInt("age"));

				student.setCourse(resultSet.getString("scourse"));

				student.setBatch(resultSet.getString("sbatch"));

				students.add(student);
			}

		}
		return students;
	}

}