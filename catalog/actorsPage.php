

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>



<?php
$db= mysqli_connect('localhost', 'root', '', 'crazymovie');

    // Query with Join between table
    $query = "SELECT *
    FROM actors wHERE id = 5 "; 

    // Execute query
    $results = mysqli_query($db, $query);

   // var_dump($results);

        // Retrieve actors
        $actors = mysqli_fetch_all($results, MYSQLI_ASSOC);


        $actorsId = "";

       // Show all information from the actor selected 
      
            echo '<p><strong> Name : </strong>' . $actors['0']['name'] . '</p>';
            echo '<img src="images/actors/' . $actors['0']['picture'] . '">';
            echo '<p><strong> gender : </strong>' . $actors['0']['gender'] . '</p>';
            echo '<p><strong> nationality : </strong>' . $actors['0']['nationality'] . '</p>';
            echo '<p><strong> status : </strong>' . $actors['0']['status'] . '</p>';
    

       
    //query for display all actor's movies 
    
    $queryMovie = "SELECT *FROM movies
    INNER JOIN actor_movie_director ON movies.id = actor_movie_director.movie_id
    INNER JOIN actors ON actors.id = actor_movie_director.actor_id
    WHERE actors.id = 5" ;




$resultsM = mysqli_query($db, $queryMovie);

// Fetch results as associative array
$movies = mysqli_fetch_all($resultsM, MYSQLI_ASSOC);

if ( $actors['gender'] = 'female'){
    echo 'you can see her on' ;
}else
echo 'You can see him on :';

foreach ($movies as $movie) {
//foreach ($movies as $movie) {
    echo '<p><strong> Title : </strong>' . $movie['title'] . '</p> <br>';
    echo  '<img src="images/movies/' .$movie['poster']  . '" width="100px">';
  
}

var_dump($resultsM);


/*
I retrieve the results as an array
And display this array (using a loop)


while ($db_record = mysqli_fetch_assoc($results)) {
  echo '<hr>';
  echo $db_record['title'] . '<br>';
  echo $db_record['release_year'] . '<br>';
  echo $db_record['views'] . '<br>';
}
*/
        // Display the movie of an actors 

      /*  "SELECT*FROM movies
INNER JOIN actor_movie_director ON movies.id = actor_movie_director.movie_id
INNER JOIN actors ON actors.id = actor_movie_director.actors_id "*/
    

