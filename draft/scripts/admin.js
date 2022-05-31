const users =document.getElementById("users");
const restaurants = document.getElementById("restaurants");
const comments = document.getElementById("comments"); 
    

        let data = {
            users: users.value,
            restaurants : restaurants.value,
            comments :comments.value,
        }

        let url = 'http://foodity/backend/backend/statistics.php';
        axios({
            method: 'GET',
            url: url,
            params: data,
        })     
        .then(function (response) {
            console.log(response)
            let result = response.data;
            let usersphp = result[0].users;
            let commentsphp = result[0].comments;
            let restaurantsphp = result[0].restaurants;
            users.innerHTML=usersphp;
            restaurants.innerHTML=restaurantsphp;
            comments.innerHTML=commentsphp;

            

        });