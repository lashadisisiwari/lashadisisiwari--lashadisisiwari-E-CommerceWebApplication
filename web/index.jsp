<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Shop | Home</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="css/footer.css" rel="stylesheet">
  <style>
    .hero-section {
      background: url('accest/home.png') no-repeat center center/cover;
      height: 60vh;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      position: relative;
    }
    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      z-index: 1;
    }
    .hero-content {
      position: relative;
      z-index: 2;
    }
    .hero-section h1 {
      font-size: 3rem;
      font-weight: bold;
    }
    .hero-section p {
      font-size: 1.25rem;
    }
    .scrolling-images {
      display: flex;
      overflow-x: auto;
      gap: 15px;
      padding: 20px;
      scroll-behavior: smooth;
    }
    .scrolling-images img {
      height: 300px;
      border-radius: 15px;
      flex-shrink: 0;
    }
    .product-card img {
      height: 200px;
      object-fit: cover;
    }
    #imageTab:hover{
      background-color: #76c4f4;
      height: 350px;
      width: 102%;
      margin-left: -1%;
      margin-top: -1%;
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
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="productPage.jsp">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="cartPage.jsp">Cart</a></li>
        <li class="nav-item"><a class="nav-link" href="profilePage.jsp">Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li>
        <li class="nav-item"><a class="nav-link" href="register.jsp">SignIn</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
  <div class="hero-overlay"></div>
  <div class="hero-content">
    <h1>Welcome to E-Shop</h1>
    <p>Your one-stop destination for all your shopping needs.</p>
    <a href="productPage.jsp" class="btn btn-primary btn-lg mt-3">Shop Now</a>
  </div>
</div>

<!-- Scrolling Images Section -->
<div class="container-fluid my-5">
  <h2 class="text-center mb-4" style="text-underline-position: under; text-decoration: underline;">Premium Collections</h2>
  <div class="scrolling-images">
    <img src="accest/product5.jpg" alt="Premium Collection 1">
    <img src="accest/product2.jpg" alt="Premium Collection 2">
    <img src="accest/product3.jpg" alt="Premium Collection 3">
    <img src="accest/product4.jpg" alt="Premium Collection 4">
    <img src="accest/product6.jpg" alt="Premium Collection 5">
    <img src="accest/product7.jpg" alt="Premium Collection 3">
    <img src="accest/product8.jpg" alt="Premium Collection 4">
    <img src="accest/product1.jpg" alt="Premium Collection 5">
    <img src="accest/product9.jpg" alt="Premium Collection 5">
  </div>
</div>

<!-- Featured Products Section -->
<div class="container my-5">
  <h2 class="text-center mb-4">Featured Products</h2>
  <div class="row" id="featured-products">
    <!-- Product cards will be injected here dynamically -->
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
          <li><a href="homePage.jsp">Home</a></li>
          <li><a href="productPage.jsp">Products</a></li>
          <li><a href="cartPage.jsp">Cart</a></li>
          <li><a href="profilePage.jsp">Profile</a></li>
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
<script src="js/index.js"></script>
</body>
</html>
