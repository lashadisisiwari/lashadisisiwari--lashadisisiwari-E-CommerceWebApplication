<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ShopEase</title>
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
<!--    <link rel="stylesheet" href="styles.css">-->


    <style>
        /* Login Card Styles */
        .login-card {
            max-width: 400px;
            width: 100%;
            border-radius: 10px;
            background-color: #fff;
        }

        .login-card h2 {
            font-weight: bold;
            color: #333;
        }

    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-lg login-card">
        <h2 class="text-center mb-4">Login to ShopEase</h2>
        <form action="processLogin.jsp" method="post">
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
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
            <!-- Additional Links -->
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="register.jsp" class="text-decoration-none">Sign Up</a></p>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
