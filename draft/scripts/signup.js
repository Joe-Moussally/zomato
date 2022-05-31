document.getElementById("sign-up-btn").addEventListener("click", function (event) {
    if (document.getElementById("password").value == document.getElementById("comfirmPassword").value) {
        event.preventDefault();
        const username = document.getElementById("username").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;

        let data = {
            username,
            email,
            password
        }

        let url = 'http://localhost/zomato/backend/signup.php';
        axios({
            method: 'POST',
            url: url,
            params: data
        })
            .then(function (response) {
                if (response.data === 'ok') {
                    window.location.href = "http://localhost/zomato/draft/login.html";
                }
            });
    }
    else {
        alert("Password does not match");
    }
});