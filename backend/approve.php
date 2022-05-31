<?php
include("connection.php");

$id = $_GET["id"];
$approve = $_GET["approve"];

if ($approve == "true") {
    $query = $mysqli->prepare("UPDATE comments SET approved = 1 WHERE id = ?");
} else {
    $query = $mysqli->prepare("UPDATE comments SET approved = -1 WHERE id = ?");
}

$query->bind_param("i",$id);
$query->execute();
?>