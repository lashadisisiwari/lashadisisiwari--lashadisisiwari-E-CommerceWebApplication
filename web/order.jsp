<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placement</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Order Placement</h1>

    <%-- Retrieve Customer Details from Session --%>
    <%
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String address = (String) session.getAttribute("address");
    %>

    <h3>Customer Details</h3>
    <p><strong>Name:</strong> <%= name %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Phone:</strong> <%= phone %></p>
    <p><strong>Address:</strong> <%= address %></p>

    <h3>Order Summary</h3>
    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Product 1</td>
            <td>1</td>
            <td>$10.00</td>
            <td>$10.00</td>
        </tr>
        <tr>
            <td>Product 2</td>
            <td>2</td>
            <td>$15.00</td>
            <td>$30.00</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3" class="text-end">Total Amount:</th>
            <th>$40.00</th>
        </tr>
        </tfoot>
    </table>

    <div class="text-center">
        <button class="btn btn-success">Confirm Order</button>
    </div>
</div>
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
