<?php

require_once 'database.php';

$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);

echo 'Connexion successfull<br>';

$username ="";
$email ="";
$pswd = "";
$pswdConf ="";
$age="";


if(isset($_POST['register'])){
    $username = $_POST['username'];
    $pswd = $_POST['pswd'];
    $email = $_POST['pswdConf'];
    $age = $_POST['age'];
    $confPswd = $_POST['pswdConf'];
    
    if(empty($username) || empty($age) || empty($email) || empty($pswdConf) || empty($pswd)){
        echo ' all fields mandatory' ; 
    } elseif($pswd != $confPswd){
        echo ' Password not match';
    }
    elseif($pswd == $confPswd){
        "INSERT INTO `users`( `user_name`, `email`, `age`, `password`, `admin`) VALUES ("",$username,$email,$age,$pswd,[value-6])
    }
