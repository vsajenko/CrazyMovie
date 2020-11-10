<?php
//session_start();
//$_SESSION['movieId'];
//$movieId=$_SESSION['movieId'];

/* administrator status*/
$_SESSION['adminStatus'] = '0';
if ($_SESSION['adminStatus']) {
    $status = '';
} else {
    $status = 'display:none';
};

/* connect to database */
require_once 'database.php';

/* count catgerory type */
$sql_movie = "SELECT movies.*
FROM movies";
/* put data to array */
$result = mysqli_query($conn, $sql_movie);
$moviesArray = array();
$numberOfMovies = mysqli_num_rows($result);
while ($row = mysqli_fetch_assoc($result)) {
    $moviesArray[] = [
        'id' => $row['id'],
        'title' => $row['title'],
        'poster' => $row['poster'],
    ];
};
echo json_encode($moviesArray);
mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/moviescatalog.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Sansita+Swashed:wght@900&display=swap" rel="stylesheet">
    <title>CrazyMovies</title>
</head>

<body>
    <!-- add header -->
    <?php require_once 'header.html'; ?>
    <main>
        <section>
            <h2>Here we write texts for people information</h2>
            <form action="">
                <input type="text" name="search" id="search" placeholder="Search">
                <input type="submit" name="okBtn" value="OK">
            </form>
            <article id="category">

            </article>
            <article id="movieArea" >
                <div id="template">
                    <div id="tempHeader">
                        <h2 id="movienumber">#1 </h2>
                        <h2 id="movieTitle"> Title of movies </h2>
                    </div>
                    <img src="../images/movies/theMask.jpg" alt="">
                </div>
            </article>

        </section>
    </main>
    <!-- add footer-->
    <?php require_once 'footer.html'; ?>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
</script>
<script>
    /* for (let i = 0; i < 9; i++) {
        $('#template').clone().appendTo("#movieArea");

    } */
    $.ajax({
                    url:'moviecatalog.php',
                    method:'post',
                    dataType:'json'

            }).done(function(result){
                
                console.log(result);
                $.each(result, function(key, movie){
                    
                    $('#moviesContainer').append('<h3> #' + movie.id +' Title: '+ movie.title+'</h3>');
                    $('#moviesContainer').append('<img src="../images/movies/'+ movie.poster+'" alt="">');
                    $('#moviesContainer').append('<hr>'); 
                   
                });
            }).fail(function(result){
                // If AJAX failed
                console.log('AJAX ERROR: movies ' + result);
            });
</script>

</html>