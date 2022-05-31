// const users =document.getElementById("users");
// const restaurants = document.getElementById("restaurants");
// const comments = document.getElementById("comments");

    

        // let data = {
        //     users: users.value,
        //     restaurants : restaurants.value,
        //     comments :comments.value,
        // }

        // let url = 'http://foodity/backend/backend/statistics.php';
        // axios({
        //     method: 'GET',
        //     url: url,
        //     params: data,
        // })     
        // .then(function (response) {
        //     console.log(response)
        //     let result = response.data;
        //     let usersphp = result[0].users;
        //     let commentsphp = result[0].comments;
        //     let restaurantsphp = result[0].restaurants;
        //     users.innerHTML=usersphp;
        //     restaurants.innerHTML=restaurantsphp;
        //     comments.innerHTML=commentsphp;

            

        // });

// {"id":2,"name":"KFC","rating":0,"description":"test kfc
// description","icon":null,"phone":"76069710","location":"test location kfc","cuisine":"chinese"}

let resto_id = localStorage.getItem('resto_id');
let cuisines = document.getElementById('cuisines')
let resto_name = document.getElementById('restaurant_id')
let resto_desc = document.getElementById('description')
let phone = document.getElementById('phone')
let resto_location = document.getElementById('location')

let url = 'http://foodity/backend/restaurant.php'
url += "?resto_id=" + resto_id;

axios({
        method: 'GET',
        url: url
    }).then((response) => {
        console.log(response.data[0])
        resto_name.innerHTML = response.data[0].name
        resto_desc.innerHTML = response.data[0].description
        phone.innerHTML = response.data[0].phone
        resto_location.innerHTML = response.data[0].location
    });

//print restaurant reviews
let url2 = 'http://foodity/backend/restaurantcomments.php'
url2 += "?resto_id=" + resto_id;
axios({
        method: 'GET',
        url: url2
    }).then((Response) => {
            console.log(Response.data)

            let reviewlist = document.getElementById('review-list')
            console.log(reviewlist)
            for (let i=0;i<Response.data.length;i++) {
                    reviewlist.innerHTML += '<li><div class="review-header"><div class="review-header-left"><img src="https://media.npr.org/assets/img/2022/04/18/gettyimages-1239860186-cc4ab75dba7fd565b66a36d4112c2e7a4209160d.jpg"><span>'+Response.data[i].username+'</span></div><span>5<i class="fa-solid fa-star"></i></span></div><div class="review-body">'+Response.data[i].review+'</div></li>'
            }
    })