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

/* Grab English and EnglishEx files from URL parameters */
$englishFile = $_GET['eng'];
/* Create proper filename */
$englishFile = "./" . $englishFile . ".txt";
$englishFile = file($englishFile, true);

$englishExFile = $_GET['ex'];
/* Create proper filename */
$englishExFile = "./" . $englishExFile . ".txt";
$englishExFile = file($englishExFile, true);

/* Loop through all lines of file and enter each 
   into the database */
for ($i=0; $i < count($englishFile); $i++) {
	$eng = $englishFile[$i];
	$eng = rtrim($eng);
	$engLen = strlen($eng);

	$ex = $englishExFile[$i];
	$ex = rtrim($ex);
	$exLen = strlen($ex);

	/* Query the table and insert the translation */
	mysqli_query($con,
		"INSERT INTO TESTTranslations 
		(TransID, English, EnglishLen, EnglishEx, EnglishExLen, Image) 
		VALUES ('', '$eng', '$engLen', '$ex', '$exLen', '')"); 	
}
?>