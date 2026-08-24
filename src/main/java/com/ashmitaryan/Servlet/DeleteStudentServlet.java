package com.ashmitaryan.Servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

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
