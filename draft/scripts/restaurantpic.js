document.getElementById("create-restaurant-btn").addEventListener("click", function (event) {
        event.preventDefault();
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const phone = document.getElementById("phone").value;
        const location = document.getElementById("location").value;
        const style = document.getElementsByClassName('messageCheckbox')
        const cuisines =[];
        Array.from(style).forEach(element => { 

            if(element.checked)
           cuisines.push(element.value)
        });

        let data = {
            name,
            email,
            phone,
            location,
            cuisines
        }
        debugger
        let url = 'http://foodity/backend/backend/add.php';
        axios({
            method: 'POST',
            url: url,
            params: data
        })
            .then(function (response) {
                debugger
                if (response.data === 'ok') {
                    window.location.href = "http://localhost/zomato/draft/login.html";
                }
            });
    
});