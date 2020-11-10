<?php

require_once 'database.php';

/* --------------count all movies------------------ */
$sql_AllMovies = "SELECT movies.* 
FROM movies";
$allmoviesData = mysqli_query($conn, $sql_AllMovies);
$rowcountAllMovies = mysqli_num_rows($allmoviesData);
echo 'number of movies: '.$rowcountAllMovies.'<br>';

/* -------------count all category------------------- */
$sql_AllCategory = "SELECT *  
FROM category";
$allCategoryData = mysqli_query($conn, $sql_AllCategory);
$rowcountAllcategory = mysqli_num_rows($allCategoryData);
echo 'number of category: '.$rowcountAllcategory.'<br>';

/* ---------------count pages  -------------*/

$moduleOfCounting= $rowcountAllMovies%5;
if($moduleOfCounting==0){
    $countingPages= $rowcountAllMovies/5;
}else{
    $countingPages = $rowcountAllMovies - $moduleOfCounting;
    $countingPages = $countingPages / 5;
    $countingPages = $countingPages+1;
}
echo 'number of pages for movies: ' .$countingPages . '<br>';
echo 'number of movies on last page: ' .$moduleOfCounting . '<br>';

/* ---------------count how meny movies in each category */
for ($i=1; $i < $rowcountAllcategory+1; $i++) { 
    $sql_AllMoviesByCategory = "SELECT movies.*,category.category
        FROM movies 
        INNER JOIN category 
        ON movies.category_id=category.id
        WHERE movies.category_id= $i";
    $allMoviesByCategoryData = mysqli_query($conn, $sql_AllMoviesByCategory);
    $rowcountAllMovies = mysqli_num_rows($allMoviesByCategoryData);
echo 'number of movies in the category: ' . $rowcountAllMovies . '<br>';
}



/* ----------------------------------------------------- */
//echo json_encode($countingData);
mysqli_close($conn);





-------------------------------------------------------

$sql_AllCategory = "SELECT *  
    FROM category";
$allCategoryData = mysqli_query($conn, $sql_AllCategory);
$rowcountAllcategory = mysqli_num_rows($allCategoryData);
echo 'number of category: ' . $rowcountAllcategory . '<br>';

$catgoryArray = array();
$justcatgoryArray = array();
for ($i = 1; $i < $rowcountAllcategory + 1; $i++) {
    $sql_AllMoviesByCategory = "SELECT category.category
        FROM movies 
        INNER JOIN category 
        ON movies.category_id=category.id
        WHERE category.id= $i";

    $allMoviesByCategoryData = mysqli_query($conn, $sql_AllMoviesByCategory);
    //var_dump($allMoviesByCategoryData);
    $rowcountAllMovies = mysqli_num_rows($allMoviesByCategoryData);
    echo 'number of movies in the category: ' . $rowcountAllMovies . '<br>';
    $catgoryArray[$i] = ['categoryNumber' => $rowcountAllMovies];
    //echo $catgoryArray[$i]['categoryNumber'].'<br>';
    /* ----------------------------------------------------------------- */
    $sql_justMoviesByCategory = "SELECT category.category
        FROM category";
    $justMoviesByCategoryData = mysqli_query($conn, $sql_justMoviesByCategory);

    $row = mysqli_fetch_assoc($justMoviesByCategoryData);
    echo ($row[$i]['category']);
    /* while ($row = mysqli_fetch_assoc($justMoviesByCategoryData)){
        $justcategoryArray[] = [
                'category' => $row['category'],
                //'categoryNumber'=> $rowcountAllMovies
        ];
    }; */
};

   /*  echo  $categoryArray['1']['category']; //. '-' . $categoryArray['1']['categoryNumber'];
    echo  $categoryArray['2']['category']; //. '-' . $categoryArray['2']['categoryNumber'];
    echo  $categoryArray['3']['category']; //. '-' . $categoryArray['3']['categoryNumber'];
    echo  $categoryArray['4']['category']; //. '-' . $categoryArray['4']['categoryNumber'];
    echo  $categoryArray['5']['category']; //. '-' . $categoryArray['5']['categoryNumber'];
    echo  $categoryArray['6']['category']; //. '-' . $categoryArray['6']['categoryNumber'];
    echo  $categoryArray['7']['category']; //. '-' . $categoryArray['7']['categoryNumber'];
    echo  $categoryArray['8']['category']; //. '-' . $categoryArray['8']['categoryNumber']; */ 











?>