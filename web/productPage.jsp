<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            max-width: 1200px;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .card img {
            border-radius: 15px 15px 0 0;
            max-height: 250px;
            object-fit: cover;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #333;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
        }

        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #ff3e2e;
            border-color: #ff3e2e;
        }

        .form-control, .form-select {
            border-radius: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .form-select {
            max-width: 180px;
        }

        .search-container input {
            border-radius: 25px;
            padding-left: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .search-container .form-control::placeholder {
            color: #aaa;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">E-Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="homePage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="productPage.html">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="cartPage.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="profilePage.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">SignIn</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center">Our Products</h1>
    <div class="row mb-4">
        <div class="col-md-6 search-container">
            <input type="text" class="form-control" placeholder="Search products..." id="search">
        </div>
        <div class="col-md-6 text-end">
            <select class="form-select d-inline" id="sort">
                <option value="">Sort by Price</option>
                <option value="asc">Low to High</option>
                <option value="desc">High to Low</option>
            </select>
        </div>
    </div>

    <div class="row" id="product-list">
        <!-- Products will be loaded here dynamically -->
    </div>
</div>

<!-- Footer Section -->
<footer class="footer text-center">
    <div class="container py-4">
        <div class="row">
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <p>Email: support@eshop.com</p>
                <p>Phone: +1 234 567 890</p>
                <p>Address: 123 E-Shop St, City, Country</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="homePage.html">Home</a></li>
                    <li><a href="productPage.html">Products</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="profilePage.html">Profile</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Follow Us</h5>
                <a href="#" class="btn btn-social-icon btn-facebook custom-icon">
                    <i class="bi bi-facebook"></i>
                </a>
                <a href="#" class="btn btn-social-icon btn-twitter custom-icon">
                    <i class="bi bi-twitter"></i>
                </a>
                <a href="#" class="btn btn-social-icon btn-instagram custom-icon">
                    <i class="bi bi-instagram"></i>
                </a>
            </div>
        </div>
        <div class="pt-3">
            <p>&copy; 2025 E-Shop. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/productPage.js"></script>
</body>
</html>
