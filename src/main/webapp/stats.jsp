<!DOCTYPE html>
<html>
<head>
    <title>Statistics</title>
    <style>
        body {
            font-family: Arial;
            max-width: 700px;
            margin: auto;
            padding: 20px;
            background: #fce4ec;
        }
        .card {
            background: white;
            padding: 20px;
            margin: 15px 0;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #d81b60;
            text-align: center;
        }
        .btn-link {
            display: inline-block;
            background: #d81b60;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
        }
        .btn-link:hover {
            background: #880e4f;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        .stat-box {
            background: #fce4ec;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .stat-box h2 {
            margin: 0;
            font-size: 36px;
            color: #d81b60;
        }
        .stat-box p {
            margin: 5px 0 0;
            color: #555;
        }
    </style>
</head>
<body>

    <h1>Statistics</h1>

    <div class="card">
        <a href="index.jsp" class="btn-link">Home</a>
        <a href="stats" class="btn-link">Refresh</a>
    </div>

    <div class="card">
        <div class="stats">
            <div class="stat-box">
                <h2><%= request.getAttribute("total") %></h2>
                <p>Total Zones</p>
            </div>
            <div class="stat-box">
                <h2><%= request.getAttribute("police") %></h2>
                <p>Police</p>
            </div>
            <div class="stat-box">
                <h2><%= request.getAttribute("hospital") %></h2>
                <p>Hospitals</p>
            </div>
            <div class="stat-box">
                <h2><%= request.getAttribute("helpline") %></h2>
                <p>Helplines</p>
            </div>
        </div>
    </div>

</body>
</html>