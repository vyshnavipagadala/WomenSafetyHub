package com.womensafety.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.womensafety.model.SafeZone;
import com.womensafety.db.DatabaseUtil;

public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String location = request.getParameter("location");

        // Empty search
        if (location == null || location.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        location = location.trim();

        List<SafeZone> zones = new ArrayList<>();

        String sql =
                "SELECT id, location, type, phone, latitude, longitude " +
                "FROM safe_zones " +
                "WHERE LOWER(location) LIKE LOWER(?) " +
                "ORDER BY id DESC";

        try (
            Connection conn = DatabaseUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            // Example:
            // User enters Vijayawada
            // It searches only locations containing Vijayawada
            stmt.setString(1, "%" + location + "%");

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    SafeZone zone = new SafeZone();

                    zone.setId(rs.getInt("id"));
                    zone.setLocation(rs.getString("location"));
                    zone.setType(rs.getString("type"));
                    zone.setPhone(rs.getString("phone"));
                    zone.setLatitude(rs.getDouble("latitude"));
                    zone.setLongitude(rs.getDouble("longitude"));

                    zones.add(zone);
                }
            }

            System.out.println("================================");
            System.out.println("SEARCH LOCATION = " + location);
            System.out.println("TOTAL RESULTS = " + zones.size());
            System.out.println("================================");

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "error",
                "Unable to search safe zones: " + e.getMessage()
            );
        }

        // Send ONLY matching zones to JSP
        request.setAttribute("safeZones", zones);

        // Send searched location
        request.setAttribute("searchTerm", location);

        // Open viewZones.jsp
        request.getRequestDispatcher("/viewZones.jsp")
               .forward(request, response);
    }
}