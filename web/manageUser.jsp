<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
            margin-left: 240px;
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
    <h3 class="text-center"><a href="dashboardPage.html">Admin Dashboard</a></h3>
    <a href="manageProduct.jsp">Manage Products</a>
    <a href="manageCategory.jsp">Manage Categories</a>
    <a href="manageOrder.jsp">Manage Orders</a>
    <a href="manageUser.html">Manage Users</a>
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
        <section id="users" class="mt-5">
            <h3>Manage Users</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="userTableBody">
                <!-- Dynamic rows will be inserted here -->
                </tbody>
            </table>
        </section>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

    async function fetchUsers() {
        try {
            const response = await fetch(baseUrl + '/user');
            if (response.ok) {
                const users = await response.json();
                populateTable(users);
            } else {
                console.error('Failed to fetch users:', response.statusText);
            }
        } catch (error) {
            console.error('Error fetching users:', error);
        }
    }


    function populateTable(users) {
        const userTableBody = document.getElementById('userTableBody');
        userTableBody.innerHTML = '';

        users.forEach(user => {
            const row = document.createElement('tr');

            // Determine text color for user type
            let typeColor;
            switch (user.type.toLowerCase()) {
                case 'admin':
                    typeColor = '#dc3545';
                    break;
                case 'customer':
                    typeColor = '#28a745';
                    break;
                default:
                    typeColor = '#17a2b8';
            }

            // Determine text color for user status
            let statusColor;
            if (user.status.toLowerCase() === 'active') {
                statusColor = '#28a745';
            } else if (user.status.toLowerCase() === 'inactive') {
                statusColor = '#dc3545';
            } else {
                statusColor = '#ffc107';
            }

            row.innerHTML = `
            <td>${user.user_id}</td>
            <td>${user.user_name}</td>
            <td>${user.email}</td>
            <td>${user.contact}</td>
            <td><span style="color: ${typeColor}; font-weight: bold;">${user.type}</span></td>
            <td><span style="color: ${statusColor}; font-weight: bold;">${user.status}</span></td>
            <td>
                <button class="btn btn-sm btn-primary me-2" onclick="changeType('${user.user_id}')">Change Type</button>
                <button class="btn btn-sm btn-warning" onclick="changeStatus('${user.user_id}', '${user.status}')">Change Status</button>
            </td>
        `;
            userTableBody.appendChild(row);
        });
    }



    async function changeStatus(userId, currentStatus) {
        try {
            const response = await fetch(baseUrl + '/user', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ userId: userId})
            });

            if (response.ok) {
                alert('User status updated successfully!');
                fetchUsers();
            } else {
                const error = await response.json();
                console.error('Failed to update status:', error.message);
                alert('Error updating status: ' + error.message);
            }
        } catch (error) {
            console.error('Error updating status:', error);
            alert('An error occurred while updating the status.');
        }
    }

    function changeType(userId) {
        console.log(`Change type for user ID: ${userId}`);
    }

    // Fetch users when the page loads
    window.onload = fetchUsers;
</script>
</body>
</html>
