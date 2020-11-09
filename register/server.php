<?php
session_start();

// initializing variables
$username = "";
$email    = "";
$age = "";
$password_1 ="";
$password_2="";
$errors = array(); 

// connect to the database
$db= mysqli_connect('localhost', 'root', '', 'crazymovie');

// REGISTER USER
if (isset($_POST['reg_user'])) {
  // receive all input values from the form
  $username = mysqli_real_escape_string($db, $_POST['username']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($db, $_POST['password_2']);
  $age = mysqli_real_escape_string($db, $_POST['age']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  if (empty($username)) { array_push($errors, "Username is required");} 
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }
  if ($password_1 != $password_2) {
	array_push($errors, "The two passwords do not match");
  }

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM users WHERE username='$username' OR email='$email' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);

  
  if ($user) { // if user exists
    if ($user['username'] === $username) {
      array_push($errors, "Username already exists");
    }

    if ($user['email'] === $email) {
      array_push($errors, "email already exists");
    }
  }

  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
  	$hashedpassword = password_hash($password_1,PASSWORD_DEFAULT);//encrypt the password before saving in the database
    
  	$query = "INSERT INTO users (userName, email, age, password) 
  			  VALUES('$username', '$email','$age', '$hashedpassword')";
  	mysqli_query($db, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header('location: index1.php');
  }
}

// ... LOGIN 

if (isset($_POST['login_user'])) {
    $userLog = mysqli_real_escape_string($db, $_POST['userLog']);
    $pswdLog = mysqli_real_escape_string($db, $_POST['pswdLog']);
  
    if (empty($userLog)) {
        array_push($errors, "Username is required");
    }
    if (empty($pswdLog)) {
        array_push($errors, "Password is required");
    }
  
    if (count($errors) == 0) {
        //$password = md5($passwor);
        $queryLog = "SELECT * FROM users WHERE username='$userLog' AND password='$pswdLog'";
        $results = mysqli_query($db, $queryLog);
        if (mysqli_num_rows($results) == 1) {
          $_SESSION['username'] = $username;
          $_SESSION['success'] = "You are now logged in";
          header('location: index1.php');
        }else {
            array_push($errors, "Wrong username/password combination");
        }
    }
  }
  
  ?>