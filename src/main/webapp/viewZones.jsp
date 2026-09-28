<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.womensafety.model.SafeZone" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Safe Zones - Women Safety Hub</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <!-- Leaflet CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fce4ec;
            color: #333;
        }

        /* HEADER */

        .header {
            background: #d81b60;
            color: white;
            text-align: center;
            padding: 25px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            margin: 8px 0 0;
            font-size: 16px;
        }

        /* CONTAINER */

        .container {
            width: 92%;
            max-width: 950px;
            margin: 30px auto;
        }

        /* BACK BUTTON */

        .back-button {
            display: inline-block;
            background: #0275d8;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .back-button:hover {
            background: #025aa5;
        }

        /* TITLE */

        .title-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .title-card h2 {
            margin: 0;
            color: #c2185b;
        }

        .search-info {
            background: #fff3cd;
            color: #856404;
            padding: 12px 15px;
            border-radius: 6px;
            margin-top: 15px;
            font-weight: bold;
        }

        /* LOCATION */

        .location-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .location-button {
            background: #0275d8;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .location-button:hover {
            background: #025aa5;
        }

        #location-status {
            margin-top: 12px;
            color: #555;
        }

        /* MAP */

        #map {
            width: 100%;
            height: 400px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        }

        /* SAFE ZONE CARD */

        .zone-card {
            background: white;
            border-radius: 12px;
            padding: 22px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
            border-left: 5px solid #d81b60;
        }

        .zone-card h3 {
            margin-top: 0;
            color: #b71c1c;
            font-size: 22px;
        }

        .zone-info {
            margin: 10px 0;
            font-size: 16px;
        }

        .label {
            font-weight: bold;
            color: #555;
        }

        /* PHONE */

        .phone {
            color: #d81b60;
            font-weight: bold;
            text-decoration: none;
        }

        .phone:hover {
            text-decoration: underline;
        }

        /* CALL BUTTON */

        .call-button {
            display: inline-block;
            margin-top: 8px;
            background: #e91e63;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 15px;
        }

        .call-button:hover {
            background: #c2185b;
        }

        /* COORDINATES */

        .coordinates {
            background: #f5f5f5;
            padding: 10px;
            border-radius: 6px;
            margin-top: 12px;
        }

        /* DISTANCE */

        .distance {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 10px;
            border-radius: 6px;
            margin-top: 12px;
            font-weight: bold;
        }

        /* DIRECTION */

        .direction-button {
            display: inline-block;
            margin-top: 15px;
            background: #28a745;
            color: white;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 6px;
            font-weight: bold;
        }

        .direction-button:hover {
            background: #218838;
        }

        /* NUMBER */

        .number {
            display: inline-block;
            background: #d81b60;
            color: white;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            margin-right: 8px;
        }

        /* EMPTY */

        .empty {
            background: white;
            padding: 35px;
            text-align: center;
            border-radius: 10px;
            color: #777;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        /* FOOTER */

        footer {
            text-align: center;
            color: #888;
            font-size: 13px;
            margin: 30px 0;
        }

    </style>

</head>

<body>

<!-- HEADER -->

<div class="header">

    <h1>🛡 Women Safety Hub</h1>

    <p>Available Safe Zones</p>

</div>


<div class="container">

    <!-- BACK -->

    <a href="index.jsp"
       class="back-button">

        ← Back to Home

    </a>


    <!-- TITLE -->

    <div class="title-card">

        <h2>📍 Safe Zones</h2>

        <p>
            Safe places available for your search.
        </p>

        <%

            String searchTerm =
                (String) request.getAttribute("searchTerm");

            if (searchTerm != null &&
                !searchTerm.trim().isEmpty()) {

        %>

            <div class="search-info">

                🔍 Search results for:

                <%= searchTerm %>

            </div>

        <%

            }

        %>

    </div>


    <!-- CURRENT LOCATION -->

    <div class="location-section">

        <h3>📍 Your Current Location</h3>

        <button
            type="button"
            class="location-button"
            onclick="getUserLocation()">

            📍 Use My Current Location

        </button>

        <p id="location-status">

            Location not detected yet.

        </p>

    </div>


    <!-- MAP -->

    <div id="map"></div>


    <%

        /*
         * Safe zones come from SearchServlet.
         */

        List<SafeZone> safeZones =
            (List<SafeZone>) request.getAttribute("safeZones");

        boolean hasZones =
            safeZones != null && !safeZones.isEmpty();

        if (hasZones) {

            int count = 1;

            for (SafeZone zone : safeZones) {

    %>


        <!-- SAFE ZONE CARD -->

        <div
            class="zone-card"

            data-lat="<%= zone.getLatitude() %>"

            data-lng="<%= zone.getLongitude() %>"

            data-name="<%= zone.getLocation() %>"

            data-type="<%= zone.getType() %>"

            data-phone="<%= zone.getPhone() %>"
        >


            <!-- LOCATION -->

            <h3>

                <span class="number">

                    <%= count %>

                </span>

                📍 <%= zone.getLocation() %>

            </h3>


            <!-- TYPE -->

            <div class="zone-info">

                <span class="label">

                    🏢 Type:

                </span>

                <%= zone.getType() %>

            </div>


            <!-- PHONE -->

            <div class="zone-info">

                <span class="label">

                    📞 Phone:

                </span>

                <a
                    href="tel:<%= zone.getPhone() %>"
                    class="phone">

                    <%= zone.getPhone() %>

                </a>

            </div>


            <!-- CALL BUTTON -->

            <a
                href="tel:<%= zone.getPhone() %>"
                class="call-button">

                📞 Call Now

            </a>


            <!-- COORDINATES -->

            <div class="coordinates">

                <div class="zone-info">

                    <span class="label">

                        🌐 Latitude:

                    </span>

                    <%= zone.getLatitude() %>

                </div>


                <div class="zone-info">

                    <span class="label">

                        🌐 Longitude:

                    </span>

                    <%= zone.getLongitude() %>

                </div>

            </div>


            <!-- DISTANCE -->

            <div class="distance">

                📏

                <span class="distance-text">

                    Distance will be calculated
                    after location is detected.

                </span>

            </div>


            <!-- START DIRECTION -->

            <a
                href="#"
                class="direction-button direction-link"
                target="_blank"
                style="display:none;">

                🧭 Start Direction

            </a>


        </div>


    <%

                count++;

            }

        } else {

    %>


        <!-- NO RESULTS -->

        <div class="empty">

            <h2>😔 No Safe Zones Found</h2>


            <%

                if (searchTerm != null &&
                    !searchTerm.trim().isEmpty()) {

            %>

                <p>

                    No safe zones were found for

                    <strong>

                        <%= searchTerm %>

                    </strong>.

                </p>


            <%

                } else {

            %>

                <p>

                    There are currently no safe zones available.

                </p>


            <%

                }

            %>


            <p>

                Please try another location.

            </p>

        </div>


    <%

        }

    %>


    <!-- FOOTER -->

    <footer>

        © 2026 Women Safety Hub

    </footer>


</div>


<!-- LEAFLET JS -->

<script
    src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js">
</script>


<script>

    /*
     * MAP INITIALIZATION
     */

    let map = L.map('map').setView(

        [16.5062, 80.6480],

        13

    );


    /*
     * OPEN STREET MAP
     */

    L.tileLayer(

        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',

        {

            maxZoom: 19,

            attribution:
                '&copy; OpenStreetMap contributors'

        }

    ).addTo(map);


    let userMarker = null;

    let userLat = null;

    let userLng = null;


    let markersLayer =
        L.layerGroup().addTo(map);


    /*
     * GET USER LOCATION
     */

    function getUserLocation() {

        const status =
            document.getElementById("location-status");


        if (!navigator.geolocation) {

            status.innerText =
                "❌ Geolocation is not supported by this browser.";

            return;

        }


        status.innerText =
            "📍 Getting your location...";


        navigator.geolocation.getCurrentPosition(

            function(position) {


                userLat =
                    position.coords.latitude;


                userLng =
                    position.coords.longitude;


                status.innerText =

                    "✅ Your location: " +

                    userLat.toFixed(6) +

                    ", " +

                    userLng.toFixed(6);


                /*
                 * Remove old user marker
                 */

                if (userMarker !== null) {

                    map.removeLayer(userMarker);

                }


                /*
                 * Add user marker
                 */

                userMarker = L.marker(

                    [userLat, userLng]

                )

                .addTo(map)

                .bindPopup(

                    "<b>📍 You are here</b>"

                )

                .openPopup();


                /*
                 * Move map to user
                 */

                map.setView(

                    [userLat, userLng],

                    14

                );


                /*
                 * Calculate distances
                 */

                calculateDistances();


            },


            function(error) {


                if (error.code === 1) {

                    status.innerText =
                        "❌ Location permission denied. Please allow location access.";

                }

                else if (error.code === 2) {

                    status.innerText =
                        "❌ Your location could not be determined.";

                }

                else if (error.code === 3) {

                    status.innerText =
                        "❌ Location request timed out.";

                }

                else {

                    status.innerText =
                        "❌ Unable to get your location.";

                }

            },


            {

                enableHighAccuracy: true,

                timeout: 10000,

                maximumAge: 0

            }

        );

    }


    /*
     * DISTANCE CALCULATION
     */

    function calculateDistance(

        lat1,

        lon1,

        lat2,

        lon2

    ) {


        const R = 6371;


        const dLat =
            toRadians(lat2 - lat1);


        const dLon =
            toRadians(lon2 - lon1);


        const a =

            Math.sin(dLat / 2) *

            Math.sin(dLat / 2) +

            Math.cos(toRadians(lat1)) *

            Math.cos(toRadians(lat2)) *

            Math.sin(dLon / 2) *

            Math.sin(dLon / 2);


        const c =

            2 *

            Math.atan2(

                Math.sqrt(a),

                Math.sqrt(1 - a)

            );


        return R * c;

    }


    function toRadians(degree) {

        return degree *

            (Math.PI / 180);

    }


    /*
     * ADD SAFE ZONE MARKERS
     */

    function calculateDistances() {


        markersLayer.clearLayers();


        const cards =

            document.querySelectorAll(

                ".zone-card"

            );


        cards.forEach(function(card) {


            const lat =

                parseFloat(

                    card.getAttribute("data-lat")

                );


            const lng =

                parseFloat(

                    card.getAttribute("data-lng")

                );


            const name =

                card.getAttribute("data-name");


            const type =

                card.getAttribute("data-type");


            if (

                isNaN(lat) ||

                isNaN(lng)

            ) {

                return;

            }


            /*
             * Calculate distance
             */

            const distance =

                calculateDistance(

                    userLat,

                    userLng,

                    lat,

                    lng

                );


            /*
             * Display distance
             */

            const distanceText =

                card.querySelector(

                    ".distance-text"

                );


            distanceText.innerText =

                distance.toFixed(2) +

                " km away";


            /*
             * Google Maps direction URL
             *
             * User location -> Safe Zone
             */

            const directionLink =

                card.querySelector(

                    ".direction-link"

                );


            directionLink.href =

                "https://www.google.com/maps/dir/?api=1" +

                "&origin=" +

                userLat +

                "," +

                userLng +

                "&destination=" +

                lat +

                "," +

                lng;


            directionLink.style.display =

                "inline-block";


            /*
             * Safe zone marker
             */

            const marker =

                L.marker(

                    [lat, lng]

                );


            marker.bindPopup(

                "<b>🛡 " +

                type +

                "</b><br>" +

                name +

                "<br><br>" +

                "📏 Distance: " +

                distance.toFixed(2) +

                " km"

            );


            markersLayer.addLayer(marker);


        });

    }

</script>


</body>
</html>