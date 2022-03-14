<?php
if(isset($_COOKIE['admin_id']))
{
  //unset($_COOKIE['admin_id']); 
  setcookie('admin_id', "", time() + (86400 * 30), "/");
}
//header("Location: adminlogin.php");
echo "<script>location.href = 'adminlogin.php';</script>";
?>