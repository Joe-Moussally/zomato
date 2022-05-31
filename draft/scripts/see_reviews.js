let url = 'http://foodity/backend/admincomments.php';

console.log(ul);


axios({
    method: 'GET',
    url: url
}).then((response) => {

    for (let i=0; i<response.data.length;i++) {
        $(ul).append('<li><div class="review-header"><div class="review-header-left"><img src="https://media.npr.org/assets/img/2022/04/18/gettyimages-1239860186-cc4ab75dba7fd565b66a36d4112c2e7a4209160d.jpg"><span>'+response.data[i].username+'</span></div><span>5<i class="fa-solid fa-star"></i></span></div><div class="review-body">'+response.data[i].review+'</div><div class="accept-reject"><button class="accept">Accept</button><button class="reject">Reject</button></div></li>')
    }

    console.log(response.data)
})