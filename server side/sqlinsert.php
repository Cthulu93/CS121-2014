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


$englishFile = file('./englishNouns.txt', true);
$spanishFile = file('./spanishNouns.txt', true);

for ($i=0; $i < count($englishFile); $i++) {
	$eng = $englishFile[$i];
	$eng = rtrim($eng);
	$engLen = strlen($eng);

	$span = $spanishFile[$i];
	$span = rtrim($span);
	$spanLen = strlen($span);

	mysqli_query($con,"INSERT INTO Translations (TransID, English, EnglishLen, Spanish, SpanishLen, Image) 
		VALUES ('', '$eng', '$engLen', '$span', '$spanLen', '')"); 	
}

?>