-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 14, 2022 at 08:28 PM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ourproje_e_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `password`) VALUES
('admin1', 'e00cf25ad42683b3df678c61f42c6bda'),
('admin2', 'c84258e9c39059a89ab77d846ddab909'),
('admin3', '32cacb2f994f6b42183a1300d9a3e8d6');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book` varchar(500) NOT NULL,
  `m_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book`, `m_id`) VALUES
('study_materials/books/12311_Introduction to Algorithms.pdf', 11),
('study_materials/books/12332_lecture-15.pdf', 32),
('study_materials/books/12334_2017-labtest1.pdf', 34),
('study_materials/books/12423_Course OutlLine.pdf', 23),
('study_materials/books/21130_NumericalAnalysis.pdf', 30),
('study_materials/books/21231_C++.pdf', 31);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(11) NOT NULL,
  `credit` float NOT NULL,
  `cname` varchar(300) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `cstatus` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `credit`, `cname`, `semester`, `cstatus`, `u_id`) VALUES
(123, 3, 'Data Structure', '2.1', 45, 147),
(124, 3, 'Algorithm Analysis & Design', '2.2', 83, 147),
(211, 3, 'Numerical Analysis', '2-1', 43, 897),
(212, 3, 'Programming with C++', '2-1', 83, 898);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(200) NOT NULL,
  `faculty_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`, `faculty_name`) VALUES
(1, 'Institute of Information Technology', 'iit'),
(2, 'Department of Computer Science & Engineering ', 'mp'),
(3, 'Department Of Mathematics', 'mp'),
(4, 'Department of Physics', 'mp'),
(5, 'Department of Environmental Science', 'mp'),
(6, 'Department of Statistics', 'mp'),
(7, 'Department of Geological Science', 'mp'),
(8, 'Department of Chemistry', 'mp'),
(9, 'Department of Finance & Banking', 'fbs'),
(10, 'Department of Marketing', 'fbs'),
(11, 'Department of Accounting & Information Systems', 'fbs'),
(12, 'Department of Management Studies', 'fbs'),
(13, 'Department of Economics', 'ss'),
(14, 'Department of Urban & Regional Planning', 'ss'),
(15, 'Department of Anthropology', 'ss'),
(16, 'Department of Geography & Environment', 'ss'),
(17, 'Department of Government & Politics', 'ss'),
(18, 'Department of Public Administration', 'ss');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `u_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`u_id`, `c_id`) VALUES
(0, 123),
(0, 124),
(1111, 123),
(1111, 124),
(1964, 123),
(1964, 124),
(1964, 211),
(1964, 212),
(1970, 123),
(2001, 123),
(2001, 124),
(2002, 124),
(2010, 124),
(2017, 123),
(2017, 124),
(2017, 212);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `etime` varchar(50) NOT NULL,
  `edate` date NOT NULL,
  `file` varchar(500) DEFAULT NULL,
  `grade` float NOT NULL,
  `e_id` int(11) NOT NULL,
  `e_details` varchar(5000) NOT NULL,
  `e_title` varchar(500) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`etime`, `edate`, `file`, `grade`, `e_id`, `e_details`, `e_title`, `c_id`) VALUES
('21:41:00', '2022-01-29', 'exam_materials/12320220129074410_DS Exam-1.pdf', 100, 6, 'Do not copy from others. ', 'Quiz-1', 123),
('19:54:00', '2022-01-30', 'exam_materials/12420220129075057_Algo_pre_ques.pdf', 100, 7, 'Dear Student, Please give that exam on time.', 'Quiz-3', 124),
('23:59:00', '2022-01-31', 'exam_materials/21120220129100543_1 (2).pdf', 100, 8, 'Use your roll number as the name of the file.', 'Lab 01', 211);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` varchar(500) NOT NULL,
  `headline` varchar(500) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `noticefile` varchar(500) DEFAULT NULL,
  `admin_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `headline`, `description`, `date`, `noticefile`, `admin_id`) VALUES
