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

/* Grab entire contents of SQL table */
$result = mysqli_query($con,"SELECT * FROM Translations");

/* Array to hold all JSON Output */
$masterArray = array();

/* Loop through the SQL database line-by-line
   and add each row to the array */
while($row = mysqli_fetch_array($result)){
  $arr = array('TransID' => $row['TransID'],
  			   'English' => $row['English'],
  			   'EnglishLen' => (int)$row['EnglishLen'],
  			   'Spanish' => $row['Spanish'],
  			   'SpanishLen' => (int)$row['SpanishLen'],
  			   'Image' => $row['Image']);
  /*put all of the json dictionaries into the master array*/
  array_push($masterArray, $arr);
}

/* Output the entire array of rows in JSON format */
echo json_encode($masterArray);
?>