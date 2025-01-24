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
        window.location.href = "index.jsp";
    } catch (error) {
        console.error("Error during checkout:", error);
        alert("Failed to proceed to checkout.");
    }
}

document.getElementById('proceed-btn').addEventListener('click', proceedToCheckout);

fetchAndRenderCartItems();