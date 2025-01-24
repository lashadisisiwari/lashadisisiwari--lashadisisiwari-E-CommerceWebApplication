<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #1da1f2;
            width: 100%;
            max-width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .input-group {
            margin-bottom: 20px;
            margin-right: 20px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
            color: #555;
        }
        .input-group input:focus {
            border-color: #007bff;
            outline: none;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #fdfafa;
        }
        .password-toggle {
            position: absolute;
            right: 1px;
            top: 30px;
            cursor: pointer;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>User Login</h2>
    <form id="loginForm">
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="input-group" style="position: relative;">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <span id="togglePassword" class="password-toggle">Show</span>
        </div>

        <button type="submit" class="btn">Login</button>
    </form>

    <div class="footer">
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</div>
<script src="js/loginJs.js"></script>
</body>
</html>
