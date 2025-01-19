<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category - E-Commerce</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <%
        String category = request.getParameter("category");
        String title = "";

        if (category == null) {
            title = "Unknown Category";
        } else if (category.equals("home_appliances")) {
            title = "Home Appliances";
        } else if (category.equals("fashion")) {
            title = "Fashion";
        } else if (category.equals("electric_items")) {
            title = "Electric Items";
        } else {
            title = "Unknown Category";
        }
    %>
    <h1 class="text-center mb-4"><%= title %></h1>
    <p class="text-center">Explore top products in <strong><%= title %></strong>.</p>
    <!-- Sample Product Cards -->
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="images/product1.jpg" alt="Product" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">Sample Product</h5>
                    <p class="card-text">A product from the <%= title %> category.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
