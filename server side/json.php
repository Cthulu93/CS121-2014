<?php
$dbhost = 'localhost';
$dbuser = 'echoorg1_cs121';
$dbpass = 'cs121';
$dbname = 'echoorg1_cs121';

$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) or die ('Error connecting to mysql');

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,"SELECT * FROM Translations");

/*begin json output */
/*echo "[";*/
$masterArray = array();
while($row = mysqli_fetch_array($result))
  {
  $arr = array('TransID' => $row['TransID'],
  			   'English' => $row['English'],
  			   'EnglishLen' => (int)$row['EnglishLen'],
  			   'Spanish' => $row['Spanish'],
  			   'SpanishLen' => (int)$row['SpanishLen'],
  			   'Image' => $row['Image']);
  /*put all of the json dictionaries into the master array*/
  array_push($masterArray, $arr);
  }

  echo json_encode($masterArray);

mysqli_close($con);
?>