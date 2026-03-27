<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />

     
        <link
            href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Marathi&family=Poppins:wght@300;600&display=swap"
            rel="stylesheet">

        <style>

            body {
                background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
                background-size: 400% 400%;
                animation: gradientMove 10s ease infinite;
                font-family: 'Poppins', sans-serif;
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

        
            .shape {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.15);
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

            .shape4 {
                width: 120px;
                height: 120px;
                top: 20%;
                right: 30%;
                animation-delay: 6s;
            }

            .shape5 {
                width: 180px;
                height: 180px;
                bottom: 20%;
                left: 20%;
                animation-delay: 8s;
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
                background: rgba(0, 0, 0, 0.5);
                border: 1px solid rgba(113, 203, 198, 0.6);
                backdrop-filter: blur(12px);
                border-radius: 15px;
                padding: 40px;
                text-align: center;
            }

          
            .andaj {
                font-family: 'Tiro Devanagari Marathi', serif;
                font-size: 3rem;
                color: #87CEEB;
                text-shadow: 0 0 15px rgba(255, 235, 59, 0.8);
            }

         
            .btn-theme {
                background: #71cbc6;
                color: black;
                border: none;
            }

            .btn-theme:hover {
                background: #3aa7a3;
                color: white;
                transform: scale(1.05);
            }

            .btn-outline-theme {
                border: 1px solid #71cbc6;
                color: #71cbc6;
            }

            .btn-outline-theme:hover {
                background: #71cbc6;
                color: black;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

 
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">

             
                <a class="navbar-brand" href="home">
                    <span class="home-emoji">🏠</span> Rentमित्रा
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">

                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link active" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                    </ul>

                    <div>
                        <a href="lg" class="btn btn-theme me-2">Login</a>
                        <a href="reg" class="btn btn-outline-theme">Register</a>
                    </div>

                </div>
            </div>
        </nav>

   
        <div class="shape shape1"></div>
        <div class="shape shape2"></div>
        <div class="shape shape3"></div>
        <div class="shape shape4"></div>
        <div class="shape shape5"></div>

        
        <div class="main-center">

            <div class="glass-card">

                <h2 class="fw-bold mb-3">
                    Welcome to Rental Price Estimation
                </h2>

                <h3 class="mb-3">
                    Smart <span class="andaj">अंदाज</span> for Smart Renting
                </h3>

                <p>
                    Get accurate rental price predictions based on location,
                    amenities, and property insights using intelligent analysis.
                </p>

                <div class="mt-3">
                    <a href="lg" class="btn btn-theme me-2">Get Started</a>
                    <a href="about" class="btn btn-outline-theme">Learn More</a>
                </div>

            </div>

        </div>

       
        <footer class="text-center pb-3">
            © 2026 Rental Price Estimation System | All Rights Reserved
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>