document.getElementById("login-btn").addEventListener("click", function (event) {
    if(document.getElementById("password").value == document.getElementById("comfirmPassword").value){
        event.preventDefault();
        alert("WORKED")
        let data = {
            username,
            email,
            password
        }
        debugger
        let url = 'http://localhost/zomato/backend/signup.php';
        debugger
        axios({
            method: 'POST',
            url: url,
            params: data
        })
        .then(function (response) {
            let result = response.data;
            let message = result.status;
            let id = result.user_id;
            if(message == "Message Sent!"){
                document.getElementById("status").style.display = "block";
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("phone").value = "";
                document.getElementById("message").value = "";
            }
            
        });    
    }
    else{
        alert("Password does not match");
    }
});