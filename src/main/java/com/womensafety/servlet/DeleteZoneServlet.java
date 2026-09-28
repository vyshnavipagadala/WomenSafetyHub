package com.womensafety.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.womensafety.db.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteZone")
public class DeleteZoneServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        System.out.println("DELETE REQUEST ID = " + id);

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("manageZones.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();

            String sql = "DELETE FROM safe_zones WHERE id = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(id));

            int rows = stmt.executeUpdate();

            System.out.println("DELETED ROWS = " + rows);

        } catch (Exception e) {
            e.printStackTrace();

            throw new ServletException(
                "Unable to delete safe zone: " + e.getMessage(), e
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

        response.sendRedirect("manageZones.jsp");
    }
}