<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to  EasyForYou</title>
    <!-- Bootstrap CSS (optional) -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">


    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar-brand {
            font-weight: bold;
            color: #007bff !important;
        }

        .hero-section {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            padding: 80px 20px;
        }

        .categories h2 {
            font-weight: bold;
            color: #333;
        }

        .category-card {
            border-radius: 10px;
            background-color: #f8f9fa;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        footer {
            background-color: #343a40;
            color: white;
        }

    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#"> EasyForYou</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="products.jsp">Shop</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<header class="hero-section text-center text-white">
    <div class="container py-5">
        <h1 class="display-4">Discover Amazing Deals at EasyForYou</h1>
        <p class="lead">Shop your favorite products at unbeatable prices.</p>
        <a href="products.jsp" class="btn btn-primary btn-lg mt-3">Start Shopping</a>
    </div>
</header>

<!-- Categories Section -->
<section class="categories py-5">
    <div class="container">
        <h2 class="text-center mb-4">Shop by Categories</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="category-card p-3 text-center shadow">
                    <img src="accest/indexiImage/electronic.png" alt="Electronics" class="img-fluid">
                    <h4 class="mt-3">Electronics</h4>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card p-3 text-center shadow">
                    <img src="accest/indexiImage/fashion.png" alt="Fashion" class="img-fluid">
                    <h4 class="mt-3">Fashion</h4>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card p-3 text-center shadow">
                    <img src="accest/indexiImage/home.png" alt="Home Appliances" class="img-fluid">
                    <h4 class="mt-3">Home Appliances</h4>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 EasyForYou. All Rights Reserved.</p>
</footer>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<a href="login-servlet">Login Servlet</a>
</body>
</html>
