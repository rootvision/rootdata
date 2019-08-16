

===========>>>>>>>>>>>>>>>>	To delete the database
deletedatabase.php

<html>
<head>
<title>Delete a Mariadb Database</title>
</head>
<body>
<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
	if(! $conn)
	{
		die('Could not connect:' .mysql_error());
	}
echo 'Connected Successfully<br />';
$sql = 'DROP DATABASE TESTING';
$retval = mysql_query($sql, $conn);
	if(! $retval)
		{
			die('Could not delete database:' .mysql_error());
		}	
echo "Database TESTING deleted Successfully\n";
mysql_close($conn);
?>
</body>
</html>

============$$$$$$$$$$$$$$$$$$$============================$$$$$$$$$$$$$$$$$$$================
