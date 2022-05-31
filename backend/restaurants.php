<?php
include("connection.php");
$query = $mysqli->prepare("SELECT id, name, rating, description, icon, phone, location from restaurants");
$query->execute();
$array = $query->get_result();
$response = [];
while($toget = $array->fetch_assoc()){
    $response[] = $toget;
} 
$json = json_encode($response);
echo $json;

?>
