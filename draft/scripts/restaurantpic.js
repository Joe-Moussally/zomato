document.getElementById("create-restaurant-btn").addEventListener("click", function (event) {
    event.preventDefault();
    const name = document.getElementById("name").value;
    const description = document.getElementById("description").value;
    const icon = document.getElementById("icon").value;
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
        description,
        icon,
        email,
        phone,
        location,
        cuisines
    }
    
    let url = './backend/backend/add.php';
    axios({
        method: 'POST',
        url: url,
        params: data
    })
        .then(function (response) {
            
            if (response.data === 'ok') {
                window.location.href = "./draft/home.html";
            }
        });

});