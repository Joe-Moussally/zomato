<?php
include("connection.php");

$id = $_GET["id"];

$query = $mysqli->prepare("DELETE FROM restaurants WHERE id = ?");
$query->bind_param("i",$id);
$query->execute();
?>