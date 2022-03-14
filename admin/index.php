<!DOCTYPE html>
<html lang="en">

<head>
    <?php
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;

    //Load Composer's autoloader
    require('../PHPMailer/Exception.php');
    require('../PHPMailer/SMTP.php');
    require('../PHPMailer/PHPMailer.php');
    $con = mysqli_connect("localhost", "ourproje_group6", "LJ83tpPZRM3hrH4", "ourproje_e_learning");
    include("functions.php");
    $dow = check_login($con);
    $adminid = $dow['admin_id'];
    $db = mysqli_connect("localhost", "ourproje_group6", "LJ83tpPZRM3hrH4", "ourproje_e_learning");
    $sql = "select *from user where status='no' ";
    $res = mysqli_query($db, $sql);
    if (mysqli_num_rows($res) >= 1) {
        $row = mysqli_fetch_array($res);
        $name = $row['fname'] . " " . $row['lname'];
        $uid = $row['u_id'];
        $email = $row['email'];
        $phone = $row['phone'];
        $house = $row['house_no'];
        $thana = $row['thana'];
        $district = $row['district'];
        $bg = $row['bg'];
        $jobtype = $row['id_type'];
        $dp = $row['dp'];
        $idphoto = $row['id_image'];
        $ustat = $row['ustat'];
    } else {
        $name = " ";
        $uid = " ";
        $email = "";
        $phone = " ";
        $house = " ";
        $thana = " ";
        $district = " ";
        $bg = " ";
        $jobtype = " ";
        $dp = " ";
        $ustat = "";
        $idphoto = " ";
    }

    if (isset($_POST['deny'])) {
        $mail = new PHPMailer(true);

        try {
            //Server settings
            // $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'mail.ourprojectju.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'group67@ourprojectju.com';                     //SMTP username
            $mail->Password   = 'A=^sSE_!ulC2';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                        //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('group6@ourprojectju.com', 'JU e-Learning Platform');
            $mail->addAddress($email);     //Add a recipient
            // //Attachments
            // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Confirmation';
            $msgbody = "Hello " . "" . $name . ",<br> We are unable to accept your request because of some misinformation provied by you. Please try again with valid information . Thank you.";
            $mail->Body    = $msgbody;
            // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            $mail->send();
        } catch (Exception $e) {
            echo "<script>alert('Something went wrong!');</script>";
        }
        $ssql = "delete from user where u_id='$uid'";
        mysqli_query($db, $ssql);
        
        $sql = "select *from user where status='no'";
        $res = mysqli_query($db, $sql);
        if (mysqli_num_rows($res) >= 1) {
            $row = mysqli_fetch_array($res);
            $name = $row['fname'] . " " . $row['lname'];
            $uid = $row['u_id'];
            $email = $row['email'];
            $phone = $row['phone'];
            $house = $row['house_no'];
            $thana = $row['thana'];
            $district = $row['district'];
            $bg = $row['bg'];
            $jobtype = $row['id_type'];
            $dp = $row['dp'];
            $idphoto = $row['id_image'];
            $ustat = $row['ustat'];
        } else {
            $name = " ";
            $uid = " ";
            $email = "";
            $phone = " ";
            $house = " ";
            $thana = " ";
            $district = " ";
            $bg = " ";
            $jobtype = " ";
            $dp = " ";
            $idphoto = " ";
            $ustat = "";
        }
       // header("Location: index.php");
        echo "<script>location.href = 'index.php';</script>";
    }

    if (isset($_POST['accept'])) {
        $ssql = "update user set status='yes',admin_id='$adminid' where u_id='$uid'";
        mysqli_query($db, $ssql);

        if ($jobtype == "Student") {
            $query2 = "insert into student(u_id) values('$uid')";
            mysqli_query($db, $query2);
        } elseif ($jobtype == "Teacher") {
            $query2 = "insert into teacher(u_id) values('$uid')";
            mysqli_query($db, $query2);
        }
        $mail = new PHPMailer(true);

        try {
            //Server settings
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'mail.ourprojectju.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'group6@ourprojectju.com';                     //SMTP username
            $mail->Password   = 'LJ83tpPZRM3hrH4';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                  //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('group6@ourprojectju.com', 'JU e-Learning Platform');
            $mail->addAddress($email);     //Add a recipient
            // //Attachments
            // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Confirmation';
            $msgbody = "Hello " . "" . $name . ",<br> Congratulations!<br> Your account is activated and now you are able to login to our platform. Login link is provided below. Thank you. " . " <br> Link : <a href='https://www.ourprojectju.com/login.php'>https://www.ourprojectju.com/login.php</a>";
            $mail->Body    = $msgbody;
            // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            $mail->send();
        } catch (Exception $e) {
            echo "<script>alert('Something went wrong!');</script>";
        }
        $sql = "select *from user where status='no'";
        $res = mysqli_query($db, $sql);
        if (mysqli_num_rows($res) >= 1) {
            $row = mysqli_fetch_array($res);
            $name = $row['fname'] . " " . $row['lname'];
            $uid = $row['u_id'];
            $email = $row['email'];
            $phone = $row['phone'];
            $house = $row['house_no'];
            $thana = $row['thana'];
            $district = $row['district'];
            $bg = $row['bg'];
            $jobtype = $row['id_type'];
            $dp = $row['dp'];
            $idphoto = $row['id_image'];
            $ustat = $row['ustat'];
        } else {
            $name = " ";
            $uid = " ";
            $email = "";
            $phone = " ";
            $house = " ";
            $thana = " ";
            $district = " ";
            $bg = " ";
            $jobtype = " ";
            $dp = " ";
            $idphoto = " ";
            $ustat = "";
        }
       // header("Location: index.php");
         echo "<script>location.href = 'index.php';</script>";
    }
    ?>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="icon" href="../dbfiles/icob.svg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- <link rel="stylesheet" href="../css/ret.css"> -->
    <link rel="stylesheet" href="../css/update.css">
    <link rel="stylesheet" href="../css/foradminmember.css">
