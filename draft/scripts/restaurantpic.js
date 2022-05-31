document.getElementById("create-restaurant-btn").addEventListener("click", function (event) {
    event.preventDefault();
    const name = document.getElementById("name").value;
    const description = document.getElementById("description").value;
    const icon = document.getElementById("image").files[0];
    const phone = document.getElementById("phone").value;
    const location = document.getElementById("location").value;
    const style = document.getElementsByClassName('messageCheckbox')
    const cuisines =[];
    Array.from(style).forEach(element => { 

        if(element.checked)
       cuisines.push(element.value)
    });

    const formData = new FormData();
    formData.append('name', name);
    formData.append('description', description);
    formData.append('icon', icon);
    formData.append('phone', phone);
    formData.append('location', location);
    formData.append('cuisines', cuisines);

    axios({
        method: 'POST',
        url: '/foodity/backend/add.php',
        data: formData,
        config: {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        }
    }).then((response) => {
        alert(response.data);
    })
});