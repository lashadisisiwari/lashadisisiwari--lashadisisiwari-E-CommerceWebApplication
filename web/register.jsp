<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - E-Commerce</title>
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: 50px auto;
            background: rgba(211, 163, 142, 0.57);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #ccd3dc;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container">
        <h2 class="text-center mb-4">Create Your Account</h2>
        <form method="post" action="">
            <!-- Full Name -->
            <div class="mb-3">
                <label for="fullname" class="form-label">Full Name</label>
                <input
                        type="text"
                        class="form-control"
                        id="fullname"
                        name="fullname"
                        placeholder="Enter your full name"
                        required
                />
            </div>
            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input
                        type="email"
                        class="form-control"
                        id="email"
                        name="email"
                        placeholder="Enter your email"
                        required
                />
            </div>
            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input
                        type="password"
                        class="form-control"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required
                />
            </div>
            <!-- Confirm Password -->
            <div class="mb-3">
                <label for="confirm_password" class="form-label"
                >Confirm Password</label
                >
                <input
                        type="password"
                        class="form-control"
                        id="confirm_password"
                        name="confirm_password"
                        placeholder="Confirm your password"
                        required
                />
            </div>
            <!-- Gender -->
            <div class="mb-3">
                <label class="form-label">Gender</label><br />
                <input type="radio" id="male" name="gender" value="Male" required />
                Male
                <input
                        type="radio"
                        id="female"
                        name="gender"
                        value="Female"
                        required
                />
                Female
            </div>
            <!-- Contact Number -->
            <div class="mb-3">
                <label for="contact" class="form-label">Contact Number</label>
                <input
                        type="text"
                        class="form-control"
                        id="contact"
                        name="contact"
                        placeholder="Enter your contact number"
                />
            </div>
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
