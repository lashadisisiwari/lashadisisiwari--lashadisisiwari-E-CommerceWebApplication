<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - ShopEase</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">

  <style>
    /* Register Card Styles */
    .register-card {
      max-width: 450px;
      width: 100%;
      border-radius: 10px;
      background-color: #fff;
    }

    .register-card h2 {
      font-weight: bold;
      color: #333;
    }

    /* Customizing form controls */
    .form-control {
      border-radius: 8px;
      margin-bottom: 15px;
    }

    .btn-primary {
      border-radius: 5px;
    }

  </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
  <div class="card p-4 shadow-lg register-card">
    <h2 class="text-center mb-4">Create Your Account</h2>
    <!-- Registration Form -->
    <form action="processRegister.jsp" method="post">
      <!-- Full Name Input -->
      <div class="mb-3">
        <label for="fullname" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>
      </div>
      <!-- Email Input -->
      <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
      </div>
      <!-- Password Input -->
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
      </div>
      <!-- Confirm Password Input -->
      <div class="mb-3">
        <label for="confirm_password" class="form-label">Confirm Password</label>
        <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm your password" required>
      </div>
      <!-- Contact Number Input (Optional) -->
      <div class="mb-3">
        <label for="contact" class="form-label">Contact Number (Optional)</label>
        <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter your contact number">
      </div>
      <!-- Gender Selection -->
      <div class="mb-3">
        <label class="form-label">Gender</label><br>
        <input type="radio" id="male" name="gender" value="Male" required> Male
        <input type="radio" id="female" name="gender" value="Female" required> Female
      </div>
      <!-- Submit Button -->
      <div class="d-grid">
        <button type="submit" class="btn btn-primary">Sign Up</button>
      </div>
      <!-- Already Registered -->
      <div class="text-center mt-3">
        <p>Already have an account? <a href="login.jsp" class="text-decoration-none">Login</a></p>
      </div>
    </form>

    <!-- Process Register -->
    <%
      String fullname = request.getParameter("fullname");
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      String confirm_password = request.getParameter("confirm_password");
      String contact = request.getParameter("contact");
      String gender = request.getParameter("gender");

      // Check if the form is submitted and passwords match
      if (fullname != null && email != null && password != null && confirm_password != null) {
        if (password.equals(confirm_password)) {
          try {
            // Database connection setup
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopease", "root", "password");

            String sql = "INSERT INTO users (fullname, email, password, contact, gender) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, password);  // For simplicity, no password hashing
            stmt.setString(4, contact);
            stmt.setString(5, gender);

            int result = stmt.executeUpdate();
            if (result > 0) {
              out.println("<h2 class='text-success'>Registration successful!</h2>");
            } else {
              out.println("<h2 class='text-danger'>Error occurred while registering!</h2>");
            }
          } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 class='text-danger'>Error: " + e.getMessage() + "</h2>");
          }
        } else {
          out.println("<h2 class='text-danger'>Passwords do not match!</h2>");
        }
      }
    %>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
