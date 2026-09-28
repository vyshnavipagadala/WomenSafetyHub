package com.womensafety.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.womensafety.db.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class StatsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int total = 0, police = 0, hospital = 0, helpline = 0;
        
        try {
            Connection conn = DatabaseUtil.getConnection();
            
            PreparedStatement stmt1 = conn.prepareStatement("SELECT COUNT(*) FROM safe_zones");
            ResultSet rs1 = stmt1.executeQuery();
            if (rs1.next()) total = rs1.getInt(1);
            rs1.close();
            stmt1.close();
            
            PreparedStatement stmt2 = conn.prepareStatement("SELECT COUNT(*) FROM safe_zones WHERE type='Police'");
            ResultSet rs2 = stmt2.executeQuery();
            if (rs2.next()) police = rs2.getInt(1);
            rs2.close();
            stmt2.close();
            
            PreparedStatement stmt3 = conn.prepareStatement("SELECT COUNT(*) FROM safe_zones WHERE type='Hospital'");
            ResultSet rs3 = stmt3.executeQuery();
            if (rs3.next()) hospital = rs3.getInt(1);
            rs3.close();
            stmt3.close();
            
            PreparedStatement stmt4 = conn.prepareStatement("SELECT COUNT(*) FROM safe_zones WHERE type='Helpline'");
            ResultSet rs4 = stmt4.executeQuery();
            if (rs4.next()) helpline = rs4.getInt(1);
            rs4.close();
            stmt4.close();
            
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("total", total);
        request.setAttribute("police", police);
        request.setAttribute("hospital", hospital);
        request.setAttribute("helpline", helpline);
        
        request.getRequestDispatcher("stats.jsp").forward(request, response);
    }
}