<?php
include("connection.php");

$id = $_GET["id"];
$first_name = $_GET["first_name"];
$last_name = $_GET["last_name"];
$username = $_GET["username"];
$email = $_GET["email"];
$password = $_GET["password"];

$query = $mysqli->prepare("ALTER users (firstname, lastname, username, password, email) where id=$id VALUES (?, ?, ?, ?, ?)");
$query->bind_param("sssss", $name, $lastname, $username,$password, $email);
$query->execute();
?>
