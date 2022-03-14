<?php
function check_login($con)
{
    if(isset($_COOKIE['u_id']))
    {
        $u_id=$_COOKIE['u_id'];
        $query="select * from user where u_id= '$u_id' limit 1 ";
        $result=mysqli_query($con,$query);
        if($result && mysqli_num_rows($result)>0)
        {
            $user_data=mysqli_fetch_assoc($result);
            return $user_data;
        }
    }
    echo "<script>location.href = 'login.php';</script>";
    die;
}
?>