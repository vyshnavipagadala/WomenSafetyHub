package com.womensafety.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.womensafety.db.DatabaseUtil;
import com.womensafety.model.SafeZone;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewZonesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<SafeZone> zones = new ArrayList<>();

        String sql =
                "SELECT id, location, type, phone, latitude, longitude " +
                "FROM safe_zones ORDER BY location";

        try (
            Connection conn = DatabaseUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()
        ) {

            while (rs.next()) {

                SafeZone zone = new SafeZone();

                zone.setId(rs.getInt("id"));

                zone.setLocation(
                    rs.getString("location")
                );

                zone.setType(
                    rs.getString("type")
                );

                zone.setPhone(
                    rs.getString("phone")
                );

                zone.setLatitude(
                    rs.getDouble("latitude")
                );

                zone.setLongitude(
                    rs.getDouble("longitude")
                );

                zones.add(zone);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Send safe zones to JSP
        request.setAttribute("zones", zones);

        // Open JSP page
        request.getRequestDispatcher("viewZones.jsp")
               .forward(request, response);
    }
}