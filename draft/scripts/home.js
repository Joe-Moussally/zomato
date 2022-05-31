let url = 'http://foodity/backend/restaurants.php';
let list = document.getElementsByTagName('ul')[0];

console.log((list))
axios({
    method: 'GET',
    url: url
})
.then( (Response) => {
    console.log(Response.data)
    for (i=0; i<Response.data.length;i++) {
        
        list.innerHTML += '<li onclick="redirect(event.currentTarget)" id="'+Response.data[i].id+'"><img src="'+Response.data[i].icon+'"><div class="card-body"><div class="card-header"><h2>'+Response.data[i].name+'</h2><span><i class="fa-solid fa-star"></i>'+Response.data[i].rating+'</span></div><span><i class="fa-solid fa-location-dot"></i>'+Response.data[i].location+'</span></div></li>';
        
    }
});

const redirect = (li) => {
   
 
    let url2 = 'http://foodity/backend/restaurant.php';
    url2 += '?resto_id='+li.id;
    localStorage.setItem('resto_id',li.id);
    window.location.replace('http://foodity/draft/restaurant.html');
}

//adding search for home searchbar

let searchbar = document.getElementById('header-search')

searchbar.addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        let name = searchbar.value;
        
    }
});