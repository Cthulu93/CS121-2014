<?php 

$englishFile = file('./englishNouns.txt', true);
$file = './links.txt';

for ($i=0; $i < count($englishFile); $i++) {
	$word = $englishFile[$i];
	$url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&as_filetype=jpg&q=$word";
	$content = file_get_contents($url);

	$http = 'http:';
	$urlstart = strpos($content, $http);
	$jpg = 'jpg';
	$urlend = strpos($content, $jpg) + 3;

	$link = substr($content, $urlstart, ($urlend - $urlstart));
	$image = file_get_contents($link);

	$current = file_get_contents($file);
	$current = file_get_contents($file);
	$current .= "$link\n";
	// Write the contents back to the file
	file_put_contents($file, $current);

}

?>