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
    $sql = "select *from user inner join payment on user.u_id=payment.u_id where pstatus='no'";
    $res = mysqli_query($con, $sql);
    if (mysqli_num_rows($res) >= 1) {
        $row = mysqli_fetch_assoc($res);
        $dp = $row['dp'];
        $email=$row['email'];
        $name = $row['fname'] . " " . $row['lname'];
        $uid = $row['u_id'];
        $tid = $row['t_id'];
        $amount = $row['amount'];
        $pdate = $row['pdate'];
    }
    if (isset($_POST['accept'])) {
        $sql = "update payment set pstatus='yes',admin_id='$adminid' where u_id='$uid' and t_id='$tid'";
        mysqli_query($con, $sql);
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
            $mail->Port       = 465;                                      //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('group6@ourprojectju.com', 'JU e-Learning Platform');
            $mail->addAddress($email);     //Add a recipient
            // //Attachments
            // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Payment Information';
            $msgbody = "Dear " . "" . $name . ",<br> Your payment has been successfull. Thank you.";
            $mail->Body    = $msgbody;
            // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            $mail->send();
        } catch (Exception $e) {
            echo "<script>alert('Something went wrong!');</script>";
        }
        //header("Location: payment.php");
        echo "<script>location.href = 'payment.php';</script>";
    }
    if (isset($_POST['reset'])) {
        $sql = "delete from payment";
        mysqli_query($con, $sql);
        //header("Location: payment.php");
        echo "<script>location.href = 'payment.php';</script>";
    }
    if (isset($_POST['deny'])) {
        $sql = "delete from payment where u_id='$uid' and t_id='$tid'";
        mysqli_query($con, $sql);
        $mail = new PHPMailer(true);

        try {
            //Server settings
            // $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'mail.ourprojectju.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'group6@ourprojectju.com';                     //SMTP username
            $mail->Password   = 'LJ83tpPZRM3hrH4';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                       //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('group6@ourprojectju.com', 'JU e-Learning Platform');
            $mail->addAddress($email);     //Add a recipient
            // //Attachments
            // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Payment Information';
            $msgbody = "Dear " . "" . $name . ",<br> Your payment has been unsuccessfull. Please provide valid information. Thank you.";
            $mail->Body    = $msgbody;
            // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            $mail->send();
        } catch (Exception $e) {
            echo "<script>alert('Something went wrong!');</script>";
        }
        echo "<script>location.href = 'payment.php';</script>";
    }
    ?>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Approval</title>
    <link rel="icon" href="../dbfiles/icob.svg">
    <link rel="stylesheet" href="../css/update.css">
    <link rel="stylesheet" href="../css/dash.css">
    <link rel="stylesheet" href="../css/class.css">
    <link rel="stylesheet" href="../css/foradminmember.css">
</head>

<body>
    <header>
        <div class="container">
            <nav id="main-nav" class="flex items-center justify-between">
                <div class="left flex  items-center">
                    <div class="branding">
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

            <div id="home" class="intro flex items-center justify-between" style="margin-top:2rem">
                <div class="left flex-1 flex justify-center">
                    <img style="object-fit:cover;height:300px;width:300px" src="../<?php if (isset($dp)) echo $dp; ?>" alt="">
                </div>
                <div class="right flex-1">
                    <h1><?php if (isset($name)) echo $name; ?></h1>
                    <h5 style="color:var(--dark);">User ID: <span><?php if (isset($uid)) echo $uid; ?></span></h5>
                    <h5 style="color:var(--dark);">Transaction ID: <span><?php if (isset($tid)) echo $tid; ?></span></h5>
                    <h5 style="color:var(--dark);">Amount: <span><?php if (isset($amount)) echo $amount; ?></span></h5>
                    <h5 style="color:var(--dark);">Payment Date: <span><?php if (isset($pdate)) echo $pdate; ?></span></h5>
                    <div class="button">
                        <form method="post">
                            <input type="submit" value="Accept" name="accept">
                            <input type="submit" value="Deny" name="deny">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </header>
    <form method="post">
        <input type="submit" value="Delete All Payment Information of Previous Semester" name="reset" class="btn cf"></input>
    </form>
</body>

</html>