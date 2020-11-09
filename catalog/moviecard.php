<?php
//session_start();
//$_SESSION['movieId'];
//$movieId=$_SESSION['movieId'];
$movieId='1';
require_once 'database.php';

$sql_movie = "SELECT movies.*,category.category,directors.name
FROM movies 
RIGHT JOIN directors ON movies.director_id = directors.id
INNER JOIN category 
ON movies.category_id=category.id 
WHERE movies.id=$movieId";
/* get data from database */
$result = mysqli_query($conn, $sql_movie);
$moviesArray=array();
while($row=mysqli_fetch_assoc($result)){
    $moviesArray[]=[
        'id'=>$row['id'],
        'title'=>$row['title'],
        'views'=>$row['views'],
        'release_date'=>$row['release_date'],
        'budget'=>$row['budget'],
        'description'=>$row['description'],
        'imdb_link'=>$row['imdb_link'],
        'trailer_link'=>$row['trailer_link'],
        'poster'=>$row['poster'],
        'category'=>$row['category'],
        'pegi'=>$row['pegi'],
        'directorname'=>$row['name']
    ];    
};
$sql_actors = "SELECT actors.name
FROM movies
INNER JOIN actor_movie_director ON movies.id=actor_movie_director.movie_id
INNER JOIN actors ON actors.id=actor_movie_director.actor_id
WHERE movies.id=1";
$resultActors = mysqli_query($conn, $sql_actors);

while($row=mysqli_fetch_assoc($resultActors)){
    $actorsArray[]=[
        'name'=>$row['name'],
    ];
};

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <section style="display: flex;">
        <img style="height:300px" src="images/movies/<?=$moviesArray['0']['poster']?>" alt="">
        <article style="padding: 10px;line-height: 80%">
            <div style="display: flex; justify-content: space-between;">
                <h1>#<?=$moviesArray['0']['id']?> - <?=$moviesArray['0']['title']?></h1>
                <p>Category: <?=$moviesArray['0']['category']?></p>
            </div >
            <p>Views: <?=$moviesArray['0']['views']?></p>
            <p>Director: <?=$moviesArray['0']['directorname']?></p>
            <p>Realese date: <?=$moviesArray['0']['release_date']?></p>
            <p>Budget: <?=$moviesArray['0']['budget']?></p>
            <p>Age rate: +<?=$moviesArray['0']['pegi']?></p> 
            <article style="display: flex; ">
                <p >Actors: </p>
                <!-- insert actors list -->
                <div style="padding:10px">
                    <?php
                        foreach ($actorsArray as $key => $value) {
                            echo '<p>'.$value['name'].'</p>';
                        };
                    ?>
                </div>
            </article>
            
        </article>
    </section>
    <section>
       <p>Description: <?=$moviesArray['0']['description']?></p>
       <p>IMDB link: <a href="<?=$moviesArray['0']['imdb_link']?>">http://---<?=$moviesArray['0']['title']?>---</a> </p>
    </section>
    
    
    <p>Official trailer: </p>
    <?=$moviesArray['0']['trailer_link']?>
</body>
</html>