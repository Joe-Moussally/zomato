<?php

include("connection.php");

$name=$_POST["name"];
$description=$_POST["description"];
$phone=$_POST["phone"];
$location=$_POST["location"];
$cuisines= $_POST["cuisines"];
$icon = $_FILES['icon'];
$cuisines = explode(",", $cuisines);

$iconLink = "";
if($icon['size'] > 0){
    $iconLink = "images/restaurants/".$icon['name'];
    move_uploaded_file($icon['tmp_name'], $iconLink);
}

$sql = "SELECT * FROM restaurants WHERE name = ?";
$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $name);
$stmt->execute();
$result = $stmt->get_result();
if($result->num_rows > 0){
    echo "Restaurant with same name already exist";
}
else{
    $sql = "INSERT INTO restaurants (name, description, icon, phone, location) VALUES (?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("sssss", $name, $description, $iconLink, $phone, $location);
    $stmt->execute();
    $id = $stmt->insert_id;
    foreach($cuisines as $cuisine){
        $sql = "INSERT INTO restaurant_has_cuisines (restaurant_id, cuisine_id) VALUES (?, (SELECT id FROM cuisines WHERE cuisine = ?))";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("is", $id, $cuisine);
        $stmt->execute();
    }
    echo "Restaurant added successfully";
}

// include("connection.php");
// $name=$_POST["name"];
// $description=$_POST["description"];
// $icon=$_POST["icon"];
// $phone=$_POST["phone"];
// $location=$_POST["location"];
// $cuisines = json_encode($_POST["cuisines"]);

// echo $cuisines;
// die();

// $query = $mysqli->prepare("INSERT INTO restaurants (name, description, icon, phone, location) VALUES (?, ?, ?, ?, ?)");
// $query->bind_param("sssss", $name, $description ,$icon ,$phone ,$location);
// $query->execute();

// for ($i=0; $i<count($cuisines); $i++) {
//     $query = $mysqli->prepare("INSERT INTO restaurant_has_cuisines (restaurant_id, cuisine_id) VALUES ((SELECT id FROM restaurants WHERE name = ?), (SELECT id FROM cuisines WHERE cuisine_name = ?))");
//     $query->bind_param("ss", $name, $cuisines[i]);
//     $query->execute();
// }

// ?>