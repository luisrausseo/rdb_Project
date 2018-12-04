-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2018 at 01:44 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rdb`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `above_average_cost`
-- (See below for the actual view)
--
CREATE TABLE `above_average_cost` (
`FoodName` varchar(45)
,`Price` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `above_average_wage`
-- (See below for the actual view)
--
CREATE TABLE `above_average_wage` (
`EmployeeID` int(11)
,`FirstName` varchar(20)
,`LastName` varchar(20)
,`SSN` varchar(11)
,`Address` varchar(50)
,`Wage` float
,`Position` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `after_employee_updates`
--

CREATE TABLE `after_employee_updates` (
  `id` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `Wage` float NOT NULL,
  `Position` varchar(50) COLLATE utf8_bin NOT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `after_employee_updates`
--

INSERT INTO `after_employee_updates` (`id`, `EmployeeID`, `Wage`, `Position`, `changedate`, `action`) VALUES
(1, 19, 15, 'cook', '2018-12-02 18:59:02', 'update'),
(2, 20, 13, 'cook', '2018-12-02 18:59:02', 'update'),
(3, 21, 16, 'cook', '2018-12-02 18:59:02', 'update'),
(4, 19, 16.82, 'cook', '2018-12-02 19:05:51', 'update'),
(5, 20, 14.92, 'cook', '2018-12-02 19:05:51', 'update'),
(6, 21, 17.17, 'cook', '2018-12-02 19:05:51', 'update'),
(7, 8, 10.5, 'server', '2018-12-02 19:30:44', 'update');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(20) COLLATE utf8_bin NOT NULL,
  `LastName` varchar(20) COLLATE utf8_bin NOT NULL,
  `PhoneNumber` varchar(12) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `PhoneNumber`) VALUES
(1, 'Wilburt', 'Ferroni', '334-165-6535'),
(2, 'Giff', 'Towl', '851-143-4762'),
(3, 'Welsh', 'Hamblett', '267-771-9177'),
(4, 'Cecilia', 'Carslake', '783-572-1824'),
(5, 'Lucina', 'Grigorkin', '736-787-8665'),
(6, 'Barn', 'Eringey', '488-816-5687'),
(7, 'Lacy', 'Venmore', '368-953-5146'),
(8, 'Thacher', 'Wyley', '189-457-8747'),
(9, 'Kerwinn', 'Von Welldun', '567-550-7985'),
(10, 'Augy', 'Blewitt', '116-962-1275'),
(11, 'Gifford', 'Mawby', '390-772-6244'),
(12, 'Raddy', 'Muehle', '977-845-2282'),
(13, 'Gibbie', 'Fydoe', '217-287-9110'),
(14, 'Waly', 'Lamborn', '289-335-6811'),
(15, 'Goddard', 'Biford', '747-396-0904'),
(16, 'Rhys', 'Lowdiane', '866-720-3329'),
(17, 'Dion', 'Martini', '731-888-2794'),
(18, 'Tove', 'Papaminas', '346-127-0130'),
(19, 'Onofredo', 'Ouldcott', '725-222-3643'),
(20, 'Ripley', 'Ramiro', '715-586-8583'),
(21, 'Chandra', 'Du Hamel', '825-984-1760'),
(22, 'Ted', 'Locket', '625-425-8615'),
(23, 'Wes', 'Markl', '558-403-5133'),
(24, 'Averill', 'Drews', '423-704-4864'),
(25, 'Christalle', 'Simyson', '771-880-2824'),
(26, 'Stacee', 'Childerley', '703-399-3424'),
(27, 'North', 'Alans', '641-447-4815'),
(28, 'Lanie', 'Frankis', '955-435-5470'),
(29, 'Renado', 'Ianinotti', '623-718-8046'),
(30, 'Shalne', 'Parbrook', '178-342-1765'),
(31, 'Inger', 'Quarless', '491-428-5286'),
(32, 'Timoteo', 'Ivchenko', '616-595-0875'),
(33, 'Freddy', 'Milligan', '607-827-1719'),
(34, 'Betsy', 'O\'Doogan', '235-215-7879'),
(35, 'Sula', 'Magill', '678-625-5445'),
(36, 'Genevieve', 'Palomba', '180-384-1463'),
(37, 'Bartlet', 'Akam', '836-106-8093'),
(38, 'Nathanael', 'Wyllcock', '246-848-6516'),
(39, 'Barbi', 'Motherwell', '613-550-2395'),
(40, 'Meridel', 'Treadgear', '248-221-9446'),
(41, 'Brina', 'Vicker', '965-526-5061'),
(42, 'Ervin', 'Tysall', '706-217-8744'),
(43, 'Clary', 'Hanshaw', '589-775-9971'),
(44, 'Kissiah', 'Wickendon', '630-177-1911'),
(45, 'Rriocard', 'Penson', '328-486-6062'),
(46, 'Beryle', 'Critten', '983-369-1856'),
(47, 'Hinze', 'Tittershill', '271-724-4241'),
(48, 'Mata', 'Skewis', '602-433-2252'),
(49, 'Nerty', 'Bartosinski', '872-451-9354'),
(50, 'Tobias', 'Priestnall', '401-400-4212'),
(51, 'Luis', 'Rausseo', '786-916-7070'),
(56, 'Luis', 'Rausseo', '786-916-5005'),
(58, 'Karen', 'Bermudez', '786-916-5050'),
(62, 'Dakota', 'Rausseo', '956-215-5768'),
(63, 'Zarka', 'McClung', '4699191092'),
(64, 'Dana ', 'Pante', '565656'),
(65, 'Jared', 'Brick', '111-111-1111'),
(66, 'Luis', 'Rausseo Gonzalez', '7869167070');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(20) COLLATE utf8_bin NOT NULL,
  `LastName` varchar(20) COLLATE utf8_bin NOT NULL,
  `SSN` varchar(11) COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) COLLATE utf8_bin NOT NULL,
  `Wage` float NOT NULL,
  `Position` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `SSN`, `Address`, `Wage`, `Position`) VALUES
(1, 'Elsie', 'Gravatt', '872-37-6318', '0609 Grim Alley', 10, 'host'),
(2, 'Locke', 'Biskupiak', '514-98-7129', '5313 Sugar Circle', 13.94, 'host'),
(3, 'Harp', 'Plaskitt', '483-21-0817', '0891 Dawn Drive', 11.56, 'host'),
(4, 'Staci', 'Duffil', '185-85-5614', '610 Talisman Point', 11.48, 'host'),
(5, 'Donavon', 'Drains', '284-14-7891', '8 Atwood Drive', 10, 'server'),
(6, 'Wes', 'McCoveney', '328-79-1287', '9 Welch Place', 11.94, 'server'),
(7, 'Kienan', 'Worcester', '868-76-2091', '0 Shelley Alley', 10, 'server'),
(8, 'Ruddy', 'Calafato', '583-35-6789', '76 Stephen Pass', 10.5, 'server'),
(9, 'Katinka', 'Goodoune', '698-94-5363', '11373 Cherokee Street', 13.09, 'server'),
(10, 'Davy', 'Hew', '183-37-6670', '498 Fremont Avenue', 11, 'server'),
(11, 'Olivia', 'Duffitt', '339-43-6306', '28 Myrtle Junction', 12.88, 'server'),
(12, 'Bourke', 'Troke', '364-63-7223', '99 Lakewood Gardens Trail', 14.64, 'server'),
(13, 'Sherrie', 'Hudd', '265-40-3024', '97455 Buell Drive', 12.16, 'busser'),
(14, 'Tristan', 'Willan', '680-03-4905', '74 Lake View Junction', 12.83, 'busser'),
(15, 'Victoir', 'Morewood', '301-38-7817', '8760 Colorado Avenue', 13.08, 'busser'),
(16, 'Padraic', 'Wharton', '476-35-1648', '85 Barnett Drive', 12.05, 'runner'),
(17, 'Sissy', 'Hoyle', '889-69-2627', '734 Spohn Parkway', 10, 'runner'),
(18, 'Vito', 'Sowood', '319-12-3567', '02 Sloan Plaza', 10, 'bartender'),
(19, 'Willey', 'Dawes', '805-03-0012', '67 Crest Line Point', 16.82, 'cook'),
(20, 'Kris', 'Fruchter', '237-33-0619', '3854 Judy Pass', 14.92, 'cook'),
(21, 'Gil', 'Smethurst', '889-51-3225', '55918 Golden Leaf Trail', 17.17, 'cook'),
(22, 'Dagmar', 'Minghella', '723-23-3893', '41857 Harbort Center', 14.67, 'manager'),
(23, 'Cherlyn', 'Rookledge', '857-91-7456', '9 Utah Point', 10.65, 'administrative'),
(24, 'Heidi', 'Jickells', '665-96-2265', '96861 Fieldstone Junction', 13.83, 'administrative'),
(25, 'Enrique', 'Hebblewhite', '252-28-4616', '796 Brown Parkway', 13.8, 'administrative');

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `after_employee_updates` AFTER UPDATE ON `employees` FOR EACH ROW BEGIN
    INSERT INTO after_employee_updates
    SET action = 'update',
     EmployeeID = OLD.employeeID,
	 Wage = NEW.Wage,
     Position = NEW.Position,   
        changedate = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `FoodID` int(11) NOT NULL,
  `FoodName` varchar(45) COLLATE utf8_bin NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`FoodID`, `FoodName`, `Price`) VALUES
(1, 'Fried Chicken', 8),
(2, 'Fried Chicken Strips', 10.99),
(3, 'Chicken and Waffles', 12.99),
(4, 'Cheeseburger', 10.99),
(5, 'Double Cheeseburger', 15.99),
(6, 'Chicken Burger', 10.99),
(7, 'Pasta (beef/ chicken/ veg)', 15.55),
(8, 'Fried Fish (whole)', 20.99),
(9, 'Fried Rice', 7.99),
(10, 'Mac & Cheese', 4.99),
(11, 'Lassagna', 12.99),
(12, 'House Special Pizza', 13.99),
(13, 'Onion Rings', 6),
(14, 'Tacos (beef/ chicken/ shimp)', 12.99),
(15, 'Burrito (beef/ chicken/ shrimp)', 12.99),
(16, 'Cole Slaw', 5),
(17, 'Chicken \'n Dumplings', 5.99),
(18, 'Chicken Tender Salad', 10),
(19, 'House Salad', 7),
(20, 'Fried Okra', 6.99),
(21, 'Mashed Potatoes (w/gravy)', 5.99),
(22, 'Corn on the Cob', 6),
(23, 'Tap Water', 0),
(24, 'Fountain Drink', 5.99),
(25, 'Bloody Mary', 15.99),
(26, 'Cosmopolitan', 14.99),
(27, 'Margarita', 16.99),
(28, 'Mojito', 14.99),
(29, 'Martini', 15.5),
(30, 'Moscow mule', 16.55);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `FoodID` int(11) NOT NULL,
  `TransactionID` int(10) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`FoodID`, `TransactionID`, `Quantity`) VALUES
(1, 1000002, 3),
(1, 1000014, 2),
(1, 1000028, 2),
(1, 1000031, 3),
(1, 1000033, 2),
(1, 1000051, 2),
(2, 1000006, 2),
(2, 1000007, 4),
(2, 1000013, 3),
(2, 1000025, 3),
(2, 1000041, 2),
(2, 1000045, 3),
(2, 1000049, 4),
(2, 1000051, 2),
(3, 1000009, 1),
(3, 1000033, 1),
(3, 1000044, 3),
(4, 1000021, 5),
(4, 1000022, 4),
(4, 1000032, 5),
(4, 1000037, 4),
(4, 1000047, 3),
(4, 1000051, 3),
(5, 1000004, 1),
(5, 1000009, 2),
(5, 1000015, 2),
(5, 1000020, 3),
(5, 1000025, 2),
(5, 1000031, 1),
(5, 1000047, 2),
(6, 1000011, 3),
(6, 1000015, 3),
(6, 1000027, 3),
(6, 1000029, 3),
(6, 1000039, 1),
(6, 1000040, 2),
(7, 1000011, 1),
(7, 1000017, 2),
(7, 1000023, 1),
(7, 1000029, 1),
(7, 1000038, 3),
(8, 1000003, 3),
(8, 1000006, 3),
(8, 1000010, 3),
(8, 1000011, 1),
(8, 1000013, 2),
(8, 1000021, 2),
(8, 1000043, 2),
(8, 1000045, 1),
(8, 1000046, 1),
(9, 1000001, 1),
(9, 1000012, 1),
(9, 1000014, 2),
(9, 1000019, 2),
(9, 1000036, 2),
(9, 1000050, 3),
(10, 1000027, 2),
(10, 1000033, 2),
(10, 1000047, 4),
(10, 1000053, 2),
(11, 1000008, 3),
(11, 1000051, 1),
(12, 1000007, 2),
(12, 1000009, 3),
(13, 1000005, 1),
(13, 1000014, 2),
(13, 1000023, 1),
(13, 1000026, 3),
(13, 1000030, 3),
(13, 1000046, 2),
(13, 1000048, 3),
(13, 1000053, 1),
(14, 1000007, 3),
(14, 1000010, 3),
(14, 1000038, 3),
(14, 1000050, 3),
(15, 1000016, 2),
(15, 1000028, 1),
(15, 1000037, 1),
(15, 1000052, 1),
(16, 1000034, 2),
(16, 1000037, 3),
(17, 1000001, 2),
(17, 1000034, 1),
(17, 1000042, 2),
(17, 1000046, 3),
(17, 1000048, 1),
(17, 1000052, 1),
(18, 1000018, 1),
(18, 1000020, 3),
(18, 1000029, 1),
(18, 1000035, 3),
(19, 1000004, 1),
(19, 1000008, 1),
(19, 1000013, 1),
(19, 1000026, 1),
(19, 1000028, 2),
(19, 1000035, 2),
(20, 1000003, 3),
(20, 1000012, 3),
(20, 1000026, 1),
(20, 1000044, 3),
(21, 1000025, 2),
(21, 1000030, 3),
(21, 1000036, 1),
(21, 1000042, 2),
(21, 1000044, 1),
(21, 1000049, 1),
(22, 1000006, 1),
(22, 1000019, 2),
(22, 1000035, 2),
(23, 1000018, 5),
(23, 1000024, 4),
(23, 1000027, 4),
(23, 1000039, 5),
(23, 1000040, 5),
(23, 1000042, 4),
(23, 1000051, 3),
(23, 1000052, 2),
(24, 1000019, 2),
(24, 1000022, 1),
(24, 1000040, 2),
(25, 1000002, 3),
(25, 1000004, 4),
(25, 1000005, 4),
(25, 1000017, 3),
(25, 1000020, 3),
(25, 1000023, 4),
(25, 1000030, 2),
(25, 1000049, 4),
(25, 1000050, 4),
(25, 1000052, 2),
(26, 1000003, 1),
(26, 1000008, 1),
(26, 1000016, 1),
(26, 1000024, 3),
(26, 1000051, 1),
(27, 1000001, 1),
(27, 1000015, 2),
(27, 1000038, 3),
(28, 1000010, 3),
(28, 1000018, 1),
(28, 1000031, 3),
(28, 1000034, 1),
(28, 1000036, 3),
(28, 1000039, 1),
(28, 1000041, 1),
(28, 1000043, 1),
(28, 1000048, 1),
(29, 1000022, 3),
(29, 1000032, 2),
(29, 1000045, 1),
(30, 1000005, 2),
(30, 1000024, 2),
(30, 1000032, 2),
(30, 1000043, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Date` datetime NOT NULL,
  `PartySize` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Waiting` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Date`, `PartySize`, `CustomerID`, `Waiting`) VALUES
