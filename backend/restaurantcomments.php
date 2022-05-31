<?php
include("connection.php");

$id = $_GET["resto_id"];


$query = $mysqli->prepare("SELECT comments.review, comments.rating, comments.date, users.username  FROM comments INNER JOIN users ON users.id = comments.users_id WHERE comments.restaurants_id = ? AND comments.accepted=1");

//SELECT r.name , r.id , cu.cuisine,u.email, c.review, c.date from restaurants as r INNER JOIN comments c on r.id=c.restaurants_id INNER join users u on u.id=c.users_id INNER JOIN restaurant_has_cuisines rhc on r.id= rhc.restaurant_id INNER JOIN cuisines cu on rhc.cuisine_id = cu.id where r.id=2 GROUP by cu.cuisine;

$query->bind_param("i", $id);
$query->execute();
$array = $query->get_result();
$response = [];
while($toget = $array->fetch_assoc()){
    
    $response[] = $toget;
} 
$json = json_encode($response);
echo $json;

?>
