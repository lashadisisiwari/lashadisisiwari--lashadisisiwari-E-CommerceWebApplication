<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
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
            padding: 5px;
            border-radius: 15px;
        }
        .content {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <h3 class="text-center"><a href="dashboardPage.jsp">Admin Dashboard</a></h3>
    <a href="manageProduct.jsp">Manage Products</a>
    <a href="manageCategory.jsp">Manage Categories</a>
    <a href="manageOrder.jsp">Manage Orders</a>
    <a href="manageUser.jsp">Manage Users</a>
    <a href="login.jsp">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <div class="header">
        <h2>Welcome, Admin</h2>
    </div>

    <!-- Content -->
    <div class="content">
        <section id="products">
            <h3>Manage Products</h3>
            <button class="btn btn-primary mb-3">Add Product</button>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Sample Product</td>
                    <td>Category 1</td>
                    <td>$100</td>
                    <td>
                        <button class="btn btn-warning btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </section>

        <section id="categories" class="mt-5">
            <h3>Manage Categories</h3>
            <button class="btn btn-primary mb-3">Add Category</button>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Category 1</td>
                    <td>
                        <button class="btn btn-warning btn-sm">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </section>

        <section id="orders" class="mt-5">
            <h3>Manage Orders</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>$200</td>
                    <td>Pending</td>
                    <td>
                        <button class="btn btn-success btn-sm">View</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </section>

        <section id="users" class="mt-5">
            <h3>Manage Users</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Jane Doe</td>
                    <td>jane@example.com</td>
                    <td>Active</td>
                    <td>
                        <button class="btn btn-warning btn-sm">Deactivate</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </section>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
