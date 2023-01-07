-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 07, 2023 lúc 04:29 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `javaweb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `createAt`, `updateAt`, `name`, `description`) VALUES
(14, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'Nike', 'Nike delivers innovative products, experiences and services to inspire athletes.'),
(15, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'Adidas', 'Welcome to adidas Vietnam. Shop from classic adidas styles to the freshest new shoes, clothing, activewear, sportswear & more. '),
(16, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'Vans', 'Shop at Vans.com for Shoes, Clothing & Accessories. Browse Men\'s, Women\'s, Kids & Infant Styles.'),
(17, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'Puma', 'Run The Streets. Do You. Research and shop all the latest gear from the world of Fashion, Sport, and everywhere in between.'),
(18, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'MLB', 'Coverage includes audio and video clips, interviews, statistics, schedules and exclusive stories.'),
(19, '2023-01-01 17:00:00', '2023-01-01 17:00:00', 'Gucci', 'Shop women\'s shoes, sandals & sneakers at GUCCI.com in black, tan, white and more. Enjoy free shipping, returns & gift wrapping.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `createAt`, `updateAt`, `name`, `email`, `subject`, `message`) VALUES
(1, '2023-01-05 17:00:00', '2023-01-05 17:00:00', '12', '1111@gmnail.com', 'dung l&#432;&#7907;ng free', 'hjghjgj');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `productId` int(11) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `createAt`, `updateAt`, `productId`, `code`) VALUES
(1, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 2, '��	���');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `voucherId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `createAt`, `updateAt`, `code`, `userId`, `price`, `voucherId`) VALUES
(1, '2023-01-05 17:00:00', '2023-01-05 17:00:00', '��	���', 7, 2989000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'VND',
  `description` text DEFAULT NULL,
  `createBy` text NOT NULL,
  `categoryId` int(11) NOT NULL,
  `images` text NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `createAt`, `updateAt`, `name`, `price`, `currency`, `description`, `createBy`, `categoryId`, `images`, `quantity`) VALUES
