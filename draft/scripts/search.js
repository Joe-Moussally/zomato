let searchbar = document.getElementById('search');
let searchButton = document.getElementById('search-btn');
let ul = document.getElementById('results-ul');

console.log(ul)
searchButton.addEventListener('click', () => {

    ul.innerHTML = ''

    let name = searchbar.value
    let url = 'http://foodity/backend/restaurantsearch.php?name='+name


    axios({
        method: 'GET',
        url: url
    }).then((Response) => {
        console.log(Response.data)
        for (let i=0; i<Response.data.length;i++) {
            ul.innerHTML += '<li onclick="redirect(event.currentTarget)" id="'+Response.data[i].id+'"><h1 class="search-name">'+Response.data[i].name+'<h1/><p class="search-desc">'+Response.data[i].description+'</p></li>'
        }
    })

})

const redirect = (li) => {
   
 
    let url2 = 'http://foodity/backend/restaurant.php';
    url2 += '?resto_id='+li.id;
    localStorage.setItem('resto_id',li.id);
    window.location.replace('http://foodity/draft/restaurant.html');
}