let url = 'http://localhost/foodity/backend/admincomments.php';
let approveUrl = 'http://localhost/foodity/backend/approve.php';

let ul = $('#see-reviews-container').children('ul')[0];

axios.get(url)
    .then(function (response) {
        console.log(response);
        let reviews = response.data;
        if (reviews.length == 0) {
            let li = document.createElement('li');
            li.innerHTML = 'No entries';
            ul.appendChild(li);
            return
        }
        for (let i = 0; i < reviews.length; i++) {
            let review = reviews[i];

            let li = document.createElement('li');
            let reviewHeader = document.createElement('div');
            let reviewHeaderLeft = document.createElement('div');
            let reviewHeaderImage = document.createElement('img');
            let reviewHeaderNameSpan = document.createElement('span');
            let reviewHeaderStars = document.createElement('span');
            let reviewHeaderStarsIcon = document.createElement('i');
            let reviewBody = document.createElement('div');
            let acceptReject = document.createElement('div');
            let acceptButton = document.createElement('button');
            let rejectButton = document.createElement('button');

            reviewHeader.classList.add('review-header');
            reviewHeaderLeft.classList.add('review-header-left');
            reviewHeaderImage.src = review.image || 'https://media.npr.org/assets/img/2022/04/18/gettyimages-1239860186-cc4ab75dba7fd565b66a36d4112c2e7a4209160d.jpg';
            reviewHeaderNameSpan.innerText = review.name || 'Anonymous';
            reviewHeaderStars.innerText = review.rating || 5;
            reviewBody.classList.add('review-body');
            acceptReject.classList.add('accept-reject');
            acceptButton.classList.add('accept');
            acceptButton.innerText = 'Accept';
            rejectButton.classList.add('reject');
            rejectButton.innerText = 'Reject';
            reviewHeaderStarsIcon.classList.add('fa-solid', 'fa-star');

            acceptButton.addEventListener('click', function () {
                let data = {
                    id: review.id,
                    approve: 1
                };
                axios.post(approveUrl, data)
                    .then(function (response) {
                        console.log(response);
                        if (response.data.status === 'success') {
                            li.remove();
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            });
            rejectButton.addEventListener('click', function () {
                let data = {
                    id: review.id,
                    approve: -1
                };
                axios.post(approveUrl, data)
                    .then(function (response) {
                        console.log(response);
                        if (response.data.status === 'success') {
                            li.remove();
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            });
            
            reviewHeaderLeft.appendChild(reviewHeaderImage);
            reviewHeaderLeft.appendChild(reviewHeaderNameSpan);
            reviewHeader.appendChild(reviewHeaderLeft);
            reviewHeaderStars.appendChild(reviewHeaderStarsIcon);
            reviewHeader.appendChild(reviewHeaderStars);
            reviewBody.innerText = review.comment || 'No comment';
            acceptReject.appendChild(acceptButton);
            acceptReject.appendChild(rejectButton);
            li.appendChild(reviewHeader);
            li.appendChild(reviewBody);
            li.appendChild(acceptReject);
            ul.appendChild(li);
            
        }
    })
    .catch(function (error) {
        console.log(error);
    });