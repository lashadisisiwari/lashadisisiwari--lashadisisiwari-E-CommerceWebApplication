const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

async function fetchUsers() {
    try {
        const response = await fetch(baseUrl + '/user');
        if (response.ok) {
            const users = await response.json();
            populateTable(users);
        } else {
            console.error('Failed to fetch users:', response.statusText);
        }
    } catch (error) {
        console.error('Error fetching users:', error);
    }
}


function populateTable(users) {
    const userTableBody = document.getElementById('userTableBody');
    userTableBody.innerHTML = '';

    users.forEach(user => {
        const row = document.createElement('tr');

        // Determine text color for user type
        let typeColor;
        switch (user.type.toLowerCase()) {
            case 'admin':
                typeColor = '#dc3545';
                break;
            case 'customer':
                typeColor = '#28a745';
                break;
            default:
                typeColor = '#17a2b8';
        }

        // Determine text color for user status
        let statusColor;
        if (user.status.toLowerCase() === 'active') {
            statusColor = '#28a745';
        } else if (user.status.toLowerCase() === 'inactive') {
            statusColor = '#dc3545';
        } else {
            statusColor = '#ffc107';
        }

        row.innerHTML = `
            <td>${user.user_id}</td>
            <td>${user.user_name}</td>
            <td>${user.email}</td>
            <td>${user.contact}</td>
            <td><span style="color: ${typeColor}; font-weight: bold;">${user.type}</span></td>
            <td><span style="color: ${statusColor}; font-weight: bold;">${user.status}</span></td>
            <td>
                <button class="btn btn-sm btn-primary me-2" onclick="changeType('${user.user_id}')">Change Type</button>
                <button class="btn btn-sm btn-warning" onclick="changeStatus('${user.user_id}', '${user.status}')">Change Status</button>
            </td>
        `;
        userTableBody.appendChild(row);
    });
}



async function changeStatus(userId, currentStatus) {
    try {
        const response = await fetch(baseUrl + '/user', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ userId: userId})
        });

        if (response.ok) {
            alert('User status updated successfully!');
            fetchUsers();
        } else {
            const error = await response.json();
            console.error('Failed to update status:', error.message);
            alert('Error updating status: ' + error.message);
        }
    } catch (error) {
        console.error('Error updating status:', error);
        alert('An error occurred while updating the status.');
    }
}

function changeType(userId) {
    console.log(`Change type for user ID: ${userId}`);
}

// Fetch users when the page loads
window.onload = fetchUsers;