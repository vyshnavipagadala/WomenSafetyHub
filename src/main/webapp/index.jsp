<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Women Safety Hub</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: auto;
            padding: 20px;
            background: #fce4ec;
            color: #333;
        }

        h1 {
            color: #d81b60;
            text-align: center;
            font-size: 30px;
            margin-bottom: 5px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-top: 0;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            margin: 18px 0;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .emergency-box {
            background: #d81b60;
            color: white;
            padding: 18px;
            border-radius: 10px;
            text-align: center;
            font-size: 17px;
            line-height: 1.8;
        }

        .emergency-box a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .emergency-box a:hover {
            text-decoration: underline;
        }

        .search-box {
            text-align: center;
        }

        input[type="text"] {
            padding: 13px;
            width: 70%;
            border: 2px solid #d81b60;
            border-radius: 6px;
            font-size: 16px;
            outline: none;
        }

        input[type="text"]:focus {
            border-color: #880e4f;
        }

        .btn {
            background: #d81b60;
            color: white;
            padding: 12px 28px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            font-weight: bold;
        }

        .btn:hover {
            background: #880e4f;
        }

        .popular-btn {
            background: #fce4ec;
            color: #d81b60;
            padding: 10px 18px;
            border: 2px solid #d81b60;
            border-radius: 6px;
            cursor: pointer;
            margin: 5px;
            font-size: 14px;
            font-weight: bold;
        }

        .popular-btn:hover {
            background: #d81b60;
            color: white;
        }

        .admin-link {
            color: #999;
            font-size: 13px;
            text-decoration: none;
        }

        .admin-link:hover {
            color: #d81b60;
        }

        .footer {
            text-align: center;
            color: #999;
            font-size: 12px;
            margin-top: 30px;
        }

        .info {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
        }

        @media (max-width: 600px) {

            body {
                width: 95%;
                padding: 15px;
            }

            input[type="text"] {
                width: 100%;
            }

            .popular-btn {
                width: 90%;
                margin: 6px auto;
            }

        }

    </style>

</head>

<body>

    <!-- PAGE TITLE -->

    <h1>Women Safety Hub</h1>

    <p class="subtitle">
        Find safe places near you
    </p>


    <!-- EMERGENCY NUMBERS -->

    <div class="emergency-box">

        <strong>EMERGENCY NUMBERS</strong>

        <br>

        <a href="tel:100">
            Police - 100
        </a>

        &nbsp; | &nbsp;

        <a href="tel:1091">
            Women Helpline - 1091
        </a>

        &nbsp; | &nbsp;

        <a href="tel:108">
            Ambulance - 108
        </a>

    </div>


    <!-- FIND SAFE ZONES -->

    <div class="card">

        <h2>Find Safe Zones</h2>

        <p class="info">
            Enter your location to find available safe places.
        </p>

        <div class="search-box">

            <form action="search" method="get">

                <input
                    type="text"
                    name="location"
                    placeholder="Enter location e.g. Vijayawada"
                    required>

                <br>

                <button
                    type="submit"
                    class="btn">

                    Find Safe Zones

                </button>

            </form>

        </div>

    </div>


    <!-- POPULAR LOCATIONS -->

    <div class="card">

        <h2>Popular Locations</h2>

        <p class="info">
            Select a location to search safe zones.
        </p>

        <form action="search" method="get">

            <button
                type="submit"
                name="location"
                value="Hyderabad"
                class="popular-btn">

                Hyderabad

            </button>

            <button
                type="submit"
                name="location"
                value="Delhi"
                class="popular-btn">

                Delhi

            </button>

            <button
                type="submit"
                name="location"
                value="Mumbai"
                class="popular-btn">

                Mumbai

            </button>

            <button
                type="submit"
                name="location"
                value="Bangalore"
                class="popular-btn">

                Bangalore

            </button>

            <button
                type="submit"
                name="location"
                value="Chennai"
                class="popular-btn">

                Chennai

            </button>

        </form>

    </div>


    <!-- ADMIN PANEL -->

    <div style="text-align: center; margin-top: 25px;">

        <a
            href="adminLogin.jsp"
            class="admin-link">

            Admin Panel

        </a>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        Copyright 2026 Women Safety Hub

    </div>

</body>

</html>