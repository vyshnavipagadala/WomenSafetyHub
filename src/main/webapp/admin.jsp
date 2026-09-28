<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Admin Panel - Women Safety Hub</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f6fa;
            color: #333;
        }

        /* HEADER */

        .header {
            background: #c82333;
            color: white;
            padding: 22px 15px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            font-size: 28px;
        }

        .header p {
            margin: 8px 0 0;
            font-size: 15px;
        }


        /* MAIN CONTAINER */

        .container {
            width: 90%;
            max-width: 850px;
            margin: 30px auto;
        }


        /* CARD */

        .card {
            background: white;
            padding: 28px;
            margin-bottom: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.10);
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #c82333;
        }


        /* INFORMATION BOX */

        .info {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
            padding: 13px;
            border-radius: 7px;
            margin-bottom: 22px;
            line-height: 1.5;
        }


        /* FORM */

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
            background: white;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #c82333;
        }


        /* COORDINATE INPUT */

        .coordinates {
            background: #f1f3f5;
        }


        /* LOCATION BUTTON */

        .location-button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 7px;
            background: #0275d8;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 15px;
        }

        .location-button:hover {
            background: #025aa5;
        }

        .location-button:disabled {
            background: #777;
            cursor: not-allowed;
        }


        /* SAVE BUTTON */

        .save-button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 7px;
            background: #c82333;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .save-button:hover {
            background: #a71d2a;
        }


        /* STATUS */

        .status {
            display: none;
            margin-top: 15px;
            padding: 12px;
            border-radius: 7px;
            line-height: 1.5;
        }

        .success {
            display: block;
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            display: block;
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }


        /* LINKS */

        .back-link {
            display: inline-block;
            margin-top: 18px;
            color: #0275d8;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }


        /* DELETE CARD */

        .delete-card {
            border-left: 5px solid #dc3545;
        }

        .delete-card h2 {
            color: #dc3545;
        }

        .manage-button {
            display: inline-block;
            padding: 12px 20px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
        }

        .manage-button:hover {
            background: #b02a37;
        }


        /* FOOTER */

        .footer {
            text-align: center;
            color: #777;
            font-size: 13px;
            padding: 20px;
        }


        /* MOBILE */

        @media (max-width: 600px) {

            .container {
                width: 95%;
            }

            .card {
                padding: 20px;
            }

            .header h1 {
                font-size: 23px;
            }

        }

    </style>

</head>


<body>


    <!-- ================= HEADER ================= -->

    <div class="header">

        <h1>🛡 Women Safety Hub</h1>

        <p>Admin Panel</p>

    </div>



    <!-- ================= MAIN ================= -->

    <div class="container">


        <!-- ================= ADD SAFE ZONE ================= -->

        <div class="card">

            <h2>➕ Add Safe Zone</h2>


            <div class="info">

                📍 Enter the place details below.
                Then click <b>Get Location Coordinates</b>
                to automatically get the current latitude and longitude.

            </div>


            <form
                action="add"
                method="post"
                id="safeZoneForm">


                <!-- LOCATION -->

                <div class="form-group">

                    <label for="location">
                        📍 Place / Location
                    </label>

                    <input
                        type="text"
                        id="location"
                        name="location"
                        placeholder="Example: Bhimavaram Police Station"
                        required>

                </div>



                <!-- TYPE -->

                <div class="form-group">

                    <label for="type">
                        🏢 Safe Zone Type
                    </label>

                    <select
                        id="type"
                        name="type"
                        required>

                        <option value="">
                            Select Type
                        </option>

                        <option value="Police Station">
                            🚔 Police Station
                        </option>

                        <option value="Hospital">
                            🏥 Hospital
                        </option>

                        <option value="Helpline">
                            ☎ Helpline
                        </option>

                        <option value="Safe Place">
                            🏠 Safe Place
                        </option>

                    </select>

                </div>



                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        📞 Phone Number
                    </label>

                    <input
                        type="text"
                        id="phone"
                        name="phone"
                        placeholder="Example: 100"
                        required>

                </div>



                <!-- LATITUDE -->

                <div class="form-group">

                    <label for="latitude">
                        🌐 Latitude
                    </label>

                    <input
                        type="text"
                        id="latitude"
                        name="latitude"
                        class="coordinates"
                        placeholder="Latitude will appear here"
                        readonly
                        required>

                </div>



                <!-- LONGITUDE -->

                <div class="form-group">

                    <label for="longitude">
                        🌐 Longitude
                    </label>

                    <input
                        type="text"
                        id="longitude"
                        name="longitude"
                        class="coordinates"
                        placeholder="Longitude will appear here"
                        readonly
                        required>

                </div>



                <!-- GET LOCATION -->

                <button
                    type="button"
                    id="locationButton"
                    class="location-button"
                    onclick="getCoordinates()">

                    📍 Get Location Coordinates

                </button>



                <!-- SAVE -->

                <button
                    type="submit"
                    class="save-button">

                    💾 Save Safe Zone

                </button>



                <!-- STATUS -->

                <div
                    id="status"
                    class="status">
                </div>


            </form>



            <!-- VIEW SAFE ZONES -->

            


        <!-- ================= DELETE SECTION ================= -->

        <div class="card delete-card">

            <h2>🗑 Manage Safe Zones</h2>

            <p>
                From the Safe Zones page, the administrator can
                manage and delete safe zones.
            </p>

            <a
                href="<%= request.getContextPath() %>/manageZones.jsp"
                class="manage-button">

                Manage Safe Zones

            </a>

        </div>


    </div>



    <!-- ================= FOOTER ================= -->

    <div class="footer">

        Women Safety Hub © 2026

    </div>



    <!-- ================= JAVASCRIPT ================= -->

    <script>

        function getCoordinates() {

            const button =
                document.getElementById("locationButton");

            const latitudeInput =
                document.getElementById("latitude");

            const longitudeInput =
                document.getElementById("longitude");

            const status =
                document.getElementById("status");


            /*
             * Check browser location support
             */

            if (!navigator.geolocation) {

                status.className =
                    "status error";

                status.innerHTML =
                    "❌ Your browser does not support location services.";

                return;
            }


            /*
             * Change button text
             */

            button.innerHTML =
                "📍 Getting Location...";

            button.disabled = true;


            status.className =
                "status success";

            status.innerHTML =
                "🔍 Please wait... Getting your current location.";


            /*
             * Get current browser location
             */

            navigator.geolocation.getCurrentPosition(

                function(position) {


                    /*
                     * Get latitude
                     */

                    const latitude =
                        position.coords.latitude;


                    /*
                     * Get longitude
                     */

                    const longitude =
                        position.coords.longitude;


                    /*
                     * Put values into input boxes
                     */

                    latitudeInput.value =
                        latitude.toFixed(6);

                    longitudeInput.value =
                        longitude.toFixed(6);


                    /*
                     * Success message
                     */

                    status.className =
                        "status success";

                    status.innerHTML =
                        "✅ Location coordinates added successfully!<br>" +
                        "Latitude: " +
                        latitude.toFixed(6) +
                        "<br>" +
                        "Longitude: " +
                        longitude.toFixed(6);


                    /*
                     * Change button
                     */

                    button.innerHTML =
                        "✅ Coordinates Added";

                    button.disabled = false;


                },


                function(error) {


                    /*
                     * Reset button
                     */

                    button.innerHTML =
                        "📍 Get Location Coordinates";

                    button.disabled = false;


                    /*
                     * Location permission denied
                     */

                    if (error.code === 1) {

                        status.className =
                            "status error";

                        status.innerHTML =
                            "❌ Location permission denied.<br>" +
                            "Please click <b>Allow</b> when Chrome asks for location permission.";

                    }


                    /*
                     * Location unavailable
                     */

                    else if (error.code === 2) {

                        status.className =
                            "status error";

                        status.innerHTML =
                            "❌ Location is unavailable.<br>" +
                            "Please check your internet/Wi-Fi and try again.";

                    }


                    /*
                     * Timeout
                     */

                    else if (error.code === 3) {

                        status.className =
                            "status error";

                        status.innerHTML =
                            "❌ Location request timed out.<br>" +
                            "Please click the button again.";

                    }


                    /*
                     * Unknown error
                     */

                    else {

                        status.className =
                            "status error";

                        status.innerHTML =
                            "❌ Unable to get your current location.";

                    }

                },


                /*
                 * Location options
                 */

                {
                    enableHighAccuracy: true,
                    timeout: 15000,
                    maximumAge: 0
                }

            );

        }



        /*
         * Before submitting the form,
         * make sure coordinates exist.
         */

        document
            .getElementById("safeZoneForm")
            .addEventListener("submit", function(event) {


                const latitude =
                    document.getElementById("latitude").value.trim();

                const longitude =
                    document.getElementById("longitude").value.trim();


                if (latitude === "" || longitude === "") {

                    event.preventDefault();

                    alert(
                        "❌ Please click 'Get Location Coordinates' first."
                    );

                    return;
                }


                /*
                 * Check valid numbers
                 */

                if (isNaN(latitude) || isNaN(longitude)) {

                    event.preventDefault();

                    alert(
                        "❌ Invalid latitude or longitude."
                    );

                    return;
                }

            });

    </script>


</body>

</html>