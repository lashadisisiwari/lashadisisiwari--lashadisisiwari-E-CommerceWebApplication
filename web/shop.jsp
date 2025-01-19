<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop - E-Commerce</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: rgba(221, 144, 107, 0.69);
        }
        .category-card {
            border: 3px solid #171719;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }
        .category-card:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .category-card img {
            height: 200px;
            object-fit: cover;
        }
        .category-card h5 {
            font-size: 1.2rem;
            margin-top: 10px;
        }
        .category-card p {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Shop by Category</h1>
    <p class="text-center mb-5">Choose from our best product categories below.</p>

    <div class="row">
        <!-- Home Appliances -->
        <div class="col-md-4 mb-4">
            <div class="category-card text-center">
                <img src="accest/indexiImage/home.png" alt="Home Appliances" class="img-fluid">
                <div class="p-3">
                    <h5>Home Appliances</h5>
                    <p>Upgrade your home with the latest appliances.</p>
                    <a href="category.jsp?category=home" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>

        <!-- Fashion -->
        <div class="col-md-4 mb-4">
            <div class="category-card text-center">
                <img src="accest/indexiImage/fashion.png" alt="Fashion" class="img-fluid">
                <div class="p-3">
                    <h5>Fashion</h5>
                    <p>Stay trendy with our latest fashion collections.</p>
                    <a href="category.jsp?category=fashion" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>

        <!-- Electric Items -->
        <div class="col-md-4 mb-4">
            <div class="category-card text-center">
                <img src="accest/indexiImage/electronic.png" alt="Electric Items" class="img-fluid">
                <div class="p-3">
                    <h5>Electric Items</h5>
                    <p>Find the best gadgets and devices.</p>
                    <a href="category.jsp?category=electric" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
