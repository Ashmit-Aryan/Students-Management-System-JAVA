package com.ashmitaryan.Servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.ashmitaryan.Database.*;
import com.ashmitaryan.Model.Students;

@WebServlet("/AllStudentsServlet")
public class AllStudentsServlet extends HttpServlet {
	
	private static StudentDAOInterface studentDAOImpl;
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		
		studentDAOImpl = new StudentDAO();
	}
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			List<Students> st = studentDAOImpl.getAllStudents();
			
			request.setAttribute("students", st);
			
			request.getRequestDispatcher("AllStudents.jsp").forward(request, response);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
