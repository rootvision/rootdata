
===========>>>>>>>>>>>>>>>> To create database 
createdatabase.php

<html>
<head>
<title>Create a Mariadb Database</title>
</head>
<body>
<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect ($dbhost, $dbuser, $dbpass);
if(! $conn )
	{
		die('Could not connect:' .mysql_error());
	}
echo 'Connected to Successfully<br />';
	$sql = 'CREATE DATABASE TESTING';
	$retval = mysql_query($sql, $conn);
	if(! $retval)
		{
			die('Could not create database:' .mysql_error());
		}
echo "Database TESTING created Successfully\n";
mysql_close($conn);
?>
</body>
</html>

============$$$$$$$$$$$$$$$$$$$============================$$$$$$$$$$$$$$$$$$$================
