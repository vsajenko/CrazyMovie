<?php

define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_SERVER', 'localhost');
define('DB_NAME', 'crazymovie');

$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_NAME);