<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>User Registration</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />

        <style>
         
            body {
                background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
                background-size: 400% 400%;
                animation: gradientMove 10s ease infinite;
                color: white;
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

            /* FLOATING CIRCLES */
            .shape {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.15);
                animation: float 8s ease-in-out infinite;
            }

            .shape1 {
                width: 180px;
                height: 180px;
                top: 10%;
                left: 10%;
            }

            .shape2 {
                width: 220px;
                height: 220px;
                bottom: 10%;
                right: 15%;
                animation-delay: 2s;
            }

            .shape3 {
                width: 120px;
                height: 120px;
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
                    transform: translateY(-20px);
                }
            }

        
            .main-center {
                min-height: 90vh;
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
                transition: 0.3s;
            }

            .glass-card:hover {
                transform: translateY(-5px);
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

        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="home">
                    <span class="home-emoji">🏠</span> Rentमित्रा
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="nav">

                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                    </ul>

                    <div>
                        <a href="lg" class="btn btn-theme me-2">Login</a>
                        <a href="reg" class="btn btn-outline-light">Register</a>
                    </div>

                </div>
            </div>
        </nav>

       
        <div class="main-center">

            <div class="col-md-4">

                <div class="glass-card shadow-lg">

                    <h3 class="text-center mb-4">✨ Create Account</h3>

                    <form id="regForm" onsubmit="return validateForm(event)">

                        <div class="mb-3">
                            <label>Full Name</label>
                            <input type="text" class="form-control" id="username" placeholder="Enter your name">
                        </div>

                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter your email">
                        </div>

                        <div class="mb-3">
                            <label>Contact</label>
                            <input type="text" class="form-control" id="contact"
                                placeholder="Enter 10 digit mobile number">
                        </div>

                        <div class="mb-3">
                            <label>Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Create password">
                        </div>

                        <div class="d-flex justify-content-between mt-3">
                            <button type="submit" class="btn btn-theme">Register</button>
                            <button type="reset" class="btn btn-secondary">Cancel</button>
                        </div>

                    </form>

                </div>

            </div>

        </div>

        <!-- FOOTER -->
        <footer class="text-center mt-3 pb-3">
            © 2026 Rental Price Prediction System
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function validateForm(event) {
                event.preventDefault();

                let username = document.getElementById("username").value.trim();
                let email = document.getElementById("email").value.trim();
                let contact = document.getElementById("contact").value.trim();
                let password = document.getElementById("password").value.trim();

                if (username == "") {
                    alert("Name is required");
                    return false;
                }

                if (username.length < 3) {
                    alert("Name must be at least 3 characters");
                    return false;
                }

                let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailPattern.test(email)) {
                    alert("Enter valid email");
                    return false;
                }

                let phonePattern = /^[0-9]{10}$/;

                if (!phonePattern.test(contact)) {
                    alert("Contact must be 10 digits");
                    return false;
                }

                if (password.length < 6) {
                    alert("Password must be at least 6 characters");
                    return false;
                }

                let user = {
                    username: username,
                    email: email,
                    contact: contact,
                    password: password
                };

                fetch("register", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(user)
                })
                    .then(res => res.text())
                    .then(msg => {
                        alert(msg);
                    })
                    .catch((err) => {
                        alert(err);
                    });

                return false;
            }
        </script>

    </body>

    </html>