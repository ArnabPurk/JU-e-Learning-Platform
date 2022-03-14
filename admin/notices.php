<!DOCTYPE html>
<html lang="en">

<head>
    <?php
    $con = mysqli_connect("localhost", "ourproje_group6", "LJ83tpPZRM3hrH4", "ourproje_e_learning");
    include("functions.php");
    $dow = check_login($con);
    $adminid = $dow['admin_id'];
    $sql = "select *from notices";
    $res = mysqli_query($con, $sql);
    $n = 0;
    $v = 0;
    while ($row = mysqli_fetch_assoc($res)) {
        $noticeid[$n] = $row['notice_id'];
        $headline[$n] = $row['headline'];
        $date[$n] = $row['date'];
        $noticefile[$n] = $row['noticefile'];
        $description[$n] = nl2br($row['description']);
        $n++;
    }
    if (isset($_POST['submit'])) {

        if (!empty($_FILES["file"]["name"])) {
            $file = $_FILES["file"]["name"];
            $folder = "NotifcesAnnouncementsFiles/" . $file;
            $tempname = $_FILES["file"]["tmp_name"];
        }

        $headline = $_POST['headline'];
        $description = $_POST['description'];
        date_default_timezone_set('Asia/Dhaka');
        $date = date('Y-m-d');
        $noticeid = date('Ymdhis');

        $sql = "INSERT INTO `notices`(`notice_id`,`headline`, `description`, `date`, `noticefile`,`admin_id`) VALUES ('$noticeid','$headline','$description','$date','" . $folder . "','$adminid')";
        mysqli_query($con, $sql);

        move_uploaded_file($tempname, $folder);
        echo "<script>location.href = 'notices.php';</script>";
        //header("Location: notices.php");
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
    <link rel="stylesheet" href="../css/notice.css">

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
        </div>
    </header>
    <div class="bodyy">
        <div class="containerr">
            <form action="notices.php" method="post" enctype="multipart/form-data">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details"> Headline</span>
                        <input type="text" id="headline" name="headline" required>
                    </div>
                    <div class="input-box">
                        <span class="details">Attach a file (if any)</span>
                        <input class="upload" type="file" name="file">
                    </div>
                    <div class="input-box">
                        <span class="details"> Details</span>
                        <textarea id="w3review" name="description" rows="10" cols="50" required></textarea>
                    </div>
                </div>
                <div class="button">
                    <input type="submit" value="Submit" name="submit">
                </div>
            </form>
            <div class="buttonn" style="margin-top:-2.2rem;">
                <button onclick="myfunction()">Show Notices</button>
            </div>
            <div class="closse" id="no">
                <div class="title" style="margin-bottom:1.5rem;">
                    Notices
                </div>
                <section id="blog" class="blog">
                    <div class="container" style="margin-top:2rem;">
                        <div class="card-wrapper">
                            <?php for ($i = 0; $i < $n; $i++) { ?>
                                <div class="card tilt">
                                    <div class="img-wrapper">
                                        <img src="../dbfiles/notice.jpg" alt="">
                                    </div>
                                    <div class="card-content">
                                        <a href="Noticedetails.php?notice_id=<?php if (isset($noticeid[$i])) echo $noticeid[$i]; ?>">
                                            <h1><?php if (isset($headline[$i])) echo $headline[$i]; ?></h1>
                                        </a>
                                        <span><?php if (isset($date[$i])) echo $date[$i]; ?></span>
                                        <p><?php if (isset($description[$i])) echo $description[$i]; ?></p>
                                    </div>
                                    <a class="read-more" href="Noticedetails.php?notice_id=<?php if (isset($noticeid[$i])) echo $noticeid[$i]; ?>">Read More...</a>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
    <script>
        VanillaTilt.init(document.querySelectorAll('.tilt'), {
            max: 10
        });

        function myfunction() {
            location.href = '#no';
            document.querySelector(".closse").setAttribute("style", "display:block");
        }
    </script>

</body>

</html>