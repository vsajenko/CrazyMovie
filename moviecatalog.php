<?php

$sortSelection=$_POST['sortSelection'];
$sortCategory=$_POST['category'];


require_once 'database.php';

if (!$conn) {
    die("Connection failed:some thing is wrong with connection.");
  }
/* what was selected */
if($sortSelection=='ASC'){  
    $valueSlection= ' ORDER BY title ASC';
};
if($sortSelection=='DESC'){
    $valueSlection= ' ORDER BY title DESC';
};
if($sortCategory=='all'){
    $valueCategorySelector= '';
}else{$valueCategorySelector= ' WHERE directors.id = '.$sortCategory;
};

/* selection quary */
$sql_movies = "SELECT movies.*,category.name 
FROM movies 
INNER JOIN category
ON movies.category=category.id ".$valueCategorySelector.$valueSlection;
/* get data from database */
$movies_data = mysqli_query($con,$sql_movies );

/* write to array data */
$movies_arr=array();
while($row = mysqli_fetch_assoc($movies_data) ){
     $movies_arr[]=[
         "title"=>$row['title'],
         "director"=>$row['name'],
         "views"=>$row['views'],
         "poster"=>$row['poster']
        ];
   }
   /* convert to jsaon */
echo json_encode($movies_arr); 
mysqli_close($con);
?>
