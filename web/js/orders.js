const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

function loadOrders() {
    fetch(baseUrl + '/orders')
        .then(response => response.json())
        .then(orders => {
            const tableBody = document.getElementById('orderTableBody');
            tableBody.innerHTML = '';
            orders.forEach(order => {
                const row = document.createElement('tr');
                row.innerHTML = `
                        <td>${order.id}</td>
                        <td>${order.userName}</td>
                        <td>$${order.amount}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="viewOrder(${order.id})" data-bs-toggle="modal" data-bs-target="#orderDetailsModal">View</button>
                            <button class="btn btn-success btn-sm" onclick="changeStatus(${order.id})">Change Status</button>
                        </td>
                    `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error fetching orders:', error);
        });
}

function viewOrder(orderId) {
    fetch(`${baseUrl}/order_details?orderId=${orderId}`)
        .then(response => response.json())
        .then(orderDetails => {
            const tableBody = document.getElementById('orderDetailsTableBody');
            tableBody.innerHTML = '';
            orderDetails.forEach(detail => {
                const row = document.createElement('tr');
                row.innerHTML = `
                        <td>${detail.productName}</td>
                        <td>${detail.quantity}</td>
                        <td>$${detail.price.toFixed(2)}</td>
                    `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error fetching order details:', error);
        });
}

function changeStatus(orderId) {
    alert(`Changing status for Order ID: ${orderId}`);
}

document.addEventListener('DOMContentLoaded', loadOrders);