
<?php
include("connection.php");
$email = $_GET["email"];
$password = hash("sha256", $_GET["password"]);
$query = $mysqli->prepare("Select id,role from users INNER JOIN roles on users.id=roles.user_id where email = ? AND password = ?");
$query->bind_param("ss", $email, $password);
$query->execute();
$query->store_result();
$num_rows = $query->num_rows;
$query->bind_result($id,$role);
$query->fetch();
$response = [];

if($num_rows == 0){
    $response["response"] = "User Not Found";
}else{
    $response["response"] = "Logged in";
    $response["user_id"] = $id;
    $response["role"] = $role;
}

echo json_encode($response);
?>