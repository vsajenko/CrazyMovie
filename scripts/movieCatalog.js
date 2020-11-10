
        $(function(){
            /* default all movies */
            $.ajax({
                    url:'counting.php',
                    dataType:'json'

            }).done(function(result){





            }).fail(function(result){

            })
            /* ------------ */
            $.ajax({
                    url:'moviecatalog1.php',
                    method:'post',
                    data:{filterSelection:'ASC', 
                        filterCategory:'all',
                        searchMovie: ''
                        },
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
/* ------------------------------ */
            $.ajax({
                    url:'category.php',
                        dataType:'json'
                }).done(function(result){
                        $.each(result,function(key,categ){
                            $('#filterCategory').append('<option value="'+ categ.category_id+'">'+ categ.category+'</option>')
                        });
                }).fail(function(result){
                    console.log('AJAX ERROR: categories ' + result);
                });   
/*---------sorting functions ASC or DSC------------------------- */
$('#filterSelection').change(function(){
            $.ajax({
                    url:'moviecatalog1.php',
                    method:'post',
                    data:{ filterSelection:$('#filterSelection').val(),
                        filterCategory:$('#filterCategory').val(),
                        searchMovie: $('#searchMovie').val()
                        },
                    dataType:'json'
                }).done(function(result){
                    $('#moviesContainer').html('')
                    $.each(result, function (key, movie) {
                        $('#moviesContainer').append('<h3> #' + movie.id + ' Title: ' + movie.title + '</h3>');
                        $('#moviesContainer').append('<img src="../images/movies/' + movie.poster + '" alt="">');
                        $('#moviesContainer').append('<hr>'); 
                        });
                }).fail(function (result) {
                    console.log('AJAX ERROR: sorting movies ' + result);
                    });
            });
/* -----------sorting function by categoryes-------------------------------- */
            $('#filterCategory').change(function(){
                $.ajax({
                    url:'moviecatalog1.php',
                    method:'post',
                    data: { filterSelection:$('#filterSelection').val(), 
                            filterCategory: $(this).val(),
                            searchMovie:$('#searchMovie').val()
                            },
                    dataType:'json'
                }).done(function(result){
                        $('#moviesContainer').html('');
                    
                    $.each(result, function (key, movie) {
                        //$('#moviesContainer').append('<div style="display: flex;"><img src="images/movies/' + movie.poster + '" alt=""><div><h3 h3 > #' + movie.id + ' Title: ' + movie.title + '</h3><p>Views: ' + movie.views + '</p></div></div>');
                            $('#moviesContainer').append(' <h3> #' + movie.id + ' Title: ' + movie.title + '</h3>');
                            $('#moviesContainer').append('<img src="../images/movies/' + movie.poster + '" alt="">');
                            $('#moviesContainer').append('<hr>'); 
                        });
                }).fail(function(result){
                    console.log('AJAX ERROR: categories-movies'); 
                });
            });
/* ------------Searching in the database--------------------------------- */
            $('#searchMovie').keyup(function(){
                $.ajax({
                    url: 'moviecatalog1.php',
                    method:'post',
                    data:{ searchMovie:$(this).val(),
                        filterSelection:$('#filterSelection').val(),
                        filterCategory:$('#filterCategory').val(),
                    },
                    dataType:'json'
                    
                }).done(function(result){
                   
                    $('#moviesContainer').html('');
                    $.each(result,function (key, movie) {
                        console.log(movie.id);
                        console.log(movie.title);

                        $('#moviesContainer').append('<h3> #' + movie.id + ' Title: ' + movie.title + '</h3>');
                        $('#moviesContainer').append('<img src="../images/movies/' + movie.poster + '" alt="">');
                        $('#moviesContainer').append('<hr>');
                    });
                }).fail(function(result){
                    console.log('AJAX ERROR: searching-movies'); 
                });

            });
/* --------------------------------------------- */


        });
