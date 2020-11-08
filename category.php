<?php
/* connect database */
require_once 'database.php';
if(!$conn){
    die("Connection failed: Some wrong with conection.");
};
/* query of all category */
$sql_category = "SELECT *
FROM category";
/* get data from database */
$categoryData = mysqli_query($conn, $sql_category);
/* default array */
$categoryArray=array();
/*  loop for writing data to array */
while($row=mysqli_fetch_assoc($categoryData)){
    $categoryArray[]=[
        'category_id'=>$row['id'],
        'category'=>$row['category']
        ];
};
/* conver array to json */
echo json_encode($categoryArray);
/* close connection */
mysqli_close($conn);
?>