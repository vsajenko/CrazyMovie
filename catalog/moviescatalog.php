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
            <form action="" method="post">
                <input type="text" name="search" id="search" placeholder="Search">
                <input type="submit" name="okBtn" value="OK">
            </form>
<!-- template and the list of all movies -->
            <article id="allmovieslist">
                <div id="template"></div>
            </article>
        </section>
<!-- Page Buttons on the  -->        
        <section id="buttons"></section>
    </main>
    <!-- add footer-->
    <?php require_once 'footer.html'; ?>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
</script>
<script>
$(function(){
   /* default  */
    $.ajax({
            url:'allmoviescounting.php',
            method:'post',
            dataType:'json'
        }).done(function(result){   
            console.log(result);
            $.each(result, function(key, movie){
                console.log(movie);
                $('#template').append('<h3> #' + movie.id +' Title: '+ movie.title+'</h3>');
                $('#template').append('<img src="../images/movies/'+ movie.poster+'" alt="">');
                let newCard=$('#template')
                newCard.clone().appendTo("#allmovieslist");
                $('#template').html('');
            });
            $('#template').remove();
        }).fail(function(result){
                // If AJAX failed
                console.log('AJAX ERROR: movies ' + result);
        });
/* ----------------------------- */
    $.ajax({
            url:'countpages.php',
            dataType:'json'
        }).done(function(result){
            console.log(result);
            let rowcountAllMovies=result['0'];
            let countingPages=result['1'];
            let moduleOfCounting=result['2'];
            console.log(rowcountAllMovies);
            console.log(countingPages);
            console.log(moduleOfCounting);
            
            $('#buttons').append('<p>['+rowcountAllMovies+' movies]</p>');
            
            for (let i = 1; i <= countingPages; i++) {
                //$('#buttons').append('<input type="submit" name="'+ i +'" class="button" value="'+ i +'">');
                $('#buttons').append('<button type="button" class="button" value="'+i+'">'+i+'</button>');
            };
            $('#buttons').append('<p>['+countingPages+'pages]</p>');
            
              
            
        }).fail(function(result){
                // If AJAX failed
                console.log('AJAX ERROR: pages ' + result);
        });

});
</script>

</html>