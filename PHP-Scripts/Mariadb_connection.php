
===========>>>>>>>>>>>>>>>>  		To check connection between mysql server


***  Mariadb_connection.php

<html>
<head>
<title>Connect to mariadb Server</title>
</head>
<body>
<?php
$dbhost = 'localhost';
$dbuser = 'vision';
$dbpass = '135@#$*J0eY';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
	if(! $conn)
		{
			die('Could not connect:' .mysql_error());
		}
	echo 'Connected to Mariadb Server';
	mysql_close($conn);
?>
</body>
</html>

============$$$$$$$$$$$$$$$$$$$============================$$$$$$$$$$$$$$$$$$$================
