<?php
//session_start();
//$_SESSION['movieId'];
//$movieId=$_SESSION['movieId'];

/* administrator status*/
$_SESSION['adminStatus'] = '1';
if ($_SESSION['adminStatus']) {
    $status = '';
} else {
    $status = 'display:none';
};
/* conect to database */
$movieId = '1';
require_once 'database.php';
/* get data by query  for movie info*/
$sql_movie = "SELECT movies.*,category.category,directors.name
FROM movies 
RIGHT JOIN directors ON movies.director_id = directors.id
INNER JOIN category 
ON movies.category_id=category.id 
WHERE movies.id=$movieId";
/* put data to array */
$result = mysqli_query($conn, $sql_movie);
$moviesArray = array();
while ($row = mysqli_fetch_assoc($result)) {
    $moviesArray[] = [
        'id' => $row['id'],
        'title' => $row['title'],
        'views' => $row['views'],
        'release_date' => $row['release_date'],
        'budget' => $row['budget'],
        'description' => $row['description'],
        'imdb_link' => $row['imdb_link'],
        'trailer_link' => $row['trailer_link'],
        'poster' => $row['poster'],
        'category' => $row['category'],
        'pegi' => $row['pegi'],
        'directorname' => $row['name']
    ];
};
/* get data by query  for actors of movie*/
$sql_actors = "SELECT actors.name
FROM movies
INNER JOIN actor_movie_director ON movies.id=actor_movie_director.movie_id
INNER JOIN actors ON actors.id=actor_movie_director.actor_id
WHERE movies.id=$movieId";
$resultActors = mysqli_query($conn, $sql_actors);
/* put data to array */
while ($row = mysqli_fetch_assoc($resultActors)) {
    $actorsArray[] = [
        'name' => $row['name'],
    ];
};
/* close connection */
mysqli_close($conn);

/* -----------------------HTML------------------------------ */
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/moviecard.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Sansita+Swashed:wght@900&display=swap" rel="stylesheet">
    <title>CrazyMovies</title>
</head>

<body>
    <!-- add header -->
    <?php require_once 'header.html'; ?>

    <main>
        <section id="conteiner">
            <div>
                <img src="../images/movies/<?= $moviesArray['0']['poster'] ?>" alt="">
                <p><em>Realese date:</em> <?= $moviesArray['0']['release_date'] ?></p>
                <p><em>Views:</em> <?= $moviesArray['0']['views'] ?></p>
                <p><em>Budget:</em> <?= $moviesArray['0']['budget'] ?></p>
                <p><em>Age rate:</em> +<?= $moviesArray['0']['pegi'] ?></p>
            </div>
            <div>
                <div>
                    <h1>#<?= $moviesArray['0']['id'] ?> - <?= $moviesArray['0']['title'] ?></h1>
                    <p><em>Category:</em> <?= $moviesArray['0']['category'] ?></p>
                </div>
                <p><em>Director:</em> <?= $moviesArray['0']['directorname'] ?></p>
                <article>
                    <p><em>Actors:</em> </p>
                    <!-- insert actors list -->
                    <div>
                        <?php
                        foreach ($actorsArray as $key => $value) {
                            echo '<p>' . $value['name'] . '</p>';
                        };
                        ?>
                    </div>
                </article>
                <section id="description">
                    <p><em>Description:</em> <?= $moviesArray['0']['description'] ?></p>
                    <p><em>IMDB link:</em> <a href="<?= $moviesArray['0']['imdb_link'] ?>" target=" _blank">http://.../<?= $moviesArray['0']['title'] ?></a> </p>
                </section>
                <div id="officialtrailer">
                    <p><em>Official trailer:</em> </p>
                    <?= $moviesArray['0']['trailer_link'] ?>
                </div>
            </div>

        </section>

    </main>
    <!-- add footer-->
    <?php require_once 'footer.html'; ?>
</body>

</html>