(1, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Air Jordan 1 Elevate Low', 3239000, 'VND', 'Rise to the occasion in style that soars. This shoe reworks an icon\'s original magic with a platform sole and low-cut silhouette. Air cushioning keeps you lifted, and sleek leather in contrasting colours adds visual interest.', 'LÊ H&#7918;U HOÀN', 14, '/assets/images/jordan.webp', 100),
(2, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Air Jordan 1 Low', 2989000, 'VND', 'Always in, always fresh. The Air Jordan 1 Low sets you up with a piece of Jordan history and heritage that\'s comfortable all day. Choose your colours, then step out in the iconic profile that\'s built with a high-end mix of materials and encapsulated Air in the heel.', 'LÊ H&#7918;U HOÀN', 14, '/assets/images/low-se-nike.webp', 99),
(3, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Air Jordan 1 Low SE', 3289000, 'VND', 'Staple sneaker, modern expression. New colours and fresh textures give you an updated AJ1without losing that forever-favourite look and feel. It\'s made from premium materials, padded with comfy Air and decked out with subtle accents that redefine a classic.', 'LÊ H&#7918;U HOÀN', 14, '/assets/images/low-se-nike.webp', 100),
(4, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Air Jordan 1 Mid SE', 2980000, 'VND', 'Get that Jordan energy on your feet this festive season. Rich grain leather with bright details make this pair shine like festive lights.', 'LÊ H&#7918;U HOÀN', 14, '/assets/images/mid-se-nike.webp', 100),
(5, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Giày Sneaker Adidas Ultra4d X Parley \"Cream White\" Fz0596 ', 3200000, 'VND', 'BI&#7870;N V&#7844;N &#272;&#7872; THÀNH GI&#7842;I PHÁP S&#7843;n ph&#7849;m này may b&#7857;ng v&#7843;i công ngh&#7879; Primegreen, thu&#7897;c dòng ch&#7845;t li&#7879;u tái ch&#7871; hi&#7879;u n&#259;ng cao. Thân giày ch&#7913;a 50% thành ph&#7847;n tái ch&#7871;. Không s&#7917; d&#7909;ng polyester nguyên sinh. &#272;&#7870; GI&#7918;A ADIDAS 4D Các vùng hi&#7879;u su&#7845;t có thi&#7871;t k&#7871; chu&#7849;n xác k&#7871;t h&#7907;p gi&#7919;a &#273;&#7897; &#7893;n &#273;&#7883;nh, tho&#7843;i ...', 'LÊ H&#7918;U HOÀN', 15, '/assets/images/adidas-1.webp', 100),
(6, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Giày Sneaker Adidas Ultraboost 22 \"Blue Rush\" Gx3061 ', 2800000, 'VND', 'Giày Adidas Ultraboost 22 ', 'LÊ H&#7918;U HOÀN', 15, '/assets/images/adidas-2.webp', 100),
(7, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Giày Sneaker Nam Adidas Ultra4d 5.0 G58159 \'\'Solar Red\'\' ', 3200000, 'VND', 'Made in Vietnam', 'LÊ H&#7918;U HOÀN', 15, '/assets/images/giay-the-thao-nam-ultra-4d.webp', 100),
(8, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'Giày Sneaker Adidas Ultraboost 22 \"Magic Grey\" H01170 ', 2580000, 'VND', '&#272;ang c&#7853;p nh&#7853;t .', 'LÊ H&#7918;U HOÀN', 15, '/assets/images/giay-the-thao-adidas-nam-ultraboost-h01170-bounty-sneakers-4.webp', 100),
(9, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'VANS OLD SKOOL CLASSIC BLACK/WHITE', 2500000, 'VND', 'VANS - m&#7897;t th&#432;&#417;ng hi&#7879;u giày th&#7875; thao vang t&#7847;m th&#7871; gi&#7899;i v&#7899;i các s&#7843;n ph&#7849;m &#273;i &#273;ôi cùng tâm huy&#7871;t, ch&#7845;t l&#432;&#7907;ng và &#273;&#7859;ng c&#7845;p th&#7901;i trang toàn c&#7847;u. V&#7899;i kinh nghi&#7879;m ho&#7841;t &#273;&#7897;ng trong ngh&#7873; c&#7921;c k&#7923; phong phú v&#7899;i h&#417;n n&#7917;a th&#7871; k&#7927; c&#7889;ng hi&#7871;n h&#7871;t mình, VANS chính th&#7913;c &#273;i vào ho&#7841;t &#273;&#7897;ng và cho ra m&#7855;t nh&#7919;ng s&#7843;n ph&#7849;m &#273;&#7847;u tiên gây ch&#7845;n &#273;&#7897;ng th&#7883; tr&#432;&#7901;ng Sneaker vào ngày 16 tháng 3 n&#259;m 1966 t&#7841;i s&#7889; 704E Broadway, Anaheim, California. Sau 11 n&#259;m ho&#7841;t &#273;&#7897;ng vào n&#259;m 1977 cùng v&#7899;i nh&#7919;ng thành công nh&#7845;t &#273;&#7883;nh, VANS ch&#432;a m&#7897;t l&#7847;n ng&#7911; quên trong chi&#7871;n th&#7859;ng c&#7911;a mình mà ti&#7871;p t&#7909;c c&#7889;ng hi&#7871;n &#273;&#7871;n các VANSAHOLIC m&#7897;t huy&#7873;n tho&#7841;i ti&#7871;p theo mang tên VANS OLD SKOOL. ', 'LÊ H&#7918;U HOÀN', 16, '/assets/images/vans-old-skool-black-white-vn000d3hy28-1.webp', 100),
(10, '2023-01-05 17:00:00', '2023-01-05 17:00:00', 'VANS CHECKERBOARD SLIP-ON CLASSIC BLACK/OFF WHITE', 1450000, 'VND', '&#272;&#7889;i v&#7899;i VANS không m&#7897;t tín &#273;&#7891; nào còn xa l&#7841;i v&#7899;i kh&#7843; n&#259;ng sáng t&#7841;o, ph&#7845;n &#273;&#7845;u không ng&#7915;ng ngh&#7881; c&#361;ng nh&#432; s&#7921; chuyên chú vào ch&#7845;t l&#432;&#7907;ng ngày m&#7897;t c&#7843;i ti&#7871;n. S&#7921; hài lòng và phong cách c&#7911;a các tín &#273;&#7891; &#273;&#432;&#7907;c VANS &#273;&#7863;t làm tôn ch&#7881; ngay t&#7915; nh&#7919;ng ngày &#273;&#7847;u tiên b&#432;&#7899;c chân vào ngành giày chuyên nghi&#7879;p. Minh ch&#7913;ng rõ nh&#7845;t cho s&#7921; &#432;u ái mà nhà m&#7889;t OFF THE WALL dành cho các tín &#273;&#7891; yêu quý mình chính là siêu ph&#7849;m VANS SLIP-ON. &#272;ây là siêu ph&#7849;m v&#7899;i b&#7873; dày l&#7883;ch s&#7917; g&#7847;n m&#7897;t n&#7917;a th&#7871; k&#7927;.', 'LÊ H&#7918;U HOÀN', 16, '/assets/images/vans-slip-on-checkerboard-black-off-white-vn000eyebww-1.webp', 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `createAt`, `updateAt`, `email`, `fullname`, `password`, `role`) VALUES
(6, '2022-12-22 17:00:00', '2022-12-22 17:00:00', 'hoanle396@gmail.com', 'Admin', 'TrhflPAH6MGcp4GFYT4T03PuwrqXunaQQyfDLnvwtAz/iejvhcm6+gmY9qda6U1A', 'ADMIN'),
(7, '2022-12-31 17:00:00', '2022-12-31 17:00:00', 'lhhoan.20it11@vku.udn.vn', 'LÊ H&#7918;U HOÀN', 'FAx1b0+vM3b2LBaTTCqrYV1WaexNHvO9XRI8woj0WkC203q6oBFZOM8p7cKQ65rE', 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `createAt` timestamp NULL DEFAULT NULL,
  `updateAt` timestamp NULL DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`productId`),
  ADD KEY `code` (`code`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `voucher` (`voucherId`),
  ADD KEY `code` (`code`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders` FOREIGN KEY (`code`) REFERENCES `orders` (`code`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
