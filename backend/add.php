<?php

include("connection.php");
$name=$_GET["name"];
$description=$_GET["description"];
$icon=$_GET["icon"];
$phone=$_GET["phone"];
$location=$_GET["location"];
$cuisines=$_GET["cuisines"];

$query = $mysqli->prepare("INSERT INTO restaurants (name, description, icon, phone, location) VALUES (?, ?, ?, ?, ?)");
$query->bind_param("sssss", $name, $description ,$icon ,$phone ,$location);
$query->execute();

for (i=0; i<count($cuisines); i++) {
    $query = $mysqli->prepare("INSERT INTO restaurant_has_cuisines (restaurant_id, cuisine_id) VALUES ((SELECT id FROM restaurants WHERE name = ?), (SELECT id FROM cuisines WHERE cuisine_name = ?))");
    $query->bind_param("ss", $name, $cuisines[i]);
    $query->execute();
}
//$query = $mysqli->prepare("insert into restaurant_has_cuisines (restaurant_id, cuisine_id) select r.id, c.id from restaurants r INNER JOIN cuisines c on r.name = "KFC" and c.cuisine= "Italian";");

?>