('2017-11-13 11:44:24', 5, 11, NULL),
('2017-11-28 18:01:36', 5, 36, NULL),
('2017-12-01 10:13:36', 4, 41, NULL),
('2017-12-05 17:51:27', 1, 28, NULL),
('2017-12-20 08:17:58', 4, 44, NULL),
('2017-12-25 15:56:21', 2, 42, NULL),
('2017-12-28 01:50:12', 2, 17, NULL),
('2018-01-07 20:53:38', 2, 28, NULL),
('2018-01-10 01:35:22', 2, 32, NULL),
('2018-01-23 06:36:31', 4, 20, NULL),
('2018-01-24 00:09:43', 1, 33, NULL),
('2018-01-24 18:27:38', 5, 20, NULL),
('2018-01-28 13:42:02', 3, 50, NULL),
('2018-02-01 22:15:25', 3, 39, NULL),
('2018-02-16 20:04:10', 1, 40, NULL),
('2018-02-17 10:48:58', 4, 25, NULL),
('2018-02-28 14:25:54', 4, 47, NULL),
('2018-03-03 00:42:26', 1, 2, NULL),
('2018-03-14 23:31:51', 2, 3, NULL),
('2018-04-06 09:33:26', 2, 18, NULL),
('2018-04-09 01:50:13', 2, 13, NULL),
('2018-04-15 10:13:07', 2, 49, NULL),
('2018-05-02 17:56:13', 1, 11, NULL),
('2018-05-15 02:39:41', 3, 32, NULL),
('2018-05-15 10:13:04', 3, 31, NULL),
('2018-05-16 09:14:42', 5, 29, NULL),
('2018-05-31 02:28:42', 3, 35, NULL),
('2018-06-04 21:08:50', 3, 13, NULL),
('2018-06-07 09:58:23', 1, 23, NULL),
('2018-06-14 03:50:54', 1, 22, NULL),
('2018-06-21 20:42:17', 4, 40, NULL),
('2018-06-27 05:46:01', 2, 5, NULL),
('2018-07-06 06:29:41', 4, 23, NULL),
('2018-07-22 08:49:37', 3, 23, NULL),
('2018-07-22 23:52:37', 5, 47, NULL),
('2018-07-27 22:24:21', 4, 20, NULL),
('2018-08-04 15:42:04', 4, 36, NULL),
('2018-08-19 14:41:01', 1, 23, NULL),
('2018-08-29 12:50:37', 1, 41, NULL),
('2018-09-17 07:40:23', 4, 43, NULL),
('2018-09-26 02:40:17', 4, 4, NULL),
('2018-10-06 21:53:36', 4, 13, NULL),
('2018-10-14 04:15:11', 2, 6, NULL),
('2018-10-23 04:36:47', 4, 43, NULL),
('2018-10-23 21:00:12', 1, 41, NULL),
('2018-10-24 21:45:54', 1, 35, NULL),
('2018-10-27 18:22:45', 3, 10, NULL),
('2018-10-29 22:58:58', 1, 36, NULL),
('2018-11-03 12:51:31', 3, 16, NULL),
('2018-11-03 14:03:04', 5, 37, NULL),
('2018-12-02 00:11:17', 2, 51, 0),
('2018-12-02 00:16:56', 3, 58, 0),
('2018-12-02 16:56:12', 10, 63, 0),
('2018-12-02 16:56:19', 1, 64, 0),
('2018-12-02 17:34:40', 5, 65, 0),
('2018-12-03 17:35:50', 3, 66, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `FoodID` int(11) NOT NULL,
  `QuantityLeft` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`FoodID`, `QuantityLeft`) VALUES
