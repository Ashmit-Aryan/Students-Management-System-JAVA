package com.ashmitaryan.Servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.ashmitaryan.Model.Students;
import com.ashmitaryan.Database.*;
@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static StudentDAOInterface studentDAOImpl;

	public void init(ServletConfig config) throws ServletException {
		
		studentDAOImpl = new StudentDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			try{
				int row = insertStudent(request);
				if(row > 0) {
					response.sendRedirect(request.getContextPath() + "/AllStudentsServlet");
				}

			}catch(SQLException e) 
			{
				e.printStackTrace();
			}
			
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
	}	

	private static int insertStudent(HttpServletRequest req) throws SQLException {
		String name, email, phone, course, batch;
		int age;
		String uniqueId = UUID.randomUUID().toString();
		name = req.getParameter("name");
		email = req.getParameter("email");
		phone = req.getParameter("phone");
		course = req.getParameter("course");
		batch = req.getParameter("batch");
		age = Integer.parseInt(req.getParameter("age"));

		return studentDAOImpl.insertStudent(new Students(uniqueId,name, email, phone, course, age, batch));

	}

}
