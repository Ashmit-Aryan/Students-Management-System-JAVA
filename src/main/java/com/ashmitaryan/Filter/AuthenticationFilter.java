package com.ashmitaryan.Filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
        "/Dashboard",
        "/AllStudentsServlet",
        "/AddStudentServlet",
        "/UpdateStudentServlet",
        "/DeleteStudentServlet",
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        // Get existing session
        // false means don't create a new session
        HttpSession session = req.getSession(false);

        // Check if user is logged in
        boolean isLoggedIn =
                session != null &&
                session.getAttribute("user") != null;

        if (isLoggedIn) {

            // User is authenticated
            chain.doFilter(request, response);

        } else {

            // User is not authenticated
            res.sendRedirect(
                    req.getContextPath() + "/Login.jsp"
            );
        }
    }
}