(1, 5),
(2, 5),
(3, 11),
(4, 15),
(5, 17),
(6, 6),
(7, 4),
(8, 5),
(9, 19),
(10, 2),
(11, 4),
(12, 18),
(13, 9),
(14, 18),
(15, 14),
(16, 8),
(17, 17),
(18, 5),
(19, 7),
(20, 17),
(21, 17),
(22, 6),
(23, 12),
(24, 11),
(25, 5),
(26, 4),
(27, 3),
(28, 17),
(29, 20),
(30, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `TableNumber` int(11) NOT NULL,
  `TransactionID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`TableNumber`, `TransactionID`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(10) UNSIGNED NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `PaymentType` text COLLATE utf8_bin,
  `AuthCode` int(11) DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `CustomerID`, `Date`, `Total`, `PaymentType`, `AuthCode`, `EmployeeID`) VALUES
(1000001, 5, '2018-11-06 10:09:00', 126.21, 'maestro', 25274228, 5),
(1000002, 7, '2018-11-01 06:30:00', 153.06, 'jcb', 629049997, 11),
(1000003, 18, '2018-10-17 08:30:00', 185.11, 'jcb', 309839908, 11),
(1000004, 23, '2018-11-06 14:00:00', 177.11, 'jcb', 768309964, 6),
(1000005, 38, '2018-11-19 18:00:00', 223.2, 'laser', 834243771, 10),
(1000006, 46, '2018-11-07 10:20:00', 168.98, 'jcb', 570288042, 11),
(1000007, 19, '2018-11-14 07:30:00', 217.92, 'diners-club-enroute', 773260000, 8),
(1000008, 43, '2018-11-16 09:00:00', 145.65, 'americanexpress', 922392480, 10),
(1000009, 11, '2018-11-17 15:00:00', 195.45, 'visa-electron', 43967570, 12),
(1000010, 5, '2018-11-18 10:00:00', 240.54, 'jcb', 699683632, 9),
(1000011, 2, '2018-11-06 11:00:00', 111.88, 'jcb', 619296071, 6),
(1000012, 41, '2018-11-20 13:00:00', 81.31, 'jcb', 562007624, 9),
(1000013, 49, '2018-11-08 13:00:00', 133.32, 'americanexpress', 391100327, 10),
(1000014, 49, '2018-11-01 13:00:00', 176.74, 'visa', 106208043, 8),
(1000015, 34, '2018-11-23 18:00:00', 147.67, 'jcb', 137469846, 8),
(1000016, 49, '2018-11-19 11:00:00', 118.35, 'jcb', 367591288, 12),
(1000017, 39, '2018-11-16 11:00:00', 126.56, 'diners-club-carte-blanche', 258746108, 8),
(1000018, 43, '2018-11-25 12:00:00', 142.23, 'instapayment', 225529380, 5),
(1000019, 16, '2018-11-15 13:00:00', 188.74, 'maestro', 363544673, 6),
(1000020, 29, '2018-11-23 16:00:00', 217.32, 'diners-club-us-ca', 863109656, 8),
(1000021, 43, '2018-11-06 13:00:00', 161.49, 'switch', 771835601, 5),
(1000022, 1, '2018-11-16 11:00:00', 218.4, 'jcb', 972780399, 6),
(1000023, 16, '2018-11-14 15:00:00', 195.77, 'jcb', 859429639, 8),
(1000024, 43, '2018-11-23 18:00:00', 203.43, 'china-unionpay', 682444998, 9),
(1000025, 25, '2018-11-26 11:00:00', 174.48, 'jcb', 21530252, 11),
(1000026, 12, '2018-11-26 12:00:00', 170.41, 'jcb', 662950692, 5),
(1000027, 23, '2018-11-06 00:00:00', 152.19, 'jcb', 283990578, 7),
(1000028, 45, '2018-11-16 17:00:00', 116.18, 'jcb', 147337964, 7),
(1000029, 25, '2018-11-16 13:00:00', 95.36, 'laser', 647901981, 9),
(1000030, 49, '2018-10-24 14:00:00', 294.6, 'instapayment', 370644678, 11),
(1000031, 40, '2018-10-17 10:00:00', 149.76, 'mastercard', 997820661, 5),
(1000032, 23, '2018-10-23 13:00:00', 228.69, 'jcb', 820645253, 7),
(1000033, 46, '2018-10-14 17:00:00', 94.04, 'jcb', 513645150, 7),
(1000034, 8, '2018-11-19 20:00:00', 98.2, 'jcb', 956354251, 5),
(1000035, 42, '2018-10-23 15:00:00', 179.44, 'jcb', 535932513, 6),
(1000036, 34, '2018-10-30 11:00:00', 154.2, 'jcb', 202423267, 6),
(1000037, 30, '2018-11-13 17:00:00', 164.91, 'jcb', 630164031, 7),
(1000038, 39, '2018-10-25 14:00:00', 193.77, 'jcb', 562429920, 12),
(1000039, 21, '2018-10-08 14:00:00', 144.04, 'jcb', 884675240, 9),
(1000040, 24, '2018-10-26 17:00:00', 189.51, 'mastercard', 207825082, 10),
(1000041, 8, '2018-10-22 17:00:00', 42.52, 'jcb', 947517452, 7),
(1000042, 27, '2018-10-22 00:00:00', 227.34, 'laser', 727249100, 11),
(1000043, 32, '2018-10-23 09:00:00', 134.86, 'jcb', 252367742, 5),
(1000044, 31, '2018-10-24 15:00:00', 205.72, 'switch', 82601788, 8),
(1000045, 20, '2018-10-19 15:00:00', 124.08, 'diners-club-carte-blanche', 112146391, 7),
(1000046, 20, '2018-10-22 15:00:00', 241.7, 'visa-electron', 880239371, 11),
(1000047, 2, '2018-11-28 11:00:00', 153.49, 'jcb', 561152230, 6),
(1000048, 25, '2018-10-21 14:00:00', 192.47, 'jcb', 24369083, 12),
(1000049, 39, '2018-10-31 13:00:00', 239.47, 'bankcard', 794247226, 5),
(1000050, 45, '2018-10-07 12:00:00', 294.06, 'americanexpress', 637678077, 6),
(1000051, 65, '2018-12-02 23:29:22', 107.09, NULL, NULL, 6),
(1000052, 66, '2018-12-03 17:36:23', 55.16, 'maestro', 661548049, 7),
(1000053, 66, '2018-12-03 18:39:51', 17.3, 'cash', 0, 8);

-- --------------------------------------------------------

--
-- Structure for view `above_average_cost`
--
DROP TABLE IF EXISTS `above_average_cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rdbManager`@`%` SQL SECURITY DEFINER VIEW `above_average_cost`  AS  select `menu`.`FoodName` AS `FoodName`,`menu`.`Price` AS `Price` from `menu` where (`menu`.`Price` > (select avg(`menu`.`Price`) from `menu`)) ;

-- --------------------------------------------------------

--
-- Structure for view `above_average_wage`
--
DROP TABLE IF EXISTS `above_average_wage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rdbManager`@`%` SQL SECURITY DEFINER VIEW `above_average_wage`  AS  select `employees`.`EmployeeID` AS `EmployeeID`,`employees`.`FirstName` AS `FirstName`,`employees`.`LastName` AS `LastName`,`employees`.`SSN` AS `SSN`,`employees`.`Address` AS `Address`,`employees`.`Wage` AS `Wage`,`employees`.`Position` AS `Position` from `employees` where (`employees`.`Wage` > (select avg(`employees`.`Wage`) from `employees`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `after_employee_updates`
--
ALTER TABLE `after_employee_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `PhoneNumber` (`PhoneNumber`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`FoodID`,`TransactionID`),
  ADD KEY `fkIdx_142` (`FoodID`),
  ADD KEY `fkIdx_187` (`TransactionID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Date`,`CustomerID`),
  ADD KEY `fkIdx_124` (`CustomerID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`FoodID`),
  ADD KEY `stock_menu` (`FoodID`) USING BTREE;

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`TableNumber`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `trans_customer` (`CustomerID`) USING BTREE,
  ADD KEY `trans_employee` (`EmployeeID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `after_employee_updates`
--
ALTER TABLE `after_employee_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000069;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `BELONGS` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`),
  ADD CONSTRAINT `FROM` FOREIGN KEY (`FoodID`) REFERENCES `menu` (`FoodID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `HAS_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `HAS` FOREIGN KEY (`FoodID`) REFERENCES `menu` (`FoodID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `MAKES` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `MANAGES` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
