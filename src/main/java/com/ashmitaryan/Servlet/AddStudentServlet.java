package com.ashmitaryan.Servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.ashmitaryan.Database.StudentDAO;
import com.ashmitaryan.Model.Students;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static StudentDAO studentDAO;

	public void init(ServletConfig config) throws ServletException {
		
		studentDAO = new StudentDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			try{
				int row = insertStudent(request);
				if(row > 0) {
					request.getRequestDispatcher("index.jsp").forward(request,response);						
				}

			}catch(SQLException e) 
			{
				e.printStackTrace();
			}
			
	}

	private static int insertStudent(HttpServletRequest req) throws SQLException {
		String name, email, phone, course, batch;
		int age;

		name = req.getParameter("name");
		email = req.getParameter("email");
		phone = req.getParameter("phone");
		course = req.getParameter("course");
		batch = req.getParameter("batch");
		age = Integer.parseInt(req.getParameter("age"));

		return studentDAO.insertStudent(new Students(name, email, phone, course, age, batch));

	}

}
