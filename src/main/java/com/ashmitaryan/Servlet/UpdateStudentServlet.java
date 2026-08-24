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
import com.ashmitaryan.Database.StudentDAOInterface;
import com.ashmitaryan.Model.Students;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentDAOInterface studentDAOImpl;
	private Students st;
	
	public void init(ServletConfig config) throws ServletException {
		
		studentDAOImpl = new StudentDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String id = request.getParameter("id");
			st = studentDAOImpl.getStudentById(id);
			
			request.setAttribute("student", st);
			
			request.getRequestDispatcher("UpdateStudent.jsp").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =  request.getParameter("action");
		
		int id = Integer.parseInt(request.getParameter("id"));
		boolean update = false;
		switch(action) {
			case "name":
				st.setName(request.getParameter("name"));
				update = true;
			break;
			case "email":
				st.setEmail(request.getParameter("email"));
				update = true;
			break;
			case "phone":
				st.setPhone(request.getParameter("phone"));
				update = true;
			break;
			case "age":
				st.setAge(Integer.parseInt(request.getParameter("age")));
				update = true;
			break;
			case "course":
				st.setCourse(request.getParameter("course"));
				update = true;
			break;
			case "batch":
				st.setBatch(request.getParameter("batch"));
				update = true;
			break;
			default:
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return;
		}
		
		try {
			int row = update == true ? studentDAOImpl.updateStudent(st) : 0;
			response.sendRedirect(request.getContextPath()+"/AllStudentsServlet"); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	

}
