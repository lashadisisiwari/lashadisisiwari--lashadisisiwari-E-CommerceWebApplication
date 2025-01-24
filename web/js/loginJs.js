const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

const form = document.getElementById('loginForm');

form.addEventListener('submit', function (e) {
    e.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    const payload = {
        email: email,
        password: password
    };

    fetch(baseUrl + '/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    })
        .then(response => response.json())
        .then(data => {
            if (data != null) {
                alert("Login successful ..!");
                sessionStorage.setItem("userName", data.userName);
                sessionStorage.setItem("id", data.userId);
                sessionStorage.setItem("email", data.userEmail);

                const role = data.role;
                if (role === 'admin' || role === 'Admin') {
                    window.location.href = 'dashboardPage.jsp';
                } else if (role === 'user' || role === 'User') {
                    window.location.href = 'index.html';
                } else {
                    alert('Unknown role.');
                }
            } else {
                alert('Invalid email or password.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred.');
        });
});

const togglePassword = document.getElementById('togglePassword');
const passwordField = document.getElementById('password');

togglePassword.addEventListener('click', function () {
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        togglePassword.textContent = 'Hide';
    } else {
        passwordField.type = 'password';
        togglePassword.textContent = 'Show';
    }
});
