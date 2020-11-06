<?php

require_once 'database.php';

$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);

echo 'Connexion successfull<br>';

$mailQuery = "SELECT email FROM users ";
 
$passwordQuery = "SELECT 'password' FROM users";

$email ="";
$password = "";



if(isset($_POST['submit'])){
    $email = $_POST['email'];
    $password = $_POST['pswd'];

    if($email )
}
