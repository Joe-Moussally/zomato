document.getElementById("login-btn").addEventListener("click", function (event) {
    event.preventDefault();
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    let data = {
        email,
        password
    }
    let url = 'http://foodity/backend/backend/login.php';
    debugger
    axios({
        method: 'POST',
        url,
        params: data
    })
        .then(function (response) {
            console.log(response)
            let result = response.data;
            let role = result.role;
            let id = result.user_id;
            window.localStorage.setItem('user_id', id);
            window.localStorage.setItem('role', role);
            window.location.href = "http://foodity/backend/draft/profile.html";

        });
});