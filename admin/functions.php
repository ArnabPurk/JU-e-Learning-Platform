<?php
function check_login($con)
{
    if(isset($_COOKIE['admin_id']))
    {
        $admin_id=$_COOKIE['admin_id'];
        $query="select * from admin where admin_id= '$admin_id' limit 1 ";
        $result=mysqli_query($con,$query);
        if($result && mysqli_num_rows($result)>0)
        {
            $admin_data=mysqli_fetch_assoc($result);
            return $admin_data;
        }
    }
    //header("Location:adminlogin.php");
     echo "<script>location.href = 'adminlogin.php';</script>";
    die;
}
?>