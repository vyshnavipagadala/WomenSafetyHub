package com.womensafety.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LocationServlet")
public class LocationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST request
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get latitude and longitude from browser
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        // Check whether location was received
        if (latitude == null || longitude == null ||
            latitude.trim().isEmpty() || longitude.trim().isEmpty()) {

            response.getWriter().println("Location not received");
            return;
        }

        // Display location in Eclipse Console
        System.out.println("================================");
        System.out.println("       CURRENT LOCATION");
        System.out.println("================================");
        System.out.println("Latitude  : " + latitude);
        System.out.println("Longitude : " + longitude);
        System.out.println("================================");

        // Send response back to browser/JSP
        response.getWriter().println("Location received successfully");
    }

    // Handle GET request also
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}