<?php
if(isset($_COOKIE['u_id']))
{
  //unset($_COOKIE['u_id']); 
  setcookie('u_id', "", time() + (86400 * 30), "/");
}
//header("Location: login.php");
echo "<script>location.href = 'login.php';</script>";
?>