-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 06:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `image`, `price`, `stock`, `description`, `image_url`, `created_at`) VALUES
(1, 'iPhone 15', 'Smartphone', NULL, 42900.00, 10, 'Apple smartphone รุ่นใหม่ล่าสุด', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(2, 'Samsung Galaxy S24', 'Smartphone', NULL, 37900.00, 15, 'สมาร์ทโฟนจาก Samsung', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(3, 'MacBook Air M3', 'Laptop', NULL, 48900.00, 5, 'โน้ตบุ๊กบางเบา ใช้ชิป M3', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(4, 'ASUS TUF Gaming F15', 'Laptop', NULL, 29900.00, 8, 'โน้ตบุ๊กเกมมิ่งแรงๆ จาก ASUS', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(5, 'Logitech MX Master 3S', 'Accessory', NULL, 2990.00, 25, 'เมาส์ไร้สายระดับโปร', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(6, 'Razer BlackWidow V4', 'Keyboard', NULL, 5990.00, 12, 'คีย์บอร์ด Mechanical สำหรับเกมเมอร์', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(7, 'Sony WH-1000XM5', 'Headphone', NULL, 12900.00, 6, 'หูฟังตัดเสียงรบกวนรุ่นใหม่', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(8, 'AirPods Pro 2', 'Earphone', NULL, 9990.00, 9, 'หูฟังไร้สายจาก Apple', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(9, 'GoPro Hero 12', 'Camera', NULL, 15900.00, 4, 'กล้อง Action Cam รุ่นใหม่', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(10, 'Canon EOS R10', 'Camera', NULL, 33900.00, 3, 'กล้อง Mirrorless คุณภาพสูง', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(11, 'Apple Watch Series 10', 'Smartwatch', NULL, 16900.00, 7, 'สมาร์ทวอทช์รุ่นล่าสุดจาก Apple', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(12, 'Samsung Galaxy Watch 7', 'Smartwatch', NULL, 12900.00, 8, 'นาฬิกาอัจฉริยะจาก Samsung', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(13, 'Kingston SSD 1TB', 'Storage', NULL, 1990.00, 20, 'SSD ความเร็วสูง 1TB', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(14, 'Seagate External HDD 2TB', 'Storage', NULL, 2590.00, 15, 'ฮาร์ดดิสก์พกพา 2TB', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(15, 'Apple Pencil 2', 'Accessory', NULL, 4590.00, 10, 'ปากกา Stylus สำหรับ iPad', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(16, 'Anker PowerCore 10000', 'Powerbank', NULL, 1290.00, 18, 'พาวเวอร์แบงค์พกพา 10000mAh', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(17, 'Dell Monitor 27”', 'Monitor', NULL, 6990.00, 5, 'หน้าจอขนาด 27 นิ้ว Full HD', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(18, 'HP Printer DeskJet 2330', 'Printer', NULL, 1990.00, 6, 'เครื่องพิมพ์ราคาประหยัด', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(19, 'TP-Link Router AX1800', 'Networking', NULL, 2290.00, 10, 'เราเตอร์ WiFi 6 ความเร็วสูง', 'https://via.placeholder.com/150', '2025-09-29 02:53:41'),
(20, 'Xiaomi Smart Bulb', 'SmartHome', NULL, 590.00, 30, 'หลอดไฟอัจฉริยะควบคุมผ่านแอป', 'https://via.placeholder.com/150', '2025-09-29 02:53:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
