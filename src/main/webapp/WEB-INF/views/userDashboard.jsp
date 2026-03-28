<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String user=(String) session.getAttribute("un"); String ue=(String) session.getAttribute("ue"); String
        uc=(String) session.getAttribute("uc"); if (user==null) { response.sendRedirect("lg"); } %>
        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>User Dashboard</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />

            <style>
               
                body {
                    background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
                    background-size: 400% 400%;
                    animation: gradientMove 10s ease infinite;
                    color: white;
                    overflow-x: hidden;
                }

                @keyframes gradientMove {
                    0% {
                        background-position: 0% 50%;
                    }

                    50% {
                        background-position: 100% 50%;
                    }

                    100% {
                        background-position: 0% 50%;
                    }
                }

            
                .navbar {
                    background: rgba(0, 0, 0, 0.5) !important;
                    backdrop-filter: blur(12px);
                    border-radius: 15px;
                    padding: 0.5rem 1rem;
                    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
                }

                .navbar-brand {
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .navbar-brand .home-emoji {
                    font-size: 1.5rem;
                }

                .nav-btns {
                    display: flex;
                    gap: 10px;
                    align-items: center;
                }

                .welcome-text {
                    color: #71cbc6;
                    font-weight: bold;
                    font-size: 18px;
                }

              
                .shape {
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.1);
                    animation: float 8s ease-in-out infinite;
                }

                .shape1 {
                    width: 200px;
                    height: 200px;
                    top: 10%;
                    left: 10%;
                }

                .shape2 {
                    width: 250px;
                    height: 250px;
                    bottom: 10%;
                    right: 15%;
                    animation-delay: 2s;
                }

                .shape3 {
                    width: 150px;
                    height: 150px;
                    top: 60%;
                    left: 5%;
                    animation-delay: 4s;
                }

                @keyframes float {

                    0%,
                    100% {
                        transform: translateY(0);
                    }

                    50% {
                        transform: translateY(-25px);
                    }
                }

                .main-center {
                    min-height: 85vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .glass-card {
                    background: rgba(0, 0, 0, 0.55);
                    border: 1px solid rgba(113, 203, 198, 0.6);
                    backdrop-filter: blur(15px);
                    border-radius: 18px;
                    padding: 20px;
                    /* reduced padding */
                    margin: 10px 0;
                    /* small margin */
                }

            
                .form-control,
                .form-select {
                    background: rgba(0, 0, 0, 0.6) !important;
                    color: white !important;
                    border: 1px solid #71cbc6;
                }

                .form-control:focus,
                .form-select:focus {
                    border-color: #71cbc6;
                    box-shadow: 0 0 10px #71cbc6;
                }

           
                .btn-theme {
                    background: #71cbc6;
                    color: black;
                    border: none;
                    transition: 0.3s;
                }

                .btn-theme:hover {
                    background: #3aa7a3;
                    color: white;
                    transform: scale(1.05);
                }

                
                .profile-box {
                    text-align: center;
                }

                .profile-box h4 {
                    color: #71cbc6;
                    margin-bottom: 10px;
                    font-size: 1.25rem;
                }

                .profile-box p {
                    margin: 5px 0;
                    font-size: 14px;
                }
            </style>
        </head>

        <body>

            <!-- FLOATING SHAPES -->
            <div class="shape shape1"></div>
            <div class="shape shape2"></div>
            <div class="shape shape3"></div>

            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container-fluid d-flex justify-content-between align-items-center">
                    <a class="navbar-brand" href="home">
                        <span class="home-emoji">🏠</span> Rentमित्रा
                    </a>
                    <div class="nav-btns">
                        <div class="welcome-text">Welcome ${un}</div>
                        <button class="btn btn-theme" onclick="showProfile()">View Profile</button>
                        <a class="btn btn-danger" href="logout">Log Out</a>
                    </div>
                </div>
            </nav>

            <!-- PROFILE FORM -->
            <div id="profileForm" class="main-center d-none">
                <div class="glass-card shadow-lg col-md-4 profile-box">
                    <h4>👤 My Profile</h4>
                    <p><b>Name:</b>
                        <%= session.getAttribute("un") %>
                    </p>
                    <p><b>Email:</b>
                        <%= session.getAttribute("ue") %>
                    </p>
                    <p><b>Phone:</b>
                        <%= session.getAttribute("uc") %>
                    </p>
                    <button class="btn btn-secondary mt-2" onclick="hideProfile()">Close</button>
                </div>
            </div>

            <!-- PROPERTY FORM -->
            <div id="addForm" class="main-center">
                <div class="glass-card shadow-lg col-md-6">
                    <h3 class="text-center mb-3">🏠 Property Details</h3>

                    <form>
                        <div class="mb-2">
                            <label>State</label>
                            <select id="ssl" onchange="loadC()" class="form-select">
                                <option value="">Select State</option>
                            </select>
                        </div>

                        <div class="mb-2">
                            <label>City</label>
                            <select id="cs" onchange="loadL()" class="form-select">
                                <option value="">Select City</option>
                            </select>
                        </div>

                        <div class="mb-2">
                            <label>Location</label>
                            <select id="cl" class="form-select">
                                <option value="">Select Location</option>
                            </select>
                        </div>

                        <div class="mb-2">
                            <label>Area (sq ft)</label>
                            <input type="number" id="area_sqft" class="form-control">
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6 mb-2">
                                <label>Bedrooms</label>
                                <input type="number" id="bedrooms" class="form-control">
                            </div>
                            <div class="col-md-6 mb-2">
                                <label>Bathrooms</label>
                                <input type="number" id="bathrooms" class="form-control">
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6 mb-2">
                                <label>Metro Distance</label>
                                <input type="number" id="metro_distance" class="form-control">
                            </div>
                            <div class="col-md-6 mb-2">
                                <label>Parking</label>
                                <select id="parking" class="form-select">
                                    <option value="">-- Select --</option>
                                    <option value="true">Yes</option>
                                    <option value="false">No</option>
                                </select>
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <button type="reset" class="btn btn-secondary me-2">Clear</button>
                            <button type="button" class="btn btn-theme" onclick="predictRent()">Predict Rent</button>
                        </div>

                        <h3 id="result" class="text-center mt-3 text-warning"></h3>
                    </form>
                </div>
            </div>

            <script>
               
                function showProfile() {
                    document.getElementById("addForm").classList.add("d-none");
                    document.getElementById("profileForm").classList.remove("d-none");
                }
                function hideProfile() {
                    document.getElementById("profileForm").classList.add("d-none");
                    document.getElementById("addForm").classList.remove("d-none");
                }

             
                function loadS() {
                    fetch("/RentalPriceEstimationApp/admin/states")
                        .then(res => res.json())
                        .then(data => {
                            let s = document.getElementById("ssl");
                            s.innerHTML = "<option value=''>Select State</option>";
                            data.forEach(e => {
                                let op = document.createElement("option");
                                op.value = e.statecode;
                                op.text = e.statename;
                                s.appendChild(op);
                            });
                        });
                }

               
                function loadC() {
                    let statecode = document.getElementById("ssl").value;
                    if (statecode == "") return;

                    fetch("/RentalPriceEstimationApp/admin/cities/" + statecode)
                        .then(res => res.json())
                        .then(data => {
                            let cs = document.getElementById("cs");
                            cs.innerHTML = "<option value=''>Select City</option>";
                            data.forEach(c => {
                                let op = document.createElement("option");
                                op.value = c.id;
                                op.text = c.name;
                                cs.appendChild(op);
                            });
                        });
                }

                function loadL() {
                    let cityid = document.getElementById("cs").value;
                    if (cityid == "") return;

                    fetch("/RentalPriceEstimationApp/admin/locations/" + cityid)
                        .then(res => res.json())
                        .then(data => {
                            let cl = document.getElementById("cl");
                            cl.innerHTML = "<option value=''>Select Location</option>";
                            data.forEach(l => {
                                let op = document.createElement("option");
                                op.value = l.locationcode;
                                op.text = l.locationname;
                                cl.appendChild(op);
                            });
                        });
                }

                // predict rent
                function predictRent() {
                    let property = {
                        locationcode: Number(document.getElementById("cl").value),
                        area_sqft: Number(document.getElementById("area_sqft").value),
                        bedrooms: Number(document.getElementById("bedrooms").value),
                        bathrooms: Number(document.getElementById("bathrooms").value),
                        metro_distance: Number(document.getElementById("metro_distance").value),
                        parking: document.getElementById("parking").value === "true"
                    };

                    fetch("/RentalPriceEstimationApp/user/predict", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(property)
                    })
                        .then(res => res.json())
                        .then(data => {
                            document.getElementById("result").innerText = "Predicted Rent ₹ : " + data.price;
                        });
                }

              
                window.onload = function () { loadS(); }
            </script>

        </body>

        </html>