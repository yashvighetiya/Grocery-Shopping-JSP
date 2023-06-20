-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2022 at 09:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gambosupermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_phone` varchar(50) NOT NULL,
  `admin_address` varchar(200) NOT NULL,
  `admin_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`admin_id`, `admin_email`, `admin_password`, `admin_phone`, `admin_address`, `admin_username`) VALUES
(1, 'yashvi123@gmail.com', 'yashvi123', '9879817955', 'Rajkot,Gujarat-360005', 'Gambo_Yashvi');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_order_detail`
--

CREATE TABLE `cancel_order_detail` (
  `cancel_order_detail_id` int(11) NOT NULL,
  `cancel_order_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `total` double NOT NULL,
  `cancel_date` date NOT NULL,
  `cancel_time` time NOT NULL,
  `discount_per_product` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel_order_detail`
--

INSERT INTO `cancel_order_detail` (`cancel_order_detail_id`, `cancel_order_id`, `user_email`, `user_name`, `product_name`, `product_quantity`, `product_price`, `total`, `cancel_date`, `cancel_time`, `discount_per_product`) VALUES
(19, 13, 'yashvi@gmail.com', 'Yashvi@45', 'Broccoli', 1, 400, 400, '2022-03-20', '00:39:09', 0),
(20, 14, 'yashvi@gmail.com', 'Yashvi@45', 'Broccoli', 1, 400, 400, '2022-03-20', '00:43:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cancel_order_master`
--

