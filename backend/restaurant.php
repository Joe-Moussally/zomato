<?php
include("connection.php");

$id = $_GET["resto_id"];

$query = $mysqli->prepare("SELECT r.id, r.name, r.rating, r.description, r.icon, r.phone, r.location, GROUP_CONCAT(c.cuisine) FROM restaurants r INNER JOIN restaurant_has_cuisines rhc on r.id= rhc.restaurant_id INNER JOIN cuisines c on rhc.cuisine_id = c.id where r.id = ?");

//SELECT GROUP_CONCAT(id) FROM tablename;
//SELECT r.name , r.id , cu.cuisine,u.email, c.review, c.date from restaurants as r INNER JOIN comments c on r.id=c.restaurants_id INNER join users u on u.id=c.users_id INNER JOIN restaurant_has_cuisines rhc on r.id= rhc.restaurant_id INNER JOIN cuisines cu on rhc.cuisine_id = cu.id where r.id=2 GROUP by cu.cuisine;

//final result example:
//[{"id":2,
//"name":"KFC",
//"rating":0,
//"description":"test kfc description",
//"icon":null,
//"phone":"76069710",
//"location":"test
//location kfc",
//"GROUP_CONCAT(c.cuisine)":"Italian,chinese"}]

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
