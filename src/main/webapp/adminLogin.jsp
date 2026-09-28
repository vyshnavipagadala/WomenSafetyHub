<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Admin password
    final String ADMIN_PASSWORD = "admin123";

    String error = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String password = request.getParameter("password");

        if (password != null && ADMIN_PASSWORD.equals(password)) {

            // Login success
            session.setAttribute("adminLoggedIn", true);

            response.sendRedirect("admin.jsp");
            return;

        } else {

            error = "Incorrect password. Please try again.";
        }
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Login - Women Safety Hub</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {

            margin: 0;

            font-family: Arial, sans-serif;

            background: #fce4ec;

            min-height: 100vh;

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 20px;
        }

        .login-container {

            width: 100%;

            max-width: 420px;

            background: white;

            padding: 35px;

            border-radius: 15px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.15);

            text-align: center;
        }

        .icon {

            font-size: 55px;

            margin-bottom: 10px;
        }

        h1 {

            color: #d81b60;

            margin: 0 0 8px;

            font-size: 28px;
        }

        .subtitle {

            color: #777;

            margin-bottom: 30px;

            font-size: 15px;
        }

        .input-group {

            text-align: left;

            margin-bottom: 20px;
        }

        .input-group label {

            display: block;

            font-weight: bold;

            color: #444;

            margin-bottom: 8px;
        }

        input[type="password"] {

            width: 100%;

            padding: 13px;

            border: 2px solid #d81b60;

            border-radius: 7px;

            font-size: 16px;

            outline: none;
        }

        input[type="password"]:focus {

            border-color: #880e4f;

            box-shadow: 0 0 5px rgba(216,27,96,0.25);
        }

        .login-btn {

            width: 100%;

            background: #d81b60;

            color: white;

            padding: 13px;

            border: none;

            border-radius: 7px;

            font-size: 17px;

            font-weight: bold;

            cursor: pointer;

            margin-top: 5px;
        }

        .login-btn:hover {

            background: #880e4f;
        }

        .error {

            background: #f8d7da;

            color: #721c24;

            padding: 12px;

            border-radius: 7px;

            margin-bottom: 20px;

            font-size: 14px;
        }

        .back-link {

            display: inline-block;

            margin-top: 22px;

            color: #0275d8;

            text-decoration: none;

            font-size: 14px;

            font-weight: bold;
        }

        .back-link:hover {

            text-decoration: underline;
        }

        .footer {

            margin-top: 25px;

            color: #999;

            font-size: 12px;
        }

    </style>

</head>

<body>

    <div class="login-container">
        <div class="icon">🔐</div>

        <h1>Admin Login</h1>

        <p class="subtitle">
            Women Safety Hub
        </p>

        <% if (error != null) { %>

            <div class="error">
                ❌ <%= error %>
            </div>

        <% } %>

        <form method="post" action="adminLogin.jsp">

            <div class="input-group">

                <label for="password">
                    🔑 Admin Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter admin password"
                    required
                    autocomplete="current-password">

            </div>

            <button
                type="submit"
                class="login-btn">

                🔓 Login to Admin Panel

            </button>

        </form>

        <a href="index.jsp" class="back-link">
            ← Back to Home
        </a>

        <div class="footer">
            © 2026 Women Safety Hub
        </div>

    </div>

</body>

</html>