CREATE TABLE `cancel_order_master` (
  `cancel_order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `cancel_date` date NOT NULL,
  `cancel_time` varchar(100) NOT NULL,
  `grand_total` double NOT NULL,
  `address` varchar(2000) NOT NULL,
  `delivery_charge` double NOT NULL,
  `wallet_balance_used` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel_order_master`
--

INSERT INTO `cancel_order_master` (`cancel_order_id`, `invoice_no`, `user_email`, `user_name`, `phone_no`, `payment_method`, `cancel_date`, `cancel_time`, `grand_total`, `address`, `delivery_charge`, `wallet_balance_used`, `user_id`) VALUES
(13, 129, 'yashvi@gmail.com', 'Yashvi@45', '9879817955', 'Cash On Delivery', '2022-03-20', '00:39:09', 599, '56,ghg,Morbi,5665', 199, 0, 21),
(14, 130, 'yashvi@gmail.com', 'Yashvi@45', '9879817955', 'Card', '2022-03-20', '00:43:25', 599, '56,ghg,Morbi,5665', 199, 0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `cancel_order_timelimit`
--

CREATE TABLE `cancel_order_timelimit` (
  `invoice_no` int(11) NOT NULL,
  `time_left` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(5) NOT NULL,
  `user_products` varchar(5000) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `user_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_products`, `quantity`, `user_name`) VALUES
(187, 'Mangosteen', 1, 'Dhruvi14'),
(270, 'Broccoli', 1, 'Yashvi@45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_image_path` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_image_path`) VALUES
(1, 'Vegetables', 'images/category/icon-1.svg'),
(2, 'Dairy Products', 'images/category/icon-3.svg'),
(3, 'Non Veg', 'images/category/icon-10.svg'),
(4, 'Nuts', 'images/category/icon-5.svg'),
(6, 'Fruits', 'images/category/icon-1.svg');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `selling` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city`, `selling`) VALUES
(1, 'Rajkot', 15),
(2, 'Morbi', 23),
(3, 'Gondal', 12),
(5, 'Mota Mava', 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_wallet`
--

CREATE TABLE `client_wallet` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `balance` double NOT NULL,
  `no_of_times_used` int(11) NOT NULL DEFAULT 0,
  `user_contact` varchar(100) NOT NULL,
  `user_email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_wallet`
--

INSERT INTO `client_wallet` (`id`, `user_name`, `balance`, `no_of_times_used`, `user_contact`, `user_email`) VALUES
(4, 'Yashvi@45', 2187, 3, '9879817955', 'yashvi@gmail.com'),
(5, 'Karishma@85', 200, 0, '9879817923', 'karishma@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(3) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_email` varchar(25) NOT NULL,
  `user_subject` varchar(100) NOT NULL,
  `user_message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges_detail`
--

CREATE TABLE `delivery_charges_detail` (
  `id` int(11) NOT NULL,
  `Delivery_charge` double NOT NULL,
  `on_price_less_then` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_charges_detail`
--

INSERT INTO `delivery_charges_detail` (`id`, `Delivery_charge`, `on_price_less_then`) VALUES
(1, 199, 1999);

-- --------------------------------------------------------

--
-- Table structure for table `gambo_products`
--

CREATE TABLE `gambo_products` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_detail` varchar(5000) NOT NULL,
  `product_price` double NOT NULL,
  `product_selling` int(11) DEFAULT 0,
  `product_discount` double DEFAULT 0,
  `product_stock` int(11) NOT NULL,
  `product_image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gambo_products`
--

INSERT INTO `gambo_products` (`product_id`, `product_category_id`, `product_name`, `product_detail`, `product_price`, `product_selling`, `product_discount`, `product_stock`, `product_image`) VALUES
(20, 6, 'GrapeFruit', 'The Little Boo - Grapefruit Plant (Imported Hawaiian Variety)The fruit ranges from 100 to 150 mm (4 to 6 inches) in diameter, its size depending upon the variety and upon growing conditions. 1 plural grapefruit or grapefruits : a large round citrus fruit with a bitter yellow rind and a juicy somewhat tart pale yellow, pink, or reddish pulp. 2 : a small citrus tree (Citrus paradisi) that produces grapefruit.1 plural grapefruit or grapefruits : a large round citrus fruit with a bitter yellow rind and a juicy somewhat tart pale yellow, pink, or reddish pulp. 2 : a small citrus tree (Citrus paradisi) that produces grapefruit.</p><p>Like many citrus fruits, grapefruit is loaded with vitamin C, a nutrient shown to help boost your body&#39;s immune system. Grapefruit is also loaded with Vitamin A, another vitamin that has been proven to help immune function. This powerful combination could help keep the amount of time you spend sick to a minimum.', 300, 6, 12, 1, 'images/product/img-11.jpg'),
(21, 1, 'QualiFlower', 'The cauliflower head is composed of a white inflorescence meristem. Cauliflower heads resemble those in broccoli, which differs in having flower buds as the edible portion.Cauliflower is actually a flower.Cauliflowers are annual plants that reach about 0.5 metre (1.5 feet) tall and bear large rounded leaves that resemble collards (Brassica oleracea, variety acephala). ... As desired for food, the terminal cluster forms a firm, succulent &ldquo;curd,&rdquo; or head, that is an immature inflorescence (cluster of flowers).Sweet and nutty flavor with bitter undertones.Contains Many Nutrients. The nutrition profile of cauliflower is quite impressive.High in Fiber.Good Source of Antioxidants. ...</p><p>May Aid in Weight Loss.High in Choline.Rich in Sulforaphane.', 35, 4, 0, 336, 'images/product/img-1.jpg'),
(22, 6, 'StrawBerry', 'The garden strawberry (or simply strawberry; Fragaria &times; ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries. strawberry is both a low-growing, flowering plant and also the name of the fruit that it produces. Strawberries are soft, sweet, bright red berries. They&#39;re also delicious. Strawberries have tiny edible seeds, which grow all over their surface. When ripe, strawberries smell wonderful and taste even better.Fruity, sweet, and juicy, with a little bit of acidity.Strawberries have a lower glycemic index than other fruits, making them helpful when it comes to regulating blood sugar levels. Studies have even shown that eating strawberries every day can reduce complications related to diabetes.', 525, 4, 0, 0, 'images/product/img-2.jpg'),
(23, 1, 'Carrot', 'Carrot, (Daucus carota), herbaceous, generally biennial plant of the Apiaceae family that produces an edible taproot. Among common varieties root shapes range from globular to long, with lower ends blunt to pointed. Besides the orange-coloured roots, white-, yellow-, and purple-fleshed varieties are known.Carrot have a crunchy texture and a sweet and minty aromatic taste, while the greens are fresh tasting and slightly bitter.The fiber in carrots can help keep blood sugar levels under control. And they&#39;re loaded with vitamin A and beta-carotene, which there&#39;s evidence to suggest can lower your diabetes risk. They can strengthen your bones. Carrots have calcium and vitamin K, both of which are important for bone health.', 200, 5, 2, 495, 'images/product/img-4.jpg'),
(24, 6, 'Banana', 'A banana is a curved, yellow fruit with a thick skin and soft sweet flesh. If you eat a banana every day for breakfast, your roommate might nickname you &quot;the monkey.&quot; A banana is a tropical fruit that&#39;s quite popular all over the world. It grows in bunches on a banana tree.As they ripen a more distinctive fruity flavour develops accompanied melon, pineapple, candy and clove flavour notes. Yellow bananas have higher sugar concentrations and therefore taste sweeter. Finally, when the peel has become brown, the banana contains notes which are reminiscent of vanilla, honey and rum.Bananas are a good source of several vitamins and minerals, especially potassium, vitamin B6, and vitamin C ( 1 ). Potassium. Bananas are a good source of potassium. A diet high in potassium can lower blood pressure in people with elevated levels and benefits heart health ( 6 ).', 230, 9, 0, 67, 'images/product/img-5.jpg'),
(25, 6, 'Kiwi', 'The ellipsoidal kiwi fruit is a true berry and has furry brownish green skin. The firm translucent green flesh has numerous edible purple-black seeds embedded around a white centre. The deciduous leaves are borne alternately on long petioles (leaf stems), and young leaves are covered with reddish hairs.Kiwi has a slightly acidic flavor that can be described as tangy or tart.Kiwis are high in Vitamin C and dietary fiber and provide a variety of health benefits. This tart fruit can support heart health, digestive health, and immunity. The kiwi is a healthy choice of fruit and is rich with vitamins and antioxidants.', 600, 4, 0, 446, 'images/product/img-6.jpg'),
(26, 6, 'Orange', 'Oranges are round citrus fruits with finely-textured skins that are, of course, orange in color just like their pulpy flesh; the skin can vary in thickness from very thin to very thick.Oranges are round orange-coloured fruit that grow on a tree which can reach 10 metres (33 ft) high. Orange trees have dark green shiny leaves and small white flowers with five petals. The flowers smell very sweet which attracts many bees. ... Orange skin is often called &quot;orange peel&quot;.Blood oranges are juicy with a rich and sweet but mildly tart flavour.One orange provides 100 percent of the daily recommended requirement of vitamin C, a key component in white blood cell production.', 530, 5, 5, 304, 'images/product/img-7.jpg'),
(27, 1, 'EggPlant', 'Eggplant is usually grown as an annual and features an erect bushy stem that is sometimes armed with spines. The leaves are large, ovate, and slightly lobed. The pendant violet flowers are characteristically solitary and approximately 5 cm (2 inches) across.Eggplant has antioxidants like vitamins A and C, which help protect your cells against damage. It&#39;s also high in natural plant chemicals called polyphenols, which may help cells do a better job of processing sugar if you have diabetes.', 100, 35, 2, 511, 'images/product/img-8.jpg'),
(28, 3, 'Meat', 'Meat, the flesh or other edible parts of animals (usually domesticated cattle, swine, and sheep) used for food, including not only the muscles and fat but also the tendons and ligaments.Meat quality is normally defined by the compositional quality (lean to fat ratio) and the palatability factors such as visual appearance, smell, firmness, juiciness, tenderness, and flavour.Meat and poultry are great sources of protein. They also provide lots of other nutrients your body needs, like iodine, iron, zinc, vitamins (especially B12) and essential fatty acids. So it&#39;s a good idea to eat meat and poultry every week as part of your balanced diet.', 500, 14, 0, 636, 'images/product/img-9.jpg'),
(29, 2, 'Cheese', '<p><span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Cheese is&nbsp;</span><b style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">a dairy product produced in wide ranges of flavors, textures and forms by coagulation of the milk protein casein</b><span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">. It comprises proteins and fat from milk, usually the milk of cows, buffalo, goats, or sheep. ... The solid curds are then separated from the liquid whey and pressed into finished cheese.<span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Cheese is a&nbsp;</span><b style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">great source of calcium, fat, and protein</b><span style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">. It also contains high amounts of vitamins A and B-12, along with zinc, phosphorus, and riboflavin. Cheese made from the milk of 100 percent grass-fed animals is the highest in nutrients and also contains omega-3 fatty acids and vitamin K-2.</span>&nbsp;</span></p>', 390, 11, 0, 778, 'images/product/img-10.jpg'),
(31, 1, 'Onion', 'An onion is a round vegetable with a brown skin that grows underground. It has many white layers on its inside which have a strong, sharp smell and taste. ... It is made with fresh minced meat, cooked with onion and a rich tomato sauce.The flavour is sweet and mild with a slight bite. They are able to be used cooked or raw and are seen as a topping for many onion soups. Similar in appearance and flavour as scallions, spring onions have a mild flavour but can be considered slightly spicy when eaten raw and sweet when cooked.Eating several servings of onions a day may help decrease the risk of oral and esophageal cancer.', 400, 4, 0, 296, 'images/product/img-13.jpg'),
(32, 1, 'Capsicum', 'Capsicum, also known as red pepper or chili pepper, is an herb. Its fruit is commonly applied to the skin for arthritis pain and other conditions. The fruit of the capsicum plant contains a chemical called capsaicin. ... Capsicum is commonly used for nerve pain and other painful conditions.Red capsicums are the sweetest due to their higher sugar content, and are rich in vitamin C and beta carotene. Orange and yellow capsicums have almost as much sugar as the red variety, while green ones have a low sugar content due to early picking, which gives them their slightly bitter taste.Being rich in antioxidant and anti-inflammatory nutrients, capsicums provide several anti-cancer benefits. They also contain health supportive sulphur compounds. The enzymes present in capsicum help to prevent gastric cancer and esophageal cancer.', 380, 31, 0, 667, 'images/product/img-14.jpg'),
(33, 3, 'Eggs', 'Eggs have a hard shell of calcium carbonate enclosing a liquid white, a single yolk (or an occasional double yolk)and an air cell.The white or albumen is a clear liquid that turns to an opaque white when cooked or beaten. The yolk is orange to yellow in color, and becomes pale yellow when cooked to a solid form.Vitamins A, B5, B12, B2 add to your daily recommended requirement.Vitamins B6, D, E, and K are found in eggs.Phosphorus aids in healthy bones and teeth.Calcium helps your bones stay strong.Zinc helps your immune system.', 250, 21, 5, 0, 'images/product/img-15.jpg'),
(34, 6, 'Mangosteen', 'Mangosteens have a thick, hard, deep red rind surrounding snow-white flesh, which is in segments resembling those of a mandarin orange.The mangosteen has been cultivated in Java, Sumatra, Indochina,Mangosteen is used for diarrhea, urinary tract infections (UTIs), gonorrhea, thrush, tuberculosis, menstrual disorders, cancer, osteoarthritis, and an intestinal infection called dysentery. It is also used for stimulating the immune system and improving mental healthMangosteen can also prevent further formation of more kidney stones. It helps boost kidney function while preventing further damage . Before you make changes to your daily diet, consult with your doctor, dietitian or other healthcare practitioner to ensure your diet meets your nutritional and overall needs.', 500, 31, 0, 199, 'images/product/img-3.jpg'),
(35, 1, 'Broccoli', 'Broccoli is a fast-growing annual plant that grows 60&ndash;90 cm (24&ndash;35 inches) tall. Upright and branching with leathery leaves, broccoli bears dense green clusters of flower buds at the ends of the central axis and the branches.Broccoli&#39;s flavor can best be described as herbaceous and earthy. Like its bright green color, you could also easily describe the flavor as grassy, with just a hint of bitterness at the end.Broccoli is a good source of vitamin K and calcium, two vital nutrients for maintaining strong, healthy bones ( 42 , 43 , 44 ). It also contains phosphorus, zinc and vitamins A and C, which are necessary for healthy bones as well (45).', 400, 21, 0, 179, 'images/product/img-12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gambo_wallet_details`
--

CREATE TABLE `gambo_wallet_details` (
  `id` int(11) NOT NULL,
  `per_can_be_used` double NOT NULL,
  `get_Rs` double NOT NULL,
  `on_purchase_of_or_more_than` double NOT NULL,
  `used_on_purchase_of` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gambo_wallet_details`
--

INSERT INTO `gambo_wallet_details` (`id`, `per_can_be_used`, `get_Rs`, `on_purchase_of_or_more_than`, `used_on_purchase_of`) VALUES
(1, 50, 100, 2999, 499);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `discount_per_product` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `invoice_no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(100) NOT NULL,
  `grand_total` double NOT NULL,
  `address` varchar(2000) NOT NULL,
  `delivery_charge` double NOT NULL,
  `wallet_balance_used` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_table`
--

CREATE TABLE `payment_table` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_table`
--

INSERT INTO `payment_table` (`id`, `payment_type`, `available`) VALUES
(1, 'Cash On Delivery', 1),
(2, 'PayU Money', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(5) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_detail` varchar(5000) NOT NULL,
  `product_price` double NOT NULL,
  `product_selling` int(5) NOT NULL,
  `product_discount` double DEFAULT NULL,
  `product_category` varchar(50) NOT NULL,
  `price_onbasis` varchar(50) NOT NULL,
  `product_img` varchar(200) NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `product_pagepath` varchar(100) NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_detail`, `product_price`, `product_selling`, `product_discount`, `product_category`, `price_onbasis`, `product_img`, `product_quantity`, `product_pagepath`, `product_category_id`) VALUES
(1, 'GrapeFruit', 'The Little Boo - Grapefruit Plant (Imported Hawaiian Variety)The fruit ranges from 100 to 150 mm (4 to 6 inches) in diameter, its size depending upon the variety and upon growing conditions. 1 plural grapefruit or grapefruits : a large round citrus fruit with a bitter yellow rind and a juicy somewhat tart pale yellow, pink, or reddish pulp. 2 : a small citrus tree (Citrus paradisi) that produces grapefruit.1 plural grapefruit or grapefruits : a large round citrus fruit with a bitter yellow rind and a juicy somewhat tart pale yellow, pink, or reddish pulp. 2 : a small citrus tree (Citrus paradisi) that produces grapefruit.\r\nLike many citrus fruits, grapefruit is loaded with vitamin C, a nutrient shown to help boost your body\'s immune system. Grapefruit is also loaded with Vitamin A, another vitamin that has been proven to help immune function. This powerful combination could help keep the amount of time you spend sick to a minimum.', 300, 50, NULL, 'Fruit', '/kg', 'images/product/img-11.jpg', 59, 'single_product_grapefruit.jsp', 0),
(2, 'Cauliflower', 'The cauliflower head is composed of a white inflorescence meristem. Cauliflower heads resemble those in broccoli, which differs in having flower buds as the edible portion.Cauliflower is actually a flower.Cauliflowers are annual plants that reach about 0.5 metre (1.5 feet) tall and bear large rounded leaves that resemble collards (Brassica oleracea, variety acephala). ... As desired for food, the terminal cluster forms a firm, succulent “curd,” or head, that is an immature inflorescence (cluster of flowers).Sweet and nutty flavor with bitter undertones.Contains Many Nutrients. The nutrition profile of cauliflower is quite impressive.High in Fiber.Good Source of Antioxidants. ...\r\nMay Aid in Weight Loss.High in Choline.Rich in Sulforaphane.', 35, 67, NULL, 'Vegetable', '/kg', 'images/product/img-1.jpg', 35, 'single_product_cauliflower.jsp', 0),
(3, 'StrawBerry', 'The garden strawberry (or simply strawberry; Fragaria × ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries. strawberry is both a low-growing, flowering plant and also the name of the fruit that it produces. Strawberries are soft, sweet, bright red berries. They\'re also delicious. Strawberries have tiny edible seeds, which grow all over their surface. When ripe, strawberries smell wonderful and taste even better.Fruity, sweet, and juicy, with a little bit of acidity.Strawberries have a lower glycemic index than other fruits, making them helpful when it comes to regulating blood sugar levels. Studies have even shown that eating strawberries every day can reduce complications related to diabetes.', 525, 89, 20, 'Fruit', '/kg', 'images/product/img-2.jpg', 53, 'single_product_strawberry.jsp', 0),
(4, 'Carrot', 'carrot, (Daucus carota), herbaceous, generally biennial plant of the Apiaceae family that produces an edible taproot. Among common varieties root shapes range from globular to long, with lower ends blunt to pointed. Besides the orange-coloured roots, white-, yellow-, and purple-fleshed varieties are known.Carrot have a crunchy texture and a sweet and minty aromatic taste, while the greens are fresh tasting and slightly bitter.The fiber in carrots can help keep blood sugar levels under control. And they\'re loaded with vitamin A and beta-carotene, which there\'s evidence to suggest can lower your diabetes risk. They can strengthen your bones. Carrots have calcium and vitamin K, both of which are important for bone health.', 174, 39, NULL, 'Vegetable', '/kg', 'images/product/img-4.jpg', 10, 'single_product_carrot.jsp', 0),
(5, 'Banana', 'A banana is a curved, yellow fruit with a thick skin and soft sweet flesh. If you eat a banana every day for breakfast, your roommate might nickname you \"the monkey.\" A banana is a tropical fruit that\'s quite popular all over the world. It grows in bunches on a banana tree.As they ripen a more distinctive fruity flavour develops accompanied melon, pineapple, candy and clove flavour notes. Yellow bananas have higher sugar concentrations and therefore taste sweeter. Finally, when the peel has become brown, the banana contains notes which are reminiscent of vanilla, honey and rum.Bananas are a good source of several vitamins and minerals, especially potassium, vitamin B6, and vitamin C ( 1 ). Potassium. Bananas are a good source of potassium. A diet high in potassium can lower blood pressure in people with elevated levels and benefits heart health ( 6 ).', 32.5, 49, 20, 'Fruit', '/kg', 'images/product/img-5.jpg', 29, 'single_product_banana.jsp', 0),
(6, 'Kiwi', 'The ellipsoidal kiwi fruit is a true berry and has furry brownish green skin. The firm translucent green flesh has numerous edible purple-black seeds embedded around a white centre. The deciduous leaves are borne alternately on long petioles (leaf stems), and young leaves are covered with reddish hairs.Kiwi has a slightly acidic flavor that can be described as tangy or tart.Kiwis are high in Vitamin C and dietary fiber and provide a variety of health benefits. This tart fruit can support heart health, digestive health, and immunity. The kiwi is a healthy choice of fruit and is rich with vitamins and antioxidants.\r\n', 600, 73, NULL, 'Fruit', '/kg', 'images/product/img-6.jpg', 47, 'single_product_kiwi.jsp', 0),
(7, 'Orange', 'Oranges are round citrus fruits with finely-textured skins that are, of course, orange in color just like their pulpy flesh; the skin can vary in thickness from very thin to very thick.Oranges are round orange-coloured fruit that grow on a tree which can reach 10 metres (33 ft) high. Orange trees have dark green shiny leaves and small white flowers with five petals. The flowers smell very sweet which attracts many bees. ... Orange skin is often called \"orange peel\".Blood oranges are juicy with a rich and sweet but mildly tart flavour.One orange provides 100 percent of the daily recommended requirement of vitamin C, a key component in white blood cell production.', 200, 98, NULL, 'Fruit', '/kg', 'images/product/img-7.jpg', 65, 'single_product_orange.jsp', 0),
(8, 'EggPlant', 'Eggplant is usually grown as an annual and features an erect bushy stem that is sometimes armed with spines. The leaves are large, ovate, and slightly lobed. The pendant violet flowers are characteristically solitary and approximately 5 cm (2 inches) across.Eggplant has antioxidants like vitamins A and C, which help protect your cells against damage. It\'s also high in natural plant chemicals called polyphenols, which may help cells do a better job of processing sugar if you have diabetes.\r\n', 60, 48, NULL, 'Vegetable', '/kg', 'images/product/img-8.jpg', 30, 'single_product_eggplant.jsp', 0),
(9, 'Meat', 'meat, the flesh or other edible parts of animals (usually domesticated cattle, swine, and sheep) used for food, including not only the muscles and fat but also the tendons and ligaments.Meat quality is normally defined by the compositional quality (lean to fat ratio) and the palatability factors such as visual appearance, smell, firmness, juiciness, tenderness, and flavour.Meat and poultry are great sources of protein. They also provide lots of other nutrients your body needs, like iodine, iron, zinc, vitamins (especially B12) and essential fatty acids. So it\'s a good idea to eat meat and poultry every week as part of your balanced diet.', 600, 100, NULL, 'NonVeg', '/kg', 'images/product/img-9.jpg', 110, 'single_product_meat.jsp', 0),
(10, 'Cheese', 'Cheese is a dairy product and produced in wide ranges of flavors, textures and forms by coagulation of the milk protein casein. It comprises proteins and fat from milk, usually the milk of cows, buffa', 470, 118, NULL, 'DairyProduct', '/kg', 'images/product/img-10.jpg', 135, 'single_product_cheese.jsp', 0),
(11, 'Broccoli', 'Broccoli is a fast-growing annual plant that grows 60–90 cm (24–35 inches) tall. Upright and branching with leathery leaves, broccoli bears dense green clusters of flower buds at the ends of the central axis and the branches.Broccoli\'s flavor can best be described as herbaceous and earthy. Like its bright green color, you could also easily describe the flavor as grassy, with just a hint of bitterness at the end.Broccoli is a good source of vitamin K and calcium, two vital nutrients for maintaining strong, healthy bones ( 42 , 43 , 44 ). It also contains phosphorus, zinc and vitamins A and C, which are necessary for healthy bones as well (45).', 300, 69, NULL, 'Vegetable', '/kg', 'images/product/img-12.jpg', 50, 'single_product_broccoli.jsp', 0),
(12, 'Onion', 'An onion is a round vegetable with a brown skin that grows underground. It has many white layers on its inside which have a strong, sharp smell and taste. ... It is made with fresh minced meat, cooked with onion and a rich tomato sauce.The flavour is sweet and mild with a slight bite. They are able to be used cooked or raw and are seen as a topping for many onion soups. Similar in appearance and flavour as scallions, spring onions have a mild flavour but can be considered slightly spicy when eaten raw and sweet when cooked.Eating several servings of onions a day may help decrease the risk of oral and esophageal cancer.', 280, 83, NULL, 'Vegetable', '/kg', 'images/product/img-13.jpg', 100, 'single_product_onion.jsp', 0),
(13, 'Capsicum', 'Capsicum, also known as red pepper or chili pepper, is an herb. Its fruit is commonly applied to the skin for arthritis pain and other conditions. The fruit of the capsicum plant contains a chemical called capsaicin. ... Capsicum is commonly used for nerve pain and other painful conditions.Red capsicums are the sweetest due to their higher sugar content, and are rich in vitamin C and beta carotene. Orange and yellow capsicums have almost as much sugar as the red variety, while green ones have a low sugar content due to early picking, which gives them their slightly bitter taste.Being rich in antioxidant and anti-inflammatory nutrients, capsicums provide several anti-cancer benefits. They also contain health supportive sulphur compounds. The enzymes present in capsicum help to prevent gastric cancer and esophageal cancer.', 104, 74, NULL, 'Vegetable', '/kg', 'images/product/img-14.jpg', 79, 'single_product_capsicum.jsp', 0),
(14, 'Eggs', 'Eggs have a hard shell of calcium carbonate enclosing a liquid white, a single yolk (or an occasional double yolk)and an air cell.The white or albumen is a clear liquid that turns to an opaque white when cooked or beaten. The yolk is orange to yellow in color, and becomes pale yellow when cooked to a solid form.Vitamins A, B5, B12, B2 add to your daily recommended requirement.Vitamins B6, D, E, and K are found in eggs.Phosphorus aids in healthy bones and teeth.Calcium helps your bones stay strong.Zinc helps your immune system.', 132, 108, 2, 'NonVeg', '/kg', 'images/product/img-15.jpg', 86, 'single_product_eggs.jsp', 0),
(15, 'Mangosteen', 'Mangosteens have a thick, hard, deep red rind surrounding snow-white flesh, which is in segments resembling those of a mandarin orange.The mangosteen has been cultivated in Java, Sumatra, Indochina,Mangosteen is used for diarrhea, urinary tract infections (UTIs), gonorrhea, thrush, tuberculosis, menstrual disorders, cancer, osteoarthritis, and an intestinal infection called dysentery. It is also used for stimulating the immune system and improving mental healthMangosteen can also prevent further formation of more kidney stones. It helps boost kidney function while preventing further damage . Before you make changes to your daily diet, consult with your doctor, dietitian or other healthcare practitioner to ensure your diet meets your nutritional and overall needs.', 240, 85, 5, 'Fruit', '/kg', 'images/product/img-3.jpg', 48, 'single_product_mangosteen.jsp', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(5) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_contact` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_orders` int(11) DEFAULT 0,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_contact`, `user_email`, `user_orders`, `date`) VALUES
(21, 'Yashvi@45', 'AsYGYVkf7MlY5hacXMrSIg==', '9879817955', 'yashvi@gmail.com', 47, '2022-03-10'),
(22, 'Karishma@85', '12tkimLunfIkFdeCuGttQQ==', '9879817923', 'karishma@gmail.com', 3, '2022-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `wishlist_product` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_name`, `wishlist_product`) VALUES
(7, 'Dhruvi14', 'Mangosteen'),
(10, 'Dhruvi14', 'Broccoli'),
(15, 'jash', 'Capsicum'),
(17, 'Karishma@85', 'Eggs'),
(18, 'Karishma@85', 'Mangosteen'),
(19, 'Karishma@85', 'Broccoli'),
(20, 'Karishma@85', 'QualiFlower'),
(21, 'Karishma@85', 'Capsicum'),
(22, 'Karishma@85', 'Cheese'),
(23, 'Yashvi@45', 'Mangosteen'),
(24, 'Yashvi@45', 'Eggs'),
(25, 'Yashvi@45', 'GrapeFruit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cancel_order_detail`
--
ALTER TABLE `cancel_order_detail`
  ADD PRIMARY KEY (`cancel_order_detail_id`),
  ADD KEY `cancel_order_id` (`cancel_order_id`);

--
-- Indexes for table `cancel_order_master`
--
ALTER TABLE `cancel_order_master`
  ADD PRIMARY KEY (`cancel_order_id`);

--
-- Indexes for table `cancel_order_timelimit`
--
ALTER TABLE `cancel_order_timelimit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_wallet`
--
ALTER TABLE `client_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_charges_detail`
--
ALTER TABLE `delivery_charges_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambo_products`
--
ALTER TABLE `gambo_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `gambo_wallet_details`
--
ALTER TABLE `gambo_wallet_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`invoice_no`);

--
-- Indexes for table `payment_table`
--
ALTER TABLE `payment_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cancel_order_detail`
--
ALTER TABLE `cancel_order_detail`
  MODIFY `cancel_order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cancel_order_master`
--
ALTER TABLE `cancel_order_master`
  MODIFY `cancel_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cancel_order_timelimit`
--
ALTER TABLE `cancel_order_timelimit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client_wallet`
--
ALTER TABLE `client_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_charges_detail`
--
ALTER TABLE `delivery_charges_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gambo_products`
--
ALTER TABLE `gambo_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `gambo_wallet_details`
--
ALTER TABLE `gambo_wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `payment_table`
--
ALTER TABLE `payment_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancel_order_detail`
--
ALTER TABLE `cancel_order_detail`
  ADD CONSTRAINT `cancel_order_detail_ibfk_1` FOREIGN KEY (`cancel_order_id`) REFERENCES `cancel_order_master` (`cancel_order_id`);

--
-- Constraints for table `gambo_products`
--
ALTER TABLE `gambo_products`
  ADD CONSTRAINT `gambo_products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`invoice_no`) REFERENCES `order_master` (`invoice_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
