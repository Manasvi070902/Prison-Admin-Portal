<?php

$servername="localhost";
$dBUsername="root";
$dBPassword="password";
$dBName="prison_system_db";

$conn=mysqli_connect($servername,$dBUsername,$dBPassword,$dBName);

//if the connection doesnt work:
    
if(!$conn){
    die("Connection failed:".mysqli_connect_error());
    //closes the connection and prints the error
}

