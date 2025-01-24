<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f7fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            max-width: 1200px;
        }

        .table {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #6c757d;
            color: white;
            text-align: center;
        }

        td {
            vertical-align: middle;
            text-align: center;
        }

        .form-control {
            width: 100px;
            text-align: center;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn-danger {
            background-color: #e74c3c;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .text-end h4 {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .cart-header {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        #updateQty{
            display: flex;
            flex-wrap: nowrap;
            flex-direction: row;
            justify-content: space-evenly;
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
                <li class="nav-item"><a class="nav-link" href="cartPage.html">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="profilePage.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">SignIn</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="cart-header">
        <h1>Your Shopping Cart</h1>
        <p class="lead">Review your items before proceeding to checkout.</p>
    </div>
    <div class="table-responsive mt-4">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>ProductID</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="cart-items">
            <!-- Items will be dynamically inserted here -->
            </tbody>
        </table>
    </div>
    <div class="text-end">
        <h4 id="cart-total">Total: $0.00</h4>
        <button class="btn btn-success" id="proceed-btn">Proceed to Checkout</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

    async function fetchAndRenderCartItems() {
        const id = sessionStorage.getItem('id');
        const url = id ? `${baseUrl}/cart?search=${id}` : baseUrl;

        try {
            const response = await fetch(url);
            if (!response.ok) throw new Error("Failed to fetch cart items");

            const cartItems = await response.json();
            const cartItemsContainer = document.getElementById('cart-items');
            const cartTotalElement = document.getElementById('cart-total');
            let total = 0;

            cartItemsContainer.innerHTML = '';

            cartItems.forEach((item) => {
                const itemTotal = item.quantity * item.price;
                total += itemTotal;

                const row = `
          <tr>
            <td>${item.product_id}</td>
            <td>${item.product_name}</td>
            <td  id="updateQty">
              <input type="number" class="form-control" id="quantity-${item.product_id}" value="${item.quantity}" min="1">
              <button class="btn btn-primary btn-sm mt-2" onclick="updateQuantity(${item.product_id})">Update</button>
            </td>
            <td id="price-${item.product_id}">$${item.price.toFixed(2)}</td>
            <td>$${itemTotal.toFixed(2)}</td>
            <td><button class="btn btn-danger btn-sm" onclick="removeItem(${item.product_id})">Remove</button></td>
          </tr>
        `;

                cartItemsContainer.insertAdjacentHTML('beforeend', row);
            });

            cartTotalElement.textContent = `Total: $${total.toFixed(2)}`;
        } catch (error) {
            console.error("Error loading cart items:", error);
            document.getElementById('cart-items').innerHTML = `<tr><td colspan="5" class="text-center text-danger">Failed to load cart items</td></tr>`;
        }
    }

    async function updateQuantity(productId) {
        const quantity = document.getElementById(`quantity-${productId}`).value;
        const userId = sessionStorage.getItem('id');
        const price = parseFloat(document.querySelector(`#price-${productId}`).textContent.replace('$', ''));

        try {
            const response = await fetch(`${baseUrl}/cart`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    product_id: productId,
                    quantity: Number(quantity),
                    user_id: userId,
                    price: price
                }),
            });

            if (!response.ok) throw new Error("Failed to update quantity");
            alert("Quantity updated successfully!");
            fetchAndRenderCartItems(); // Refresh cart
        } catch (error) {
            console.error("Error updating quantity:", error);
            alert("Failed to update quantity.");
        }
    }

    async function removeItem(productId) {
        const id = sessionStorage.getItem('id');
        try {
            const response = await fetch(`${baseUrl}/cart`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({product_id: productId, user_id: id}),
            });

            if (!response.ok) throw new Error("Failed to remove item");
            alert("Item removed successfully!");
            fetchAndRenderCartItems(); // Refresh cart
        } catch (error) {
            console.error("Error removing item:", error);
            alert("Failed to remove item.");
        }
    }

    async function fetchCartItems() {
        const id = sessionStorage.getItem('id');
        const url = id ? `${baseUrl}/cart?search=${id}` : baseUrl;

        const response = await fetch(url);
        if (!response.ok) throw new Error("Failed to fetch cart items");
        return response.json();
    }

    async function proceedToCheckout() {
        const userId = sessionStorage.getItem('id');
        const cartItems = await fetchCartItems(); // Fetch cart items to get the cart data
        const totalAmount = document.getElementById('cart-total').textContent.replace('Total: $', '');

        const orderData = {
            user_id: userId,
            total_amount: totalAmount,
            cart_items: cartItems,
        };

        try {
            const response = await fetch(`${baseUrl}/orders`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(orderData),
            });

            if (!response.ok) throw new Error("Failed to proceed to checkout");
            alert("Checkout successful!");
            window.location.href = "index.html";
        } catch (error) {
            console.error("Error during checkout:", error);
            alert("Failed to proceed to checkout.");
        }
    }

    document.getElementById('proceed-btn').addEventListener('click', proceedToCheckout);

    fetchAndRenderCartItems();
</script>
</body>
</html>
