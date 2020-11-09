



<?php


$querydirectors = "INSERT INTO `users`( `username`, `email`, `age`, `password`) 
          VALUES ($username,$email,$age,$pswd)";
          mysqli_query($conn,$queryRegister);

// To work with database, we'll use a library call : mysqli
require_once 'database.php';
// Connect to my database server
$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD);
echo 'Connexion successfull<br>';
// Choose wich database I want to work with
$db_name = 'moviedb';
$db_found = mysqli_select_db($conn, $db_name);

if ($db_found) {
  echo "$db_name found !<br>";
  // Prepare my query
  $query = "INSERT INTO movies(title, release_year, views, directorID)
  VALUES('Jurassic Park', '2018', 875125, 1)";
  //Send the query to the DB
  $results = mysqli_query($conn, $query);
  if ($results)
    echo "Insert successfull";
  else
    echo "Insert went wrong";
} else
  echo "$db_name NOT found !<br>";

// Close the connection to the database
mysqli_close($conn);
