<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.womensafety.db.DatabaseUtil" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Manage Safe Zones - Women Safety Hub</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            color: #333;
        }

        .header {
            background: #c82333;
            color: white;
            text-align: center;
            padding: 22px;
        }

        .header h1 {
            margin: 0;
        }

        .container {
            width: 92%;
            max-width: 1000px;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h2 {
            color: #c82333;
            margin-top: 0;
        }

        .zone {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 18px;
            background: #fff;
        }

        .zone h3 {
            margin-top: 0;
            color: #c82333;
        }

        .zone p {
            margin: 8px 0;
        }

        .delete-button {
            background: #dc3545;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            margin-top: 10px;
        }

        .delete-button:hover {
            background: #b02a37;
        }

        .back-button {
            display: inline-block;
            background: #0275d8;
            color: white;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .back-button:hover {
            background: #025aa5;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #777;
        }

        .coordinates {
            background: #f1f3f5;
            padding: 8px;
            border-radius: 5px;
            display: inline-block;
        }

        .success {
            background: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        @media(max-width:600px) {

            .container {
                width: 95%;
            }

            .card {
                padding: 18px;
            }

        }

    </style>

</head>

<body>

<div class="header">

    <h1>🛡 Women Safety Hub</h1>

    <p>Manage Safe Zones</p>

</div>


<div class="container">

    <a href="admin.jsp" class="back-button">
        ← Back to Admin Panel
    </a>


    <div class="card">

        <h2>📍 Safe Zones</h2>


<%

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    boolean hasZones = false;

    try {

        conn = DatabaseUtil.getConnection();

        String sql =
            "SELECT id, location, type, phone, latitude, longitude " +
            "FROM safe_zones " +
            "ORDER BY id DESC";

        stmt = conn.prepareStatement(sql);

        rs = stmt.executeQuery();


        while (rs.next()) {

            hasZones = true;

%>


        <div class="zone">

            <h3>
                📍 <%= rs.getString("location") %>
            </h3>


            <p>
                <b>🏢 Type:</b>
                <%= rs.getString("type") %>
            </p>


            <p>
                <b>📞 Phone:</b>
                <%= rs.getString("phone") %>
            </p>


            <p>
                <b>🌐 Latitude:</b>

                <span class="coordinates">
                    <%= rs.getDouble("latitude") %>
                </span>

            </p>


            <p>
                <b>🌐 Longitude:</b>

                <span class="coordinates">
                    <%= rs.getDouble("longitude") %>
                </span>

            </p>


            <p>
                <b>ID:</b>
                <%= rs.getInt("id") %>
            </p>


            <!-- DELETE SAFE ZONE -->

            <form
                action="deleteZone"
                method="post"
                onsubmit="return confirmDelete();">

                <input
                    type="hidden"
                    name="id"
                    value="<%= rs.getInt("id") %>">


                <button
                    type="submit"
                    class="delete-button">

                    🗑 Delete Safe Zone

                </button>

            </form>


        </div>


<%

        }


        if (!hasZones) {

%>


        <div class="empty">

            <h3>😔 No Safe Zones Found</h3>

            <p>
                No safe zones are currently available in the database.
            </p>

        </div>


<%

        }


    } catch (Exception e) {

%>


        <div class="empty">

            <h3>❌ Database Error</h3>

            <p>
                <%= e.getMessage() %>
            </p>

        </div>


<%

        e.printStackTrace();

    } finally {

        try {

            if (rs != null) {
                rs.close();
            }

        } catch (Exception e) {
        }


        try {

            if (stmt != null) {
                stmt.close();
            }

        } catch (Exception e) {
        }


        try {

            if (conn != null) {
                conn.close();
            }

        } catch (Exception e) {
        }

    }

%>


    </div>

</div>


<script>

function confirmDelete() {

    return confirm(
        "Are you sure you want to delete this safe zone?"
    );

}

</script>


</body>

</html>