</head>

<body>
    <header>
        <div class="container">
            <nav id="main-nav" class="flex items-center justify-between">
                <div class="left flex  items-center">
                    <div class="branding">
                        <!-- <a href="index.php"><img style="width:50px;height:50px;" src="../dbfiles/admin.jpg" alt=""></a> -->
                        <a href="index.php"><img style="width:60px;height:60px;object-fit:cover;border-radius:50%;border:3px solid var(--pure);" src="../dbfiles/admin.jpg" alt=""></a>
                    </div>
                    <div>
                        <a href="index.php">Member Approval</a>
                        <a href="payment.php">Payment Approval</a>
                        <a href="notices.php">Notices</a>
                    </div>
                </div>

                <div class="right">
                    <button class="btn btn-primary" onclick="location.href='logout.php';">
                        <div class="social">
                            <div class="a"><img src="../dbfiles/logo.svg" alt=""></div>
                            <h3 style="color:white;">Logout...</h3>
                        </div>
                    </button>
                </div>
            </nav>
        </div>
    </header>
    <div class="bodyy">
        <div class="containerr">
            <div class="title">
                Member Approval
            </div>
            <form action="index.php" method="post">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details"> Name</span>
                        <p><?php if (isset($name)) echo $name; ?></p>
                    </div>
                    <div class="input-box">
                        <span class="details">User ID</span>
                        <p><?php if (isset($uid)) echo $uid; ?></p>
                    </div>
                    <div class="input-box">
                        <span class="details"> Email<b style="color:<?php if ($ustat == "inactive") echo "red;";
                                                                    else echo "green;"; ?>;font-size:1rem;"> <?php if ($ustat == "inactive") echo "(Not verified)";
                                                                                                                else if ($ustat == "active") echo  "(Verified)";
                                                                                                                else echo ""; ?></b></span>
                        <p><?php if (isset($email)) echo $email; ?></p>
                    </div>

                    <div class="input-box">
                        <span class="details"> Phone Number</span>
                        <p><?php if (isset($phone)) echo $phone; ?></p>
                    </div>

                    <div class="input-box">
                        <span class="details"> House No.</span>
                        <p><?php if (isset($house)) echo $house; ?></p>
                    </div>

                    <div class="input-box">
                        <span class="details"> Thana</span>
                        <p><?php if (isset($thana)) echo $thana; ?></p>
                    </div>
                    <div class="input-box">
                        <span class="details"> District</span>
                        <p><?php if (isset($district)) echo $district; ?></p>
                    </div>

                    <div class="input-box">
                        <span class="details"> Blood Group</span>
                        <p><?php if (isset($bg)) echo $bg; ?></p>
                    </div>
                    <div class="input-box">
                        <span class="details">Id Type</span>
                        <p><?php if (isset($jobtype)) echo $jobtype; ?></p>
                    </div>
                    <img src="../<?php if (isset($dp)) echo $dp; ?>" alt="Your Profile Picture" style="object-fit: cover;margin-left:15rem;margin-top:2rem;" height="300" width="300">
                    <img src="../<?php if (isset($idphoto)) echo $idphoto; ?>" alt="Your ID Card" style="object-fit: cover;margin-right:15rem;margin-top:2rem;" height="300" width="300">
                </div>
                <div class="button">
                    <input type="submit" value="Accept" name="accept">
                    <input type="submit" value="Deny" name="deny">
                </div>
            </form>
        </div>
    </div>

</body>

</html>