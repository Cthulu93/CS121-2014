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

/* Grab English and Spanish files */
$englishFile = file('./englishVerbs.txt', true);
$spanishFile = file('./spanishVerbs.txt', true);

/* Loop through all lines of file and enter each 
   into the database */
for ($i=0; $i < count($englishFile); $i++) {
	$eng = $englishFile[$i];
	$eng = rtrim($eng);
	$engLen = strlen($eng);

	$span = $spanishFile[$i];
	$span = rtrim($span);
	$spanLen = strlen($span);

	/* Query the table and insert the translation */
	mysqli_query($con,
		"INSERT INTO Translations 
		(TransID, English, EnglishLen, Spanish, SpanishLen, Image) 
		VALUES ('', '$eng', '$engLen', '$span', '$spanLen', '')"); 	
}
?>