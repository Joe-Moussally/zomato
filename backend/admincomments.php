<?php
include("connection.php");


$query = $mysqli->prepare("SELECT comments.review, comments.date, users.username, restaurants.name FROM comments INNER JOIN users ON users.id = comments.users_id INNER JOIN restaurants ON restaurants.id = comments.restaurants_id WHERE comments.accepted= 0");
$query->execute();
$array = $query->get_result();
$response = [];
while($toget = $array->fetch_assoc()){
    $response[] = $toget;
} 
$json = json_encode($response);
echo $json;
?>
