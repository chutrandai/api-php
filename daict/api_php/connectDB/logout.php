<?php
    session_start();
    if(isset($_SESSION["loggedin"])) {
        unset($_SESSION["loggedin"]);
        unset($_SESSION["username"]);
        unset($_COOKIE['user']);
        // header("Location:login.php");
        echo '{ "status": ' . json_encode(200) . ','.'"data": '. json_encode(null) . '}';
    }
?>