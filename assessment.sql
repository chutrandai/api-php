-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2020 lúc 03:55 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `assessment`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `criteria`
--

CREATE TABLE `criteria` (
  `criteria-id` bigint(10) UNSIGNED NOT NULL COMMENT 'id tieu chi',
  `criteria-name` varchar(50) NOT NULL COMMENT 'ten tieu chi',
  `min-score` int(5) NOT NULL COMMENT 'min score',
  `max-score` int(5) NOT NULL COMMENT 'max score'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tieu chi';

--
-- Đang đổ dữ liệu cho bảng `criteria`
--

INSERT INTO `criteria` (`criteria-id`, `criteria-name`, `min-score`, `max-score`) VALUES
(1, 'tieu chi 1', 1, 5),
(2, 'tieu chi 2', 1, 10),
(3, 'tieu chi 3', 1, 5),
(4, 'tieu chi 4', 1, 3),
(5, 'tieu chi 5', 1, 10),
(10, 'tieu chi 06', 1, 10),
(11, 'tieu chi 07', 1, 9),
(12, 'tieu chi 08', 1, 8),
(13, 'tieu chi 09', 1, 7),
(14, 'tieu chi 10', 1, 5),
(15, 'tieu chi 11', 1, 12),
(16, 'tieu chi 12', 1, 12),
(17, 'tieu chi 13', 1, 11),
(18, 'tieu chi php', 3, 8),
(19, 'tieu chi can bo 1', 5, 10);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`criteria-id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `criteria`
--
ALTER TABLE `criteria`
  MODIFY `criteria-id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id tieu chi', AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
