<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
<div class="sidebar">
    <h3 class="text-center"><a href="dashboardPage.html">Admin Dashboard</a></h3>
    <a href="manageProduct.jsp">Manage Products</a>
    <a href="manageCategory.jsp">Manage Categories</a>
    <a href="manageOrder.html">Manage Orders</a>
    <a href="manageUser.jsp">Manage Users</a>
    <a href="login.jsp">Logout</a>
</div>

<div class="main-content">
    <div class="header">
        <h2>Welcome, Admin</h2>
    </div>

    <div class="content">
        <section id="orders" class="mt-5">
            <h3>Manage Orders</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="orderTableBody"></tbody>
            </table>
        </section>
    </div>
</div>

<!-- Modal for Viewing Order Details -->
<div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailsModalLabel">Order Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                    </thead>
                    <tbody id="orderDetailsTableBody"></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

    function loadOrders() {
        fetch(baseUrl + '/orders')
            .then(response => response.json())
            .then(orders => {
                const tableBody = document.getElementById('orderTableBody');
                tableBody.innerHTML = '';
                orders.forEach(order => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${order.id}</td>
                        <td>${order.userName}</td>
                        <td>$${order.amount}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="viewOrder(${order.id})" data-bs-toggle="modal" data-bs-target="#orderDetailsModal">View</button>
                            <button class="btn btn-success btn-sm" onclick="changeStatus(${order.id})">Change Status</button>
                        </td>
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error fetching orders:', error);
            });
    }

    function viewOrder(orderId) {
        fetch(`${baseUrl}/order_details?orderId=${orderId}`)
            .then(response => response.json())
            .then(orderDetails => {
                const tableBody = document.getElementById('orderDetailsTableBody');
                tableBody.innerHTML = '';
                orderDetails.forEach(detail => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${detail.productName}</td>
                        <td>${detail.quantity}</td>
                        <td>$${detail.price.toFixed(2)}</td>
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error fetching order details:', error);
            });
    }

    function changeStatus(orderId) {
        alert(`Changing status for Order ID: ${orderId}`);
    }

    document.addEventListener('DOMContentLoaded', loadOrders);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