('20220125040649', 'Why we should use java?', 'Java was designed to be easy to use and is therefore easy to write, compile, debug, and learn than other programming languages. Java is object-oriented. ... Java is platform-independent. One of the most significant advantages of Java is its ability to move easily from one computer system to another.', '2022-01-25', '', 'admin1'),
('20220125040924', 'Normalisation', 'Normalization or normalisation refers to a process that makes something more normal or regular. Most commonly it refers to: Normalization (sociology) or social normalization, the process through which ideas and behaviors that may fall outside of social norms come to be regarded as \"normal\"', '2022-01-25', 'NotifcesAnnouncementsFiles/2001-LabTest-02.pdf', 'admin2'),
('20220125114837', 'JU e-learning platform launched', 'Today we launched our group 6 project ju e-learning platform.\r\nhope for the best.', '2022-01-25', '', 'admin2'),
('20220126013255', 'Press note on IIT establishment day program, 2022', 'Date: January 2, 2022\r\nAn internship is a professional learning experience that offers meaningful, practical work related to a\r\nstudentâ€™s field of study or career interest. An internship gives a student the opportunity for career\r\nexploration and development, and to learn new skills. It offers the employer the opportunity to bring\r\nnew ideas and energy into the workplace, develop talent and potentially build a pipeline for future fulltime employees. In this aspect, the Institute of Information Technology, Jahangirnagar University, and\r\nseven industry partners have taken their first step in the endeavor to create an â€œIndustry-Academia\r\npartnershipâ€. Here both parties are declaring their intention to create an innovative education\r\necosystem in IIT-JU by exchanging expertise and student internship. Moreover, this collaborative\r\nindustry-academia also aims to combine IIT-JU expertise with industries to build a joint research group\r\nthat will create an open forum for all students of JU.\r\nHonâ€™ble Vice-Chancellor of JU, Professor Dr. Farzana Islam precedes the program on the occasion of\r\n12th anniversary of the IIT-JU establishment. IIT-JU organized a â€œMeet the Industry leadersâ€ program\r\non that occasion, where Ariful Islam Opu, CEO, e-soft, and ex. Director of BASIS, Kaicom solutions\r\nChairman and CEO Anjan das, President of Datasoft ltd M Manjur Mahmud, Mir Monuwar Iqbal,\r\nFounder & CEO, Pridesys IT, Ershadul Hoque, Founder & CEO, Riseup Labs, Raisul Kabir, Founder\r\n& CEO, Brain Station 23, Md. Saddam Hossain, DGM, Synesis IT were present to share their views\r\nand express industry needs.\r\nFor more about the events, please visit https://www.juniv.edu/institute/iit', '2022-01-26', '', 'admin3'),
('20220126013440', 'Press note on IIT establishment day program, 2022', 'Press  note', '2022-01-26', 'NotifcesAnnouncementsFiles/12943.pdf', 'admin1'),
('20220126030651', 'Hello, This notice is from admin-2', 'Hello, This is Admin-2', '2022-01-26', '', 'admin2'),
('20220314051550', 'JU offline class notice', 'All classes will be held on offline from  15.3.2022', '2022-03-14', 'NotifcesAnnouncementsFiles/13114.pdf', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `t_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `pdate` date NOT NULL,
  `semester` varchar(10) NOT NULL,
  `pstatus` varchar(10) DEFAULT NULL,
  `u_id` int(11) NOT NULL,
  `admin_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`t_id`, `amount`, `pdate`, `semester`, `pstatus`, `u_id`, `admin_id`) VALUES
(0, 100000, '2022-01-31', '4', 'yes', 0, 'admin1'),
(9, 1314, '2022-01-25', '2-2', 'yes', 1964, 'admin1'),
(1111, 1, '2022-01-25', '2nd', 'yes', 1970, 'admin1'),
(123456, 1000, '2022-01-25', '2.2', 'yes', 2017, 'admin1'),
(123789, 500, '2022-01-29', '2.1', 'yes', 2001, 'admin1'),
(2345566, 55599, '2022-01-25', '2.2', 'yes', 2014, 'admin3'),
(2147483647, 10000, '2022-03-14', '2-2', 'yes', 2010, 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `p_id` int(11) NOT NULL,
  `post` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`p_id`, `post`, `date`, `c_id`) VALUES
