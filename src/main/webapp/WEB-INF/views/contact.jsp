<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact</title>

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

            @keyframes float {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-25px);
                }
            }

           
            .glass-card {
                background: rgba(0, 0, 0, 0.55);
                border: 1px solid rgba(113, 203, 198, 0.6);
                backdrop-filter: blur(14px);
                border-radius: 15px;
            }

           
            .form-control {
                background: rgba(0, 0, 0, 0.6) !important;
                color: white !important;
                border: 1px solid #71cbc6;
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

          
            .btn-outline-theme {
                border: 1px solid #71cbc6;
                color: #71cbc6;
            }

            .btn-outline-theme:hover {
                background: #71cbc6;
                color: black;
            }

          
            .icon-circle {
                width: 60px;
                height: 60px;
                background: #71cbc6;
                color: black;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 28px;
                margin: auto;
                margin-bottom: 15px;
            }

        
            .main-center {
                min-height: 85vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- FLOAT SHAPES -->
        <div class="shape shape1"></div>
        <div class="shape shape2"></div>
        <div class="shape shape3"></div>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark px-3">
            <div class="container">

                <!-- Brand with Home emoji and Rentमित्रा -->
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
                        <li class="nav-item"><a class="nav-link active" href="contact">Contact</a></li>
                    </ul>

                    <div>
                        <a href="lg" class="btn btn-theme me-2">Login</a>
                        <a href="reg" class="btn btn-outline-theme">Register</a>
                    </div>

                </div>
            </div>
        </nav>

        <!-- CONTACT -->
        <div class="main-center">

            <div class="col-md-5">

                <div class="glass-card p-4 shadow-lg text-center">

                    <!-- ICON -->
                    <div class="icon-circle">📩</div>

                    <h3 class="mb-2">Get in Touch</h3>
                    <p class="mb-4">We’d love to hear from you!</p>

                    <form id="contactForm" onsubmit="return sendInquiry(event)">

                        <div class="mb-3 text-start">
                            <label>Full Name</label>
                            <input type="text" class="form-control" id="name">
                        </div>

                        <div class="mb-3 text-start">
                            <label>Email</label>
                            <input type="email" class="form-control" id="email">
                        </div>

                        <div class="mb-3 text-start">
                            <label>Message</label>
                            <textarea class="form-control" rows="4" id="message"></textarea>
                        </div>

                        <button type="submit" class="btn btn-theme w-100">
                            Send Inquiry
                        </button>

                    </form>

                </div>

            </div>

        </div>


        <footer class="text-center pb-3">
            © 2026 Rental Price Estimation System | All Rights Reserved
        </footer>
<script>

function sendInquiry(event){

    event.preventDefault();

    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let message = document.getElementById("message").value.trim();

    if(name === "" || email === "" || message === ""){
        alert("All fields are required");
        return false;
    }

    let inquiry = {
        name : name,
        email : email,
        message : message
    };

    fetch("/RentalPriceEstimationApp/saveInquiry",{
        method : "POST",
        headers : {
            "Content-Type":"application/json"
        },
        body : JSON.stringify(inquiry)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        document.getElementById("contactForm").reset();
    })
    .catch(err => {
        alert("Error : " + err);
    });

    return false;
}

</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>