<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>About - Rental Price Estimation</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"/>

<style>


body {
    background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
    background-size: 400% 400%;
    animation: gradientMove 10s ease infinite;
    color: white;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

@keyframes gradientMove {
    0% {background-position: 0% 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0% 50%;}
}


.navbar {
    background: rgba(0,0,0,0.5) !important;
    backdrop-filter: blur(12px);
    border-radius: 15px;
    padding: 0.5rem 1rem;
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
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

.navbar-nav .nav-link.active {
    color: #71cbc6 !important;
    font-weight: 600;
}

/* BUTTONS SAME AS REGISTER/LOGIN PAGE */
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

.btn-outline-light {
    background: transparent;
    border: 1px solid #ffffff;
    color: white;
}

.btn-outline-light:hover {
    background: #ffffff;
    color: #2b7a78;
}

/* FLOATING SHAPES */
.shape {
    position: absolute;
    border-radius: 50%;
    background: rgba(255,255,255,0.15);
    animation: float 8s ease-in-out infinite;
    z-index:0;
}
.shape1 { width:180px;height:180px;top:10%;left:10%; }
.shape2 { width:220px;height:220px;bottom:10%;right:15%; animation-delay:2s; }
.shape3 { width:120px;height:120px;top:60%;left:5%; animation-delay:4s; }

@keyframes float {
    0%,100% {transform:translateY(0);}
    50% {transform:translateY(-20px);}
}


.about-header {
    text-align:center;
    margin-top:40px;
    position: relative;
    z-index:1;
}

.about-header h1 {
    font-size:2.5rem;
    font-weight:bold;
    color: #ffffff;
}

.about-header p {
    color:#ffffff;
}

/* CONTENT */
.about-content {
    max-width:900px;
    margin:auto;
    position: relative;
    z-index:1;
    padding-bottom:40px;
}

.about-cards {
    display:flex;
    flex-wrap:wrap;
    gap:20px;
    margin-top:30px;
}

.about-card {
    flex:1;
    min-width:280px;
    background: rgba(0,0,0,0.55);
    border:1px solid rgba(255,255,255,0.3);
    backdrop-filter: blur(12px);
    border-radius:15px;
    padding:20px;
}

.about-card h2 {
    text-align:center;
    color:#ffffff;
}

.about-card ul {
    margin-top:10px;
}

/* FOOTER TEXT */
.about-footer {
    text-align:center;
    margin-top:20px;
    font-weight:bold;
    color:#ffffff;
}

footer {
    margin-top:auto;
    padding:10px 0;
    color:#ffffff;
}

</style>
</head>

<body>

<!-- NAVBAR -->
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

<!-- FLOAT SHAPES -->
<div class="shape shape1"></div>
<div class="shape shape2"></div>
<div class="shape shape3"></div>

<!-- HEADER -->
<div class="about-header">
    <h1>Rental Price Estimation</h1>
    <p>Your smart solution for accurate rent prediction</p>
</div>

<!-- CONTENT -->
<div class="container flex-grow-1">

    <div class="about-content">

        <p class="text-white">
            The <strong>Rental Price Estimation System</strong> helps predict
            property rent using advanced machine learning techniques.
        </p>

        <!-- CARDS -->
        <div class="about-cards">

            <div class="about-card">
                <h2>For Admin</h2>
                <ul>
                    <li>Manage users and data</li>
                    <li>Add property listings</li>
                    <li>Monitor system performance</li>
                    <li>Update pricing models</li>
                </ul>
            </div>

            <div class="about-card">
                <h2>For Users</h2>
                <ul>
                    <li>Search rental properties</li>
                    <li>Predict accurate rent</li>
                    <li>Compare locations easily</li>
                    <li>Make smart decisions</li>
                </ul>
            </div>

        </div>

        <p class="about-footer">
            Fast • Reliable • Smart Rental Predictions
        </p>

    </div>

</div>

<!-- FOOTER -->
<footer class="text-center mt-3 pb-3">
    © 2026 Rental Price Prediction System
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>