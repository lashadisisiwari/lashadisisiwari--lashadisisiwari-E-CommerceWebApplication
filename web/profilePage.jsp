<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Shop | Profile</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f5f5f5;
    }
    .profile-header {
      position: relative;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      height: 250px;
      border-radius: 15px;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }
    .profile-picture {
      position: absolute;
      bottom: -60px;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 4px solid white;
      overflow: hidden;
    }
    .profile-picture img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .profile-details {
      margin-top: 70px;
      text-align: center;
    }
    .profile-details h2 {
      font-size: 1.75rem;
      font-weight: bold;
    }
    .profile-details p {
      color: gray;
    }
    .card {
      border-radius: 15px;
    }
    .section-title {
      font-weight: bold;
      font-size: 1.25rem;
      margin-bottom: 15px;
    }
    .footer {
      background-color: #f8f9fa;
      padding: 20px 0;
      text-align: center;
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
        <li class="nav-item"><a class="nav-link" href="productPage.jsp">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="cartPage.jsp">Cart</a></li>
        <li class="nav-item"><a class="nav-link" href="profilePage.html">Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li>
        <li class="nav-item"><a class="nav-link" href="register.jsp">SignIn</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <div class="profile-header">
    <div class="profile-picture">
      <img src="accest/fashion.png" alt="User Profile Picture">
    </div>
    <div class="profile-details">
      <h2 id="userName">John Doe</h2>
      <p id="email">johndoe@example.com</p>
      <button class="btn btn-light btn-sm mt-2">Edit Profile</button>
    </div>
  </div>
</div>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-4">
      <div class="card p-3">
        <h4 class="section-title">Account Options</h4>
        <ul class="list-group list-group-flush">
          <li class="list-group-item"><a href="#">Order History</a></li>
          <li class="list-group-item"><a href="#">Wishlist</a></li>
          <li class="list-group-item"><a href="#">Account Settings</a></li>
          <li class="list-group-item"><a href="login.jsp" class="text-danger">Logout</a></li>
        </ul>
      </div>
    </div>

    <div class="col-md-8">
      <div class="card p-4">
        <h4 class="section-title">Recent Orders</h4>
        <div class="table-responsive">
          <table class="table">
            <thead>
            <tr>
              <th>Order ID</th>
              <th>Date</th>
              <th>Status</th>
              <th>Total</th>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody id="orderTableBody">
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="footer">
  <div class="container">
    <p>&copy; 2025 E-Shop. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

  window.onload=()=>{
    console.log(sessionStorage.getItem('userName'))
    const storedUserName = sessionStorage.getItem('userName');
    if (storedUserName) {
      document.getElementById('userName').textContent = storedUserName;
    }

    const storedEmail = sessionStorage.getItem('email');
    if (storedEmail) {
      document.getElementById('email').textContent = storedEmail;
    }
  }

  const orders = [
    { id: '#12345', date: '2025-01-18', status: 'Delivered', total: '$125.00', badge: 'success' },
    { id: '#12346', date: '2025-01-15', status: 'Pending', total: '$85.00', badge: 'warning' },
    { id: '#12347', date: '2025-01-10', status: 'Cancelled', total: '$45.00', badge: 'danger' }
  ];

  const loadOrders = () => {
    const tableBody = document.getElementById('orderTableBody');
    orders.forEach(order => {
      const row = `
        <tr>
          <td>${order.id}</td>
          <td>${order.date}</td>
          <td><span class="badge bg-${order.badge}">${order.status}</span></td>
          <td>${order.total}</td>
          <td><a href="#" class="btn btn-sm btn-primary">View</a></td>
        </tr>
      `;
      tableBody.innerHTML += row;
    });
  };

  window.onload = () => {
    loadOrders();
    const storedUserName = sessionStorage.getItem('userName');

    if (storedUserName) {
      document.getElementById('userName').textContent = storedUserName;
    }

    const storedEmail = sessionStorage.getItem('email');
    if (storedEmail) {
      document.getElementById('email').textContent = storedEmail;
    }
  };
</script>
</body>
</html>
