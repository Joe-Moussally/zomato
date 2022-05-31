<?php
include("connection.php");

$id = $_GET["id"];

$query = $mysqli->prepare("SELECT id, first_name, last_name, username, email, created_at from users where id = ?");

$query->bind_param("i", $id);
$query->execute();
$array = $query->get_result();
$response[] = $array->fetch_assoc();

$json = json_encode($response);
echo $json;

?>
