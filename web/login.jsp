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




    <style>
        /* Login Card Styles */
        .login-card {
            max-width: 400px;
            width: 100%;
            border-radius: 10px;
            background-color: rgba(204, 159, 140, 0.73);
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
<%--        alert--%>
        <div id="alert-container" class="mt-3"></div>

        <form>
            <!-- UserName Input -->
            <div class="mb-3">
                <label for="username" class="form-label">UserName</label>
                <input type="username" class="form-control" id="username" name="username" placeholder="Enter your UserName" required>
            </div>
            <!-- Password Input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" id="login" class="btn btn-primary">Login</button>
            </div>
            <!-- Additional Links -->
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="register.jsp" class="text-decoration-none">Sign Up</a></p>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/loginJs.js"></script>
</body>
</html>
