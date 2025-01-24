
const form = document.getElementById('registrationForm');
const  baseUrl="http://localhost:8080/E_CommerceWebApplication_war_exploded";

form.addEventListener('submit', function (e) {
    e.preventDefault();

    let valid = true;

    const userName = document.getElementById('user_name');
    if (userName.value.trim() === '') {
        document.getElementById('user_name_error').style.display = 'block';
        valid = false;
    } else {
        document.getElementById('user_name_error').style.display = 'none';
    }

    const email = document.getElementById('email');
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email.value)) {
        document.getElementById('email_error').style.display = 'block';
        valid = false;
    } else {
        document.getElementById('email_error').style.display = 'none';
    }

    const password = document.getElementById('password');
    if (password.value.trim() === '') {
        document.getElementById('password_error').style.display = 'block';
        valid = false;
    } else {
        document.getElementById('password_error').style.display = 'none';
    }

    const contact = document.getElementById('contact');
    if (contact.value.trim().length !== 10) {
        document.getElementById('contact_error').style.display = 'block';
        valid = false;
    } else {
        document.getElementById('contact_error').style.display = 'none';
    }

    if (valid) {
        const payload = {
            user_name: userName.value,
            email: email.value,
            password: password.value,
            contact: contact.value
        };

        fetch(baseUrl+'/user', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        })
            .then(response => {
                if (response.ok) {
                    alert('Registration successful!');
                    window.location.href = 'login.jsp';
                } else {
                    alert("massage : "+"Duplicate entry for key 'users.email'");
                }
            })
            .catch(error => {
                console.log('Error:', error)
                console.error('Error:', error);
                alert('An error occurred.');
            });
    }
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