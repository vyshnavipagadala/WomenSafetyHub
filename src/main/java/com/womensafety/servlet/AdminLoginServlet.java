package com.womensafety.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Admin password
    private static final String ADMIN_PASSWORD = "admin123";

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("password");

        // Check password
        if (password != null && password.equals(ADMIN_PASSWORD)) {

            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);

            // Login successful
            response.sendRedirect("admin.jsp");

        } else {

            // Wrong password
            response.sendRedirect("adminLogin.jsp?error=Invalid%20password");
        }
    }
}