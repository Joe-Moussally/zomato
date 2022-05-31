<?php
include("connection.php");

$users_id = $_GET["users_id"];
$restaurants_id = $_GET["restaurants_id"];
$review = $_GET["review"];
$rating = $_GET["rating"];

$query = $mysqli->prepare("Select id from comments where users_id = ? AND restaurants_id = ?");
$query->bind_param("ss",$users_id, $restaurants_id);
$query->execute();
$query->store_result();
$num_rows = $query->num_rows;
$query->fetch();
$response = [];

if($num_rows == 1){
    $query = $mysqli->prepare("UPDATE comments SET users_id=?, restaurants_id=?, review=?, rating=? WHERE users_id = ? AND restaurants_id = ?");
    $query->bind_param("iisiii", $users_id, $restaurants_id , $review, $rating, $users_id, $restaurants_id);
    $query->execute();
    $response["response"] = "ok";
}else{
    $query = $mysqli->prepare("INSERT INTO comments (users_id, restaurants_id, review, rating) VALUES (?, ?, ?, ?)");
    $query->bind_param("iisi", $users_id, $restaurants_id , $review, $rating);
    $query->execute();
    $response["response"] = "ok";
}


$json = json_encode($response);
echo $json;

?>
