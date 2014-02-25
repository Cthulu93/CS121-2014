<?php
/* Database parameters */
$dbhost = 'localhost';
$dbuser = 'echoorg1_cs121';
$dbpass = 'cs121';
$dbname = 'echoorg1_cs121';

/* Establish connection to SQL database, throw error */
$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) 
     or die ('Error connecting to mysql');
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

/* UPDATE Customers
SET ContactName='Alfred Schmidt', City='Hamburg'
WHERE CustomerName='Alfreds Futterkiste'; */

$url = "URL";
$image = file_get_contents($url);
file_get_contents($url);

?>