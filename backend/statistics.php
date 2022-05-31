<?php
include("connection.php");

$query = $mysqli->prepare("select (SELECT COUNT(*)-1 from users) as users, (SELECT COUNT(*) from comments) as comments, (SELECT COUNT(*) from restaurants) as restaurants;");
$query->execute();
$array = $query->get_result();
$response = [];
while($toget = $array->fetch_assoc()){
    $response[] = $toget;
} 
$json = json_encode($response);
echo $json;
?>