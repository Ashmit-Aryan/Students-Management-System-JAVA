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

import com.ashmitaryan.Model.*;

import com.ashmitaryan.Database.StudentDAO;
import com.ashmitaryan.Database.StudentDAOInterface;


@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static StudentDAOInterface studentDAOImpl;
	
	public void init(ServletConfig config) throws ServletException {
		
		studentDAOImpl = new StudentDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int totalStudents , btechStudents, bbaStudents, bcaStudents, bjmcStudents, bcomStudents;

		try {
			totalStudents = studentDAOImpl.getAllStudents().size();
			
			btechStudents = studentDAOImpl.getStudentByCourse("B. Tech");
			bbaStudents  = studentDAOImpl.getStudentByCourse("BBA");
			bcaStudents = studentDAOImpl.getStudentByCourse("BCA");
			bjmcStudents = studentDAOImpl.getStudentByCourse("BJMC");
			bcomStudents = studentDAOImpl.getStudentByCourse("B.Com");
			List<Students> st = studentDAOImpl.getRecentStudents();
			request.setAttribute("totalStudents", totalStudents);
			request.setAttribute("btechStudents", btechStudents);
			request.setAttribute("bbaStudents", bbaStudents);
			request.setAttribute("bcaStudents", bcaStudents);
			request.setAttribute("bjmcStudents", bjmcStudents);
			request.setAttribute("bcomStudents", bcomStudents);
			request.setAttribute("recentStudents", st);
			
			
			request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}	
}
