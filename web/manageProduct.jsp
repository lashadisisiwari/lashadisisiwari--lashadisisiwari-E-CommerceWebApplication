<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #49698a;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #1f4468;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .header {
            background-color: #628bb5;
            border-bottom: 1px solid #ddd;
            padding: 10px;
            border-radius: 15px;
            color: white;
        }
        .content {
            margin-top: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #1f4468;
            border-color: #1f4468;
        }
        .btn-primary:hover {
            background-color: #16334e;
            border-color: #16334e;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h3 class="text-center"><a href="dashboardPage.html">Admin Dashboard</a></h3>
    <a href="manageProduct.html">Manage Products</a>
    <a href="manageCategory.jsp">Manage Categories</a>
    <a href="manageOrder.jsp">Manage Orders</a>
    <a href="manageUser.jsp">Manage Users</a>
    <a href="login.jsp">Logout</a>
</div>

<div class="main-content">
    <div class="header mb-4">
        <h2>Welcome, Admin</h2>
    </div>

    <div class="content">
        <section id="products">
            <h3>Manage Products</h3>
            <div class="card p-4 mb-4">
                <h5>Add/Edit Product</h5>
                <form id="productForm" class="row g-3">
                    <div class="col-md-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" id="productName" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select id="productCategory" class="form-select" required>
                            <option value="" disabled selected>Select a category</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" id="productPrice" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea id="productDescription" class="form-control" rows="1" required></textarea>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Add Product</button>
                    </div>
                </form>
            </div>

            <div class="card p-4">
                <h5>Product List</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody id="productTableBody">
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>

<script src="js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/manageProduct.js"></script>
</body>
</html>
