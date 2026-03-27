<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login - Rental Price Estimation</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />

        <style>
         
            body {
                background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
                background-size: 400% 400%;
                animation: gradientMove 10s ease infinite;
                color: white;
                overflow: hidden;
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
                height: 85vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

         
            .glass-card {
                background: rgba(0, 0, 0, 0.55);
                border: 1px solid rgba(113, 203, 198, 0.6);
                backdrop-filter: blur(15px);
                border-radius: 18px;
                padding: 35px;
                width: 100%;
                max-width: 380px;
            }

         
            .form-control {
                background: rgba(0, 0, 0, 0.6) !important;
                color: white !important;
                border: 1px solid #71cbc6;
            }

            .form-control::placeholder {
                color: #bbb;
            }

            .form-control:focus {
                border-color: #71cbc6;
                box-shadow: 0 0 10px #71cbc6;
            }

            /* BUTTON */
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
        </style>
    </head>

    <body>


        <div class="shape shape1"></div>
        <div class="shape shape2"></div>
        <div class="shape shape3"></div>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <!-- Brand with Home emoji -->
                <a class="navbar-brand" href="home">
                    <span class="home-emoji">🏠</span> Rentमित्रा
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                    </ul>

                    <div>
                        <a href="lg" class="btn btn-theme me-2">Login</a>
                        <a href="reg" class="btn btn-outline-light">Register</a>
                    </div>

                </div>
            </div>
        </nav>

        <!-- LOGIN -->
        <div class="main-center">

            <div class="glass-card shadow-lg">

                <h3 class="text-center mb-4">Login Here</h3>

                <form id="loginForm" onsubmit="return loginUser(event)">

                    <div class="mb-3">
                        <label>Username</label>
                        <input type="text" id="username" class="form-control" placeholder="Enter username">
                    </div>

                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" id="password" class="form-control" placeholder="Enter password">
                    </div>

                    <div class="d-flex justify-content-between mt-3">
                        <button type="submit" class="btn btn-theme">Login</button>
                        <button type="reset" class="btn btn-secondary">Cancel</button>
                    </div>

                    <div id="msg" class="text-center mt-3 text-warning"></div>

                </form>

            </div>

        </div>

        <footer class="text-center text-light pb-3">
            © 2026 Rental Price Estimation System | All Rights Reserved
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ⚠️ FUNCTION SAME (NO CHANGE) -->
        <script>
            function loginUser(event) {
                event.preventDefault();

                let username = document.getElementById("username").value.trim();
                let password = document.getElementById("password").value.trim();

                if (username == "") {
                    alert("Username required");
                    return false;
                }

                if (username.length < 3) {
                    alert("Username must be minimum 3 characters");
                    return false;
                }

                if (password == "") {
                    alert("Password required");
                    return false;
                }

                if (password.length < 6) {
                    alert("Password must be minimum 6 characters");
                    return false;
                }

                let user = {
                    username: username,
                    password: password
                };

                fetch("login", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(user)
                })
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === "User Login Success") {
                            window.location.href = "${pageContext.request.contextPath}/user/userDashboard";
                        }
                        else if (msg === "Admin Login Success") {
                            window.location.href = "${pageContext.request.contextPath}/admin/adminDashboard";
                        }
                        else {
                            document.getElementById("msg").innerHTML = msg;
                        }
                    });

                return false;
            }
        </script>

    </body>

    </html>