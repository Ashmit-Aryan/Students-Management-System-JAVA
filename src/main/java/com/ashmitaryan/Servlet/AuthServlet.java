package com.ashmitaryan.Servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;

import com.ashmitaryan.Database.UserDAO;
import com.ashmitaryan.Database.UserDAOInterface;
import com.ashmitaryan.Model.Users;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UserDAOInterface userDAOImpl;

	public void init(ServletConfig config) throws ServletException {
		userDAOImpl = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("login".equals(action)) {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} else if ("sigup".equals(action)) {
			request.getRequestDispatcher("SignUp.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("login".equals(action)) {
			
			Login(request,response);
			
		} else if ("sigup".equals(action)) {
			signUp(request,response);
		} else {
			doGet(request,response);
		}

	}

	private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");

		String password = request.getParameter("password");

		if (username == null || password == null) {
			request.setAttribute("error", "Username and Password Required");
			request.getRequestDispatcher("login.jsp").forward(request, response);

			return;
		}

		try {
			Users user = userDAOImpl.login(username, password);

			if (user == null) {
				request.setAttribute("error", "Invalid username or password.");

				request.getRequestDispatcher("/Login.jsp").forward(request, response);

				return;
			}

			HttpSession session = request.getSession();

			session.setAttribute("user", user);

			// Redirect to dashboard
			response.sendRedirect(request.getContextPath() + "/Dashboard");

		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Something went wrong. Please try again.");

			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}

	}
	
	private void signUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		   String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String confirmPassword =
	                request.getParameter("confirmPassword");

	        // =========================
	        // VALIDATION
	        // =========================

	        if (username == null || username.trim().isEmpty()
	                || email == null || email.trim().isEmpty()
	                || password == null || password.isEmpty()
	                || confirmPassword == null
	                || confirmPassword.isEmpty()) {

	            request.setAttribute("error",
	                    "All fields are required.");

	            request.getRequestDispatcher("/SignUp.jsp")
	                   .forward(request, response);

	            return;
	        }

	        username = username.trim();
	        email = email.trim();

	        // Username length
	        if (username.length() < 3) {

	            request.setAttribute("error",
	                    "Username must be at least 3 characters.");

	            request.getRequestDispatcher("/SignUp.jsp")
	                   .forward(request, response);

	            return;
	        }

	        // Password length
	        if (password.length() < 6) {

	            request.setAttribute("error",
	                    "Password must be at least 6 characters.");

	            request.getRequestDispatcher("/SignUp.jsp")
	                   .forward(request, response);

	            return;
	        }

	        // Password confirmation
	        if (!password.equals(confirmPassword)) {

	            request.setAttribute("error",
	                    "Passwords do not match.");

	            request.getRequestDispatcher("/SignUp.jsp")
	                   .forward(request, response);

	            return;
	        }
	        try {
	        	if(userDAOImpl.usernameExists(username)) {
	                request.setAttribute("error",
	                        "Username already exists.");

	                request.getRequestDispatcher("SignUp.jsp")
	                       .forward(request, response);

	                return;
	        	}
	        	
	        	if(userDAOImpl.emailExists(email)) {

	                request.setAttribute("error",
	                        "Email already exists.");

	                request.getRequestDispatcher("SignUp.jsp")
	                       .forward(request, response);

	                return;
	        	}
	        	

	            Users user = new Users();

	            user.setId(UUID.randomUUID().toString());
	            user.setUsername(username);
	            user.setEmail(email);
	            user.setPassword(password);

	            // =========================
	            // SAVE USER
	            // =========================

	            boolean success = userDAOImpl.signUp(user);

	            if (success) {

	                // PRG pattern
	                response.sendRedirect(
	                        request.getContextPath()
	                        + "/Login.jsp?success=signup"
	                );

	            } else {

	                request.setAttribute("error",
	                        "Unable to create account. Please try again.");

	                request.getRequestDispatcher("SignUp.jsp")
	                       .forward(request, response);
	            }
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
		
	}
	
}
