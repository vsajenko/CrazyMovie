<?php

/* connect to database */
require_once 'database.php';

/* count catgerory type */
$sql_AllMovies = "SELECT movies.* 
FROM movies";
$allmoviesData = mysqli_query($conn, $sql_AllMovies);
$rowcountAllMovies = mysqli_num_rows($allmoviesData);
//echo 'number of movies: '.$rowcountAllMovies.'<br>';

$moduleOfCounting= $rowcountAllMovies%6;
if($moduleOfCounting==0){
    $countingPages= $rowcountAllMovies/6;
}else{
    $countingPages = $rowcountAllMovies - $moduleOfCounting;
    $countingPages = $countingPages / 6;
    $countingPages = $countingPages+1;
}
$numbers['0']=$rowcountAllMovies;
$numbers['1']=$countingPages;
$numbers['2']=$moduleOfCounting;


$limitMin=0+$x*$countingPages
$limitMax=0+6*$number;




$sql_movie = "SELECT movies.*
    FROM movies
    LIMIT 0, 6";
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