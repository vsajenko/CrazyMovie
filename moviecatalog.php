<?php
$searchMovie = $_POST['searchMovie'];
$filterSelection = $_POST['filterSelection'];
$filterCategory = $_POST['filterCategory'];
/* $searchMovie = 's';
$filterSelection = 'DESC';
$filterCategory = 'all'; */


require_once 'database.php';

if(!$conn){
    die("Connection failed: Some wrong with conection.");
};
/* selection */
if($filterSelection == 'ASC'){
    $valueFilterSelection = " ORDER BY title ASC";
};
if ($filterSelection == 'DESC') {
    $valueFilterSelection = " ORDER BY title DESC";
};
if ($filterCategory == 'all') {
    $valueFilterCategory = "";
} else {
    $valueFilterCategory = " WHERE movies.category_id= " . $filterCategory;
};
if(empty($searchMovie)){
    $valuesearchMovie="";
}else{
    $valuesearchMovie=" AND movies.title 
                        LIKE '%$searchMovie%' ";
}

/* query of movies */
$sql_movies = "SELECT movies.*,category.category
FROM movies 
INNER JOIN category 
ON movies.category_id=category.id " . $valueFilterCategory . $valuesearchMovie. $valueFilterSelection;
/* get data from database */

$moviesData = mysqli_query($conn, $sql_movies);

$moviesArray=array();

while($row=mysqli_fetch_assoc($moviesData)){
    $moviesArray[]=[
        'id'=>$row['id'],
        'title'=>$row['title'],
        'views'=>$row['views'],
        'release_date'=>$row['release_date'],
        'budget'=>$row['budget'],
        'description'=>$row['description'],
        'imdb_link'=>$row['imdb_link'],
        //'trailer_link'=>$row['trailer_link'],
        'poster'=>$row['poster'],
        'category_id'=>$row['category_id'],
        'category'=>$row['category'],
        'pegi'=>$row['pegi']
    ];
};

echo json_encode($moviesArray);
mysqli_close($conn);
?>
