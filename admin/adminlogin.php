<?php
//session er khauwa nai, header er khauwa nai.
$con = mysqli_connect("localhost", "ourproje_group6", "LJ83tpPZRM3hrH4", "ourproje_e_learning");
include("functions.php");
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $adminid = $_POST['adminid'];
    $password = md5($_POST['password']);
    if (!empty($adminid) && !empty($password)) {
        $query = "select * from admin where admin_id='$adminid'limit 1";
        $result = mysqli_query($con, $query);
        if ($result && mysqli_num_rows($result) > 0) {
            $admindata = mysqli_fetch_assoc($result);
            if ($admindata['password'] === $password) {
                setcookie('admin_id', $admindata['admin_id'], time() + (86400 * 30), "/");
                // echo "<script>location.href = 'index.php';</script>";
                header("Location: index.php");
                die;
            } else {
                echo '<script>alert("Wrong Password. Please Enter Correct Password!")</script>';
            }
        } else {
            echo '<script>alert("Invalid Admin ID")</script>';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../dbfiles/icob.svg">
    <title>Admin Login Page</title>
    <link rel="stylesheet" href="../css/login.css">

</head>

<body>
<div class="container">
        <div class="navbar">
            <nav>
                <ul class="nav_links">
                     <li><a href="/">Home</a></li>
                    <li><a href="../notices.php">Notices</a></li>
                </ul>
            </nav>
            <a class="login" href="adminlogin.php"><button class="button1">Login</button></a>
        </div>
    </div>
    <div class="center">
        <form method="post">
            <div class="txt_field">
                <input type="text" name="adminid" required>
                <span></span>
                <label>Admin Name</label>
            </div>
            <div class="txt_field">
                <input type="password" name="password" required>
                <span></span>
                <label>Password</label>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>
</body>

</html>