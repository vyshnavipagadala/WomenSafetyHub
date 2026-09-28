package com.womensafety.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.womensafety.db.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddZoneServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String location = request.getParameter("location");
        String type = request.getParameter("type");
        String phone = request.getParameter("phone");

        String latitudeParam = request.getParameter("latitude");
        String longitudeParam = request.getParameter("longitude");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {

            // Validation
            if (location == null || location.trim().isEmpty()) {
                response.sendRedirect("admin.jsp?error=Location is required");
                return;
            }

            if (type == null || type.trim().isEmpty()) {
                response.sendRedirect("admin.jsp?error=Type is required");
                return;
            }

            if (phone == null || phone.trim().isEmpty()) {
                response.sendRedirect("admin.jsp?error=Phone is required");
                return;
            }

            double latitude = 0.0;
            double longitude = 0.0;

            if (latitudeParam != null && !latitudeParam.trim().isEmpty()) {
                latitude = Double.parseDouble(latitudeParam);
            }

            if (longitudeParam != null && !longitudeParam.trim().isEmpty()) {
                longitude = Double.parseDouble(longitudeParam);
            }

            // Database connection
            conn = DatabaseUtil.getConnection();

            String sql =
                    "INSERT INTO safe_zones " +
                    "(location, type, phone, latitude, longitude) " +
                    "VALUES (?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, location.trim());
            stmt.setString(2, type.trim());
            stmt.setString(3, phone.trim());
            stmt.setDouble(4, latitude);
            stmt.setDouble(5, longitude);

            int rows = stmt.executeUpdate();

            // SUCCESS
            if (rows > 0) {

                response.sendRedirect("admin.jsp?success=1");

            } else {

                response.sendRedirect(
                    "admin.jsp?error=Unable to save safe zone"
                );
            }

        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect(
                "admin.jsp?error=Invalid latitude or longitude"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "admin.jsp?error=Unable to save safe zone"
            );

        } finally {

            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}