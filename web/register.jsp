<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
        .input-group .error {
            color: red;
            font-size: 12px;
            display: none;
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
    <h2>User Registration</h2>
    <form id="registrationForm">
        <div class="input-group">
            <label for="user_name">User Name</label>
            <input type="text" id="user_name" name="user_name" required>
            <div class="error" id="user_name_error">User name is required.</div>
        </div>

        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <div class="error" id="email_error">A valid email is required.</div>
        </div>

        <div class="input-group" style="position: relative;">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <span id="togglePassword" class="password-toggle">Show</span>
            <div class="error" id="password_error">Password is required.</div>
        </div>

        <div class="input-group">
            <label for="contact">Contact</label>
            <input type="text" id="contact" name="contact" maxlength="10">
            <div class="error" id="contact_error">Contact number is required.</div>
        </div>

        <button type="submit" class="btn">Register</button>
    </form>

    <div class="footer">
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</div>
<script src="js/register.js"></script>
</body>
</html>