(1, 'Notice:\r\nYour Lab Test will be held on Monday (17th Jan 2022) in online.\r\nSyllabus : Greedy methods and Dynamic Programming', '2022-01-29', 123),
(2, 'Notice:\r\nClass Test 1:\r\nDate: 1/12/2021 (Wednesday)\r\nSyllabus: Lecture slide 1 to 5\r\n', '2022-01-29', 123),
(3, 'salam.\r\nwelcome to algorithm analysis class.\r\nclass link for next 3 weeks on every Monday and Wednesday at 10:00 am.\r\nhttps://bdren.zoom.us/j/69874028026', '2022-01-29', 123),
(4, 'salam.\r\nwelcome to algorithm analysis class.\r\nclass link for next 3 weeks on every Monday and Wednesday at 10:00 am.\r\nhttps://bdren.zoom.us/j/69874028026', '2022-01-29', 124),
(5, 'Date: 1st Nov 2021\r\nLink: \r\nhttps://bdren.zoom.us/j/66943504303', '2022-01-29', 124),
(6, 'Date : 26th Jan 2022\r\nhttps://bdren.zoom.us/j/64795253330\r\n\r\n\r\n\r\nPresentation of last 3 groups will be held from 10 am.\r\nAfter Presentation, quiz will be started', '2022-01-29', 124),
(7, 'Hello students best of luck for your exams', '2022-03-05', 123),
(8, 'hello  best of luck for exams again', '2022-03-09', 123),
(9, 'Hello post', '2022-03-13', 123),
(10, 'Hello', '2022-03-13', 124),
(11, 'Hi dear student.', '2022-03-13', 124),
(12, 'tomorrow lab final exam will be held', '2022-03-14', 124);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `video` varchar(500) NOT NULL,
  `m_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`video`, `m_id`) VALUES
('study_materials/records/12424_2021-10-04 10-10-30.mkv', 24);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `slide` varchar(500) NOT NULL,
  `m_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`slide`, `m_id`) VALUES
('study_materials/slides/12340_Algorithm_Lecture 6.pptx', 40),
('study_materials/slides/12341_Algorithm_Lecture 7.pptx', 41),
('study_materials/slides/12342_Algorithm_Lecture 8.pptx', 42),
('study_materials/slides/12435_Algorithm_lecture 1.pptx', 35),
('study_materials/slides/12436_Algorithm_Lecture 2.pptx', 36),
('study_materials/slides/12437_Algorithm_Lecture 3.pptx', 37),
('study_materials/slides/12438_Algorithm_Lecture 4.pptx', 38),
('study_materials/slides/12439_Algorithm_Lecture 5.pptx', 39);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `u_id` int(11) NOT NULL,
  `skills` varchar(500) DEFAULT NULL,
  `hall` varchar(200) DEFAULT NULL,
  `cg` varchar(100) DEFAULT NULL,
  `semester` varchar(30) DEFAULT NULL,
  `batch` varchar(100) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`u_id`, `skills`, `hall`, `cg`, `semester`, `batch`, `dept_id`) VALUES
