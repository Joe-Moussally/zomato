let url = 'http://foodity/backend/restaurants.php';
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
    console.log("redirected")
    
    let url2 = 'http://foodity/backend/restaurant.php';
    url2 += '?resto_id='+li.id;
    console.log(li.id)
    localStorage.setItem('resto_id',li.id);
    console.log(li)
    
    window.location.replace('http://foodity/draft/restaurant.html');
}