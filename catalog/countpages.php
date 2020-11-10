<?php
require_once 'database.php';

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
//echo 'number of pages for movies: ' .$countingPages . '<br>';
//echo 'number of movies on last page: ' .$moduleOfCounting . '<br>';

$numbers['0']=$rowcountAllMovies;
$numbers['1']=$countingPages;
$numbers['2']=$moduleOfCounting;
echo json_encode($numbers);
mysqli_close($conn);
?>