(0, 'C++', 'Sheikh Hasina Hall', '3.58', '4', '48', 1),
(1031, 'Capable of everything', 'Girls hostel', '4', 'Jani na', '12', 2),
(1111, 'none', 'SSB', '3.89', '3', '49', 1),
(1964, 'C++', 'Sheikh Hasina Hall ', '3.78', '2-2', '48', 1),
(1970, 'Programming', 'Sheikh Hasina Hall', '3.59', '2nd', '48', 1),
(1979, NULL, NULL, NULL, NULL, NULL, NULL),
(1999, 'DBMS', 'Mowlana Bhasani', '3.74', '2', '48', 1),
(2001, '', 'Shaheed Salam Barkat', '3.00', '', '48', 1),
(2002, 'Node Js', 'Shaheed Salam Barkat Hall', '3.32', '2-2', '48', 1),
(2007, 'none', 'MBH', '4.5', '4th', '48', 1),
(2010, 'Study', 'MMH Hall', '2.5', '2-2', '48', 1),
(2014, 'C++, python', 'BBH', '4', '2.2', '48', 1),
(2017, 'mysql', 'Shaheed Rafiq Jabbar Hall', '3', '2.2', '48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--

CREATE TABLE `study_material` (
  `m_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`m_id`, `u_id`, `c_id`) VALUES
(11, 147, 123),
(23, 147, 124),
(24, 147, 124),
(30, 897, 211),
(31, 898, 212),
(32, 147, 123),
(34, 147, 123),
(35, 147, 124),
(36, 147, 124),
(37, 147, 124),
(38, 147, 124),
(39, 147, 124),
(40, 147, 123),
(41, 147, 123),
(42, 147, 123);

-- --------------------------------------------------------

--
-- Table structure for table `takes_part`
--

CREATE TABLE `takes_part` (
  `u_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `sgrade` float DEFAULT NULL,
  `ftime` time DEFAULT NULL,
  `fdate` date DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takes_part`
--

INSERT INTO `takes_part` (`u_id`, `e_id`, `sgrade`, `ftime`, `fdate`, `file`) VALUES
(1111, 6, 20, '15:09:00', '2022-02-06', 'exam_materials/student/12362022-01-29_HarryPotter.themepack'),
(2017, 6, 20, '21:55:00', '2022-03-05', 'exam_materials/student/12362022-01-29_Course Outline (ICT-2207 MBH).pdf');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `u_id` int(11) NOT NULL,
  `rinterest` varchar(500) DEFAULT NULL,
  `designition` varchar(50) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`u_id`, `rinterest`, `designition`, `dept_id`) VALUES
(147, 'Machine Learning, AI', 'Professor', 1),
(897, 'Data Analytics, Machine Learning', 'Professor', 1),
(898, 'Big Data, Machine Learning', 'Professor', 1),
(899, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `district` varchar(100) DEFAULT NULL,
  `house_no` varchar(100) DEFAULT NULL,
  `thana` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bg` varchar(10) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `id_type` varchar(15) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dp` varchar(500) NOT NULL,
  `id_image` varchar(500) NOT NULL,
  `ustat` varchar(500) NOT NULL,
  `token` varchar(500) NOT NULL,
  `admin_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `email`, `fname`, `lname`, `password`, `district`, `house_no`, `thana`, `phone`, `bg`, `status`, `id_type`, `gender`, `dob`, `dp`, `id_image`, `ustat`, `token`, `admin_id`) VALUES
(0, 'mayesha.stu2018@juniv.edu', 'Mayesha', 'Sadia', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '5/6', 'Savar', '01953663776', 'O+', 'yes', 'Student', 'Female', '2000-12-13', 'dbfiles/Mayesha_dp3a75f49c943ef907c25e31c8204b2c.jpg', 'dbfiles/Mayesha_idphoto3a75f49c943ef907c25e31c8204b2c.jpeg', 'active', '2000-12-13Mayesha+880195366377620220131072614', 'admin1'),
(147, 'drmoha@temporary-mail.net', 'Dr. Mohammad Abu', 'Yousuf', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '895', 'Dhaka', '01304963440', 'A+', 'yes', 'Teacher', 'Male', '1962-06-12', 'dbfiles/147_dpba5222e4cb21f67118b93e585a8a16.jpeg', 'dbfiles/147_idphoto94a513a4d947602ffc8b2596db767a.jpg', 'active', '1962-06-121470172569874520220129073055', 'admin1'),
(369, 'zb484_fz@temporary-mail.net', 'Kathy', 'miller', '202cb962ac59075b964b07152d234b70', 'Natore', '2568', 'Baraigram', '0172345698', 'A', 'yes', 'Student', 'Male', '2022-01-07', 'dbfiles/369_dpc01ab03d50eb5e001d43c2fb6e88b0.png', 'dbfiles/369_idphotoc01ab03d50eb5e001d43c2fb6e88b0.jpg', 'active', '2022-01-07369017234569820220128021119', 'admin1'),
(897, 'hekod70704@peykesabz.com', 'M Shamim', 'Kaiser', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '12', 'Jigatola', '0141000035', 'O(+)ve', 'yes', 'Teacher', 'Male', '1985-01-01', 'dbfiles/897_dpc9e66aa8d03317fb20720813d3b62d.jpg', 'dbfiles/897_idphotoc9e66aa8d03317fb20720813d3b62d.jpg', 'active', '1985-01-01897014100003520220129092427', 'admin1'),
(898, 'hekod70704@peykesabz.com', 'Fazlul Karim', 'Patwary', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '1', 'Savar', '01310000113', 'A(+)ve', 'yes', 'Teacher', 'Male', '1975-04-01', 'dbfiles/898_dp01e4c673f8a9c91b3be5e82ed3f27c.jpeg', 'dbfiles/898_idphoto01e4c673f8a9c91b3be5e82ed3f27c.jpg', 'active', '1975-04-018980131000011320220129092614', 'admin1'),
(899, 'hekod70704@peykesabz.com', 'Jesmin', 'Akhter', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '20', 'Badda', '01900001121', 'AB(+)ve', 'yes', 'Teacher', 'Female', '1977-12-01', 'dbfiles/899_dp0bcce3960659c9e47f0e850995f7b2.jfif', 'dbfiles/899_idphoto0bcce3960659c9e47f0e850995f7b2.jfif', 'active', '1977-12-018990190000112120220129092720', 'admin1'),
(1031, 'sumuptityy1988@gmail.com', 'Sumaiya', 'Prityy', '9053c15c9251c0f73638d1fc5c914aad', 'Dhaka', '29/5', 'Sabujbag', '01987097564', 'AB+', 'yes', 'Student', 'Female', '1999-05-23', 'dbfiles/1031_dp74eb7eddfa6e3e7094fadfffbce804.jpeg', 'dbfiles/1031_idphoto74eb7eddfa6e3e7094fadfffbce804.jpeg', 'active', '1999-05-2310310198709756420220128022432', 'admin1'),
(1111, 'shaudhorakhibulhasan@gmail.com', 'A', 'B', '81dc9bdb52d04dc20036dbd8313ed055', 'xyz', 'xyz#2', 'xyz', '01720688056', 'o+', 'yes', 'Student', 'Male', '2002-03-22', 'dbfiles/1111_dp6608ff16ad2442e42f413574fe7105.jpg', 'dbfiles/1111_idphoto6608ff16ad2442e42f413574fe7105.jpg', 'active', '2002-03-2211110172068805620220206025024', 'admin2'),
(1964, 'zarinteresa11@gmail.com', 'Zarin', 'Teresa', 'c465eab6495a43d2ec0c238250ea4c0e', 'Dhaka', '8', 'Mirpur', '01317047164', 'A(+)ve', 'yes', 'Student', 'Female', '2000-06-11', 'dbfiles/1964_dpab83084eb103a3c4916ab7935c41ac.jpg', 'dbfiles/1964_idphotoab83084eb103a3c4916ab7935c41ac.jpg', 'active', '2000-06-1119640131704716420220125022530', 'admin2'),
(1970, 'tamim.stu20183@juniv.edu', 'Zannat Hossain', 'Tamim', '8e7f86260c88346052cadd7d68514184', 'Patuakhali', '411', 'Patuakhali', '01791594313', 'A+', 'yes', 'Student', 'Female', '1999-08-31', 'dbfiles/1970_dp55e4d35aee8c5381d23c65db26201d.jpg', 'dbfiles/1970_idphoto55e4d35aee8c5381d23c65db26201d.jpg', 'active', '1999-08-3119700179159431320220125035249', 'admin2'),
(1979, 'sithee.stu2018@juniv.edu', 'Barnita', 'Sithee', '1e48c4420b7073bc11916c6c1de226bb', 'Dhaka', '87/c, east rajabazar,Sher e bangla nagar, dhaka', 'Sher e bangla nagar', '01713525222', 'A-', 'yes', 'Student', 'Female', '2001-07-27', 'dbfiles/1979_dpcedeb592d9379bf79a0be4e114b1ac.jpg', 'dbfiles/1979_idphotocedeb592d9379bf79a0be4e114b1ac.jpg', 'active', '2001-07-2719790171352522220220130121045', 'admin1'),
(1999, 'farabiiit2018@gmail.com', 'Md.Farabi', 'Hasan', '81dc9bdb52d04dc20036dbd8313ed055', 'zaqwsc', '14', 'zxcvbnm', '01478523691', 'O+', 'yes', 'Student', 'Male', '2022-01-25', 'dbfiles/1999_dpf96c688a141ee6fcd1e39956267bec.jpg', 'dbfiles/1999_idphotof96c688a141ee6fcd1e39956267bec.jpg', 'active', '2022-01-2519990147852369120220125101311', 'admin1'),
(2001, 'shawoniitju@gmail.com', 'Md. Bokhtiar Nadeem', 'Shawon', '81dc9bdb52d04dc20036dbd8313ed055', 'Natore', '123456', 'Baraigram', '01768503891', 'B+', 'yes', 'Student', 'Male', '2000-07-06', 'dbfiles/2001_dp0a90d29be26cef9d82d07de704ea3f.jpg', 'dbfiles/2001_idphoto0a90d29be26cef9d82d07de704ea3f.jpg', 'active', '2000-07-0620010176850389120220129093725', 'admin1'),
(2002, 'eyenine11@gmail.com', 'MD Zuleyenine', 'Ibne Noman', '5d41402abc4b2a76b9719d911017c592', 'Dhaka', '42/1,Middle Paikpara', 'Mirpur-1', '01959536493', 'B+', 'yes', 'Student', 'Male', '1999-11-11', 'dbfiles/2002_dp8dca44de60798484652bf469db49b8.jpg', 'dbfiles/2002_idphoto8dca44de60798484652bf469db49b8.jpg', 'active', '1999-11-1120020195953649320220314054533', 'admin1'),
(2007, 'niloysamiun91@gmail.com', 'samiun', 'Islam', '81dc9bdb52d04dc20036dbd8313ed055', 'Narail', '11', 'lohagara', '01628333434', 'A+', 'yes', 'Student', 'Male', '1999-01-14', 'dbfiles/2007_dpcddf7b7035ad67a86eb054decfe3d5.jpg', 'dbfiles/2007_idphotocddf7b7035ad67a86eb054decfe3d5.jpg', 'active', '1999-01-1420070162833343420220125105936', 'admin1'),
(2010, 'akmolmasud5@gmail.com', 'Akmol Masud', 'Ayon', '9f83a911f5ce38b632ef8a031d60acc6', 'Manikganj ', '1234', 'singair', '01304963440', 'B+ve', 'yes', 'Student', 'Male', '2000-05-19', 'dbfiles/2010_dpc2fe648af7676f0a4c9e3290f70a07.jpg', 'dbfiles/2010_idphotoc2fe648af7676f0a4c9e3290f70a07.jpg', 'active', '2000-05-1920100130496344020220314070854', 'admin1'),
(2014, 'mahfidantor98@gmail.com', 'Sayd Mahfid ', 'Rahman', '81dc9bdb52d04dc20036dbd8313ed055', 'Dhaka', '25', 'savar', '01706210803', 'O+', 'yes', 'Student', 'Male', '2022-01-25', 'dbfiles/2014_dp2b8f62b78dd013cd0654f9f9228058.jpg', 'dbfiles/2014_idphoto0544588688661e093fff30ab86e8c5.jfif', 'active', '2022-01-2520140170621080320220125020429', 'admin3'),
(2017, 'arnabpurk@gmail.com', 'Arnab', 'Purk', '81dc9bdb52d04dc20036dbd8313ed055', 'Brahmanbaria', '1', 'sarail', '01798072145', 'o+', 'yes', 'Student', 'Male', '1999-07-03', 'dbfiles/2017_dp8bcfa3409958a317761decfcfe1632.jpg', 'dbfiles/2017_idphoto.jpg', 'active', '1999-07-0320170188597752920220125123245', 'admin1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book`,`m_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`u_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`e_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`video`,`m_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slide`,`m_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `study_material`
--
ALTER TABLE `study_material`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `takes_part`
--
ALTER TABLE `takes_part`
  ADD PRIMARY KEY (`u_id`,`e_id`),
  ADD KEY `e_id` (`e_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `study_material` (`m_id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `teacher` (`u_id`);

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `student` (`u_id`),
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `student` (`u_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `study_material` (`m_id`);

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `study_material` (`m_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`);

--
-- Constraints for table `study_material`
--
ALTER TABLE `study_material`
  ADD CONSTRAINT `study_material_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `teacher` (`u_id`),
  ADD CONSTRAINT `study_material_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);

--
-- Constraints for table `takes_part`
--
ALTER TABLE `takes_part`
  ADD CONSTRAINT `takes_part_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `student` (`u_id`),
  ADD CONSTRAINT `takes_part_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `exam` (`e_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
