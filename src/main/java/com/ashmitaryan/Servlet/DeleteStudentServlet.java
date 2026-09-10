package com.ashmitaryan.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import com.ashmitaryan.Database.StudentDAO;
import com.ashmitaryan.Database.StudentDAOInterface;


/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static StudentDAOInterface studentDAOImpl;
	
	
	public void init(ServletConfig config) throws ServletException {
		studentDAOImpl  = new StudentDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		
		try {
			int row = studentDAOImpl.deleteStudent(id);
			if(row > 0) {
				response.sendRedirect(request.getContextPath()+"/AllStudentsServlet");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}

