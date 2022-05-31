const restaurant_id =document.getElementById("restaurant_id");
const description = document.getElementById("description");
const cuisines = document.getElementById("cuisines"); 
const review = document.getElementById("user-review-input");
const reviews = document.getElementById("review-list"); 
const user_id = window.localStorage.getItem('user_id');
const resto_id = window.localStorage.getItem('resto_id');

        let data = {
            users: users.value,
            restaurants : restaurants.value,
            comments :comments.value,
        }

let url = './backend/backend/restaurant.php';
        axios({
            method: 'GET',
            url: url,
            params: data,
        })     
        .then(function (response) {
            console.log(response)
            let result = response.data;
            let restaurant_id = restaurant_id;
            let description = description;
            let cuisines = cuisines;
            let review = review;
            let user_id = user_id;
            let resto_id = resto_id;

            users.innerHTML=usersphp;
            restaurants.innerHTML=restaurantsphp;
              comments.innerHTML=commentsphp;
        }

let url = './backend/backend/comment.php';
let ul = $('#near-you-list').children('ul')[0];
axios({
    method: 'GET',
    url: url
})
.then( (Response) => {
    console.log(Response.data)
    for (i=0; i<Response.data.length;i++) {

        ul.innerHTML += '<li onclick="redirect(event.currentTarget)" id="'+Response.data[i].id+'"><img src="'+Response.data[i].icon+'"><div class="card-body"><div class="card-header"><h2>'+Response.data[i].name+'</h2><span><i class="fa-solid fa-star"></i>4</span></div><span><i class="fa-solid fa-location-dot"></i>'+Response.data[i].location+'</span></div></li>'
        
    }
});

const redirect = (li) => {
   
 
    let url2 = 'http://foodity/backend/restaurant.php';
    url2 += '?resto_id='+li.id;
    localStorage.setItem('resto_id',li.id);
    window.location.replace('http://foodity/draft/restaurant.html');


        });

// {"id":2,"name":"KFC","rating":0,"description":"test kfc
// description","icon":null,"phone":"76069710","location":"test location kfc","cuisine":"chinese"}