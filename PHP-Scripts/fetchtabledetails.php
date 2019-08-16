

===========>>>>>>>>>>>>>>>> To fetch tables details
fetchtabledetails.php

<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
	if(! $conn)
	{
		die('Could not connect:' .mysql_error());
	}
$sql = 'select * FROM 6SGivK_users';
mysql_select_db('wpsikhguru');
$retval = mysql_query($sql, $conn);
	if(! $retval)
	{
		die('Could not get data:' .mysql_error());
	}
while($row = mysql_fetch_array($retval, MYSQL_ASSOC))
{
	echo "ID : {$row['ID']}<br>";
	echo "user_login : {$row['user_login']}<br>";
	echo "user_pass : {$row['user_pass']}<br>";
	echo "user_nicename : {$row['user_nicename']}<br>";
	echo "user_email : {$row['user_email']}<br>";
	echo "user_url : {$row['user_url']}<br>";
	echo "user_registered : {$row['user_registered']}<br>";
	echo "user_activation_key : {$row['user_activation_key']}<br>";
	echo "user_status : {$row['user_status']}<br>";
	echo "display_name : {$row['display_name']}<br>";
	echo"------------------------------<br>";
}
echo "Fetched data Successfully\n";
mysql_close($conn);
?>



============$$$$$$$$$$$$$$$$$$$============================$$$$$$$$$$$$$$$$$$$================

