-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2024 at 10:45 PM
-- Server version: 8.0.27
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olympia_garden_materials`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `sku` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `category_order` bigint UNSIGNED NOT NULL DEFAULT '0',
  `parent_category` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `uuid`, `title`, `slug`, `description`, `image`, `is_active`, `category_order`, `parent_category`, `created_at`, `updated_at`) VALUES
(1, 'da84e224-1c24-11ee-9885-89d07af14ba3', 'Sand, Gravel, and Decorative Aggregates', 'sand-gravel-aggregates', '<p>The key to landscaping in California is to maximize water efficiency, and strategically use decorative rocks and fillers in places where plants can&#39;t grow. Designing your exteriors to be functional, efficient, and aesthetically appealing is a great way to increase your enjoyment and the value of your home. To improve your landscape&#39;s function, choose from a wide variety of filler materials, such as our sands, pea gravels, and crushed grain rock, as well as base rock materials. To increase aesthetic beauty, we offer a large variety of crushed rock, as well as decorative, polished, and premium pebbles. See for a guide to all<a style=\"color: #aa081e\" target=\"_blank\" href=\"#\"> our landscaping sands, gravels, and rocks.</a></p> <p style=\"font-size:12px;text-align:center;margin-bottom:15px\">Disclaimer: Product pictures of natural stone are not an exact representation of the product hues seen in natural light. There are natural color variations in stone and exact color match is not guaranteed. We recommend verifying the product color at our location before placing your order online.</p>', 'sand-grave-decorative-rocks.jpg', 1, 1, NULL, NULL, NULL),
(2, 'da84e512-1c24-11ee-9885-89d07af14ba3', 'Natural Stone', 'natural-stone', '', 'natural-stone.jpg', 1, 2, NULL, NULL, NULL),
(3, 'da84e5da-1c24-11ee-9885-89d07af14ba3', 'Composts, Mulches, Soils and Amendments', 'composts-mulches-soils-amendments', '', 'compost-mulch.jpg', 1, 4, NULL, NULL, NULL),
(4, 'da84e670-1c24-11ee-9885-89d07af14ba3', 'Biologicals, Fertilizers and Bagged Soils', 'biologicals-fertilizers-bagged-soils', '', 'fertilizers-amendments.jpg', 1, 8, NULL, NULL, NULL),
(5, 'da84e6f2-1c24-11ee-9885-89d07af14ba3', 'Pottery and Garden Ornaments', 'pottery-garden-ornaments', 'We carry an extensive line of pottery and statues.  Visit our location in San Carlos for our new and ever evolving inventory.', 'pottery-garden-ornements.jpg', 1, 5, NULL, NULL, NULL),
(6, 'da84e774-1c24-11ee-9885-89d07af14ba3', 'Water Features', 'water-features', '', 'water-features.jpg', 1, 3, NULL, NULL, NULL),
(7, 'da84e7f6-1c24-11ee-9885-89d07af14ba3', 'Building Materials and Tools', 'building-materials-tools', '', 'tools.jpg', 1, 7, NULL, NULL, NULL),
(8, 'da84e882-1c24-11ee-9885-89d07af14ba3', 'Precast Concrete Products', 'precast-concrete', 'Please refer to our vendor websites for your paver selections, you&#39;ll be redirected by clicking on the picture below.  For more information and to place your order, call us at (650) 364 1730.', 'precast-concrete.jpg', 1, 9, NULL, NULL, NULL),
(11, 'da84e904-1c24-11ee-9885-89d07af14ba3', 'Boulders', 'natural-stone/boulders', '<p>Boulders are a timeless natural resource that enhances the beauty of any landscaped area. Use them as a focal point in your garden or as a complimentary element. Boulders could also be enjoyed as a natural seating in an outdoor space. Our boulders are sold by weight of the individual piece. We carry a wide variety of natural boulders from granite to quartzite to basalt and more! With natural variations between each boulder, no two are alike.</p>\n<p>Visit our yard to handpick your unique boulders!</p>\n<p>Disclaimer: Many stone types may have concentrations of iron, and with the exposure to moisture, rust stains may be bleeding to the surface of the stone. For many stone types there is no way of knowing prior to installation if this will be an issue.</p>', 'boulders.jpg', 1, 10, 2, NULL, NULL),
(13, 'da84e9d6-1c24-11ee-9885-89d07af14ba3', 'Dimensional Stones', 'natural-stone/dimensional-stone', 'Dimensional Stones are cut stones with rectilinear edges, making installation of natural stone quite easy. Create your own desired pattern with various sizes. Most dimensional stones are offered from 12\" X 12\" size. Custom sizes are made to order.', 'dimensional-stone.jpg', 1, 11, 2, NULL, NULL),
(14, 'da84ea9e-1c24-11ee-9885-89d07af14ba3', 'Driveway Cubes, Cobbles & Pavers', 'natural-stone/cubes-cobbles-pavers', '', 'driveway-cubes-cobbles-pavers.jpg', 1, 12, 2, NULL, NULL),
(15, 'da84eb34-1c24-11ee-9885-89d07af14ba3', 'Drystack and Wall Rocksrn', 'natural-stone/drystack-wallrocks', '', 'drystack-wall-rocks.jpg', 1, 13, 2, NULL, NULL),
(16, 'da84ebb6-1c24-11ee-9885-89d07af14ba3', 'Irregular Flagstones', 'natural-stone/irregular-flagstone', 'Irregular Flagstones are available as stand-up select on a pallet. Due to the variations between each pallets, we recommend that our customers visit our yard to select the exact pallet before setting up a delivery. For smaller quantities, we offer an open bin option to hand select your flagstones from.', 'irregular-flagstone.jpg', 1, 14, 2, NULL, NULL),
(17, 'da84ec60-1c24-11ee-9885-89d07af14ba3', 'Ledgestones', 'natural-stone/ledgerstones', '', 'ledgerstones.jpg', 1, 15, 2, NULL, NULL),
(18, 'da84ecec-1c24-11ee-9885-89d07af14ba3', 'Veneer Panels', 'natural-stone/veneer-panels', '', 'veneer-panels.jpg', 1, 16, 2, NULL, NULL),
(19, 'da84ed6e-1c24-11ee-9885-89d07af14ba3', 'Sand', 'sand-gravel-aggregates/sand', '', 'sand.jpg', 1, 17, 1, NULL, NULL),
(20, 'da84edf0-1c24-11ee-9885-89d07af14ba3', 'Gravel', 'sand-gravel-aggregates/gravel', '', 'gravel.jpg', 1, 18, 1, NULL, NULL),
(21, 'da84ee72-1c24-11ee-9885-89d07af14ba3', 'Base Rock', 'sand-gravel-aggregates/base-rock', '', 'base-rock.jpg', 1, 19, 1, NULL, NULL),
(22, 'da84eefe-1c24-11ee-9885-89d07af14ba3', 'Path Fines', 'sand-gravel-aggregates/pathway-fines', '', 'path-fines.jpg', 1, 20, 1, NULL, NULL),
(23, 'da84f020-1c24-11ee-9885-89d07af14ba3', 'Crushed Rock', 'sand-gravel-aggregates/crushed-rock', '', 'crushed-rock.jpg', 1, 21, 1, NULL, NULL),
(24, 'da84f0a2-1c24-11ee-9885-89d07af14ba3', 'Decorative Pebbles', 'sand-gravel-aggregates/decorative-pebbles', '', 'decorative-pebbles.jpg', 1, 22, 1, NULL, NULL),
(25, 'da84f124-1c24-11ee-9885-89d07af14ba3', 'Polished Pebbles', 'sand-gravel-aggregates/polished-pebbles', '', 'polished-pebbles.jpg', 1, 23, 1, NULL, NULL),
(26, 'da84f1c4-1c24-11ee-9885-89d07af14ba3', 'Premium Pebbles', 'sand-gravel-aggregates/premium-pebbles', '', 'premium-pebbles.jpg', 1, 24, 1, NULL, NULL),
(27, 'da84f250-1c24-11ee-9885-89d07af14ba3', 'Bocce Ball Court Materials', 'sand-gravel-aggregates/bocce-ball-courts', '<h1>Bocce Court Surface Materials</h1>rnrnWhen building a backyard bocce court, be sure to choose lasting materials that are low maintenance and that facilitate fast play while offering minimal bounce. Choose from our bocce court materials below, or see our guide to building a backyard bocce court for more tips and advice.', 'bocce-ball-court-materials.jpg', 1, 25, 1, NULL, NULL),
(28, 'da84f2d2-1c24-11ee-9885-89d07af14ba3', 'Amendments', 'composts-mulches-soils-amendments/amendments', '<h1>Organic Soil Amendments</h1><p>The ideal soil consists of a balance of sand, loam, clay, organic matter, minerals, water, and air, but rarely do we get to start with the perfect combination. That&#39;s why we offer a number of soil amendments that are perfect for California&#39;s main soil types: sandy, loamy, and clay. For tips on how to amend, see our <a href=\"https://www.lyngsogarden.com/community-resources/the-best-soils-for-vegetables-fruit-flowers-and-other-landscaping-needs/\">guide to amendments for California soils</a>.</p>', 'amendments.jpg', 1, 26, 3, NULL, NULL),
(29, 'da84f368-1c24-11ee-9885-89d07af14ba3', 'Compost', 'composts-mulches-soils-amendments/compost', '<h1>Organic Garden Composts</h1><p>Compost is decomposed organic matter that is rich in nutrients and often a course, dark brown, peat-like material. Adding compost to your soil improves the overall structure and texture. It increases the capacity to hold water in sandy soils, and enhances drainage in heavy clay soils. It also attracts earthworms that help aerate the soil and beneficial microbiology that helps convert material into molecules and elements that plants can more easily absorb. Not sure which compost is best for your needs? Check out our guide to choosing the right compost for your flower or vegetable garden.</p>', 'compost.jpg', 1, 27, 3, NULL, NULL),
(31, 'da84f3f4-1c24-11ee-9885-89d07af14ba3', 'Mulches', 'composts-mulches-soils-amendments/mulches', '<p>Mulch is a generic term for a ground cover that protects the soil. Organic and natural mulch helps with moisture retention, weed prevention and water loss due to surface evaporation. Covering your landscape with at least 1&#39; of mulch helps provide the soil with the much needed protection from the natural weathering elements. The mulch will decompose over time, providing carbon matter and feeding your soil. Choose from a variety of mulch to match your garden aesthetics. Not sure which compost is best for your needs? Check out our guide to choosing the right compost for your flower or vegetable garden.</p>', 'mulches.jpg', 1, 29, 3, NULL, NULL),
(32, 'da84f480-1c24-11ee-9885-89d07af14ba3', 'Soils', 'composts-mulches-soils-amendments/soils', '<h1>SOIL IS LIFE!</h1>\n<p>The ideal soil is made up of a balance between clay, sand, loam, organic matter, minerals, water and air. At Lyngso, we believe in the soil food web with a healthy balance of microorganisms that help the soil be alive, organic, and full of life. We pride ourselves in our extensive knowledge of soil biology and are happy to recommend the right kind of soil for your garden to thrive! See our how to guide on improving your soil\'s structure, feeding your soil, and protecting your soil. Not sure which compost is best for your needs?</p>\n<p>Check out our guide to choosing the right compost for your flower or vegetable garden.</p>', 'soils.jpg', 1, 30, 3, NULL, NULL),
(33, 'da84f548-1c24-11ee-9885-89d07af14ba3', 'Biologicals, Minerals and Liquid Fertilizers', 'biologicals-fertilizers-bagged-soils/biologicals-minerals-liquid-fertilizers', '', 'biological-minerals-liquid-fertilizers.jpg', 1, 31, 4, NULL, NULL),
(34, 'da84f5de-1c24-11ee-9885-89d07af14ba3', 'Down To Earth Single and Blended Fertilizers', 'biologicals-fertilizers-bagged-soils/down-to-earh-fertilizers', '', 'down-to-earth.jpg', 1, 32, 4, NULL, NULL),
(35, 'da84f66a-1c24-11ee-9885-89d07af14ba3', 'Pre-bagged Soils and Composts', 'biologicals-fertilizers-bagged-soils/pre-bagged-soils-composts', '', 'pre-bagged-soils-composts.jpg', 1, 33, 4, NULL, NULL),
(36, 'da84f6e2-1c24-11ee-9885-89d07af14ba3', 'Sheet Mulching Supplies', 'biologicals-fertilizers-bagged-soils/sheet-mulching-supplies', '', 'sheet-mulching-supplies.jpg', 1, 34, 4, NULL, NULL),
(40, 'da84f764-1c24-11ee-9885-89d07af14ba3', 'Pottery', 'pottery-garden-ornaments/pottery', '', 'pottery.jpg', 1, 35, 5, NULL, NULL),
(41, 'da84f85e-1c24-11ee-9885-89d07af14ba3', 'Earthenware Planters', 'pottery-garden-ornaments/pottery/earthware-planters', '', 'earthenware-planters.jpg', 1, 36, 40, NULL, NULL),
(43, 'da84f8e0-1c24-11ee-9885-89d07af14ba3', 'Statuary', 'pottery-garden-ornaments/statuary', '', 'statuary.jpg', 1, 37, 5, NULL, NULL),
(44, 'da84f958-1c24-11ee-9885-89d07af14ba3', 'Columns', 'water-features/columns', '', 'columns.jpg', 1, 38, 6, NULL, NULL),
(45, 'da84f9da-1c24-11ee-9885-89d07af14ba3', 'Basins', 'water-features/basins', '', 'basins.jpg', 1, 39, 6, NULL, NULL),
(46, 'da84fa5c-1c24-11ee-9885-89d07af14ba3', 'Pumps', 'water-features/pumps', '', 'basins.jpg', 1, 40, 6, NULL, NULL),
(47, 'da84fad4-1c24-11ee-9885-89d07af14ba3', 'Plumbing', 'water-features/plumbling', '', 'plumbing.jpg', 1, 41, 6, NULL, NULL),
(48, 'da84fb56-1c24-11ee-9885-89d07af14ba3', 'Lighting', 'water-features/lighting', '', 'lighting.jpg', 1, 42, 6, NULL, NULL),
(49, 'da84fbd8-1c24-11ee-9885-89d07af14ba3', 'Installation Parts', 'water-features/installation-parts', '', 'installation-parts.jpg', 1, 43, 6, NULL, NULL),
(50, 'da84fc5a-1c24-11ee-9885-89d07af14ba3', 'Water Treatments', 'water-features/water-treatments', '<p>Risus feugiat in ante metus dictum. Tincidunt lobortis feugiat vivamus at augue eget. Id donec ultrices tincidunt arcu. Accumsan lacus vel facilisis volutpat est velit egestas. Tortor condimentum lacinia quis vel eros donec ac. In arcu cursus euismod quis viverra nibh cras pulvinar.</p>', 'water-treatments.jpg', 1, 44, 6, NULL, NULL),
(51, 'da84fcfa-1c24-11ee-9885-89d07af14ba3', 'Cement, Grout and Quikrete', 'building-materials-tools/cement-grout-quikrete', '<p>Risus at ultrices mi tempus. Eget duis at tellus at urna condimentum mattis pellentesque id. Quisque non tellus orci ac. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Orci phasellus egestas tellus rutrum. Bibendum est ultricies integer quis. Ornare arcu odio ut sem nulla pharetra. Tortor at auctor urna nunc id. Pretium aenean pharetra magna ac placerat vestibulum lectus mauris. Nisl nisi scelerisque eu ultrices vitae auctor.</p>', 'cement-grout-quikrete.jpg', 1, 45, 7, NULL, NULL),
(52, 'da84fd7c-1c24-11ee-9885-89d07af14ba3', 'Sand(Pre-Bagged)', 'building-materials-tools/pre-bagged-sand', '', 'pre-bagged-sand.jpg', 1, 46, 7, NULL, NULL),
(53, 'da84fdfe-1c24-11ee-9885-89d07af14ba3', 'Stains, Sealers and Cleaners', 'building-materials-tools/stains-sealers-cleaners', '', 'stains-sealers-cleaners.jpg', 1, 47, 7, NULL, NULL),
(54, 'da84fe76-1c24-11ee-9885-89d07af14ba3', 'Structural and Edging', 'building-materials-tools/structural-edging', '', 'structural-and-edging.jpg', 1, 48, 7, NULL, NULL),
(55, 'da84fef8-1c24-11ee-9885-89d07af14ba3', 'tools', 'building-materials-tools/tools', '<p>Id neque aliquam vestibulum morbi blandit cursus risus. Lacinia quis vel eros donec ac odio tempor orci. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. Viverra maecenas accumsan lacus vel facilisis volutpat est velit. Nisi vitae suscipit tellus mauris. Volutpat ac tincidunt vitae semper quis lectus nulla at. Turpis in eu mi bibendum neque egestas congue.</p>', 'construction-tools.jpg', 1, 49, 7, NULL, NULL),
(57, 'da84ff7a-1c24-11ee-9885-89d07af14ba3', 'Calstone', 'precast-concrete/calstone', '', 'calstone.jpg', 1, 51, 8, NULL, NULL),
(58, 'da84fff2-1c24-11ee-9885-89d07af14ba3', 'Step Stone', 'precast-concrete/stepping-stone', '', 'step-stone.jpg', 1, 52, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_categories`
--

CREATE TABLE `category_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `parent_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_categories`
--

INSERT INTO `category_categories` (`id`, `category_id`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 19, 1, NULL, NULL),
(2, 20, 1, NULL, NULL),
(3, 21, 1, NULL, NULL),
(4, 22, 1, NULL, NULL),
(5, 23, 1, NULL, NULL),
(6, 24, 1, NULL, NULL),
(7, 25, 1, NULL, NULL),
(8, 26, 1, NULL, NULL),
(9, 27, 1, NULL, NULL),
(10, 11, 2, NULL, NULL),
(11, 13, 2, NULL, NULL),
(12, 14, 2, NULL, NULL),
(13, 15, 2, NULL, NULL),
(14, 16, 2, NULL, NULL),
(15, 17, 2, NULL, NULL),
(16, 18, 2, NULL, NULL),
(17, 28, 3, NULL, NULL),
(18, 29, 3, NULL, NULL),
(19, 31, 3, NULL, NULL),
(20, 32, 3, NULL, NULL),
(21, 33, 4, NULL, NULL),
(22, 34, 4, NULL, NULL),
(23, 35, 4, NULL, NULL),
(24, 36, 4, NULL, NULL),
(25, 40, 5, NULL, NULL),
(26, 43, 5, NULL, NULL),
(27, 44, 6, NULL, NULL),
(28, 45, 6, NULL, NULL),
(29, 46, 6, NULL, NULL),
(30, 47, 6, NULL, NULL),
(31, 48, 6, NULL, NULL),
(32, 49, 6, NULL, NULL),
(33, 50, 6, NULL, NULL),
(34, 51, 7, NULL, NULL),
(35, 52, 7, NULL, NULL),
(36, 53, 7, NULL, NULL),
(37, 54, 7, NULL, NULL),
(38, 55, 7, NULL, NULL),
(39, 57, 8, NULL, NULL),
(40, 58, 8, NULL, NULL),
(41, 41, 40, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_order` int NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `sku`, `product_order`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'C2BR', 1, 21, 1, NULL, NULL),
(2, '34C2', 2, 21, 2, NULL, NULL),
(3, '14-FB', 1, 28, 5, NULL, NULL),
(4, 'AFBF', 1, 16, 4, NULL, NULL),
(5, '14PG', 2, 20, 3, NULL, NULL),
(6, '1OS', 1, 19, 6, NULL, NULL),
(7, '2OS', 2, 19, 7, NULL, NULL),
(8, 'CS', 3, 19, 8, NULL, NULL),
(9, 'CBSB', 2, 16, 9, NULL, NULL),
(10, 'AL', 3, 16, 10, NULL, NULL),
(11, 'GBLT', 5, 16, 11, NULL, NULL),
(12, 'LGS', 6, 16, 12, NULL, NULL),
(13, '516RL', 2, 28, 13, NULL, NULL),
(14, 'LIGNA PEAT', 3, 28, 14, NULL, NULL),
(15, 'ORGANIC-AMENDMENT', 4, 28, 15, NULL, NULL),
(16, 'RS', 4, 28, 16, NULL, NULL),
(17, 'COMPOST-MULCH', 4, 31, 17, NULL, NULL),
(18, 'GRB', 5, 31, 18, NULL, NULL),
(19, 'MA CHIP', 6, 31, 19, NULL, NULL),
(20, 'MMFB', 7, 31, 20, NULL, NULL),
(21, 'MOCHA CHIP', 8, 31, 21, NULL, NULL),
(22, 'PF', 8, 31, 22, NULL, NULL),
(23, 'PAM', 9, 31, 23, NULL, NULL),
(24, 'SCB', 10, 31, 24, NULL, NULL),
(25, 'SFB', 11, 31, 25, NULL, NULL),
(26, 'WOB', 10, 31, 26, NULL, NULL),
(27, 'TWC', 11, 31, 27, NULL, NULL),
(28, 'AACT', 10, 29, 28, NULL, NULL),
(29, 'BBBC', 10, 29, 29, NULL, NULL),
(30, 'DDOC', 11, 29, 30, NULL, NULL),
(31, 'HOWC', 12, 29, 31, NULL, NULL),
(32, 'SCCOB', 13, 29, 32, NULL, NULL),
(33, 'OBULL', 14, 29, 33, NULL, NULL),
(34, 'OAM', 15, 29, 34, NULL, NULL),
(35, 'DIESTEL', 16, 29, 35, NULL, NULL),
(36, 'OC', 17, 29, 36, NULL, NULL),
(37, 'WEBB', 18, 29, 37, NULL, NULL),
(38, 'BIOSWALE', 19, 32, 38, NULL, NULL),
(39, 'BBBPS', 19, 32, 39, NULL, NULL),
(40, 'BBBPS', 20, 32, 40, NULL, NULL),
(41, 'ES', 21, 32, 41, NULL, NULL),
(42, 'LM', 22, 32, 42, NULL, NULL),
(43, 'OAM', 23, 32, 43, NULL, NULL),
(44, '38-FB', 30, 20, 44, NULL, NULL),
(45, '34CDR', 31, 20, 45, NULL, NULL),
(46, 'BBF', 1, 22, 46, NULL, NULL),
(47, 'BBFS', 1, 22, 47, NULL, NULL),
(48, 'BF', 2, 22, 48, NULL, NULL),
(49, 'BFS', 3, 22, 49, NULL, NULL),
(50, 'DBF', 4, 22, 50, NULL, NULL),
(51, 'SGPF', 5, 22, 51, NULL, NULL),
(52, 'SGPFS', 6, 22, 52, NULL, NULL),
(53, 'SGPFS', 6, 23, 53, NULL, NULL),
(54, 'MBTSC', 7, 23, 54, NULL, NULL),
(55, '1278GGR', 8, 23, 55, NULL, NULL),
(56, '38CBB', 3, 23, 56, NULL, NULL),
(57, '18DG', 3, 23, 57, NULL, NULL),
(58, '38T', 3, 23, 58, NULL, NULL),
(59, '21CBB', 6, 23, 59, NULL, NULL),
(60, '34CDR', 7, 23, 45, NULL, NULL),
(61, '38CRG', 8, 23, 60, NULL, NULL),
(62, '38Y', 9, 23, 61, NULL, NULL),
(63, '24LCC', 1, 24, 62, NULL, NULL),
(64, '112LC', 1, 24, 63, NULL, NULL),
(65, '38LODI', 3, 24, 64, NULL, NULL),
(66, '38PAMI', 4, 24, 65, NULL, NULL),
(67, '12QP', 5, 24, 66, NULL, NULL),
(68, '12SB', 5, 24, 67, NULL, NULL),
(69, 'BYHPP', 1, 25, 68, NULL, NULL),
(70, 'FSHPP', 2, 25, 69, NULL, NULL),
(71, 'HRHPP', 3, 25, 70, NULL, NULL),
(72, 'JGPP', 3, 25, 71, NULL, NULL),
(73, 'KBHPP', 4, 25, 72, NULL, NULL),
(74, 'NPP', 6, 25, 73, NULL, NULL),
(75, 'TFWHPP', 8, 24, 74, NULL, NULL),
(76, 'WGPP', 9, 24, 75, NULL, NULL),
(77, 'WHPP', 10, 24, 76, NULL, NULL),
(78, 'WBHPP', 11, 24, 77, NULL, NULL),
(79, 'AGB', 1, 11, 78, NULL, NULL),
(80, 'AWGB', 1, 11, 79, NULL, NULL),
(81, 'BCSB', 3, 11, 80, NULL, NULL),
(82, 'BCSBD', 4, 11, 81, NULL, NULL),
(83, 'CCB', 6, 11, 83, NULL, NULL),
(84, 'SWP2-3CM', 8, 25, 84, NULL, NULL),
(85, 'TFWHPP', 8, 25, 74, NULL, NULL),
(86, 'WGPP', 9, 25, 75, NULL, NULL),
(87, 'WHPP', 10, 25, 76, NULL, NULL),
(88, 'WBHPP', 11, 25, 77, NULL, NULL),
(89, 'BB1', 1, 26, 85, NULL, NULL),
(90, 'BBBLP', 2, 26, 86, NULL, NULL),
(91, 'BBF', 1, 27, 46, NULL, NULL),
(92, 'BFS', 1, 27, 49, NULL, NULL),
(93, '34C2P', 3, 27, 2, NULL, NULL),
(94, 'C2BR', 5, 27, 1, NULL, NULL),
(95, 'OSM', 6, 27, 87, NULL, NULL),
(96, 'OSTM', 7, 27, 88, NULL, NULL),
(97, 'SGPF', 5, 27, 51, NULL, NULL),
(98, 'TF', 5, 22, 89, NULL, NULL),
(99, 'TF', 5, 27, 89, NULL, NULL),
(100, 'B-BLP', 3, 26, 90, NULL, NULL),
(101, 'B-BUFFLP', 4, 26, 91, NULL, NULL),
(102, 'BT1', 6, 26, 92, NULL, NULL),
(103, 'HTP1-2CM', 7, 26, 93, NULL, NULL),
(104, 'B-LP', 9, 26, 94, NULL, NULL),
(105, 'B-RLP', 9, 26, 95, NULL, NULL),
(106, 'BASALT-C-ND', 1, 44, 96, NULL, NULL),
(107, 'BASALT-NT', 3, 44, 97, NULL, NULL),
(108, 'BASALT-FPT', 3, 44, 98, NULL, NULL),
(109, 'LBASALT-FNT', 6, 44, 99, NULL, NULL),
(110, 'LBASALT-FPT', 8, 44, 100, NULL, NULL),
(111, 'BASALT-FSET', 10, 44, 101, NULL, NULL),
(112, 'BASALT-SCF', 12, 44, 102, NULL, NULL),
(113, 'SWIRL-PAT-BASALT-F', 14, 44, 103, NULL, NULL),
(114, 'CAL-PLANTER', 2, 41, 104, NULL, NULL),
(115, 'CUPER-PLANTER', 3, 41, 105, NULL, NULL),
(116, 'LARKS-PLANTER', 4, 41, 106, NULL, NULL),
(117, 'OAKLAND-PLANTER', 5, 41, 107, NULL, NULL),
(118, 'WC', 1, 51, 108, NULL, NULL),
(119, 'PGG', 2, 51, 109, NULL, NULL),
(120, 'PGT', 2, 51, 110, NULL, NULL),
(121, 'QKS', 3, 51, 111, NULL, NULL),
(122, 'QKFSCM', 4, 51, 112, NULL, NULL),
(123, 'QKFPC', 4, 51, 113, NULL, NULL),
(124, 'QKA', 8, 51, 114, NULL, NULL),
(125, 'OKMM', 10, 51, 115, NULL, NULL),
(126, 'QKM', 12, 51, 116, NULL, NULL),
(127, 'GTS', 14, 51, 117, NULL, NULL),
(128, '47#C', 16, 51, 118, NULL, NULL),
(129, 'QKPMSVMG', 18, 51, 119, NULL, NULL),
(130, 'CGS5035', 2, 54, 120, NULL, NULL),
(131, 'CGS3818', 4, 54, 121, NULL, NULL),
(132, 'GATORNW', 6, 54, 122, NULL, NULL),
(133, 'PBB', 8, 54, 123, NULL, NULL),
(134, '24PBB', 10, 54, 124, NULL, NULL),
(135, 'BBBS', 12, 54, 125, NULL, NULL),
(136, '30S', 2, 52, 126, NULL, NULL),
(137, '20S', 2, 52, 127, NULL, NULL),
(138, '216S', 6, 52, 128, NULL, NULL),
(139, 'AZOMITEP', 1, 33, 129, NULL, NULL),
(140, 'BOBQ', 1, 33, 130, NULL, NULL),
(141, 'BOBUQ', 1, 33, 131, NULL, NULL),
(142, 'BSF', 4, 52, 132, NULL, NULL),
(143, 'QKSANDBAG', 5, 52, 133, NULL, NULL),
(144, 'ATOBL', 2, 11, 134, NULL, NULL),
(145, 'BCBL', 10, 11, 135, NULL, NULL),
(146, 'CCB', 11, 11, 136, NULL, NULL),
(147, 'CFGB', 11, 11, 137, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `UUID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `UUID`, `type`, `image`, `comment`, `created_at`, `updated_at`) VALUES
(51, '10083054-dcbe-11ee-ae44-ea2910d3f243', 'image', 'amendments.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(52, '10086baa-dcbe-11ee-ae44-ea2910d3f243', 'image', 'base-rock.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(53, '100889b4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'basins.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(54, '1008a660-dcbe-11ee-ae44-ea2910d3f243', 'image', 'biological-minerals-liquid-fertilizers.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(55, '1008c190-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blades.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(56, '1008df7c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'bocce-ball-court-materials.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(57, '1008fe3a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'boulders.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(58, '100912da-dcbe-11ee-ae44-ea2910d3f243', 'image', 'calstone.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(59, '10092d92-dcbe-11ee-ae44-ea2910d3f243', 'image', 'cement-grout-quikrete.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(60, '100947dc-dcbe-11ee-ae44-ea2910d3f243', 'image', 'columns.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(61, '100962c6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'compost-mulch.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(62, '100978b0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'compost.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(63, '10099098-dcbe-11ee-ae44-ea2910d3f243', 'image', 'construction-tools.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(64, '1009ad30-dcbe-11ee-ae44-ea2910d3f243', 'image', 'crushed-rock.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(65, '1009d0bc-dcbe-11ee-ae44-ea2910d3f243', 'image', 'decorative-pebbles.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(66, '1009e6a6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'dimensional-stone.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(67, '1009fe16-dcbe-11ee-ae44-ea2910d3f243', 'image', 'down-to-earth.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(68, '100a13d8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'driveway-cubes-cobbles-pavers.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(69, '100a2a12-dcbe-11ee-ae44-ea2910d3f243', 'image', 'drystack-wall-rocks.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(70, '100a41a0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'earthenware-planters.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(71, '100a59ec-dcbe-11ee-ae44-ea2910d3f243', 'image', 'fertilizers-amendments.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(72, '100a6fae-dcbe-11ee-ae44-ea2910d3f243', 'image', 'gravel.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(73, '100a837c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'installation-parts.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(74, '100a96e6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'irregular-flagstone.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(75, '100aafa0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'ledgerstones.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(76, '100ac486-dcbe-11ee-ae44-ea2910d3f243', 'image', 'lighting.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(77, '100ae056-dcbe-11ee-ae44-ea2910d3f243', 'image', 'mulches.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(78, '100af35c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'natural-stone.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(79, '100b185a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'path-fines.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(80, '100b2e30-dcbe-11ee-ae44-ea2910d3f243', 'image', 'plumbing.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(81, '100b42a8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'polished-pebbles.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(82, '100b56f8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'pottery-garden-ornements.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(83, '100b6ada-dcbe-11ee-ae44-ea2910d3f243', 'image', 'pottery.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(84, '100b847a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'pre-bagged-sand.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(85, '100b9a50-dcbe-11ee-ae44-ea2910d3f243', 'image', 'pre-bagged-soils-composts.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(86, '100bad92-dcbe-11ee-ae44-ea2910d3f243', 'image', 'precast-concrete.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(87, '100bc692-dcbe-11ee-ae44-ea2910d3f243', 'image', 'premium-pebbles.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(88, '100bd998-dcbe-11ee-ae44-ea2910d3f243', 'image', 'pumps.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(89, '100bf18a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'sand-grave-decorative-rocks.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(90, '100c0850-dcbe-11ee-ae44-ea2910d3f243', 'image', 'sand.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(91, '100c1caa-dcbe-11ee-ae44-ea2910d3f243', 'image', 'sheet-mulching-supplies.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(92, '100c314a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'soils.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(93, '100c4360-dcbe-11ee-ae44-ea2910d3f243', 'image', 'stains-sealers-cleaners.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(94, '100c56de-dcbe-11ee-ae44-ea2910d3f243', 'image', 'statuary.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(95, '100c7362-dcbe-11ee-ae44-ea2910d3f243', 'image', 'step-stone.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(96, '100c8dfc-dcbe-11ee-ae44-ea2910d3f243', 'image', 'structural-and-edging.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(97, '100ca634-dcbe-11ee-ae44-ea2910d3f243', 'image', 'tools.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(98, '100cc34e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'veneer-panels.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(99, '100cdb7c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'water-features.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(100, '100ceedc-dcbe-11ee-ae44-ea2910d3f243', 'image', 'water-treatments.jpg', 'initial image', '2024-03-07 20:05:36', '2024-03-07 20:05:36'),
(101, '4bdc8526-dcbe-11ee-ae44-ea2910d3f243', 'image', '030LapisLustreSand100.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(102, '4bdcc612-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-1-2-3-1-2GreenAquaCovePebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(103, '4bdce7f0-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-12LinCreekPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(104, '4bdd049c-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2-1BlackLaPazPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(105, '4bdd30e8-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2-1RedLaPazPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(106, '4bdd618a-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-20LapisLustreSand100.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(107, '4bdd8552-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2BlackLaPazPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(108, '4bdda906-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2LinCreekPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(109, '4bddc5ee-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2QuartzPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(110, '4bdde81c-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-2samonBayPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(111, '4bde0d1a-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-8DesertGold.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(112, '4bde2f16-dcbe-11ee-ae44-ea2910d3f243', 'image', '1-olympia-sand.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(113, '4bde4bea-dcbe-11ee-ae44-ea2910d3f243', 'image', '12-78GlacerGreen.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(114, '4bde5ffe-dcbe-11ee-ae44-ea2910d3f243', 'image', '14-fur-bark.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(115, '4bde762e-dcbe-11ee-ae44-ea2910d3f243', 'image', '15-7AutumnSlateTumbledChip.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(116, '4bde8a6a-dcbe-11ee-ae44-ea2910d3f243', 'image', '15-7MidnightBlackSlateTumbledChip.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(117, '4bdea0e0-dcbe-11ee-ae44-ea2910d3f243', 'image', '2-16LapisLustreSand100.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(118, '4bdeb53a-dcbe-11ee-ae44-ea2910d3f243', 'image', '2-3RedLaPazPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(119, '4bdeccaa-dcbe-11ee-ae44-ea2910d3f243', 'image', '2-4LinCreekCobble.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(120, '4bdee01e-dcbe-11ee-ae44-ea2910d3f243', 'image', '2-5-2-8NijiPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(121, '4bdef61c-dcbe-11ee-ae44-ea2910d3f243', 'image', '2-olympia-sand.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(122, '4bdf0b20-dcbe-11ee-ae44-ea2910d3f243', 'image', '21-2CrushedBlackBasalt.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(123, '4bdf21a0-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-11-4FiveSpringsHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(124, '4bdf36ea-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4-1-1-4KuroBlackHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(125, '4bdf5224-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4-1-1-4NijiPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(126, '4bdf6b24-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4DesertGold.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(127, '4bdf821c-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4PamiPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(128, '4bdf97b6-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4QuartzPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(129, '4bdfac56-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-4crushedDrainRock.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(130, '4bdfc0ec-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-5-8FiveSpringsHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(131, '4bdfd5c8-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-5BlackLaPazPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(132, '4bdfe8f6-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8-pea-gravel.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(133, '4be00016-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8CrushedBlackBasalt.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(134, '4be0161e-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8CrushedRoseGold.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(135, '4be031bc-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8CrushedYosemiteTan.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(136, '4be04936-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8DesertGold.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(137, '4be05c78-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8LinCreekCobble.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(138, '4be0710e-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8PamiPebbles.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(139, '4be08388-dcbe-11ee-ae44-ea2910d3f243', 'image', '3-8Taffy.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(140, '4be09a9e-dcbe-11ee-ae44-ea2910d3f243', 'image', '5-16-horticultureLava.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(141, '4be0ad0e-dcbe-11ee-ae44-ea2910d3f243', 'image', '60-LapisLustreSand100.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(142, '4be0c1d6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'AntigoBolder.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(143, '4be0d5a4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'Black Basalt Fines.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(144, '4be0e83c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'BlackOwlBiochar.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(145, '4be1010a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'BlackOwlBiocharEnvironmentalUltra.jpg', 'initial image', '2024-03-07 20:07:16', '2024-03-07 20:07:16'),
(146, '4be11686-dcbe-11ee-ae44-ea2910d3f243', 'image', 'BouquetCanyonBoulders-closeup.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(147, '4be12ce8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'CalistogaPlanter.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(148, '4be15a4c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'CoregravelDriveway.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(149, '4be16be0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'CoregravelPathway.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(150, '4be188c8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'CupertinoPlanter.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(151, '4be19ab6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'FilledBurlapSandBag.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(152, '4be1ae70-dcbe-11ee-ae44-ea2910d3f243', 'image', 'GatorGeotextFabricView.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(153, '4be1bf00-dcbe-11ee-ae44-ea2910d3f243', 'image', 'GatorGeotextileFabric.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(154, '4be1d472-dcbe-11ee-ae44-ea2910d3f243', 'image', 'LarkspurPlanter.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(155, '4be1e796-dcbe-11ee-ae44-ea2910d3f243', 'image', 'LehighWhiteCement94Lbs.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(156, '4be1fab0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'OaklandPlanter.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(157, '4be20f46-dcbe-11ee-ae44-ea2910d3f243', 'image', 'OrganicDiestelStructuredCompost.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(158, '4be2251c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PerkgroutGrey.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(159, '4be23df4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PerkgroutGreyTan.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(160, '4be250e6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PlasticBenderBoard1x4x20.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(161, '4be2645a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PlasticBenderBoard2x4x20.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(162, '4be2754e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PlasticBenderBoardStakes.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(163, '4be2899e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'PrefilledPokyWovenSanBag50lbs.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(164, '4be2a4f6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteBaseCoatStucco60Lbs.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(165, '4be2bd4c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteBaseCoatStucco80Lbs.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(166, '4be2d084-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteFencePostMix80Lbs.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(167, '4be2e420-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteHighPerformanceBlacktopRepair50.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(168, '4be2f5e6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteMasonsMix80.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(169, '4be308e2-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteMortarMix80.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(170, '4be31a4e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikretePlasticCement94.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(171, '4be330a6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikretePortlandCement94.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(172, '4be34488-dcbe-11ee-ae44-ea2910d3f243', 'image', 'QuikreteThinSetSandedGray50.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(173, '4be36544-dcbe-11ee-ae44-ea2910d3f243', 'image', 'activelyAeratedCompostTea.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(174, '4be37e1c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'amadorGraniteBoulders.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(175, '4be392da-dcbe-11ee-ae44-ea2910d3f243', 'image', 'arizona-flagstone-buckskin.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(176, '4be3a8f6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'atwaterGraniteBoulder.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(177, '4be3bb8e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'azomitePowder.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(178, '4be3cfac-dcbe-11ee-ae44-ea2910d3f243', 'image', 'azure-limestone.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(179, '4be3e80c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'babyBuBiodynamicPottingSoil.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(180, '4be3fe6e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'basaltColumnsSawnBottom-Drilled.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(181, '4be414a8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'basaltColumnsSawnBottom.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(182, '4be42a9c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'biotreatmentSoilMix.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(183, '4be444b4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blackAquaCovePebbles1.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(184, '4be4590e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blackAquaCovePebbles3.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(185, '4be48f3c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blackAquaCovePebbles5.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(186, '4be4a472-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blackBasaltFines.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(187, '4be4ba98-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blackBasaltFinesStabilized.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(188, '4be4cdb2-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blueFines.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(189, '4be4e16c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'blueFinesStabilized.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(190, '4be4f31e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'bouquetCanyonBoulders.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(191, '4be50782-dcbe-11ee-ae44-ea2910d3f243', 'image', 'buckthornYellowHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(192, '4be51cfe-dcbe-11ee-ae44-ea2910d3f243', 'image', 'busBlendBiodynamicCompost.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(193, '4be532ca-dcbe-11ee-ae44-ea2910d3f243', 'image', 'chiefcliffBoulders.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(194, '4be5472e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'class2baserock.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(195, '4be5601a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'class2permeableBaserock.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(196, '4be57cf8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'compostMulch.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(197, '4be59472-dcbe-11ee-ae44-ea2910d3f243', 'image', 'concrete-sand.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(198, '4be5a6ba-dcbe-11ee-ae44-ea2910d3f243', 'image', 'connecticut-blue-stone.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(199, '4be5b934-dcbe-11ee-ae44-ea2910d3f243', 'image', 'crushedBlackBasalt.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(200, '4be5cc4e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'default_image.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(201, '4be5e12a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'default_thumbnail.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(202, '4be5f8ea-dcbe-11ee-ae44-ea2910d3f243', 'image', 'desertBrownFines.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(203, '4be60b14-dcbe-11ee-ae44-ea2910d3f243', 'image', 'doubleDoodyOrganicCompost.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(204, '4be6211c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'downToEarchAllNaturalPottingSoil.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(205, '4be63ddc-dcbe-11ee-ae44-ea2910d3f243', 'image', 'essentialSoil.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(206, '4be64e58-dcbe-11ee-ae44-ea2910d3f243', 'image', 'groundRedwoodBark.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(207, '4be6606e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'hennaRedHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(208, '4be67284-dcbe-11ee-ae44-ea2910d3f243', 'image', 'heritageOrganics.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(209, '4be6858a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'jadeGreenHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(210, '4be69692-dcbe-11ee-ae44-ea2910d3f243', 'image', 'landScapeMix.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(211, '4be6a9d4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'lingaPeat.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(212, '4be6bc08-dcbe-11ee-ae44-ea2910d3f243', 'image', 'lodiPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(213, '4be6ccb6-dcbe-11ee-ae44-ea2910d3f243', 'image', 'luna-gray-sandstone.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(214, '4be6de36-dcbe-11ee-ae44-ea2910d3f243', 'image', 'mahoganyChip.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(215, '4be6ee4e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'miniMulchFirBark.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(216, '4be7003c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'mochaChip.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(217, '4be71036-dcbe-11ee-ae44-ea2910d3f243', 'image', 'oneQuarterInchPeaGravel.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(218, '4be72080-dcbe-11ee-ae44-ea2910d3f243', 'image', 'oregonBullOrganicAgedHumus.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(219, '4be7323c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'organicAmendmentMix.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(220, '4be74fe2-dcbe-11ee-ae44-ea2910d3f243', 'image', 'organicAmendmentMix.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(221, '4be7654a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'organicDiestalStructuredCompost.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(222, '4be778b4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'organicGreenWasteGardenCompost.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(223, '4be78aac-dcbe-11ee-ae44-ea2910d3f243', 'image', 'osterShellFlour.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(224, '4be7a5f0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'oysterShellBocceBlend.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(225, '4be7c4ae-dcbe-11ee-ae44-ea2910d3f243', 'image', 'playgroundFiber.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(226, '4be7d7c8-dcbe-11ee-ae44-ea2910d3f243', 'image', 'premiumArborMulch.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(227, '4be7eed4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'redwoodSawdust.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(228, '4be7ffaa-dcbe-11ee-ae44-ea2910d3f243', 'image', 'samonBayPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(229, '4be81242-dcbe-11ee-ae44-ea2910d3f243', 'image', 'seaCoastCompost.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(230, '4be823e0-dcbe-11ee-ae44-ea2910d3f243', 'image', 'shreddedCedarBark.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(231, '4be83704-dcbe-11ee-ae44-ea2910d3f243', 'image', 'smallFirBark.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(232, '4be847e4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'snowWhitePebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(233, '4be85dba-dcbe-11ee-ae44-ea2910d3f243', 'image', 'sunsetGoldPathFines-stabliized.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(234, '4be86d28-dcbe-11ee-ae44-ea2910d3f243', 'image', 'sunsetGoldPathFines.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(235, '4be88006-dcbe-11ee-ae44-ea2910d3f243', 'image', 'taffyFine.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(236, '4be891ae-dcbe-11ee-ae44-ea2910d3f243', 'image', 'tufaWhiteHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(237, '4be8a4b4-dcbe-11ee-ae44-ea2910d3f243', 'image', 'walkOnBark.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(238, '4be8b59e-dcbe-11ee-ae44-ea2910d3f243', 'image', 'wasabiGreenPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(239, '4be8c61a-dcbe-11ee-ae44-ea2910d3f243', 'image', 'webRanchPremiumCompost.png', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(240, '4be8d970-dcbe-11ee-ae44-ea2910d3f243', 'image', 'woodChips.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(241, '4be8e99c-dcbe-11ee-ae44-ea2910d3f243', 'image', 'woodgrainHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17'),
(242, '4be8fe96-dcbe-11ee-ae44-ea2910d3f243', 'image', 'wuyiBrownHighPolishPebbles.jpg', 'initial image', '2024-03-07 20:07:17', '2024-03-07 20:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_08_180429_create_categories_table', 2),
(6, '2023_06_09_010109_create_products_table', 2),
(7, '2023_06_09_162037_create_prices_table', 2),
(8, '2023_06_09_163048_create_categories_products_table', 2),
(9, '2023_06_26_123152_create_carts', 3),
(10, '2023_06_26_165240_create_cart_items', 4),
(11, '2023_06_30_165817_add_columns_to_users_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2023_09_15_172519_create_user_phone_number', 7),
(14, '2023_10_21_005702_create_category_categories', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cart_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_rate` decimal(8,0) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `delivery_instructions` text,
  `purchase_order` varchar(50) DEFAULT NULL,
  `requested_delivery_date` date DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `manual_address` json DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `is_delivery` tinyint(1) DEFAULT '0',
  `is_pickup` tinyint(1) DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_delivered` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `confirm_order` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bernietwo@test.com', '$2y$10$Gj1IVij.dj1CA4F8N6gz7uQS2YA2lWqzWiPTuwYj9gQqgdHampWea', '2023-08-21 23:20:41'),
('joseph@nativemeadow.com', '$2y$10$bFeU3Zo89gx6DXKX1D66xeb2hf4QnxeTOFXIBShVAurVHZFntDSAu', '2023-08-21 23:59:14'),
('bernyone@test.com', '$2y$10$Fg50X9aR8CbwytsYvqACXOm4Hk2u6Li3GQCUwWcpCYna0uDkWNAb.', '2023-09-14 03:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `units` text COLLATE utf8mb4_unicode_ci,
  `coverage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coverage_value` decimal(10,2) DEFAULT NULL,
  `online_minimum` decimal(10,2) DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `uuid`, `sku`, `title`, `description`, `image`, `price`, `size`, `units`, `coverage`, `coverage_value`, `online_minimum`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '09d1a86e-1c25-11ee-9885-89d07af14ba3', 'C2BR', 'Class 2 Base Rock U-sack', 'Per U-sack', NULL, '2.25', NULL, 'sk', 'Ton/Yard', '1.35', '3.75', 1, NULL, NULL),
(2, '09d1ad00-1c25-11ee-9885-89d07af14ba3', 'C2BR', 'Class 2 Base Rock', 'Per Ton', NULL, '31.50', NULL, 'ton', 'Ton/Yard', '1.35', '3.75', 1, NULL, NULL),
(3, '09d1ae9a-1c25-11ee-9885-89d07af14ba3', '34C2P', 'Class 2 Base Rock Permeable U-sack', 'Per U-Sack', NULL, '5.25', NULL, 'sk', 'Ton/Yard', '1.25', '3.75', 2, NULL, NULL),
(4, '09d1afe4-1c25-11ee-9885-89d07af14ba3', '34C2P', 'Class 2 Base Rock Permeable', 'Per Ton', NULL, '77.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.75', 2, NULL, NULL),
(5, '09d1b12e-1c25-11ee-9885-89d07af14ba3', '14PG', '1/4\" Pea Gravel U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.25', '2.50', 3, NULL, NULL),
(6, '09d1b264-1c25-11ee-9885-89d07af14ba3', '14PG', '1/4\" Pea Gravel ', 'Per Ton', NULL, '84.95', NULL, 'ton', 'Ton/Yard', '1.25', '2.50', 3, NULL, NULL),
(7, '09d1b3a4-1c25-11ee-9885-89d07af14ba3', 'AFBF', 'Arizona Flagstone - Buckskin', 'Per Lb', NULL, '0.23', 'Per Lb', 'lbs', NULL, NULL, '1.00', 4, NULL, NULL),
(8, '09d1b4ee-1c25-11ee-9885-89d07af14ba3', 'AFBF', 'Arizona Flagstone - Buckskin', 'Per Ton', NULL, '450.00', 'Per ton', 'ton', NULL, NULL, '1.00', 4, NULL, NULL),
(9, '09d1b70a-1c25-11ee-9885-89d07af14ba3', '14-FB', '1/4\" Minus Fir Bark U-sack', 'Per U-Sack ', NULL, '4.50', NULL, 'sk', 'Ton/Yard', '0.16', '2.50', 5, NULL, NULL),
(10, '09d1b840-1c25-11ee-9885-89d07af14ba3', '14-FB', '1/4\" Minus Fir Bark ', 'Per Yard', NULL, '75.50', NULL, 'yd', 'Ton/Yard', '0.16', '2.50', 5, NULL, NULL),
(11, '09d1b9b2-1c25-11ee-9885-89d07af14ba3', '1OS', '#1 Olympia Sand Sack U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 6, NULL, NULL),
(12, '09d1bb2e-1c25-11ee-9885-89d07af14ba3', '1OS', '#1 Olympia Sand', 'Per Ton', NULL, '103.95', 'Ton', 'ton', 'Ton/Yard', '1.25', '3.25', 6, NULL, NULL),
(13, '09d1bc64-1c25-11ee-9885-89d07af14ba3', '2OS', '#2 Olympia Sand U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 7, NULL, NULL),
(14, '09d1bdae-1c25-11ee-9885-89d07af14ba3', '2OS', '#2 Olympia Sand', 'Per Ton', NULL, '103.95', 'Ton', 'ton', 'Ton/Yard', '1.25', '3.25', 7, NULL, NULL),
(15, '09d1bee4-1c25-11ee-9885-89d07af14ba3', 'CS', 'Concrete Sand U-sack', 'Per U-Sack', NULL, '5.00', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 8, NULL, NULL),
(16, '09d1c024-1c25-11ee-9885-89d07af14ba3', 'CS', 'Concrete Sand Per Ton ', 'Per Ton', NULL, '99.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 8, NULL, NULL),
(17, '09d1c2fe-1c25-11ee-9885-89d07af14ba3', 'CBSB', 'Connecticut Bluestone, True Blue full Pallet Only', 'Full Pallet', NULL, '950.00', 'pallet', 'pallet', '100-100 / Ton', NULL, '1.00', 9, NULL, NULL),
(18, '09d1c4fc-1c25-11ee-9885-89d07af14ba3', 'AL', 'Azure Limestone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 10, NULL, NULL),
(19, '09d1c664-1c25-11ee-9885-89d07af14ba3', 'AL', 'Azure Limestone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 10, NULL, NULL),
(20, '09d1c7a4-1c25-11ee-9885-89d07af14ba3', 'GBLT', 'Galaxy Black Limestone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 11, NULL, NULL),
(21, '09d1c8e4-1c25-11ee-9885-89d07af14ba3', 'GBLT', 'Galaxy Black Limestone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 11, NULL, NULL),
(22, '09d1ca10-1c25-11ee-9885-89d07af14ba3', 'LGS', 'Luna Grey Sandstone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 12, NULL, NULL),
(23, '09d1cb50-1c25-11ee-9885-89d07af14ba3', 'LGS', 'Luna Grey Sandstone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 12, NULL, NULL),
(24, '09d1cc7c-1c25-11ee-9885-89d07af14ba3', '516RL', '5/16\" Lava Sack', 'Per U-Sack', NULL, '6.50', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 13, NULL, NULL),
(25, '09d1cdd0-1c25-11ee-9885-89d07af14ba3', '516RL', '5/16\" Lava Aprox.1350 Lb/yd ', 'Per Yard', NULL, '109.95', NULL, 'yd', 'Lb/yd', '0.65', '2.50', 13, NULL, NULL),
(26, '09d1cf60-1c25-11ee-9885-89d07af14ba3', 'LIGNA PEAT', 'U-sack Ligna Peat', 'Per U-Sack', NULL, '3.95', NULL, 'sk', 'Lb/yd', '0.15', '2.50', 14, NULL, NULL),
(27, '09d1d0e6-1c25-11ee-9885-89d07af14ba3', 'LIGNA PEAT', 'Ligna Peat Amendment', 'Per U-Sack', NULL, '57.95', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 14, NULL, NULL),
(28, '09d1d186-1c25-11ee-9885-89d07af14ba3', 'ORGANIC-AMENDMENT', 'U-sack Amendment Mix', 'Per U-Sack', NULL, '3.25', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 15, NULL, NULL),
(29, '09d1d212-1c25-11ee-9885-89d07af14ba3', 'ORGANIC-AMENDMENT', 'Amendment Mix', 'Per Yard', NULL, '41.50', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 15, NULL, NULL),
(30, '09d1d29e-1c25-11ee-9885-89d07af14ba3', 'RS', 'U Sack Redwood Sawdust', 'Per U-Sack', NULL, '3.50', NULL, 'sk', 'Lb/yd', '0.29', '2.50', 16, NULL, NULL),
(31, '09d1d32a-1c25-11ee-9885-89d07af14ba3', 'RS', 'Redwood Sawdust ', 'Per Yard', NULL, '42.50', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 16, NULL, NULL),
(32, '09d1d3b6-1c25-11ee-9885-89d07af14ba3', 'COMPOST-MULCH', 'Composted Mulch - Limited Quantity', 'Per U-Sack', NULL, '3.00', NULL, 'sk', 'Lb/yd', '0.29', '2.50', 17, NULL, NULL),
(33, '09d1d442-1c25-11ee-9885-89d07af14ba3', 'COMPOST-MULCH', 'Composted Mulch', 'Per Yard', NULL, '78.00', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 17, NULL, NULL),
(34, '09d1d4ce-1c25-11ee-9885-89d07af14ba3', 'GRB', 'Ground Redwood Bark Sack', 'Per U-Sack', NULL, '3.75', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 18, NULL, NULL),
(35, '09d1d55a-1c25-11ee-9885-89d07af14ba3', 'GRB', 'Ground Redwood Bark Double Grind ', 'Per Yard', NULL, '51.00', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 18, NULL, NULL),
(36, '09d1d5e6-1c25-11ee-9885-89d07af14ba3', 'MA CHIP', 'U-sack Mahogany Chip', 'Per U-Sack', NULL, '4.35', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 19, NULL, NULL),
(37, '09d1d672-1c25-11ee-9885-89d07af14ba3', 'MA CHIP', 'Mahogany Chip', 'Per Yard', NULL, '71.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 19, NULL, NULL),
(38, '09d1d6fe-1c25-11ee-9885-89d07af14ba3', 'MMFB', 'Mini Mulch Fir Bark Sack', 'Per U-Sack', NULL, '4.95', NULL, 'sk', 'Lb/yd', '0.25', '2.50', 20, NULL, NULL),
(39, '09d1d780-1c25-11ee-9885-89d07af14ba3', 'MMFB', 'Mini Mulch Fir Bark', 'Per Yard', NULL, '87.50', NULL, 'yd', 'Lb/yd', '0.25', '2.50', 20, NULL, NULL),
(40, '09d1d834-1c25-11ee-9885-89d07af14ba3', 'MOCHA CHIP', 'U-sack Mocha Chip 1cf Bag ', 'Per U-Sack', NULL, '4.20', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 21, NULL, NULL),
(41, '09d1d8fc-1c25-11ee-9885-89d07af14ba3', 'MOCHA CHIP', 'Mocha Chip', 'Per Yard', NULL, '59.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 21, NULL, NULL),
(42, '09d1d992-1c25-11ee-9885-89d07af14ba3', 'PF', 'U-sack Playground Fibe', 'Per U-Sack', NULL, '4.25', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 22, NULL, NULL),
(43, '09d1da78-1c25-11ee-9885-89d07af14ba3', 'PF', 'Playground Fiber', 'Per Yard', NULL, '73.75', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 22, NULL, NULL),
(44, '09d1db0e-1c25-11ee-9885-89d07af14ba3', 'PAM', 'U-sack Premium Arbor Mulch', 'Per U-Sack', NULL, '2.75', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 23, NULL, NULL),
(45, '09d1db9a-1c25-11ee-9885-89d07af14ba3', 'PAM', 'Premium Arbor Mulch', 'Per Yard', NULL, '36.00', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 23, NULL, NULL),
(46, '09d1dc30-1c25-11ee-9885-89d07af14ba3', 'SCB', 'Shredded Cedar Bark', 'Per U-Sack', NULL, '3.85', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 24, NULL, NULL),
(47, '09d1de74-1c25-11ee-9885-89d07af14ba3', 'SCB', 'Shredded Cedar Bark', 'Per Yard', NULL, '55.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 24, NULL, NULL),
(48, '09d1df28-1c25-11ee-9885-89d07af14ba3', 'SFB', 'Small Fir Bark Sack', 'Per U-Sack', NULL, '4.95', NULL, 'sk', 'Lb/yd', '0.26', '2.50', 25, NULL, NULL),
(49, '09d1dfb4-1c25-11ee-9885-89d07af14ba3', 'SFB', 'Small Fir Bark 3/4\"-1-1/2\"', 'Per Yard', NULL, '87.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 25, NULL, NULL),
(50, '09d1e04a-1c25-11ee-9885-89d07af14ba3', 'WOB', 'U-sack Walk On Bark', 'Per U-Sack', NULL, '4.45', NULL, 'sk', 'Lb/yd', '0.25', '2.50', 26, NULL, NULL),
(51, '09d1e0d6-1c25-11ee-9885-89d07af14ba3', 'WOB', 'Walk On Bark', 'Per Yard', NULL, '71.00', NULL, 'yd', 'Lb/yd', '0.25', '2.50', 26, NULL, NULL),
(52, '09d1e162-1c25-11ee-9885-89d07af14ba3', 'TWC', 'U-sack Wood Chips', 'Per U-Sack', NULL, '3.45', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 27, NULL, NULL),
(53, '09d1e1ee-1c25-11ee-9885-89d07af14ba3', 'TWC', 'Wood Chips ', 'Per Yard', NULL, '42.75', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 27, NULL, NULL),
(54, '09d1e2ac-1c25-11ee-9885-89d07af14ba3', 'AACT', 'Actively Aerated Compost Tea', 'Per GL', NULL, '12.00', NULL, 'gl', 'gl', NULL, '2.50', 28, NULL, NULL),
(55, '09d1e342-1c25-11ee-9885-89d07af14ba3', 'BBBC', 'Bu\'s Blend Compost Pre Bag 1 Cf', 'Per Cubic Foot', NULL, '19.99', NULL, 'cu ft', 'cf', NULL, '2.50', 29, NULL, NULL),
(56, '09d1e3ce-1c25-11ee-9885-89d07af14ba3', 'DDOC', 'Double Doody Organic Compost', 'EA', NULL, '13.50', NULL, 'EA', 'cf', NULL, '2.50', 30, NULL, NULL),
(57, '09d1e45a-1c25-11ee-9885-89d07af14ba3', 'HOWC', 'Heritage Organics Worm Castings', 'EA', NULL, '24.00', NULL, 'EA', 'cf', NULL, '2.50', 31, NULL, NULL),
(58, '09d1e4dc-1c25-11ee-9885-89d07af14ba3', 'SCCOB', 'Seacoast Biodynamic Compost ', 'EA', NULL, '26.50', NULL, 'EA', 'cf', NULL, '2.50', 32, NULL, NULL),
(59, '09d1e568-1c25-11ee-9885-89d07af14ba3', 'OBULL', 'Oregon Bull Organic Aged Humus ', 'Per U-Sack', NULL, '12.50', NULL, 'sk', 'Lb/yd', '0.75', '2.50', 33, NULL, NULL),
(60, '09d1e5f4-1c25-11ee-9885-89d07af14ba3', 'OBULL', 'Oregon Bull Organic Aged Humus', 'Per Yard', NULL, '255.00', NULL, 'yd', 'Lb/yd', '0.75', '2.50', 33, NULL, NULL),
(61, '09d1e68a-1c25-11ee-9885-89d07af14ba3', 'OAM', 'U-sack Amendment Mix', 'Per U-Sack', NULL, '3.25', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 34, NULL, NULL),
(62, '09d1e716-1c25-11ee-9885-89d07af14ba3', 'OAM', 'Amendment Mix', 'Per Yard', NULL, '41.00', NULL, 'yd', 'Lb/yd', '0.75', '2.50', 34, NULL, NULL),
(63, '09d1e7a2-1c25-11ee-9885-89d07af14ba3', 'DIESTEL', 'Diestel Structured Compost U-sk', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 35, NULL, NULL),
(64, '09d1e82e-1c25-11ee-9885-89d07af14ba3', 'DIESTEL', 'Diestel Structured Compost', 'Per Yard', NULL, '162.95', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 35, NULL, NULL),
(65, '09d1e8ba-1c25-11ee-9885-89d07af14ba3', 'OC', 'U-sk Garden Compost /green Waste', 'Per U-Sack', NULL, '3.50', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 36, NULL, NULL),
(66, '09d1e946-1c25-11ee-9885-89d07af14ba3', 'OC', 'Garden Compost / Green Waste', 'Per Yard', NULL, '40.50', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 36, NULL, NULL),
(67, '09d1e9d2-1c25-11ee-9885-89d07af14ba3', 'WEBB', 'U-sack Webb Ranch Compost ', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 37, NULL, NULL),
(68, '09d1ea90-1c25-11ee-9885-89d07af14ba3', 'WEBB', 'Webb Ranch Organic Compost ', 'Per Yard', NULL, '140.95', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 37, NULL, NULL),
(69, '09d1eb30-1c25-11ee-9885-89d07af14ba3', 'BIOSWALE', 'Biotreatment Soil Mix', 'Per Yard', NULL, '72.00', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 38, NULL, NULL),
(70, '09d1ebbc-1c25-11ee-9885-89d07af14ba3', 'BBBPS', 'Baby Bu Potting Mix 1 1/2 Cu Ft', 'Cubic Foot', NULL, '72.00', NULL, 'cu ft', 'cu ft', '0.50', '2.50', 39, NULL, NULL),
(71, '09d1ec48-1c25-11ee-9885-89d07af14ba3', 'DEANPP', 'All Natural Potting Soil 1.5 Cu Ft', 'Cubic Foot', NULL, '19.00', NULL, 'cu ft', 'cu ft', '0.50', '2.50', 40, NULL, NULL),
(72, '09d1ecde-1c25-11ee-9885-89d07af14ba3', 'ES', 'Essential Soil Blend Usack', 'Per U-sack', NULL, '5.00', NULL, 'sk', 'ton/yd', '0.95', '2.50', 41, NULL, NULL),
(73, '09d1ed6a-1c25-11ee-9885-89d07af14ba3', 'ES', 'Essential Soil Blend', 'Per Yard', NULL, '99.99', NULL, 'yd', 'ton/yd', '0.95', '2.50', 41, NULL, NULL),
(74, '09d1edf6-1c25-11ee-9885-89d07af14ba3', 'LM', 'U-sack Landscape Mix', 'Per U-sack', NULL, '3.75', NULL, 'sk', 'ton/yd', '0.85', '2.50', 42, NULL, NULL),
(75, '09d1ee82-1c25-11ee-9885-89d07af14ba3', 'LM', 'Landscape Mix', 'Per Yard', NULL, '62.00', NULL, 'yd', 'ton/yd', '0.85', '2.50', 42, NULL, NULL),
(76, '09d1f0b2-1c25-11ee-9885-89d07af14ba3', 'OAM', 'U-sack Amendment Mix', 'Per U-sack', NULL, '3.25', NULL, 'sk', 'ton/yd', '0.85', '2.50', 43, NULL, NULL),
(77, '09d1f148-1c25-11ee-9885-89d07af14ba3', 'OAM', 'Amendment Mix', 'Per Yard', NULL, '41.50', NULL, 'yd', 'ton/yd', '0.85', '2.50', 43, NULL, NULL),
(78, '09d1f1d4-1c25-11ee-9885-89d07af14ba3', '38PG', '3/8&quot; Pea Gravel U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 44, NULL, NULL),
(79, '09d1f260-1c25-11ee-9885-89d07af14ba3', '38PG', '3/8&quot; Pea Gravel ', 'Per Ton', NULL, '84.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 44, NULL, NULL),
(80, '09d1f2ec-1c25-11ee-9885-89d07af14ba3', '34CDR', '3/4\" Crushed Drain Rock/u-sack', 'Per U-Sack', NULL, '5.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 45, NULL, NULL),
(81, '09d1f3a0-1c25-11ee-9885-89d07af14ba3', '34CDR', '3/4\" Crushed D/r', 'Per Ton', NULL, '77.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 45, NULL, NULL),
(82, '09d1f59e-1c25-11ee-9885-89d07af14ba3', 'BBF', 'U Sack Black Basalt Fines', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Ton/Yard', '1.50', '3.75', 46, NULL, NULL),
(83, '09d1f634-1c25-11ee-9885-89d07af14ba3', 'BBF', 'Black Basalt Fines', 'Per Ton', NULL, '118.50', NULL, 'ton', 'Ton/Yard', '1.50', '3.75', 46, NULL, NULL),
(84, '09d1f6b6-1c25-11ee-9885-89d07af14ba3', 'BBFS', 'Black Basalt Fines Stabilized', 'Per Ton', NULL, '168.00', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 47, NULL, NULL),
(85, '09d1f74c-1c25-11ee-9885-89d07af14ba3', 'BF', 'Blue Fines U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.50', '1.00', 48, NULL, NULL),
(86, '09d1f7ce-1c25-11ee-9885-89d07af14ba3', 'BF', 'Blue Fines', 'Per Ton', NULL, '91.50', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 48, NULL, NULL),
(87, '09d1fa30-1c25-11ee-9885-89d07af14ba3', 'BFS', 'Blue Fines Stabilized', 'Per Ton', NULL, '158.00', NULL, 'ton', 'Ton/Yard', '1.50', '3.75', 49, NULL, NULL),
(88, '09d1fabc-1c25-11ee-9885-89d07af14ba3', 'DBF', 'Desert Brown Fines', 'Per Ton', NULL, '350.00', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 50, NULL, NULL),
(89, '09d2044e-1c25-11ee-9885-89d07af14ba3', 'SGPF', 'U-sack Sunset Gold Path Fines', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Ton/Yard', '1.40', '3.75', 51, NULL, NULL),
(90, '09d20818-1c25-11ee-9885-89d07af14ba3', 'SGPF', 'Sunset Gold Path Fines', 'Per Ton', NULL, '128.95', NULL, 'ton', 'Ton/Yard', '1.40', '3.75', 51, NULL, NULL),
(91, '09d2096c-1c25-11ee-9885-89d07af14ba3', 'SGPFS', 'Sunset Gold Path Fines Stabilized', 'Per Ton', NULL, '168.00', NULL, 'ton', 'Ton/Yard', '1.40', '1.00', 52, NULL, NULL),
(92, '09d20aa2-1c25-11ee-9885-89d07af14ba3', 'SGPF', 'U-sk Stabilized Sunset Gold Fine', 'Per U-Sack', NULL, '9.75', NULL, 'sk', 'Ton/Yard', '1.40', '1.00', 52, NULL, NULL),
(93, '09d20d2c-1c25-11ee-9885-89d07af14ba3', 'ASTC', 'U-sack Autumn Sl Tumbled Chips', 'Per U-Sack', NULL, '68.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 53, NULL, NULL),
(94, '09d20e94-1c25-11ee-9885-89d07af14ba3', 'ASTC', '1.5\"-7\" Autumn Slate Tumble Chip', 'Per Ton', NULL, '1750.00', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 53, NULL, NULL),
(95, '09d21150-1c25-11ee-9885-89d07af14ba3', 'MBTSC', 'U-sack Midnight Blk Tumble Chips ', 'Per U-Sack', NULL, '68.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 54, NULL, NULL),
(96, '09d213f8-1c25-11ee-9885-89d07af14ba3', 'MBTSC', 'Midnight Blk Tmbl Chips 1.5\"-7', 'Per Ton', NULL, '1750.00', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 54, NULL, NULL),
(97, '09d2165a-1c25-11ee-9885-89d07af14ba3', '1278GGR', 'U-sack Glacier Green 1/2\"-7/8\"', 'Per U-Sack', NULL, '20.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 55, NULL, NULL),
(98, '09d21952-1c25-11ee-9885-89d07af14ba3', '1278GGR', 'Glacier Green Rock 1/2\"-7/8\"', 'Per Ton', NULL, '374.95', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 55, NULL, NULL),
(99, '09d21e48-1c25-11ee-9885-89d07af14ba3', '38CBB', 'Crushed Black Basalt U-sack ', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 56, NULL, NULL),
(100, '09d21fc4-1c25-11ee-9885-89d07af14ba3', '38CBB', '3/8\" Crushed Black Basalt Rock', '3/8\"', '3-8CrushedBlackBasalt.jpg', '111.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 56, NULL, NULL),
(101, '09d22104-1c25-11ee-9885-89d07af14ba3', '14CBB', '1/4\" Crushed Black Basalt Rock', '1/4\"', NULL, '111.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 56, NULL, NULL),
(102, '09d221a4-1c25-11ee-9885-89d07af14ba3', '18DG', '1/8\" Desert Gold Sack ', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 57, NULL, NULL),
(103, '09d22230-1c25-11ee-9885-89d07af14ba3', '14DG', '1/4\" Desert Gold (nets 1/8\") ', '1/8\"', '1-8DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57, NULL, NULL),
(104, '09d222c6-1c25-11ee-9885-89d07af14ba3', '38DG', '3/8\" Desert Gold', '3/8\"', '3-8DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57, NULL, NULL),
(105, '09d2235c-1c25-11ee-9885-89d07af14ba3', '34DG', '3/4\" Desert Gold', '3/4\"', '3-4DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57, NULL, NULL),
(106, '09d223e8-1c25-11ee-9885-89d07af14ba3', '38T', '3/8\" Taffy Per U-sack', 'Per U-Sack', NULL, '9.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 58, NULL, NULL),
(107, '09d2249c-1c25-11ee-9885-89d07af14ba3', '38T', '3/8\" Taffy Rock (minus) ', '3/8\"', NULL, '155.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 58, NULL, NULL),
(108, '09d22532-1c25-11ee-9885-89d07af14ba3', '21CBB', '2 1/2\" Crushed Black Basalt Sack ', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 59, NULL, NULL),
(109, '09d225be-1c25-11ee-9885-89d07af14ba3', '21CBB', '2 1/2\" Crushed Black Basalt Rock ', '21/2\"', NULL, '132.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 59, NULL, NULL),
(110, '09d22654-1c25-11ee-9885-89d07af14ba3', '38CRG', '3/8 Crushed Rose Gold (minus)', '3/8', NULL, '249.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 60, NULL, NULL),
(111, '09d226e0-1c25-11ee-9885-89d07af14ba3', '38Y', '3/8\" Yosemite Tan Per U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 61, NULL, NULL),
(112, '09d2276c-1c25-11ee-9885-89d07af14ba3', '38Y', '3/8\" Crushed Yosemite Tan', '21/2\"', NULL, '106.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 61, NULL, NULL),
(113, '09d227f8-1c25-11ee-9885-89d07af14ba3', '24LC', '2 X 4 Lin Creek Cobbles Sack', 'Per U-Sack', NULL, '11.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 62, NULL, NULL),
(114, '09d2288e-1c25-11ee-9885-89d07af14ba3', '24LCC', '2 X 4 Lin Creek Cobbles', '2\"/4\"', '2-4LinCreekCobble.jpg', '199.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 62, NULL, NULL),
(115, '09d2291a-1c25-11ee-9885-89d07af14ba3', '38LCC', '3 X 8 Lin Creek Cobbles', '3\"/8\"', '3-8LinCreekCobble.jpg', '199.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 62, NULL, NULL),
(116, '09d229b0-1c25-11ee-9885-89d07af14ba3', '12LC', 'U-sack 1 1/2\" Lin Creek Pebbles', 'Per U-Sack', NULL, '10.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 63, NULL, NULL),
(117, '09d22a3c-1c25-11ee-9885-89d07af14ba3', '24LC', '2 X 4 Lin Creek Cobbles', '2\"/4\"', '1-12LinCreekPebbles.jpg', '179.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 63, NULL, NULL),
(118, '09d22af0-1c25-11ee-9885-89d07af14ba3', '112LC', '1/2\" Lin Creek Pebbles', '1/2\"', '1-2LinCreekPebbles.jpg', '179.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 63, NULL, NULL),
(119, '09d22b90-1c25-11ee-9885-89d07af14ba3', '38LODI', '3/8\" Lodi Per Sack', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 64, NULL, NULL),
(120, '09d22c1c-1c25-11ee-9885-89d07af14ba3', '38LODI', '3/8\" Lodi ', '3/8\"', NULL, '114.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 64, NULL, NULL),
(121, '09d22cda-1c25-11ee-9885-89d07af14ba3', '38PAMI', '3/8\" Pami Pebbles Sack ', 'Per U-Sack', NULL, '17.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 65, NULL, NULL),
(122, '09d22d70-1c25-11ee-9885-89d07af14ba3', '38PAMI', '3/8\" Pami Pebbles', '3/8\"', '3-8PamiPebbles.jpg', '305.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 65, NULL, NULL),
(123, '09d22dfc-1c25-11ee-9885-89d07af14ba3', '34PAMI', '3/4\" Pami Pebbles', '3/4\"', '3-4PamiPebbles.jpg', '305.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 65, NULL, NULL),
(124, '09d22e88-1c25-11ee-9885-89d07af14ba3', '12QP', '1/2\" Quartz Pebbles 3/8\"x1/2\"', 'Per U-Sack', NULL, '17.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 66, NULL, NULL),
(125, '09d22f1e-1c25-11ee-9885-89d07af14ba3', '12QP', '1/2\" Quartz Pebbles 3/8\"x1/2\"', '1/2\"', '1-2QuartzPebbles.jpg', '131.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 66, NULL, NULL),
(126, '09d22faa-1c25-11ee-9885-89d07af14ba3', '34QP', '3/4\" Quartz Pebbles 3/4\"x1/2\"', '3/4\"', '3-4QuartzPebbles.jpg', '131.50', NULL, 'ton', 'Lb/yd', '1.25', '3.25', 66, NULL, NULL),
(127, '09d23040-1c25-11ee-9885-89d07af14ba3', '12SB', 'U-sack 1/2\" Salmon Bay', 'Per U-Sack', NULL, '30.50', NULL, 'sk', 'Ton/yd', '1.25', '3.25', 67, NULL, NULL),
(128, '09d230d6-1c25-11ee-9885-89d07af14ba3', '34SB', '1/4\" Salmon Bay Pebbles', '1/4\"', 'samonBayPebbles.jpg', '576.95', NULL, 'ton', 'Ton/yd', '1.25', '3.25', 67, NULL, NULL),
(129, '09d2316c-1c25-11ee-9885-89d07af14ba3', '12SB', '1/2\" Salmon Bay Pebbles ', '1/2\"', '1-2samonBayPebbles.jpg', '576.95', NULL, 'ton', 'Ton/yd', '1.25', '3.25', 67, NULL, NULL),
(130, '09d2346e-1c25-11ee-9885-89d07af14ba3', 'BYHPP', 'Buckthorn Yellow High Pol 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '65.00', NULL, 'lbs', '', '0.00', '3.25', 68, NULL, NULL),
(132, '09d23518-1c25-11ee-9885-89d07af14ba3', '9-15FSHPP', 'Five Springs High Pol .8-1.5cm', '9 cm - 15 cm or 3/8\" - 5/8\"', '3-5-8FiveSpringsHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 69, NULL, NULL),
(133, '09d235ae-1c25-11ee-9885-89d07af14ba3', '2-3FSHPP', 'Five Springs High Pol 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-11-4FiveSpringsHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 69, NULL, NULL),
(134, '09d23842-1c25-11ee-9885-89d07af14ba3', 'HRHPP', 'Henna Red High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '65.00', NULL, 'lbs', '', '0.00', '3.25', 70, NULL, NULL),
(135, '09d23978-1c25-11ee-9885-89d07af14ba3', 'JGPP', 'Pol Jade Green 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '45.00', NULL, 'lbs', '', '0.00', '3.25', 71, NULL, NULL),
(136, '09d23c20-1c25-11ee-9885-89d07af14ba3', '2-3KBHPP', 'Kuro Black High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-4-1-1-4KuroBlackHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72, NULL, NULL),
(137, '09d23f04-1c25-11ee-9885-89d07af14ba3', '3-5KBHPP', 'Kuro Black High Polish 3-5Cm', '3 cm - 5 cm or 1\" - 2\"', '1-2KuroBlackHighPolishPebbles.jpeg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72, NULL, NULL),
(138, '09d24170-1c25-11ee-9885-89d07af14ba3', '5-8KBHPP', 'Kuro Black High Polish 3-5Cm', '5 cm - 8 cm or 2\" - 3\"', '2-3KuroBlackHighPolishPebbles.jpeg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72, NULL, NULL),
(139, '09d244c2-1c25-11ee-9885-89d07af14ba3', '2-3NPP', 'Niji Pebbles 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-4-1-1-4NijiPebbles.jpg', '35.00', NULL, 'lbs', '', '0.00', '3.25', 73, NULL, NULL),
(140, '09d24896-1c25-11ee-9885-89d07af14ba3', '1-15NPP', 'Niji Pebbles 1-1.5cm/3/8\"-5/8\"', '1 cm - 1.5 cm or 3/8\" - 5/8\"', '2-5-2-8NijiPebbles.jpg', '35.00', NULL, 'lbs', '', '0.00', '3.25', 73, NULL, NULL),
(141, '09d24bd4-1c25-11ee-9885-89d07af14ba3', 'TFWHPP', 'Tufa White High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '65.00', NULL, 'lbs', '', '0.00', '3.25', 74, NULL, NULL),
(142, '09d25084-1c25-11ee-9885-89d07af14ba3', 'WGPP', 'Wasabi Grn Pbl 1-1.5cm/3/8\"-5/8\"', '1 cm - 1.5 cm or 3/8\" - 5/8\"', NULL, '35.00', NULL, 'lbs', '', '0.00', '3.25', 75, NULL, NULL),
(143, '09d2512e-1c25-11ee-9885-89d07af14ba3', 'WHPP', 'Pol Woodgrain 2-3cm/3/4\"-1 1/4\" ', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '45.00', NULL, 'lbs', '', '0.00', '3.25', 76, NULL, NULL),
(144, '09d251e2-1c25-11ee-9885-89d07af14ba3', 'WBHPP', 'Wuyi Brown High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '27.00', NULL, 'lbs', '', '0.00', '3.25', 77, NULL, NULL),
(145, '09d25278-1c25-11ee-9885-89d07af14ba3', 'AGB', 'Amador Granite Boulders Per Lb', 'Per Lb', NULL, '0.32', 'lbs', 'lbs', '', '0.00', '1.00', 78, NULL, NULL),
(146, '09d25318-1c25-11ee-9885-89d07af14ba3', 'AGB', 'Amador Granite Boulders', 'Per Ton', NULL, '64.00', 'ton', 'ton', '', '0.00', '1.00', 78, NULL, NULL),
(147, '09d253ae-1c25-11ee-9885-89d07af14ba3', 'AWGB', 'Atwater Granite Boulder', 'Per Ton', NULL, '898.00', 'ton', 'ton', '', '0.00', '1.00', 79, NULL, NULL),
(148, '09d25444-1c25-11ee-9885-89d07af14ba3', 'BCSB', 'Basalt Column Sawn Bottom Per Lb ', 'Per Lb', NULL, '0.43', 'lbs', 'lbs', '', '0.00', '1.00', 80, NULL, NULL),
(149, '09d254da-1c25-11ee-9885-89d07af14ba3', 'BCSB', 'Basalt Column, Sawn Bottom', 'Per Ton', NULL, '860.00', 'ton', 'ton', '', '0.00', '1.00', 80, NULL, NULL),
(150, '09d25566-1c25-11ee-9885-89d07af14ba3', 'BCSBD', 'Basalt Fountain Rock Per Lb ', 'Per Lb', NULL, '0.94', 'lbs', 'lbs', '', '0.00', '1.00', 81, NULL, NULL),
(151, '09d25624-1c25-11ee-9885-89d07af14ba3', 'BCSBD', 'Basalt Column, Sawn Bottom Drill', 'Per Ton', NULL, '1880.00', 'ton', 'ton', '', '0.00', '1.00', 81, NULL, NULL),
(154, '09d256e2-1c25-11ee-9885-89d07af14ba3', 'CCB', 'Chiefcliff Boulder Per Pound ', 'Per Lb', NULL, '0.33', 'lbs', 'lbs', '', '0.00', '1.00', 83, NULL, NULL),
(155, '09d25778-1c25-11ee-9885-89d07af14ba3', 'BCB', 'Chiefcliff Boulder', 'Per Ton', NULL, '660.00', 'ton', 'ton', '', '0.00', '1.00', 83, NULL, NULL),
(156, '09d25804-1c25-11ee-9885-89d07af14ba3', 'SWP2-3CM', 'Snow White Pbl 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '35.00', NULL, 'lbs', '', '0.00', '3.25', 84, NULL, NULL),
(157, '09d2589a-1c25-11ee-9885-89d07af14ba3', 'BB1', 'Blk Aqua Cove 10mm-20mm 1/2\"-1\"', '1 cm - 2 cm or 1/2\" - 1\"', 'blackAquaCovePebbles1.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85, NULL, NULL),
(158, '09d2593a-1c25-11ee-9885-89d07af14ba3', 'BB1', 'U-sack Blk Aqua Cove 1-2cm', 'Per U-Sack', NULL, '78.00', NULL, 'sk', 'Ton/yd', '1.25', '1.00', 85, NULL, NULL),
(159, '09d259d0-1c25-11ee-9885-89d07af14ba3', 'BB2', 'Blk Aqua Cove 20-30mm 3/4-1 1/4', '2 cm - 3 cm or 3/4\" - 1 1/4\"', 'blackAquaCovePebbles3.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85, NULL, NULL),
(160, '09d25a5c-1c25-11ee-9885-89d07af14ba3', 'BB5', 'Blk Aqua Cove 30mm-50mm 1\"-2\"', '3 cm - 5 cm or 1\" - 2\"', 'blackAquaCovePebbles5.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85, NULL, NULL),
(161, '09d25afc-1c25-11ee-9885-89d07af14ba3', 'BBBLP', 'U-sack Blk Button 5/8-7/8 La Paz', 'Per U-Sack', NULL, '43.00', NULL, 'sk', 'Ton/yd', '1.25', '1.00', 86, NULL, NULL),
(162, '09d25b88-1c25-11ee-9885-89d07af14ba3', 'BBBLP', 'Bsk Black 5/8-7/8 La Paz Button', '5/8\" - 7/8\"', '', '800.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 86, NULL, NULL),
(163, '09d25c1e-1c25-11ee-9885-89d07af14ba3', 'OSM', 'U-sack Oyster Shell Bocce Mix', 'Per U-Sack', NULL, '32.00', NULL, 'sk', 'Ton/yd', '1.00', '3.75', 87, NULL, NULL),
(164, '09d25cb4-1c25-11ee-9885-89d07af14ba3', 'OSM', 'Oyster Shell Bocce Blend ', 'per ton', '', '585.00', 'per ton', 'tons', 'Ton/yd', '1.00', '3.75', 87, NULL, NULL),
(165, '09d25d4a-1c25-11ee-9885-89d07af14ba3', 'OSM', 'U-sack Oyster Shell Bocce Mix', 'bag', NULL, '21.00', NULL, 'bg', 'Ton/yd', '1.00', '3.75', 88, NULL, NULL),
(166, '09d25dd6-1c25-11ee-9885-89d07af14ba3', 'TF', 'Taffy Fines Per U-sack', 'Per U-Sack', NULL, '9.50', NULL, 'sk', 'Ton/yd', '1.00', '3.75', 89, NULL, NULL),
(167, '09d25e8a-1c25-11ee-9885-89d07af14ba3', 'TF', 'Taffy Fines ', 'per ton', '', '145.00', 'per ton', 'ton', 'Ton/yd', '1.00', '3.75', 89, NULL, NULL),
(168, '09d25f20-1c25-11ee-9885-89d07af14ba3', 'B-BLP', 'U-sack 1/2\"x1\" Black La Paz', 'Per U-Sack', '', '36.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 90, NULL, NULL),
(169, '09d25fb6-1c25-11ee-9885-89d07af14ba3', 'B-BLP', 'Bulk Basket 1/2\"-1\" Black La Paz', '1/2\"-1\"', '1-2-1BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90, NULL, NULL),
(170, '09d2604c-1c25-11ee-9885-89d07af14ba3', 'B-BLP', 'Bulk Basket 1\"-2\" Black La Paz', '1\"-2\"', '1-2BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90, NULL, NULL),
(171, '09d260e2-1c25-11ee-9885-89d07af14ba3', 'B-BLP', 'Bulk Basket 2\"-3\" Black La Paz ', '2\"-3\"', '2-3BlackLaPazPebbles.jpb.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90, NULL, NULL),
(172, '09d2616e-1c25-11ee-9885-89d07af14ba3', 'B-BLP', 'Bulk Basket 3\"-5\" Black La Paz', '3\"-5\"', '3-5BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90, NULL, NULL),
(173, '09d26204-1c25-11ee-9885-89d07af14ba3', 'B-BUFFLP', 'Bulk Basket 1/2\"-1\"buff La Paz ', '1/2\"-1\"', '1-2-1BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91, NULL, NULL),
(174, '09d26290-1c25-11ee-9885-89d07af14ba3', 'B-BUFFLP', 'Bulk Basket 1\"-2\" Buff La Paz', '1\"-2\"', '1-2BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91, NULL, NULL),
(175, '09d26326-1c25-11ee-9885-89d07af14ba3', 'B-BUFFLP', 'Bulk Basket 2\"-3\" Buff La Paz', '2\"-3\"', '2-3BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91, NULL, NULL),
(176, '09d263b2-1c25-11ee-9885-89d07af14ba3', 'B-BUFFLP', 'Bulk Basket 3\"-5\" Buff La Paz', '3\"-5\"', '3-5BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91, NULL, NULL),
(177, '09d2643e-1c25-11ee-9885-89d07af14ba3', 'BT1', 'U-sack Green Aqua Cove 1/2-2 1/2', 'Per U-Sack', '', '63.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 92, NULL, NULL),
(178, '09d264d4-1c25-11ee-9885-89d07af14ba3', 'BT1', 'Green Aqua Cove 1/2\"-2 1/2\"', '1/2\"-2 1/2\"', '1-2-2-1-2GreenAquaCovePebbles.jpeg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92, NULL, NULL),
(179, '09d26560-1c25-11ee-9885-89d07af14ba3', 'BT3', 'Green Aqua Cove 1/2\"-2 1/2\"', '1\"- 3\"', '1-3GreenAquaCovePebbles.jpeg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92, NULL, NULL),
(180, '09d2661e-1c25-11ee-9885-89d07af14ba3', 'BTS', 'Green Aqua Cove 1 1/2\" - 3 1/2\"', '1 1/2\" - 3 1/2\"', '1-1-2-3-1-2GreenAquaCovePebbles.jpg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92, NULL, NULL),
(181, '09d266b4-1c25-11ee-9885-89d07af14ba3', 'HTP1-2CM', 'Hama Pebbles 1-2cm / 1/2\" - 1\" ', 'Per U-Sack', NULL, '104.00', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 93, NULL, NULL),
(182, '09d26740-1c25-11ee-9885-89d07af14ba3', 'HTP1-2CM', 'Green Aqua Cove 1/2\"-2 1/2\"', '1/2\"-2 1/2\"', '', '1975.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 93, NULL, NULL),
(183, '09d267d6-1c25-11ee-9885-89d07af14ba3', 'B-LP', 'U-sack 1/4\"x1/2\" Mix La Paz', 'Per U-Sack', '', '36.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 94, NULL, NULL),
(184, '09d27640-1c25-11ee-9885-89d07af14ba3', 'B-LP', 'Bulk Basket 1/8\"x1/4\" La Paz Mix', '1/8\"x1/4\"', '1-8-1-4MixedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 94, NULL, NULL),
(185, '09d27744-1c25-11ee-9885-89d07af14ba3', 'B-LP', 'Bulk Basket 1/4\"-1/2\" Mix La Paz', '1/4\"-1/2\"', '1-4-1-2MixedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 94, NULL, NULL),
(186, '09d277ee-1c25-11ee-9885-89d07af14ba3', 'B-RLP', 'Bulk Basket 1/2\"-1\" Red La Paz', '1/2\"-1\"', '1-2-1RedLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95, NULL, NULL),
(187, '09d279b0-1c25-11ee-9885-89d07af14ba3', 'B-RLP', 'Bulk Basket 1\"-2\" Red La Paz', '1\"-2\"', '1-2RedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95, NULL, NULL),
(188, '09d27a46-1c25-11ee-9885-89d07af14ba3', 'B-RLP', 'Bulk Basket 2\"-3\" Red La Paz', '2\"- 3\"', '2-3RedLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95, NULL, NULL),
(189, '09d27adc-1c25-11ee-9885-89d07af14ba3', 'B-RLP', 'Bulk Basket 3\"-5\" Red La Paz', '3\"- 5\"', '3-5RedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95, NULL, NULL),
(190, '09d27bc2-1c25-11ee-9885-89d07af14ba3', 'BASALT-C-ND', 'Basalt Columns 24\" Not Drilled', '24\"', '', '96.00', 'per each', '24\" column', NULL, NULL, '0.00', 96, NULL, NULL),
(191, '09d27c62-1c25-11ee-9885-89d07af14ba3', 'BASALT-C-ND-36', 'Basalt Columns 36\" Not Drilled', '36\"', '', '140.00', 'per each', '36\" column', NULL, NULL, '0.00', 96, NULL, NULL),
(192, '09d27d34-1c25-11ee-9885-89d07af14ba3', 'BASALT-C-ND-48', 'Basalt Columns 48\" Not Drilled', '48\"', '', '196.00', 'per each', '48\" column', NULL, NULL, '0.00', 96, NULL, NULL),
(193, '09d27dc0-1c25-11ee-9885-89d07af14ba3', 'BASALT-NT', 'Drilled Basalt Columns 24\"', '24\"', '', '115.00', 'per each', '24\" column', NULL, NULL, '0.00', 97, NULL, NULL),
(194, '09d27e56-1c25-11ee-9885-89d07af14ba3', 'BASALT-NT-36', 'Drilled Basalt Columns 36\"', '36\"', '', '165.00', 'per each', '36\" column', NULL, NULL, '0.00', 97, NULL, NULL),
(195, '09d27ee2-1c25-11ee-9885-89d07af14ba3', 'BASALT-NT-48', 'Drilled Basalt Columns 48\"', '48\"', '', '250.00', 'per each', '48\" column', NULL, NULL, '0.00', 97, NULL, NULL),
(196, '09d27f78-1c25-11ee-9885-89d07af14ba3', 'BASALT-NT-60', 'Drilled Basalt Columns 60\"', '60\"', '', '325.00', 'per each', '60\" column', NULL, NULL, '0.00', 97, NULL, NULL),
(197, '09d280f4-1c25-11ee-9885-89d07af14ba3', 'BASALT-FPT', 'Drilled Basalt Column 24\" Polish ', '24\"', '', '120.00', 'per each', '24\" column', NULL, NULL, '0.00', 98, NULL, NULL),
(198, '09d2823e-1c25-11ee-9885-89d07af14ba3', 'BASALT-FPT-36', 'Drilled Basalt Column 36\" Polish ', '36\"', '', '182.00', 'per each', '36\" column', NULL, NULL, '0.00', 98, NULL, NULL),
(199, '09d2836a-1c25-11ee-9885-89d07af14ba3', 'BASALT-FPT-48', 'Drilled Basalt Column 48\" Polish ', '48\"', '', '266.00', 'per each', '48\" column', NULL, NULL, '0.00', 98, NULL, NULL),
(200, '09d28496-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FNT', 'Large Basalt Column 36\" Nat. Top', '36\"', '', '435.00', 'per each', '36\" column', NULL, NULL, '0.00', 99, NULL, NULL),
(201, '09d285c2-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FNT-48', 'Large Basalt Column 48\" Nat. Top', '48\"', '', '550.00', 'per each', '48\" column', NULL, NULL, '0.00', 99, NULL, NULL),
(202, '09d286e4-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FNT-60', 'Large Basalt Column 60\" Nat. Top', '60\"', '', '660.00', 'per each', '60\" column', NULL, NULL, '0.00', 99, NULL, NULL),
(203, '09d28810-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FPT', 'Large Basalt Column 36\" Polished Top', '36\"', '', '450.00', 'per each', '36\" column', NULL, NULL, '0.00', 100, NULL, NULL),
(204, '09d28932-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FPT-48', 'Large Basalt Column 48\" Polished Top', '48\"', '', '565.00', 'per each', '48\" column', NULL, NULL, '0.00', 100, NULL, NULL),
(205, '09d28a5e-1c25-11ee-9885-89d07af14ba3', 'LBASALT-FPT-60', 'Large Basalt Column 60\" Polished Top', '60\"', '', '680.00', 'per each', '60\" column', NULL, NULL, '0.00', 100, NULL, NULL),
(206, '09d28ba8-1c25-11ee-9885-89d07af14ba3', 'BASALT-FSET', 'Basalt Fountain 2 Pcs/set - 2 Ft', '24\"', '', '345.00', 'per each', '24\" column', NULL, NULL, '0.00', 101, NULL, NULL),
(207, '09d28cd4-1c25-11ee-9885-89d07af14ba3', 'BASALT-FSET', 'Basalt Fountain 2 Pcs/set - 2 Ft', '36\"', '', '505.00', 'per each', '36\" column', NULL, NULL, '0.00', 101, NULL, NULL),
(208, '09d28df6-1c25-11ee-9885-89d07af14ba3', 'BASALT-SCF', 'Special Carving Basalt 48\"', '48\"', '', '660.00', 'per each', '48\" column', NULL, NULL, '0.00', 102, NULL, NULL),
(209, '09d28f22-1c25-11ee-9885-89d07af14ba3', 'SWIRL-PAT-BASALT-F', 'Swirl Basalt Fountain Dia 16\"', '16\"', '', '150.00', 'per each', '16\" wide', NULL, NULL, '0.00', 103, NULL, NULL),
(210, '09d29044-1c25-11ee-9885-89d07af14ba3', 'SWIRL-PAT-BASALT-F-24', 'Swirl Basalt Fountain Dia 24\"', '24\"', '', '2200.00', 'per each', '24\" wide', NULL, NULL, '0.00', 103, NULL, NULL),
(211, '09d29170-1c25-11ee-9885-89d07af14ba3', 'CAL-PLANTER-21-30', 'Calistoga Planter', '21\" Wide x 30\" High', NULL, '147.00', 'per each', '21\" x 30\"', NULL, NULL, '0.00', 104, NULL, NULL),
(212, '09d2929c-1c25-11ee-9885-89d07af14ba3', 'CAL-PLANTER-13-22', 'Calistoga Planter', '13\" Wide x 22\" High', NULL, '60.00', 'per each', '13\" x 22\"', NULL, NULL, '0.00', 104, NULL, NULL),
(213, '09d2958a-1c25-11ee-9885-89d07af14ba3', 'CUPER-PLANTER-16-32', 'Cuprtino Planter', '16\" Wide x 32\" High', NULL, '100.00', 'per each', '16\" x 32\"', NULL, NULL, '0.00', 105, NULL, NULL),
(214, '09d297a6-1c25-11ee-9885-89d07af14ba3', 'CUPER-PLANTER-14-23', 'Cuprtino Planter', '14\" Wide x 23\" High', NULL, '69.00', 'per each', '14\" x 23\"', NULL, NULL, '0.00', 105, NULL, NULL),
(215, '09d2990e-1c25-11ee-9885-89d07af14ba3', 'CUPER-PLANTER-22-39', 'Cuprtino Planter', '22\" Wide x 39\" High', NULL, '170.00', 'per each', '22\" x 39\"', NULL, NULL, '0.00', 105, NULL, NULL),
(216, '09d29a8a-1c25-11ee-9885-89d07af14ba3', 'LARKS-PLANTER-24-55', 'Larkspur Planter', '24\" Wide x 55\" High', NULL, '300.00', 'per each', '24\" x 55\"', NULL, NULL, '0.00', 106, NULL, NULL),
(217, '09d29bca-1c25-11ee-9885-89d07af14ba3', 'LARKS-PLANTER-22-47', 'Larkspur Planter', '22\" Wide x 47\" High', NULL, '250.00', 'per each', '22\" x 47\"', NULL, NULL, '0.00', 106, NULL, NULL),
(218, '09d29d00-1c25-11ee-9885-89d07af14ba3', 'LARKS-PLANTER-20-39', 'Larkspur Planter', '20\" Wide x 39\" High', NULL, '150.00', 'per each', '20\" x 39\"', NULL, NULL, '0.00', 106, NULL, NULL),
(219, '09d29e7c-1c25-11ee-9885-89d07af14ba3', 'LARKS-PLANTER-19-30', 'Larkspur Planter', '19\" Wide x 30\" High', NULL, '85.00', 'per each', '19\" x 30\"', NULL, NULL, '0.00', 106, NULL, NULL),
(220, '09d29fbc-1c25-11ee-9885-89d07af14ba3', 'OAKLAND-PLANTER-30-28', 'Oakland Planter ', '30\" Wide x 28\" High', NULL, '185.00', 'per each', '30\" x 28\"', NULL, NULL, '0.00', 107, NULL, NULL),
(221, '09d2a0f2-1c25-11ee-9885-89d07af14ba3', 'OAKLAND-PLANTER-20-21', 'Oakland Planter ', '20\" Wide x 21\" High', NULL, '100.00', 'per each', '20\" x 21\"', NULL, NULL, '0.00', 107, NULL, NULL),
(222, '09d2a21e-1c25-11ee-9885-89d07af14ba3', 'OAKLAND-PLANTER-36-33', 'Oakland Planter ', '36\" Wide x 33\" High', NULL, '325.00', 'per each', '36\" x 33\"', NULL, NULL, '0.00', 107, NULL, NULL),
(223, '09d2a35e-1c25-11ee-9885-89d07af14ba3', 'WC', 'Lehigh White Cement 94 Lbs ', 'EA', NULL, '30.95', '94 LBS', 'EA', '', NULL, '0.00', 108, NULL, NULL),
(224, '09d2a408-1c25-11ee-9885-89d07af14ba3', 'PGG', 'Perkgrout Grey', 'Bag', NULL, '26.00', '', 'Bag', '', NULL, '0.00', 109, NULL, NULL),
(226, '09d2a49e-1c25-11ee-9885-89d07af14ba3', 'PGT', 'Perkgrout Tan', 'Bag', NULL, '26.00', '', 'Bag', '', NULL, '0.00', 110, NULL, NULL),
(227, '09d2a534-1c25-11ee-9885-89d07af14ba3', 'QKS', 'Quikrete Base Coat Stucco 60 Lbs ', 'EA', NULL, '10.00', '', 'EA', '', NULL, '0.00', 111, NULL, NULL),
(228, '09d2a5ca-1c25-11ee-9885-89d07af14ba3', 'QKFSCM', 'Quikrete Base Coat Stucco 80 Lbs ', 'EA', NULL, '8.30', '', 'EA', '', NULL, '0.00', 112, NULL, NULL),
(229, '09d2a656-1c25-11ee-9885-89d07af14ba3', 'QKFPC', 'Quikrete Fence Post Mix 80 Lbs', 'EA', NULL, '8.30', '', 'EA', '', NULL, '0.00', 113, NULL, NULL),
(230, '09d2a6ec-1c25-11ee-9885-89d07af14ba3', 'QKA', 'Quikrete High Performance Blacktop Repair 50 Lbs ', 'EA', NULL, '19.25', '', 'EA', '', NULL, '0.00', 114, NULL, NULL),
(231, '09d2a778-1c25-11ee-9885-89d07af14ba3', 'OKMM', 'Quikrete Masons Mix 80 Lbs ', 'EA', NULL, '11.90', '', 'EA', '', NULL, '0.00', 115, NULL, NULL),
(232, '09d2a804-1c25-11ee-9885-89d07af14ba3', 'QKM', 'Quikrete Mortar Mix 80 Lbs', 'EA', NULL, '11.50', '', 'EA', '', NULL, '0.00', 116, NULL, NULL),
(233, '09d2a890-1c25-11ee-9885-89d07af14ba3', 'GTS', 'Quikrete Thin Set Sanded - Gray 50 Lbs', 'EA', NULL, '19.00', '', 'EA', '', NULL, '0.00', 117, NULL, NULL),
(234, '09d2a91c-1c25-11ee-9885-89d07af14ba3', '47#C', 'Quikrete Portland Cement 94 Lbs', 'EA', NULL, '20.95', '', 'EA', '', NULL, '0.00', 118, NULL, NULL),
(235, '09d2a9da-1c25-11ee-9885-89d07af14ba3', 'QKPMSVMG', 'Quikrete Plastic Cement 94 Lbs', 'EA', NULL, '23.75', '', 'EA', '', NULL, '0.00', 119, NULL, NULL),
(236, '09d2aa70-1c25-11ee-9885-89d07af14ba3', 'CGS5035', 'Coregravel Driveway', 'EA', NULL, '68.00', '', 'EA', '', NULL, '0.00', 120, NULL, NULL),
(237, '09d2aafc-1c25-11ee-9885-89d07af14ba3', 'CGS3818', 'Coregravel Pathway', 'EA', NULL, '50.00', '', 'EA', '', NULL, '0.00', 121, NULL, NULL),
(238, '09d2ab88-1c25-11ee-9885-89d07af14ba3', 'GATORNW', 'Gator Geotextile Fabric ', 'EA', 'GatorGeotextileFabric.png', '160.00', '', 'EA', '', NULL, '0.00', 122, NULL, NULL),
(239, '09d2ac1e-1c25-11ee-9885-89d07af14ba3', 'GATORNW', 'Gator Geotextile Fabric ', 'EA', 'GatorGeotextFabricView.jpg', '160.00', '', 'EA', '', NULL, '0.00', 122, NULL, NULL),
(241, '09d2acaa-1c25-11ee-9885-89d07af14ba3', 'PBB			', 'Plastic Bender Board 1\"x4\"x20’ ', 'EA', NULL, '36.75', '', 'EA', '', NULL, '0.00', 123, NULL, NULL),
(242, '09d2ad36-1c25-11ee-9885-89d07af14ba3', '24PBB			', 'Plastic Bender Board 2\"x4\"x20’ ', 'EA', NULL, '76.25', '', 'EA', '', NULL, '0.00', 124, NULL, NULL),
(243, '09d2adc2-1c25-11ee-9885-89d07af14ba3', 'PBBS', 'Plastic Bender Board Stakes', 'EA', NULL, '1.00', '', 'EA', '', NULL, '0.00', 125, NULL, NULL),
(244, '09d2ae4e-1c25-11ee-9885-89d07af14ba3', '30S', '#0/30 Lapis Lustre Sand 100 ', 'EA', NULL, '23.75', '', 'EA', '', NULL, '0.00', 126, NULL, NULL),
(245, '09d2aeda-1c25-11ee-9885-89d07af14ba3', '20S', '#1/20 Lapis Lustre Sand 100 ', 'EA', NULL, '23.50', '', 'EA', '', NULL, '0.00', 127, NULL, NULL),
(246, '09d2af66-1c25-11ee-9885-89d07af14ba3', '216S', '#2/16 Lapis Lustre Sand 100 ', 'EA', NULL, '23.50', '', 'EA', '', NULL, '0.00', 128, NULL, NULL),
(247, '09d2affc-1c25-11ee-9885-89d07af14ba3', 'AZOMITEP', 'Azomite Powder 44 Lbs', 'EA', NULL, '32.50', '', 'EA', '', NULL, '0.00', 129, NULL, NULL),
(248, '09d2b088-1c25-11ee-9885-89d07af14ba3', 'BOB1', 'Black Owl BIOCHAR 1 cu.ft ', '1 Cubit Foot', NULL, '43.50', 'cu ft', 'cf', '', NULL, '0.00', 130, NULL, NULL),
(249, '09d2b114-1c25-11ee-9885-89d07af14ba3', 'BOBQ', 'Black Owl BIOCHAR 1 qt. ', '1 Quart', NULL, '18.50', 'qt', 'qt', '', NULL, '0.00', 130, NULL, NULL),
(250, '09d2b1a0-1c25-11ee-9885-89d07af14ba3', 'BOBEUQ', 'Black Owl BIOCHAR ENV ULTRA 1 CF', '1 Cubit Foot', NULL, '43.50', 'cu ft', 'cf', '', NULL, '0.00', 131, NULL, NULL),
(251, '09d2b27c-1c25-11ee-9885-89d07af14ba3', 'BOBU!', 'Black Owl BIOCHAR ENV ULTRA 1 qt', '1 Quart', NULL, '18.50', 'qt', 'qt', '', NULL, '0.00', 131, NULL, NULL),
(252, '09d2b31c-1c25-11ee-9885-89d07af14ba3', 'BSF', 'Filled Burlap Sand Bag', 'EA', NULL, '4.00', 'ea', 'ea', '', NULL, '0.00', 132, NULL, NULL),
(253, '09d2b3a8-1c25-11ee-9885-89d07af14ba3', 'QKSANDBAG', 'Prefilled Poly Woven Sand Bag 50 Lbs', 'EA', NULL, '6.00', 'ea', 'ea', '', NULL, '0.00', 133, NULL, NULL),
(254, '09d2b43e-1c25-11ee-9885-89d07af14ba3', 'ATOBL', 'Antigo Boulder', 'Per pound', NULL, '0.41', 'lbs', 'lbs', NULL, NULL, '1.00', 134, NULL, NULL),
(255, '09d2b4d4-1c25-11ee-9885-89d07af14ba3', 'ATOBL', 'Antigo Boulder', 'Per ton', NULL, '810.00', 'ton', 'ton', NULL, NULL, '1.00', 134, NULL, NULL),
(256, '09d2b560-1c25-11ee-9885-89d07af14ba3', 'BCBL', 'Boquet Canyon Boulder Per Lb', 'Per pound', NULL, '0.33', 'lbs', 'lbs', NULL, NULL, '1.00', 135, NULL, NULL),
(257, '09d2b614-1c25-11ee-9885-89d07af14ba3', 'BCBL', 'Boquet Canyon Boulder Per Ton', 'Per ton', NULL, '650.00', 'ton', 'ton', NULL, NULL, '1.00', 135, NULL, NULL),
(258, '09d2b6aa-1c25-11ee-9885-89d07af14ba3', 'CCB', 'Chiefcliff Boulder Per Pound', 'Per pound', NULL, '0.38', 'lbs', 'lbs', NULL, NULL, '1.00', 136, NULL, NULL),
(259, '09d2b8b2-1c25-11ee-9885-89d07af14ba3', 'CCB', 'Chiefcliff Boulder Per Ton', 'Per ton', NULL, '750.00', 'ton', 'ton', NULL, NULL, '1.00', 136, NULL, NULL),
(260, '09d2b952-1c25-11ee-9885-89d07af14ba3', 'CCFBP', 'Crawford Granite Boulder per pound', 'Per pound', NULL, '0.43', 'lbs', 'lbs', NULL, NULL, '1.00', 137, NULL, NULL),
(261, '09d2b9de-1c25-11ee-9885-89d07af14ba3', 'CFGB', 'Crawford Granite Boulder per ton', 'Per ton', NULL, '855.00', 'ton', 'ton', NULL, NULL, '1.00', 137, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_lens_size` json DEFAULT NULL,
  `extended` json DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `sku`, `slug`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fc575a44-1c24-11ee-9885-89d07af14ba3', 'C2BR', 'class-2-base-rock', 'Class 2 Base Rock', '<p>Class 2 Base Rock is a recycled product composed of fines and 3/4\" crushed concrete. It is used underneath foundations, pathways, patios, and driveways. It is also used as a base underneath concrete and asphalt. Class 2 Base Rock meets the Cal Trans spec.</p>\r\n<p>We sell the Class 2 Base Rock in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your Bay Area location. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Class 2 Base Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'class2baserock.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(2, 'fc575ef4-1c24-11ee-9885-89d07af14ba3', '34C2P', 'class-2-permeable-base-rock', 'Class 2 Permeable Base Rock', '<p>Class 2 Base Rock is a recycled permeable product composed of 3/4\" crushed concrete and minimal fine stones allowing it to be water permeable. It is used underneath foundations, pathways, patios, and driveways or wherever permeability and stability are desired. Class 2 Permeable Base Rock meets the Cal Trans spec.</p>\r\n<p>We sell the Class 2 Permeable Base Rock in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck, or for a fee, have us deliver the base rock to your location in the Bay Area. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Class 2 Permeable Base Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'class2permeableBaserock.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(3, 'fc576192-1c24-11ee-9885-89d07af14ba3', '14PG', '1-4-pea-gravel', '1/4\" Pea Gravel ', '<p>1/4&quot; Pea Gravel is commonly used for pathways, driveways, dog runs, playgrounds, patios, and as ground cover. The smaller gravels are often used on roofs over tar.  Underground applications include drainage and pipe bedding materials for stable support.</p>\r\n<p>Please note: 1/4&quot; Pea Gravel vendor source is currently different than our previous source. Therefore, the gravel may vary in appearance. </p>\r\n<p>We sell the 1/4\" Pea Gravel in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your own truck,  or for a fee, have us deliver to your Bay Area location. For orders over 20 tons please call us for direct pricing.</p>\r\n<p>1/4&quot; Pea Gravel may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'oneQuarterInchPeaGravel.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(4, 'fc57639a-1c24-11ee-9885-89d07af14ba3', 'AFBF', 'arizona-flagstone---buckskin', 'Arizona Flagstone - Buckskin', '<ul class=\"product-details\">\r\n<li class=\"item-details\">Origin: North America</li>\r\n<li class=\"item-details\">Classification Sandstone</li>\r\n<li class=\"item-details\">Color Range: Warm Tones</li>\r\n<li class=\"item-details\">Finish: Natural Cleft</li>\r\n<li class=\"item-details\">Applications: Walkways, Pathways, Patios, Accents</li>\r\n</ul> \r\n\r\n\r\n<p>Arizona Flagstone is a standup select grade flagstone that is available in large sheets of random shapes. It can be used for patios, stepping stones or any flat surface that you want to cover with flagstone. Due to the natural cleft and the porosity, this natural paving stone spalls, meaning, the top layer of the stone peels off with wear. In a shady damp area, particularly in winter months, algae and moss growth which can permanently stain the stone. Some landscapes desire this look but to deter algae and moss growth, use a stone sealer.</p><p>This sedimentary sandstone is available in a variety of southwest colors: Sedona Red, Rosa, Peach, Buckskin, Buff, Classic Oak, and variations in between.</p>\r\n<p>Available in two thickness: 1&quote;-1  3/4 &quote; and thinner 1&quote; minus.</p>\r\n<p>For sand setting application, use the thicker 1&quote; - 1  3/4 &quote; flagstone.\r\nFor the 1&quote; minus flagstone, special care needs to be taken since the stone is very fragile and brittle. It is intended to be set in mortar on a concrete base to protect it from cracking</p>', 'arizona-flagstone-buckskin.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(5, 'fc576584-1c24-11ee-9885-89d07af14ba3', '14-FB', '1-4-fir-bark', '1/4\" - Fir Bark', '<p>1/4 &quot; Fir Bark is the smallest remaining particles from sifting the fir barks. Mix in with clay soil to loosen and aerate as an organic amendment. Provides moisture retention and aeration. Due to the small size of the bark, breaks down faster than Fine Redwood Amendment.</p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', '14-fur-bark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(6, 'fc57676e-1c24-11ee-9885-89d07af14ba3', '1OS', '1-olympia-sand', '#1 Olympia Sand', '<p>Olympia Sands is used primarily for making mortar or stucco. However, Olympia Sand #1 is screened and washed. It is highly desirable for children\'s sandboxes, playgrounds, and the sand used for volleyball courts.</p><p>Lyngso Garden Materials sell #1 Olympia Sand in one cubic foot bags.  We supply the bags and you fill them! For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite. For orders over 20 tons please call us for direct pricing.</p><p>#1 Olympia Sand may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', '1-olympia-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(7, 'fc576912-1c24-11ee-9885-89d07af14ba3', '2OS', '2-olympia-sand', '#2 Olympia Sand', '<p>Olympia Sand #2 is used for making plaster, mortar or stucco and can also be used for sandboxes.  It is a more coarse material than Olympia Sand #1, which provides it with better construction properties.</p><p>We sell both Olympia Sand #1 and Olympia Sand #2 in one cubic foot bags.  Lyngso will supply the bags and you can fill as many as you need. For larger areas, you\'ll want to purchase Olympia Sand by the ton. We can load your truck for you, or for a fee, you can use our rental truck and load the sand on your own, or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>#2 Olympia Sand may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', '2-olympia-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(8, 'fc576ab6-1c24-11ee-9885-89d07af14ba3', 'CS', 'concrete-sand', 'Concrete Sand', '<p>Concrete sand, also known as top sand, is a coarse washed and screened sand. It is used as a base for setting stones, pavers, and bricks. Concrete Sand packs together well and will not wash out as easily as finer sands.</p><p>We sell the Concrete Sand in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite. For orders over 20 tons please call us for direct pricing.</p>', 'concrete-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(9, 'fc576c78-1c24-11ee-9885-89d07af14ba3', 'CBSB', 'connecticut-bluestone-true-blue', 'Connecticut Bluestone, True Blue', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Metamorphic Sandstone</li>\r\n<li>Color Range: Greys, Blues, Greens</li>\r\n<li>Finish: Natural Cleft</li>\r\nApplications: Walkways, Pathways, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Connecticut Bluestone is a classic East Coast paving stone that\'s been used for centuries, dating back to the 1800s. Denser sandstone that has been tested through the times.  A metamorphic sandstone with consistent blue-grey colors. Thickness ranges from 1 inch to 2 inches. Full pallet can weigh between 1.25 tons to 2.25 tons. This bluestone is standup select with sizes that vary from 1.5 sq. ft. to upwards of 20 sq. ft.</p>', 'connecticut-blue-stone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(10, 'fc576db8-1c24-11ee-9885-89d07af14ba3', 'AL', 'azure-limestone', 'Azure Limestone', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: Blues, Grays</li>\r\n<li>Finishes: Natural Cleft</li>\r\n<li>Applications: Walkways, Pathways, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Azure Limestone is a great alternative for Connecticut Bluestone True Blue. 2\" thickness.</p>', 'azure-limestone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(11, 'fc576eb2-1c24-11ee-9885-89d07af14ba3', 'GBLT', 'galaxy-black-limestone', 'Galaxy Black Limestone', '<ul>\r\n<li>Origin: Asia</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: Blacks</li>\r\n<li>Finishes: Tumbled Natural Cleft</li>\r\n<li>Applications: Walkways, Pathways, Patios, Veneers, Accents</li>\r\n</ul>\r\n\r\n<p>Galaxy Black Tumbled flagstone are limestone with striking matte black hues. The flagstones are tumbled to soften the edges. Nominal 2\" thickness.</p>', 'galaxy-black-limestone.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(12, 'fc576ff2-1c24-11ee-9885-89d07af14ba3', 'LGS', 'luna-grey-sandstone', 'Luna Grey Sandstone', '<ul>\r\n<li>Origin: Asia</li>\r\n<li>Classification: Sandstone</li>\r\n<li>Color Range: Grays</li>\r\n<li>Finishes: Natural Cleft</li>\r\n<li>Application: Walkways, Pathways, Pavers, Veneers, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Luna Grey Flagstone are a light grey colored sandstone. 2” thickness.<p>', 'luna-gray-sandstone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(13, 'fc5770e2-1c24-11ee-9885-89d07af14ba3', '516RL', '5-16-horticulture-lava', '5/16\" Horticulture Lava', '<p>Light weight horticultural lava. Use as an amendment to aerate soil mixes. Great for creating custom potting mixes for succulents, cacti, orchids, and plants that require ample drainage.</p><p>We sell the lava in one cubic foot bags, we supply the bags and you fill them. For large areas you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', '5-16-horticultureLava.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(14, 'fc5771dc-1c24-11ee-9885-89d07af14ba3', 'LIGNA PEAT', 'ligna-peat', 'Ligna Peat', '<p>Ligna Peat is 100% pure, organic, and sustainably harvest redwood fiber. A sustainable alternative to Peat Moss. Ligna Peat provides beneficial organic matter for a sustained period of time without rapid decomposition. Commonly used for aeration and water retention within the soil. </p><p>We sell Ligna Peat in one cubic foot bags, we supply the bags and you fill them. For large areas you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p><p>Ligna Peat is CDFA OIM listed for organic use and is a FSC certified product.</p>', 'lingaPeat.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(15, 'fc577326-1c24-11ee-9885-89d07af14ba3', 'ORGANIC-AMENDMENT', 'organic-amendment-mix', 'Organic amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending. </p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment. </p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(16, 'fc577452-1c24-11ee-9885-89d07af14ba3', 'RS', 'redwood-sawdust', 'Redwood Sawdust', '<p>Redwood Sawdust is an all-natural redwood byproduct of the lumber mills. Not treated with any chemicals.  It is typically used as a soil amendment to help break up clay and aerate compacted soil.</p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>We sell the Redwood Sawdust in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site</p>', 'redwoodSawdust.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(17, 'fc577588-1c24-11ee-9885-89d07af14ba3', 'COMPOST-MULCH', 'composted-mulch-limited-quantity', 'Composted Mulch - Limited Quantity', '<p>Composted Mulch is derived from composted wood from composting green waste facility. This material has been through a 9–20-week composting process. During the composting period, accepted thermophilic composting procedures are performed to accomplish pathogen reduction through time and temperature (130-170 degrees (F) throughout the composting period). This ensures a thoroughly composted, weed and pathogen free product. </p><p>Composted Mulch is screened to 1”-3’’ in size and contains fines. Although Composted Mulch is listed as OMRI organic, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass.</p><p>Compost Mulch is an excellent ground cover that greatly enhances the aesthetic appearance of landscapes. Composted Mulch can help retain moisture, control weeds, and help prevent erosion. In addition, this Composted Mulch has demonstrated to be less combustible and less floatable compared to other wood mulches. </p><p>Composted Mulch is also considered as a no-float mulch and is highly recommended for use in Bioretention areas. Composted Mulch is OMRI listed organic as a soil amendment and a weed and disease control product. </p> <p>Composted Mulch complies with SB 1383 requirements and is produced in a fully permitted composting facility conforming to the State of California regulations set forth by the California Integrated Waste Management Board (CIWMB) Title 14, Division 7 California Code of Regulations governing composting operations. </p> <p>Limited quantity available. </p>', 'compostMulch.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(18, 'fc577704-1c24-11ee-9885-89d07af14ba3', 'GRB', 'ground-redwood-bark-', 'Ground Redwood Bark ', '<p>Ground Redwood Bark is the bark from redwood trees that have been double ground. It is a stringy, fluffy, and fibrous bark that ranges in size around 1-2 inches and less. Often referred to as \"Gorilla Hair\" or \"Monkey Fur\". However, our Ground Redwood Bark is double ground and has finer texture. It does hold onto water and is lightweight. Not recommended for windy areas or steep slopes. Depending on the grade, holds well in moderately sloped areas. Great for indoor or outdoor potted plants. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee you can use our rental dump truck or have us deliver the bark to you. For large orders over 60 yards please call for a direct price.</p><p><a href=\"https://www.youtube.com/watch?v=W_xlAV7gKjI\" target=\"blank\">Information Link</a></p>', 'groundRedwoodBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(19, 'fc577808-1c24-11ee-9885-89d07af14ba3', 'MA CHIP', 'mahogany-chip', 'Mahogany Chip', '<p>Mahogany Chip is an attractive processed wood product that\'s dyed with a natural UV protectant color, ferric oxide. Clean byproduct from sawmills, no post consumer wood is used. Therefore, no paints or toxins in the mulch. Great for commercial applications or wherever longevity of the vibrant color is desired. Mahogany Chip varies in size quite drastically, from 2\" to 6\" but typically stays towards the smaller size. Our batches vary from day to day, so it\'s best to check with us directly if you need to match a specific size. If you are trying to match your exiting Mahogany Chip, consider taking a trip to our yard to verify the size before your purchase.  Although Mahogany Chip will retain its color longer than most non-colored chips, in rainy season however, the color could wash away when it is exposed to water or sits in water for an extended period of time. It is advisable to install the chips once the rains have passed.</p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver the mulch to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=D8gjB759-hQ\" target=\"blank\">Information Link</a></p>', 'mahoganyChip.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(20, 'fc577952-1c24-11ee-9885-89d07af14ba3', 'MMFB', 'mini-mulch-fir-bark', 'Mini Mulch Fir Bark', '<p>Mini Mulch Fir Bark is 1/4-3/8 inch in size. The sun fades the natural red bark to a weathered grey over time. Often mistaken for redwood, it is indeed the bark of fir trees. Very attractive and popular mulch for vegetable garden beds. The Mini Mulch will decompose faster than larger mulch and will eventually turn into organic soil amendment.</p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to you. For orders over 45 yards please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=aBKZYxsMf90\" target=\"blank\">Information Link</a></p>', 'miniMulchFirBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(21, 'fc577a7e-1c24-11ee-9885-89d07af14ba3', 'MOCHA CHIP', 'mocha-chip', 'Mocha Chip', '<p>Mocha Chip is an attractive processed redwood that\'s dyed with a natural UV protectant color, ferric oxide. It\'s a clean byproduct from sawmills, no post-consumer wood is used. Therefore, no paints or toxins in the mulch. Great for commercial applications or wherever longevity of the vibrant color is desired. Mocha Chip varies in size quite drastically, from 2\" to 6\" but typically stays towards the smaller size. </p><p>Our shipment varies from day to day, so it\'s best to check with us directly if you need to match a specific size. If you are trying to match your exiting Mocha Chip, consider taking a trip to our yard to verify the size before your purchase.  Although Mocha Chip will retain its color longer than most non-colored chips, in the rainy season, however, the color could wash away when it is exposed to water or sits in water for an extended period of time. It is advisable to install the chips once the rains have passed.</p><p>Freshly produced Mocha Chips may be subject to colorant wash off and can stain driveways. Therefore, it is recommended that the mulch is dumped on a tarp. The colorant can also stain clothing or be tracked onto carpet or furniture by pets. </p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=I1ZOsWuYzzs\" target=\"blank\">Information Link</a></p>', 'mochaChip.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(22, 'fc5789b0-1c24-11ee-9885-89d07af14ba3', 'PF', 'playground-fiber', 'Playground Fiber', '<p>Playground Fiber is engineered natural wood that is 1/2\" - 1\" in size. Made out of California white conifers, the fiber is processed to have elongated blunt or soft chopped ends, therefore, more resistant to splintering. Chips do not contains any toxins or chemical additives. No recycled by-products, processed woods or fillers are used. Meets ADA, ASTM and CPSC playground surfacing standards for impact absorption, accessibility and safety. Approved for use in public playgrounds, parks or pathways. </p><p>We sell the Playground Fiber in one cubic foot bags, we supply the bags you fill them. For larger areas, you\'ll want to purchase the Playground Fiber by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=EJ1EtKcxSno\" target=\"blank\">Information Link</a></p>', 'playgroundFiber.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(23, 'fc578b18-1c24-11ee-9885-89d07af14ba3', 'PAM', 'premium-arbor-mulch', 'Premium Arbor Mulch', '<p>Premium Arbor Mulch is 100% clean tree trimming from local urban forests. The tree trimmers and arborists dropping off the trimmings and wood are monitored closely for quality. Mulch contains a conglomerate of bark, wood chips, and some leaves. Provides protection and food for the life in your soil. Mulch will eventually decompose and will turn into organic soil amendment over time. Depending on the grade, holds well in moderately sloped areas. Excellent for Sheet Mulching applications! Click on the Information Link below to learn more about Sheet Mulching!</p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver the mulch to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.lyngsogarden.com/community-resources/sheet-mulching/\" target=\"blank\">Information Link</a></p>', 'premiumArborMulch.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(24, 'fc578cd0-1c24-11ee-9885-89d07af14ba3', 'SCB', 'shredded-cedar-bark', 'Shredded Cedar Bark', '<p>Shredded Cedar Bark is a stringy, and fibrous bark that ranges in size around 1-3 inches and less. Bark originates from lumber from cedar trees. Practical and attractive mulch for most applications in your landscape. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to your home or jobsite. For large orders over 60 cubic yards, please call for a direct price.</p><p><a href=\"https://www.youtube.com/watch?v=z3OEKGpTf-4\" target=\"blank\">Information Link</a></p>', 'shreddedCedarBark.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(25, 'fc578e06-1c24-11ee-9885-89d07af14ba3', 'SFB', 'small-fir-bark', 'Small Fir Bark', '<p>Small Fir Bark is often mistaken for redwood, it is indeed the bark of fir trees. An attractive and popular mulch for most landscapes. The sun fades the natural red fir bark to a weathered grey over time. Mulch will eventually decompose and will turn into an organic soil amendment over time.  </p><p>Small Fir Bark is 1/2\"-2\" in size and has some variation. Please check the physical inventory in our yard before ordering. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to you. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=i3Dd3WTvRjY\" target=\"blank\">Information Link</a></p>', 'smallFirBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(26, 'fc578f3c-1c24-11ee-9885-89d07af14ba3', 'WOB', 'walk-on-bark-', 'Walk On Bark ', '<p>Walk on Bark is mostly a mixture of 1\"-3\" red/brown fir bark nuggets and cambium. There could be some much larger pieces of material mixed in, from time to time and the consistency of the Walk on Bark varies from batch to batch.  Clean byproduct from sawmills, no post consumer wood is used. When Fir Bark is the desired visual effect, Walk on Fir Bark is a beautiful and economical alternative to Small Fir Bark and Mini Mulch Fir Bark, to mulch your landscape project. Great for pathways and walkways. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to your home or jobsite. For large orders over 60 cubic yards, please call for a direct price.</p>', 'walkOnBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(27, 'fc579036-1c24-11ee-9885-89d07af14ba3', 'TWC', 'wood-chips', 'Wood Chips', '<p>Wood Chips are primarily redwood and may contain a small amount of fir that are 1/2\"-1\" in size. Lighter colored mulch that will darken with age and has a sheen. Great for pathways, walkways, and larger landscaped areas. Wood Chips take longer to decompose than other mulch so can be used in areas where mulch needs to last for a while. </p><p>We sell the Wood Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the wood chips by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=a1zr7dEPtM0\" target=\"blank\"></a></p>', 'woodChips.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(28, 'fc57918a-1c24-11ee-9885-89d07af14ba3', 'AACT', 'actively-aerated-compost-tea', 'Actively Aerated Compost Tea', '<p>Actively Aerated Compost Tea (AACT) is a liquid concentrate containing all the beneficial microbial components that compost is famous for.  These living beneficial microbes are the biology that drives the soil food web in a healthy functioning soil.  The soil food web is responsible for:</p>\r\n<ul>\r\n<li>Nutrient cycling break-down and reuse of organic sources of plant nutrition, and their holding capacity in the soil.</li><li>Improved soil structure - through the formation of soil aggregates.</li><li>Increased porosity - resulting in better aeration and water retention.</li><li>The degradation of soil pollutants and pH buffering.</li>\r\n<ul>\r\n\r\n<p>Inorganic (chemical) fertilizers, pesticides, herbicides, and mechanical compaction damage these beneficial soil microbes and reduce or delete the benefits of a healthy soil food web.  This breakdown of microbial functioning can be the cause of poor plant growth and color, low resistance to garden pests and pathogens, and decreased fruit and vegetable production. Without the re-introduction of the beneficial microbes found in well-made compost, garden maintenance becomes a dependent cycle of chemical inputs and controls, spreading pesticide pollution by air and leaching through the soil to pollute our groundwater, creeks, and bay waters.</p><p>The tea made here at Lyngso Garden Materials, Inc is specifically called Actively Aerated Compost Tea (AACT) in reference to the careful brewing process that maintains oxygen levels necessary for aerobic functioning.</p><p>AACT is composed of living biology and is therefore very sensitive to heat, sunlight, and oxygen loss and should be protected until applied; no more than a few hours at the most, from purchase.  If you detect \"bad\" or rotten smells, do not use the tea, as the biology has been damaged and will contain harmful by-products of anaerobic reproduction.</p><p>AACT can be used full strength or diluted up to 1:4. If chloramine-treated city water is used for dilution the water must be pre-treated using Amquel or another aquarium product that breaks down the chloramine.  Another treatment to neutralize the chloramine is by mixing a small amount of liquid humates (Humic Acid) into the city water before putting the AACT in. Application can be made manually with a watering can to the soil.  Rinse out the container and let it air dry.</p><p>It is important to provide food for the biology if you use AACT as a soil drench.  A liquid fertilizer such as Native Nutrients Fish Hydrolysate or Native Nutrients Kelp may be added to the AACT before applying.   A 1\" layer of compost and mulch will provide additional food for the organisms.</p><p>Tea brewing & compost production are under the direction of Alane Weber, Certified Adviser for the Soil Food Web, Inc (www.soilfoodweb.com) and are regularly tested for microbial health and diversity.  Test results are available upon request.</p>\r\n<ul><li>AACT is not for human or animal consumption.</li><li>Do not apply AACT directly onto food crops.</li><li>Wash your hands with soap and water after applying AACT.</li></ul><p></p>\r\n<p>Actively Aerated Compost Tea (AACT) Pricing:</p><ul><li>$12.00 per gallon (if less than 18 gallons)</li><li>$10.00 per gallon (if 18 gallons or more in your own bulk container. No one-gallon containers please.)</li></ul><p>One gallon and three-gallon containers are available for purchase and if cleaned, can be reused.</p><ul><li>1-gallon containers $3.00</li><li>2.5-gallon containers $8.00</li></ul><p></p><p>Actively Aerated Compost Tea (AACT) is available on a first-come-first-served basis. To ensure we have the quantity you need, we suggest you place your bulk orders before Tuesday at noon for our Wednesday and Thursday brew. </p><p>If you would like to be on our weekly email notification schedule for our Actively Aerated Compost Tea (AACT) please subscribe to our AACT Email list under the Community Resources tab and find the AACT article. Or click the link below.</p><p><a href=\"https://www.lyngsogarden.com/community-resources/actively-aerated-compost-tea-aact/\" target=\"blank\"></a></p>', 'activelyAeratedCompostTea.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Inactive', NULL, NULL),
(29, 'fc57931a-1c24-11ee-9885-89d07af14ba3', 'BBBC', 'bu’s-blend-biodynamic-compost-', 'Bu’s Blend Biodynamic Compost ', '<p>A Demeter(R) USA certified biodynamic compost. Contains no GMOs, pesticides, sewage sludge, growth hormones or synthetic chemicals. Acts as an alternative to chemical, synthetic, and \"faux\" organic soil amendments. Excellent compost to feed your soil.</p><p>Ingredients: Dairy cow manure, straw, wood chips, and concentrations of yarrow, chamomile, valerian, stinging nettle, dandelion, and oak bark.</p><p>For good soil & seasonal care: Spread 1/2\" to 1\" of Bu\'s Blend over planting area (for edibles and grass), watering well (for roses and other bushes), or drip line (for larger trees). Water in (or let the rain do it for you) and let the microbes do the work. Repeat every 3-4 months.</p><p>For poor soil: Break up the soil and apply up to 2\" of Bu\'s Blend on top. Water deeply & repeat every 2 weeks or so until soil improves. The water will draw beneficial microbes deep into the soil, where they will work to improve soil structure and vitality.</p>', 'busBlendBiodynamicCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(30, 'fc57946e-1c24-11ee-9885-89d07af14ba3', 'DDOC', 'double-doody-organic-compost', 'Double Doody Organic Compost', '<p>Double Doody Compost is an earthy blend of nutrient-rich horse and cow manure.</p><p>Adds vigor to plants, promotes root growth, aids water penetration, and improves the structure and quality of the soil.</p><p>Perfect for veggies, shrubs, trees, plants, and gardens, Point Reyes Double Doody is an excellent top dressing to help protect roots and soil from temperature damage. Lab-tested for the highest nutrient value, Double Doody has an excellent carbon to nitrogen ratio and iron reserve, and can assist in correcting any degree of deficiency of phosphorous, potassium and sulfate. Its stability and maturity means the rich nutrients are readily available – little of this stout stuff goes a long, long way.</p><p>Nutrient-wise, it offers three basic elements critical to plant health: nitrogen, phosphorus, and potassium. Nitrogen allows plants to produce the proteins needed to build living tissue for green stems, strong roots, and lots of leaves. Phosphorus helps move energy throughout the plant, especially important in maturing plants. Potassium aids plants in adapting sugars needed in growth and is especially helpful in root crops.</p><p>Double Doody Compost is CDFA OIM listed for organic use. </p>', 'doubleDoodyOrganicCompost.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(31, 'fc5795c2-1c24-11ee-9885-89d07af14ba3', 'HOWC', 'heritage-organics-worm-castings', 'Heritage Organics Worm Castings', '<p>Heritage Organics® Premium Quality Organic Worm Castings are an all-in-one Soil Amendment that is safe for the environment, children and pets. For millions of years earthworms have continued the “Cycle of Fertility” by converting organic matter into vermicompost. Odorless. Great for indoor/outdoor use. CDFA & OMRI listed for organic use.</p>\r\n<p>APPLICATION RATES:</p><ul><li>Vegetable Gardens – Till in 1/2\" of worm castings or top dress with 1\" of worm castings around plants. Re-apply every 3 to 6 month with 1/2\" of worm castings.</li><li>Potting Mix – Mix in 1 part of worm castings to every 4 parts of potting soil</li><li> House Plants & Flower Beds – Apply 1/2\" of worm castings at the beginning of spring, summer & fall. Till in worm castings if possible.</li><li>New & Established Lawns – Apply 10 pounds per 100 square feet. Water lawns as usual.</li><li>Fruit Trees – Apply 1/2\" – 1\" of worm castings under half the diameter oft he trees canopy. Till in if possible.</li><li>Worm Castings are perfect for a plant tea. Mix 2 cups castings with 5 gallons of water. Let steep for 1 hour and feed plants.</li></ul><br /><p>INGREDIENTS: Worm Castings</p>', 'heritageOrganics.png', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(32, 'fc5796ee-1c24-11ee-9885-89d07af14ba3', 'SCCOB', 'seacoast-biodynamic-compost-', 'Seacoast Biodynamic Compost ', '<p>SeaCoast Compost is a premium, Biodynamic® compost crafted from the finest combination of sea and land ingredients. We gather the “waste” from three iconic Oregon coast industries and use these high-quality inputs to create nutrient-rich compost. The mixture includes fish, shrimp and crab leftovers from seafood processing, alder hardwood from the lumber industry, and cow manure and bedding from organic dairies. They add homeopathic preparations to enliven the compost and stimulate plants to maximize their effectiveness in their environments. The resulting compost offers a feast for your soil and plants.</p><p>SeaCoast Biodynamic Compost is available in 1 cubic foot bags.</p>', 'seaCoastCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(33, 'fc579928-1c24-11ee-9885-89d07af14ba3', 'OBULL', 'oregon-bull-organic-aged-humus---special-order', 'Oregon Bull Organic Aged Humus - Special Order', '<p>AVAILABLE BY SPECIAL ORDER ONLY. Order minimum is 12 cubic yards. </p><p>Oregon Bull Organic Aged Humus is not compost but rather humus - it is the manure of cattle that have been left to decompose over time. The manure comes from an old feed yard where animals were grass-fed and barley finished. This was before the days of GMOs, hormones, and antibiotics. The process of humification is much slower than composting and involves a greater diversity of microbes including fungi. You will notice on the Soil Food Web Report that the Oregon Bull Organic Aged Humus has a higher fungal count than compost, it has a more diverse soil food web and will benefit a wide range of plants.</p><p>The Oregon Bull Organic Aged Humus can be used for food crops including vegetable gardens, fruit trees, berries and as well as roses and perennials. As with all composts and worm castings, you can apply the Humus as a top dressing but then do apply mulch on top to protect it from the sun, wind, and rain.</p><p>Due to the fine nature of the humus, you will find that it may shed water if it is dry. If you incorporate it into the soil lightly that will help to remoisten it.  If you are side dressing then wet the soil, apply the Oregon Bull, then apply a 2-3\" layer of mulch, and then water the mulch. It will supply soluble nutrients and lots of life. A 3/8\"-1/2\" layer on top of the soil followed by mulch is all you need for most plants. If incorporating it into the soil 1/2\" - 1\" of Oregon Bull to a depth of 6-8\" soil is sufficient from a wide range of plants. If planting vegetables, go with a higher rate of 1\" and incorporate to a depth of 6-8\" of soil.</p><p>We sell the Oregon Bull Organic Aged Humus in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase the Humus by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Oregon Bull Organic Aged Humus is OMRI and CDFA OIM listed for organic use.</p>', 'oregonBullOrganicAgedHumus.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(34, 'fc579ab8-1c24-11ee-9885-89d07af14ba3', 'OAM', 'organic-amendment-mix-1', 'Organic Amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending. </p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment. </p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(35, 'fc579bda-1c24-11ee-9885-89d07af14ba3', 'DIESTEL', 'organic-diestel-structured-compost-', 'Organic Diestel Structured Compost ', '<p>Diestel Structured Compost delivers vitality to the soil. Diestel Structured Compost is completely finished and is not a hot compost. The ingredients are sourced directly from the Diestel family turkey ranch where turkeys are allowed to develop at a natural growth rate. The carbon used to make the Diestel Structured Compost comes from forest trimmings from the Sierra Nevada Foothills. The compost is given time and consistent attention to develop into a dark brown, fresh-smelling, living compost ready to add life and feed your plants. </p><p>For additional organic fertilizer and microbiology, mix in We sell the Diestel Structured Compost in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase the Garden Compost by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.\r\n</p><p>Diestel Structured Compost is CDFA OIM listed for organic use.</p>', 'OrganicDiestelStructuredCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(36, 'fc579d38-1c24-11ee-9885-89d07af14ba3', 'OC', 'organic-green-waste-garden-compost', 'Organic Green Waste Garden Compost', '<p>Garden Compost is composted green waste and is OMRI and CDFA listed as organic. It is a rich amendment that is especially good for improving soils that are too sandy and drain too fast as well as to amend clay soil. Garden Compost is still warm, so spread it out on the surface or mix into your existing soil.  Spread the Garden Compost to a depth of 2 inches and mix in with your soil. </p><p>Although the Garden Compost is listed as CDFA OIM, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass. Therefore, we don\'t recommend it for organic food production. If you are looking for compost to grow organic vegetable, please consider using our Organic Diestel Structured Compost. </p><p>We sell the Garden Compost in one cubic foot bags, we supply the bags, you fill them. For larger areas, you will want to purchase the Garden Compost by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Garden Compost is OMRI and CDFA listed for organic use.\r\n</p><p>Organic Green Waste Garden Compost complies with SB 1383 requirements and is produced in a fully permitted composting facility conforming to the State of California regulations set forth by the California Integrated Waste Management Board (CIWMB) Title 14, Division 7 California Code of Regulations governing composting operations.</p>', 'organicGreenWasteGardenCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(37, 'fc579e64-1c24-11ee-9885-89d07af14ba3', 'WEBB', 'webb-ranch-premium-organic-compost-', 'Webb Ranch Premium Organic Compost ', '<p>Webb Ranch Premium Organic Compost is screened and aged over 6 months. Compost is weed-free, smells earthy, and is an invaluable addition to any garden because it improves soil structure. The primary soil food is organic matter and compost is the best way to provide it— making Webb Ranch Compost a key component of successful gardens.  \r\nWebb Ranch Premium Organic Compost is made from fine wood shavings, horse manure, hay, and green waste from Webb Ranch’s organic farm.  It is ideal for use in vegetable gardens, flower beds, around trees and shrubs, and on lawns.  Add it to the soil at the time of planting, side-dress your existing plants, or use it as a surface mulch and watch your garden thrive!\r\n</p><p>Although the Garden Compost is listed as CDFA OIM, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass. Therefore, we don\'t recommend it for organic food production. If you are looking for compost to grow organic vegetable, please consider using our Organic Diestel Structured Compost. </p><p>How to Use: </p><p>Amending Soil: Work 1-2 inches of compost into the top 3-5 inches of soil.</p><p>Growing Fruit and Vegetables- Spread 1-2 inches of compost on top of the garden bed in the Fall.  Till it into the soil in the Springtime.  Add ½ inch of compost monthly as plants begin to grow quickly.</p><p>Lawn: For new lawns, add up to 3 inches of compost into the soil and till to a depth of 5-7 inches.  For existing lawns, incorporate 1 inch of compost into the bald spots before reseeding.  You can also topdress lawns with ¼ inch of finely screened compost.  Rake the compost evenly throughout the grass area.  Over time the compost will improve the soil, reducing the need for other products.</p><p>New and Existing Plants: When planting, work 1 inch of compost into the top 2 inches of soil in and around the planting hole.  Apply 1-2 inches of compost as a mulch around new and existing plants in early Spring or Fall to improve the soil, prevent weeds, and help retain moisture.  You can also gently till compost into the soil once or twice a year.  Do not place compost directly against the stem or trunk of a plant, which could cause rot or invite pests.</p><p>Compost Coverage: 2 cubic feet of compost will cover approximately 24 square feet at a depth of 1 inch.</p><p>We sell the Webb Ranch Premium Organic Compost in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Webb Ranch Premium Organic Compost is CDFA OIM listed for organic use. </p>', 'webRanchPremiumCompost.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(38, 'fc579fd6-1c24-11ee-9885-89d07af14ba3', 'BIOSWALE', 'biotreatment-soil-mix', 'Biotreatment Soil Mix', '<p>Biotreatment Soil Mix is very effective at filtering stormwater runoff before it enters our storm drains and waterways. The process of running the storm or runoff water through the Biotreatment Soil Mix allows the water to be cleaned up by the biology and filtered so pollutants and sediments are much reduced. The Biotreatment Soil Mix will support many vernal and riparian plant communities, the roots of the plants will also help clean up the stormwater runoff. The quality of water going into our streams, creeks, bay and ocean will be much improved creating a much healthier habitat for our native amphibians and fish.</p><p>Our Biotreatment Mix meets the “Soil Specifications: criteria approved by the Executive Officer of the San Francisco Bay Regional Water Quality Control Board on April 18, 2016, in accordance with Provision C.3.c.i.(2)(c)(ii) of the Municipal Regional Stormwater Permit (MRP). Meets BASMAA and SFPUC specifications. </p>', 'biotreatmentSoilMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(39, 'fc57a0da-1c24-11ee-9885-89d07af14ba3', 'BBBPS', 'baby-bu\'s-biodynamic-potting-mix', 'Baby Bu\'s Biodynamic Potting Mix', '<p>Baby Bu bursts with premium materials specially blended with Bu\'s Blend(TM) Biodynamic(R) Compost to Support plant & soil life in your raised beds, pots, container gardens, hanging baskets, and houseplants.</p><p>Baby Bu\'s(TM) Biodynamic(R) Blend Potting Soil:</p><ul><li>Contains no GMOs, pesticides, sewage sludge, growth hormones, or synthetic chemicals</li><li>Acts as an alternative to chemical, synthetic, and \"faux\" soil amendments</li><li>Aids in the proliferation of beneficial soil microbes</li><li> Is ideal for seeds, seedlings, & transplants</li><li>Saves water through proper moisture absorption at the surface and dissipation at the root levels</li><li>Is safe and non-toxic for your kids, your pets, and our planet.</li></ul><br/><p>Ingredients:</p><p>Coir, compost (composted organic dairy cow manure, wood chips, straw, concentrations of yarrow, chamomile, valerian, stinging nettle, dandelion, & oak bark), fir bark, perlite, worm castings, soybean meal, fish meal, fish bone meal, langbeinite, alfalfa meal, crab meal, green sand, neem seed meal, volcanic ash, biochar & kelp meal. </p><p>Baby Bu\'s Biodynamic Potting Mix is available pre-bagged in 1.5 cubic foot.</p>', 'babyBuBiodynamicPottingSoil.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL);
INSERT INTO `products` (`id`, `uuid`, `sku`, `slug`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`, `created_at`, `updated_at`) VALUES
(40, 'fc57a238-1c24-11ee-9885-89d07af14ba3', 'DEANPP', 'down-to-earth-all-natural-potting-soil', 'Down To Earth All Natural Potting Soil', '<p>Our blend of premium organic ingredients makes Down To Earth™ All Natural Potting Soil an excellent all purpose mix for seed starting, transplanting or container gardening. It’s ideal for vegetables, flowers, houseplants and trees in indoor and outdoor containers, hanging baskets or planter boxes. It is also recommended for amending garden soils or for preparing raised beds. This Aged Pacific Northwest Bark, Coconut Coir Fiber and Vermicompost based soil is ideal for the developing root systems of all plants. Enhanced with pure Earthworm Castings, Mycorrhizal Fungi and Organic Fertilizer, DTE™ All Natural Potting Soil will nourish your plants naturally.</p><p>GUARANTEED ANALYSIS:</p><ul><li>Total Nitrogen (N) 0.1%\r\n0.1% Water Insoluble Nitrogen</li><li>Available Phosphate (P2O5) 0.1%</li><li>Soluble Potash (K2O) 0.1%</li><li>SOIL AMENDING INGREDIENTS: Bark, Coir Fiber, Perlite, Diatomite, Vermicompost, Oyster Shell, and Dolomitic Limestone (for pH adjustment)</li><li>DERIVED FROM: Earthworm Castings, Fish Bone Meal, Blood Meal, Langbeinite, Greensand, Volcanic Ash and Kelp Meal.</li></ul><br/><p>ALSO CONTAINS NON-PLANT FOOD INGREDIENT(S):\r\nMycorrhizal Inoculant (Glomus intraradices 0.016 prop/gm, Glomus mosseae 0.017 prop/gm, Glomus aggregatum 0.018 prop/gm, Glomus etunicatum 0.02 prop/gm, Pisolithus tinctorius 280 prop/gm, Rhizopogon villosullus 8 prop/gm, Rhizopogon luteolus 8 prop/gm, Rhizopogon amylopogon 8 prop/gm, Rhizopogon fulvigleba 8 prop/gm, Scleroderma citrinum 17 prop/gm, Scleroderma cepa 17 prop/gm)</p><p>APPLICATION RATES:</p><ul><li>This potting soil is ready to use right from the bag. Select the appropriate size container for your plant and add 2-3 inches of fresh potting soil.</li><li>Gently remove the plant from its current pot and carefully untangle any existing roots.</li><li>Place the plant in the new container and add soil to completely cover the root system up to the base of the stem.</li><li>Lightly tamp down the soil to remove any air pockets and secure the plant. Water thoroughly and allow the excess water to drain out the bottom of the pot.</li><li> Most plants will benefit from a regular feeding schedule and consistent watering practices. Take pleasure in your plants and be sure to water when the soil feels dry to the touch.</li></ul><br /><p>Down To Earth All Natural Potting Soil will supply enough organic nutrients to feed the average plant for 3 to 4 weeks. To ensure consistent performance, please remember to tightly close the bag after each use.</p>', 'downToEarchAllNaturalPottingSoil.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(41, 'fc57a38c-1c24-11ee-9885-89d07af14ba3', 'ES', 'essential-soil-blend', 'Essential Soil Blend', '<p>Essential Soil Blend is a substitute soil mix for our regular Essential Soil.</p><p>Essential Soil Blend is an all-natural mix that is engineered to resist compaction, has excellent water penetration, good aeration, and will support rapid root growth. Essential Soil Blend is recommended for raised planter beds and will support excellent root growth. An ideal soil for vegetables and fruit trees.</p><p>Essential Soil Blend is comprised of the following: ¼”-Pea Gravel which is an inorganic mineral component for drainage and aeration; Organic Garden Compost provides organic matter and soluble nutrients; ¼-Fir Bark is a wood amendment acts as carbon matter; Coarse Sand is an inorganic mineral component; Bio-Nutrient Package provides soil microbiology.</p><p>Due to the biological nature of the Essential Soil, proper irrigation and mulch cover is required. Do not let the soil sit fallow. Cover cropping during Winter is highly recommended.\r\n</p><p>We sell the Essential Soil Blend in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase the Mix by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', 'essentialSoil.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(42, 'fc57a5f8-1c24-11ee-9885-89d07af14ba3', 'LM', 'landscape-mix', 'Landscape Mix', '<p>Our Landscape Mix (formerly \"Nursery Mix\") is an all-purpose soil mix for outdoor use. It contains Sandy Loam, Redwood Sawdust, Organic Garden Compost, and Organic Crustacean Meal. You can spread it out over an existing soil and turn it under wherever you need to raise the grade and improve your soil. Our Landscape Mix can also be used for under new sod installation with an application of Bio-Turf or Bio-Live organic fertilizers.</p><p>If you are growing vegetables we recommend using either the Essential Soil or our Lyngso Vegetable Blend. For vegetables, the Landscape Mix will need either an application of organic fertilizer like Bio-Fish or All Purpose or a 2\" application of Diestel Structured Compost worked into the top 6\"-8\" of the raised bed.</p><p>We sell the Landscape Mix in one cubic foot bags, we supply the bags, you fill them. For larger areas, you\'ll want to purchase the Nursery Mix by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job-site.\r\n</p>', 'landScapeMix.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(43, 'fc57a738-1c24-11ee-9885-89d07af14ba3', 'OAM2', 'organic-amendment-mix-2', 'Organic Amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending.</p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending.</p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment.</p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(44, 'fc57a846-1c24-11ee-9885-89d07af14ba3', '38PG', '3-8-pea-gravel-', '3/8\" Pea Gravel ', '<p>3/8\" Pea Gravel is a clean stone mix often used in small line Portland cement and concrete mixes.  The gravel can also be used as a backfill for drainage runs and underground storage tanks. 3/8\" pea gravel also makes for a care-free ground cover, patio mix, sturdy driveway material, dog run, and quality roofing material.</p>\r\n<p>We sell the 3/8\" Pea Gravel in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. Bring your truck and we can load it, or have us deliver the stones to you in the Bay Area. For orders over 20 tons please call us for direct pricing.</p>\r\n<p>3/8\" Pea Gravel may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', '3-8-pea-gravel.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(45, 'fc57a9b8-1c24-11ee-9885-89d07af14ba3', '34CDR', '3-4-crushed-drain-rock', '3/4\" Crushed Drain Rock', '<p>Used for back-filling perforated drainpipes and french drains, allowing water flow in your intended direction. The 3/4\" Crushed Drain Rock is also a sturdy material for potholes and driveways. The crushed rock locks together making a more stable surface and provide a strong foundation.\r\n</p>\r\n<p>Please note: accurate product pictures can be found by clicking on \'VIEW MORE\' under the currently displayed picture. </p>\r\n<p>We sell the 3/4\" Crushed Drain Rock in one cubic foot bag, we supply the bags and you fill them in our San Carlos location. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite in the Bay Area. For orders over 20 tons please call us for direct pricing.</p><p>3/4\" Crushed Drain Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', '3-4crushedDrainRock.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(46, 'fc57aabc-1c24-11ee-9885-89d07af14ba3', 'BBF', 'black-basalt-fines', 'Black Basalt Fines', '<p>Black Basalt Fines are 1/4\" minus basalt quarry fines that are charcoal gray in color. Typically used for pathways and parking areas, dog runs, and utility yards. These quarry fines will not compact to a firm surface and is permeable. \r\n</p>\r\n<p>Standard application is to spread about 2\", water and roll it, then apply the last 1\"-2\" for extra stability. </p>\r\n<p>We sell the Black Basalt Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Black Basalt Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'blackBasaltFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(47, 'fc57abf2-1c24-11ee-9885-89d07af14ba3', 'BBFS', 'black-basalt-fines-stabilized-', 'Black Basalt Fines Stabilized ', '<p>Black Basalt Fines are 1/4\" minus basalt quarry fines that are charcoal gray in color. Typically used for pathways and parking areas, dog runs, and utility yards. These quarry fines will not compact to a firm surface and is permeable. \r\n</p>\r\n<p>Standard application is to spread about 2\", water and roll it, then apply the last 1\"-2\" for extra stability. </p>\r\n<p>We sell the Black Basalt Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Black Basalt Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'blackBasaltFinesStabilized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(48, 'fc57acec-1c24-11ee-9885-89d07af14ba3', 'BF', 'blue-fines', 'Blue Fines', '<p>Blue Fines is a 1/4\" minus quarry fines is typically used for pathways and parking areas, dog runs, utility yards and allows water to permeate. Blue Fines should be spread 3\"-4\" deep and compacted. You will have a natural-looking pathway for years to come.\r\n</p>\r\n<p>We sell the Blue Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'blueFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(49, 'fc57ae4a-1c24-11ee-9885-89d07af14ba3', 'BFS', 'blue-fines-stabilized', 'Blue Fines Stabilized', '<p>Blue Fines Stabilized stone is not a substitute for a non-permeable concrete or asphalt surface. This product was developed to mitigate erosion during heavy rains and is perfect for pathways and between flagstone and pavers. The surface will always have some loose grit that can be tracked. \r\n</p>\r\n<p>It is critical to follow the proper installation instructions to ensure the performance of the product. Lyngso will not be responsible for unsatisfactory results due to improper installation. See the attached installation guidelines. </p>\r\n<p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n<p>Blue Fines are a 1/4\" minus rock that is perfect for pathways and between flagstone and pavers.  Stabilized Blue Fines are available in stock and are pre-mixed with a stabilizer. For areas where the stability of the pathway fines is desired, a stabilizer can be added. We only use a non-toxic, natural stabilizer. </p><p>Blue Fines should be spread and compacted at 2\"- 4\". There may be a 15-20% shrinkage during compaction so plan ahead with your calculations. Stabilized Blue Fines will need to be set with spraying water once compacted. Curing time is necessary before using the space and varies depending on the weather.\r\n</p><p>We sell the Blue Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'blueFinesStabilized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(50, 'fc57af8a-1c24-11ee-9885-89d07af14ba3', 'DBF', 'desert-brown-fines', 'Desert Brown Fines', '<p>Desert Brown Fines are brown decomposed 3/8\" minus quarry fines. Commonly used for decorative pathways, parking areas, utility yards and dog runs. Desert Brown Fines packs well due to the larger quarry gravel and will have visible grits on the surface layer. Permeable material. Desert Brown Fines should be spread 3\"-4\" deep and compacted. \r\n</p>\r\n<p>We sell the Desert Brown Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n', 'desertBrownFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(51, 'fc57b0ac-1c24-11ee-9885-89d07af14ba3', 'SGPF', 'sunset-gold-path-fines', 'Sunset Gold Path Fines', '<p>Sunset Gold Path Fines are 1/4\" minus gold granite fines and is typically referred to as decomposed granite. Sunset Gold Path Fines are gold and tan in color and are used for pathways, driveways, parking areas, and between flagstone and pavers. Sunset Gold Path Fines is permeable and once compacted, top layer will still have some loose fines.  Apply 2\" deep, water and roll, then add a 1\" - 2\" layer to complete the project. \r\n</p>\r\n<p>We sell the Sunset Gold Path Fines in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>Sunset Gold Path Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'sunsetGoldPathFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(52, 'fc57b1ec-1c24-11ee-9885-89d07af14ba3', 'SGPFS', 'sunset-gold-path-fines-stabilized', 'Sunset Gold Path Fines Stabilized', '<p>Sunset Gold Path Fines Stabilized stones is not a substitute for a non-permeable concrete or asphalt surface. This product was developed to mitigate erosion during heavy rains. The surface will always have some loose grit that can be tracked.</p>\r\n<p>Gold Path Fines stones are pre-mixed with stabilizer and available in stock.  Non-toxic stabilizer material is added to the mix in applications where high stability is needed.</p><p>It is critical to follow the proper installation instructions to ensure the performance of the product. Lyngso will not be responsible for unsatisfactory results due to improper installation. See the attached installation guidelines. </p><p>Sunset Gold Path Fines are 1/4\" minus gold granite fines. The Sunset Gold Path Fines are gold and tan in color and are used for pathways and between flagstone and pavers. Stabilized Sunset Gold Path Fines are available in stock and are pre-mixed with a stabilizer. For areas where the stability of the pathway fines is desired, a stabilizer can be added. We only use a non-toxic, natural stabilizer. </p><p>Sunset Gold Path Fines should be spread and compacted at 2\"- 4\". There may be a 15-20% shrinkage during compaction so plan ahead with your calculations. Stabilized Sunset Gold Path Fines will need to be set with spraying water once compacted. Curing time is necessary before using the space and varies depending on the weather. </p><p>We sell the Sunset Gold Path Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons, please call us for direct pricing.\r\n</p><p>Sunset Gold Path Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'sunsetGoldPathFines-stabliized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(53, 'fc57b3cc-1c24-11ee-9885-89d07af14ba3', 'ASTC', '1.5-7-autumn-slate-tumbled-chip-', '1.5\"-7\" Autumn Slate Tumbled Chip ', '<ul>\r\n<li>Origin: Asia</li><li>Classification: Slate</li><li>Color Range: Charcoals, Tans, Bronze Rusts</li><li>Finishes: Crushed Tumbled Natural Matte</li>\r\n</ul>\r\n\r\n\r\n<p>The Autumn Slate Chips look great in contemporary gardens, walkway lining and accent areas. Slate material with tans and bronze colored rusts. Use as an unusual ground cover. Tumbled for smooth edges. 1.5\"-7\" in size. </p>\r\n<p>We sell the Autumn Slate Tumbled Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p>\r\n', '15-7AutumnSlateTumbledChip.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(54, 'fc57b4f8-1c24-11ee-9885-89d07af14ba3', 'MBTSC', '1.5-7-midnight-black-slate-tumbled-chip', '1.5\"-7\" Midnight Black Slate Tumbled Chip', '<ul>\r\n<li>Origin: Asia</li><li>Classification: Slate</li><li>Color Range: Charcoals, Tans</li><li>Finishes: Crushed Tumbled Natural Matte</li>\r\n</ul>\r\n\r\n\r\n<p>The black Slate Tumbled Chips look great in contemporary gardens, edge areas near walkways and drives, or use it as an unusual ground cover. Tumbled for smooth edges.\r\n</p>\r\n<p>We sell the Midnight Black Slate Tumbled Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p>\r\n', '15-7MidnightBlackSlateTumbledChip.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(55, 'fc57b642-1c24-11ee-9885-89d07af14ba3', '1278GGR', '1-2-7-8-glacier-green', '1/2\"-7/8\" Glacier Green', '<p>Our 1/2\" - 7/8\" Glacier Green Gravel is crushed and cleaned, great for gardens, walkways and decorative accents in gardens.\r\n</p>\r\n<p>The Glacier Green Gravel can be purchased by the bag or delivery may be possible to your SF Bay area home.  Visit our large showroom and landscaping yard in San Carlos. </p>\r\n', '12-78GlacerGreen.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(56, 'fc57b73c-1c24-11ee-9885-89d07af14ba3', '38CBB', '1-4-&-3-8-crushed-black-basalt', '1/4\" & 3/8\" Crushed Black Basalt', '<p>3/8\" Crushed Black Basalt rock is attractive decorative gravel with charcoal hues. It\'s angular in shape, it packs well for walkways, pathways, patios and driveways.\r\n</p>\r\n<p>We sell the 3/8\" Crushed Black Basalt in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Crushed Black Basalt may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'crushedBlackBasalt.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(57, 'fc57b87c-1c24-11ee-9885-89d07af14ba3', '18DG', '1-8,-3-8-&-3-4-desert-gold-', '1/8\", 3/8\" & 3/4\" Desert Gold ', '<ul><li>Origin: North America</li><li>Classification: Gold Granite</li><li>Finishes: Crushed Angular Rocks</li><li>Application: Great for walkways/pathways</li></ul>\r\n<br/ >\r\n<p>Our Desert Gold stone material is a vibrant tan and white speckled crushed granite. Seamlessly integrates into succulent gardens, xeriscaping and various design aspect of a striking landscape. Common uses include pathways, driveways, and decorative accents. Also, used as a garden groundcover, and in planting beds as rock mulch. Desert Gold will contain fines. \r\n</p><p>Desert Gold is available in three nominal sizes: 1/8\", 3/8\" and  3/4\".</p>\r\n<p>Desert Gold may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '1-8DesertGold.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(58, 'fc57b99e-1c24-11ee-9885-89d07af14ba3', '38T', '3-8-taffy', '3/8\" Taffy', '<ul><li>Origin: North America</li><li>Color Range: Tans, Yellows, Buffs</li><li>Finishes: Crushed Angular - Natural Matte</li></ul>\r\n<br/ >\r\n<p>Lightweight crushed gravel. Size range is  1/4 \" -  1/2 \"\r\nBuff, orange and pink hues. Used for walkways and as a decorative mulch. Contains fines. </p><p>Desert Gold is available in three nominal sizes: 1/8\", 3/8\" and  3/4\".</p>\r\n<p>We sell the 3/8\" Taffy in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Taffy may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8Taffy.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(59, 'fc57bade-1c24-11ee-9885-89d07af14ba3', '21CBB', '2-1-2-crushed-black-basalt-', '2 1/2\" Crushed Black Basalt ', '<p>2 1/2\" Crushed Black Basalt is attractive decorative gravel with dark gray and charcoal hues.  May be some reds visible as well.</p>\r\n<p>We sell the 2 1/2\" Crushed Black Basalt in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck. For orders over 20 tons please call us for direct pricing.</p><p>2 1/2\" Crushed Black Basalt may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '21-2CrushedBlackBasalt.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(60, 'fc57bd90-1c24-11ee-9885-89d07af14ba3', '38CRG', '3-8-crushed-rose-gold-', '3/8\" Crushed Rose Gold ', '<p>3/8\" Crushed Rose Gold is a beautiful shimmery rock that is very attractive with speckles of reflectiveness. It\'s rosy tan in color. Works well as garden groundcover for succulents and dry gardens. This product contains a lot of fines and it can not be separated from the gravel during pickup or delivery. Once gravel is installed, wet the area down with water so that the fines will settle to the bottom and the gravel will surface. </p>\r\n<p>3/8\" Crushed Rose Gold may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8CrushedRoseGold.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(61, 'fc57beee-1c24-11ee-9885-89d07af14ba3', '38Y', '3-8-crushed-yosemite-tan', '3/8\" Crushed Yosemite Tan', '<p>3/8\" Crushed Yosemite Tan is decorative gravel that is used in pathways and walkways. The material will contain fines.</p>\r\n<p>We sell the 3/8\" Crushed Yosemite Tan in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Crushed Yosemite Tan may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8CrushedYosemiteTan.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(62, 'fc57c010-1c24-11ee-9885-89d07af14ba3', '24LCC', 'lin-creek-cobbles', 'Lin Creek Cobbles', '<p>Lin Creek Cobbles are rounded river rock cobblestones; however, some cobblestones are fractured and split. Colors include brown, tan, rust, grey, and blue-grey. The cobbles are commonly used for dry creek beds, borders, under oak trees and water features. </p>\r\n<p>LIN CREEK COBBLES WILL CONTAIN FINES - after installation, water the fines down to settle the dust and to expose the pebbles. </p><p>The 2\"-4\" Lin Creek Cobbles will cover about 85 square feet of area and the 3\"-8\" Lin Creek Cobbles will cover about 60 square feet of area.</p><p>Lin Creek Cobbles are sold in cubic foot sacks, we supply the bags, you load them. For larger areas, you will want to purchase the Lin Creek Cobbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lin Creek Cobbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p><p>Lin Creek Cobbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '2-4LinCreekCobble.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(63, 'fc57c150-1c24-11ee-9885-89d07af14ba3', '12LC', 'lin-creek-pebbles', 'Lin Creek Pebbles', '<p>Lin Creek Pebbles are rounded river rock pebbles, colors include brown, tan, grey and blue-grey. Commonly used as garden ground-cover, dry creek beds, and borders. </p>\r\n<p>LIN CREEK PEBBLES WILL CONTAIN FINES - after installation, water the fines down to settle the dust and to expose the pebbles. </p><p>Lin Creek Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Lin Creek Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lin Creek Cobbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.\r\n</p><p>Lin Creek Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '1-12LinCreekPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(64, 'fc57c29a-1c24-11ee-9885-89d07af14ba3', '38LODI', 'lodi-creek-pebbles', 'Lodi Creek Pebbles', '<p>Lodi Pebbles are a mixture of rounded and angular pebbles containing white, grey, blue, tan, brown and red colors. Commonly used for garden ground cover, pathways, planting beds, and as an exposed aggregate in concrete.</p>\r\n<p>Lodi Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Lodi Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lodi Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying. </p><p>Lodi Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', 'lodiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(65, 'fc57c402-1c24-11ee-9885-89d07af14ba3', '38PAMI', 'pami-pebbles', 'Pami Pebbles', '<p>Pami Pebbles are a mixture of rounded pebbles, beautiful muted colors including burgundy, pink, tan, blue grey, and green. Great for barefoot pathways or garden ground-cover surface. Pami Pebbles are also our most popular aggregate for exposing in concrete walks and driveways.</p>\r\n<p>Pami Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Pami Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Pami Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p>\r\n', '3-4PamiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(66, 'fc57c542-1c24-11ee-9885-89d07af14ba3', '12QP', 'quartz-pebble', 'Quartz Pebble', '<p>Quartz Pebbles are available by special order only. Please call or email us to order. </p>\r\n<p>Quartz Pebbles are a mixture of rounded and angular pebbles, including black, white and grey with a few rust-colored pebbles. Commonly used for garden ground cover, pathways, planting beds and walkways.</p><p>Quartz Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Quartz Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Quartz Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p><p>Quartz Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '1-2QuartzPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(67, 'fc57c68c-1c24-11ee-9885-89d07af14ba3', '12SB', 'salmon-bay-pebbles-limited-availability', 'Salmon Bay Pebbles - Limited Availability', '<p>Salmon Bay Pebbles are a mixture of opaque salmon colored pebbles with some white coloration. It is a beautiful and unique glass like rock. It is best used as an accent in the garden, as a mulch for containers or in dish gardens. Popular in pond applications and in water features.\r\n</p>\r\n<p>Salmon Bay Pebbles do contain fines and are available in two sizes: 1/4\" and 1/2\"</p><p>Salmon Bay Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Salmon Bay Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Salmon Bay Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p>\r\n', 'samonBayPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(68, 'fc57c7f4-1c24-11ee-9885-89d07af14ba3', 'BYHPP', 'buckthorn-yellow-high-polish-pebbles', 'Buckthorn Yellow High Polish Pebbles', '<p>The Buckthorn Yellow High Polish Pebbles are a mixture of yellow and tan pebbles, polished to a bright finish.  Light, natural looking stones are a great finishing color and surface for many indoor and outdoor garden, walkway, yards and planting applications.\r\n</p>\r\n<p>The Buckthorn Yellow High Polish Pebbles come pre-bagged, 55 pounds each.</p>\r\n', 'buckthornYellowHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(69, 'fc57c8ee-1c24-11ee-9885-89d07af14ba3', 'FSHPP', 'five-springs-high-polish-pebbles', 'Five Springs High Polish Pebbles', '<p>The Five Springs High Polished Pebbles are a mixture of red, tan, black, white, and yellow pebbles. Great for indoor or outdoor use, along walkways instead of mulch, outdoor gardens and in fountains or water features.\r\n</p>\r\n<p>The Five Springs High Polished Pebbles come pre-bagged, 55 pounds each.</p>\r\n', '3-11-4FiveSpringsHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(70, 'fc57ca24-1c24-11ee-9885-89d07af14ba3', 'HRHPP', 'henna-red-high-polish-pebbles', 'Henna Red High Polish Pebbles', '<p>The Henna High Polish Pebbles are an assortment of red and brown colored stones. Strikingly beautiful accents in any landscape.  The 3/4\" to 1 1/4\" polished stones provide a finished look in natural settings indoors or outside.\r\n</p>\r\n<p>Henna High Polish Pebbles come pre-bagged, 55 pounds each.</p>\r\n', 'hennaRedHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(71, 'fc57cb46-1c24-11ee-9885-89d07af14ba3', 'JGPP', 'jade-green-high-polish-pebbles', 'Jade Green High Polish Pebbles', '<p>The Jade Green high Polish Pebbles have pale jade-green color with flecks of white, reminiscent of sea foam. These pebbles have a subtle translucency. Polished to a satin sheen.  The mix provides an interesting color tone for indoor and outdoor landscaping applications.\r\n</p>\r\n<p>Jade Green High Polish Pebbles come pre-bagged, 44 pounds each.</p>\r\n', 'jadeGreenHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(72, 'fc57cc9a-1c24-11ee-9885-89d07af14ba3', 'KBHPP', 'kuro-black-high-polish-pebbles', 'Kuro Black High Polish Pebbles', '<p>The Kuro Black Highly Polished Pebbles are an assortment of jet-black stones. Strikingly beautiful accents in any landscape, including shallow creeks, water accents and borders. Natural shine on the pebbles is fade resistant even over time.\r\n</p>\r\n<p>Kuro Black High Polished Pebbles come pre-bagged, 55 pounds each.</p>\r\n', '3-4-1-1-4KuroBlackHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(73, 'fc57cdf8-1c24-11ee-9885-89d07af14ba3', 'NPP', 'niji-pebbles', 'Niji Pebbles', '<p>Niji means rainbow in Japanese. Although the Niji Pebbles do not contain all the colors of the rainbow, they do have a combination of red, blue and white pebbles. An attractive choice for various landscaping projects, gardens, edging on walks and drives, and even fountains and water features.\r\n</p>\r\n<p>Niji Pebbles are available in two sizes: 3/8\" - 5/8\" (1 cm - 1  1/2  cm) and  3/4 \" - 1  1/4 \" (2 cm - 3 cm). Both sizes are available in pre-bagged 44 lbs. bags. For large quantity bulk orders, please contact us directly.</p>\r\n', '2-5-2-8NijiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(74, 'fc57cf2e-1c24-11ee-9885-89d07af14ba3', 'TFWHPP', 'tufa-white-high-polish-pebbles', 'Tufa White High Polish Pebbles', '<p>The Tufa White High Polish Pebbles are an assortment of white, grey stones. Strikingly beautiful accents in any landscape. 3/4\" to 1 1/4\" in size, they offer a bright finish to any landscaping project.  For use internal or outdoor projects.\r\n</p>\r\n<p>Tufa White High Polish Pebbles come pre-bagged, 55 pounds each.</p><p></p>\r\n', 'tufaWhiteHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(75, 'fc57d06e-1c24-11ee-9885-89d07af14ba3', 'WGPP', 'wasabi-green-pebbles', 'Wasabi Green Pebbles', '<p>Marbled soft greens and blue pebbles add an interesting and beautiful color palette to both indoor and outdoor applications.  Non-shiny surface offers a natural appearance.  Looks great in both indoor and outdoor landscaping applications.\r\n</p>\r\n<p>Wasabi Green Pebbles come pre-bagged in 44 lbs. bags</p>\r\n', 'wasabiGreenPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(76, 'fc57d1ae-1c24-11ee-9885-89d07af14ba3', 'WHPP', 'woodgrain-high-polish-pebbles', 'Woodgrain High Polish Pebbles', '<p>Natural woodgrain brown with white high polish pebbles give an earthy appearance with a fine finish.  Natural looking ground cover of eye-catching pebbles with natural striation in multiple brown tones, remarkably similar to wood grain.  The color palette of these pebbles is a warm beige with caramel and chocolate highlights. Polished to a satin sheen.\r\n</p>\r\n<p>Woodgrain High Polished Pebbles come pre-bagged in 44 lbs. bags</p>\r\n', 'woodgrainHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(77, 'fc57d2a8-1c24-11ee-9885-89d07af14ba3', 'WBHPP', 'wuyi-brown-high-polish-pebbles', 'Wuyi Brown High Polish Pebbles', '<p>Rich brown tones from our wuyi brown polished pebbles provide an elegant finish to indoor and outdoor landscaping and water features.  These are special order materials so contact our landscaping experts to determine the correct quantity for your application.\r\n</p>\r\n', 'wuyiBrownHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(78, 'fc57d3a2-1c24-11ee-9885-89d07af14ba3', 'AGB', 'amador-granite-boulder', 'Amador Granite Boulder', '<ul><li>Origin: North America</li><li>Classification: Granite</li><li>Color Range: Greys, Whites, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Coarse grain granite boulders with an interesting angular and sculptural elements. Many boulders might contain plug & feather marks. Reclaimed quarry tailings. Remnants of mid-1800s mining operations. Natural local stone.\r\n</p>\r\n<p>Amador Granite Boulders may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'amadorGraniteBoulders.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(79, 'fc57d51e-1c24-11ee-9885-89d07af14ba3', 'AWGB', 'atwater-granite-boulder', 'Atwater Granite Boulder', '<ul><li>Origin: North America</li><li>Classification: Granite</li><li>Color Range: Greys, Whites, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Atwater Granite Boulders have a smooth sculptural element that make a beautiful statement piece in any landscape.\r\n</p>\r\n', 'atwaterGraniteBoulder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(80, 'fc57d622-1c24-11ee-9885-89d07af14ba3', 'BCSB', 'basalt-columns-sawn-bottom', 'Basalt Columns Sawn Bottom', '<ul><li>Origin: North America</li><li>Classification: Basalt </li><li>Color Range: Blacks, Greys</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Basalt Columns are large columnar shape rocks used where vertical landscape features are desired. Monolithic pieces of art, primarily gray in color with some brown or taupe color variations, sawn bottoms make for easy placement and reduced labor costs.\r\n</p>\r\n', 'basaltColumnsSawnBottom.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(81, 'fc57d71c-1c24-11ee-9885-89d07af14ba3', 'BCSBD', 'basalt-columns-sawn-bottom---drilled', 'Basalt Columns Sawn Bottom - Drilled', '<ul><li>Origin: North America</li><li>Classification: Basalt </li><li>Color Range: Blacks, Greys</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Basalt Columns are large columnar rocks cored to be used as water features. Monolithic pieces of art, primarily gray in color with some brown or taupe color variations, sawn bottoms make for easy placement and reduced labor costs. These columns have been drilled to be used as water features. Group them in threes or more to create a unique and attractive water feature.\r\n</p>\r\n', 'basaltColumnsSawnBottom-Drilled.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(83, 'fc57d866-1c24-11ee-9885-89d07af14ba3', 'CCB', 'chief-cliff-boulders-1', 'Chiefcliff Boulders', '<ul><li>Origin: North America</li><li>Classification: Argillite </li><li>Color Range: Grays, Blues, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Chiefcliff Boulders are decorative gray angular Argillite landscape boulders. These are sedimentary rocks with green moss and lichen highlights. Blocky and irregular shapes. Weight is from 150 pounds to over 4,000 pounds. Size range varies from 16 inches wide by 18 inches tall by 18 inches long to 30 inches wide by 48 inches tall by 60 inches long. Colors range from light grays, blue grays to browns.</p>\r\n', 'chiefcliffBoulders-1.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Inactive', NULL, NULL),
(84, 'fc57d960-1c24-11ee-9885-89d07af14ba3', 'SWP2-3CM', 'snow-white-pebbles', 'Snow White Pebbles', '<p>Snow White Pebbles are unique chalky white pebbles. The surface carries minuscule reflective particles that give this stone the appearance of snow.  The White Pebbles are opaque with a flat finish.  Brighten up dark corners of your yard or gardens, mix with other colors, or add in water features and fountains for a clean appearance.</p>\r\n', 'snowWhitePebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(85, 'fc57dac8-1c24-11ee-9885-89d07af14ba3', 'BB1', 'black-aqua-cove-pebbles', 'Black Aqua Cove Pebbles', '<p>Our Black Aqua Cove Pebbles are irregular decorative beach pebbles. These are the darkest matte black pebble, unlike La Paz, Aqua Cove is non-uniform in shape, imported pebbles.</p><p>Sizes slightly vary from shipment to shipment. Hand-sorted materials. Not screened.</p><p>Available in the following nominal sizes:</p><ul><li>BB1: 1/2\" - 1\" (1-2cm; 10-20mm)</li><li>BB3: 3/4\" - 1 1/4\" (2-3cm; 20-30mm)</li><li>BB5: 1\" - 2\" (3-5cm; 30-50mm)</li></ul>\r\n', 'blackAquaCovePebbles1.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(86, 'fc57dd66-1c24-11ee-9885-89d07af14ba3', 'BBBLP', 'black-button-la-paz-pebbles', 'Black Button La Paz Pebbles', '<p>Black Button La Paz Pebbles are smaller than their standard brother, La Paz Pebbles.  La Paz Pebbles are often called Mexican Beach Pebbles, hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, blacks, grays, and charcoals in this set, La Paz pebbles will make a statement in your landscape design.</p><p>La Paz pebbles are oval in shape. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p><p>Please note:</p><p>Actual Button size La Paz range from 3/4\" to 1 1/4\".\r\n</p><p>As an alternative to Black Button La Paz Pebbles, consider our Hama Pebbles.</p>\r\n', 'blackButtonLaPazPebbles.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(87, 'fc57ded8-1c24-11ee-9885-89d07af14ba3', 'OSM', 'oyster-shell-bocce-blend', 'Oyster Shell Bocce Blend', '<p>Oyster Shell Bocce Blend is specially formulated for use in bocce ball courts. A mixture of crushed oyster shells and fines for a natural, traditional surface. This bocce blend provides the players with a smooth rolling surface and has proper drainage when it rains.</p><p>As an alternative to Bocce Blend, you may want to consider using our Path Fines to construct your Bocce Ball Court.</p>\r\n', 'oysterShellBocceBlend.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(88, 'fc57dfd2-1c24-11ee-9885-89d07af14ba3', 'OSTM', 'oyster-shell-flour', 'Oyster Shell Flour', '<p>Oyster Shell Flour consists of approximately 96% calcium carbonate. The Oyster Shell Flour is sprinkled over the oyster shell, and helps to create a smooth surface once the Oyster Shell Bocce Blend has been applied to the court\'s surface.</p>\r\n', 'osterShellFlour.jpg', '{\"width\": \"50px\", \"height\": \"50px\"}', NULL, 'Active', NULL, NULL),
(89, 'fc57e112-1c24-11ee-9885-89d07af14ba3', 'TF', 'taffy-fines', 'Taffy Fines', '<p>Taffy Fines are 3/16\" minus rhyolite and felsite fines that have buff, orange and pink hues. Taffy Fines are attractive as pathways or as a decorative mulch.  Apply 2\" deep, water and roll, then add a 1\" - 2\" layer to complete the project. Taffy Fines, once compacted, will still have some fines.\r\n</p>\r\n<p>We sell the Taffy Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Taffy Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'taffyFine.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(90, 'fc57e284-1c24-11ee-9885-89d07af14ba3', 'B-BLP', 'black-la-paz-pebbles', 'Black La Paz Pebbles', '<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.\r\n</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n<p>Please note actual sizes</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li> 1\" - 2\" La Paz range from 1\"-3\"</li><li> 2\" - 3\" La Paz range from 2\"-4\"  </li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n<p>As an alternative to Black La Paz Pebbles, consider our Hama Pebbles.</p>\r\n\r\n\r\n\r\n', '3-5BlackLaPazPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(91, 'fc57e3ec-1c24-11ee-9885-89d07af14ba3', 'B-BUFFLP', 'buff-la-paz-pebbles---special-order', 'Buff La Paz Pebbles - Special Order', '<p>Buff La Paz are special order and are not in-stock materials. These pebbles have unique colors and surface textures. Great for natural water features, ground cover and unique landscape settings.\r\n</p>\r\n<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand-sorted, not screened.</p>\r\n\r\n\r\n\r\n\r\n<p>Please note actual sizes</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li> 1\" - 2\" La Paz range from 1\"-3\"</li><li> 2\" - 3\" La Paz range from 2\"-4\"  </li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n\r\n\r\n\r\n', '1-2-1BuffLaPazPebbles.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(92, 'fc57e54a-1c24-11ee-9885-89d07af14ba3', 'BT1', 'green-aqua-cove-pebbles', 'Green Aqua Cove Pebbles', '<p>Lyngso\'s Green Aqua Cove Pebbles have tones of white, green and gray providing a bright and less formal display of colors.  The green aqua cove pebbles come in a variety of sizes, from 1/2\" to 3 1/2\".  They are perfect for indoor and outdoor landscaping, water features and decorative edging.</p>\r\n\r\n\r\n\r\n', '1-2-2-1-2GreenAquaCovePebbles.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(93, 'fc57e662-1c24-11ee-9885-89d07af14ba3', 'HTP1-2CM', 'hama-pebbles', 'Hama Pebbles', '<p>The Hama Pebbles are an assortment of matte-black tumbled stones. Strikingly beautiful accents in any landscape.</p>\r\n<p>Hama Pebbles are available in bulk and in U-Sacks.</p>\r\n\r\n\r\n\r\n', 'hamaPebbles.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL);
INSERT INTO `products` (`id`, `uuid`, `sku`, `slug`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`, `created_at`, `updated_at`) VALUES
(94, 'fc57e7ac-1c24-11ee-9885-89d07af14ba3', 'BL-LP', 'mixed-la-paz-pebbles', 'Mixed La Paz Pebbles', '<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, our Mixed La Paz pebbles will make a statement in your landscape design. Mixed colors in the stones, they have green, brown, grays and tans, and some shells.</p>\r\n<p>La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n\r\n\r\n', '1-4-1-2MixedLaPazPebbles.jpeg', '{\"width\": \"24px\", \"height\": \"24px\"}', NULL, 'Active', NULL, NULL),
(95, 'fc57e8f6-1c24-11ee-9885-89d07af14ba3', 'B-RLP', 'red-la-paz-pebbles-special-order', 'Red La Paz Pebbles - Special Order', '<p>Red La Paz are special order and are not in-stock materials. These pebbles have more reddish, brown and maroon tones in them with naturally shaped surfaces.\r\n</p>\r\n<p>La Paz Pebbles, often called Mexican Beach Pebbles, are  hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n<p>Actual size:</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li>1\" - 2\" La Paz range from 1\"-3\"</li><li>2\" - 3\" La Paz range from 2\"-4\"</li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n\r\n', '1-2-1RedLaPazPebbles.jpg', '{\"width\": \"24px\", \"height\": \"24px\"}', NULL, 'Active', NULL, NULL),
(96, 'fc57ea68-1c24-11ee-9885-89d07af14ba3', 'BASALT-C-ND', 'basalt-columns-not-drilled', 'Basalt Columns, Not Drilled', '<p>Basalt columns not drilled. Diameter 6-10\"</p>\r\n\r\n\r\n', 'BasaltColumnsNotDrilled.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(97, 'fc57eb62-1c24-11ee-9885-89d07af14ba3', 'BASALT-NT', 'basalt-fountain-natural-top', 'Basalt Fountain Natural Top', '<p>Drilled basalt column. Diameter 6-10\", natural top.</p>\r\n\r\n\r\n', 'BasaltFountainNaturalTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(98, 'fc57ec5c-1c24-11ee-9885-89d07af14ba3', 'BASALT-FPT', 'basalt-fountain-polished-top', 'Basalt Fountain Polished Top', '<p>Drilled basalt column. Diameter 6-10\", polished top.</p>\r\n\r\n\r\n', 'BasaltFountainPolishedTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(99, 'fc57edc4-1c24-11ee-9885-89d07af14ba3', 'LBASALT-FNT', 'large-basalt-fountain-natural-top', 'Large Basalt Fountain Natural Top', '<p>Large drilled basalt column, natural top. Diameter 12-18\"</p>\r\n\r\n\r\n', 'LargeBasaltFountainNaturalTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(100, 'fc57eebe-1c24-11ee-9885-89d07af14ba3', 'LBASALT-FPT', 'large-basalt-fountain-polished-top', 'Large Basalt Fountain Polished Top', '<p>Large drilled basalt column, polished top. Diameter 12-18\"</p>\r\n\r\n\r\n', 'LargeBasaltFountainPolishedTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(101, 'fc57effe-1c24-11ee-9885-89d07af14ba3', 'BASALT-FSET', 'basalt-fountain-set', 'Basalt Fountain Set', '<p>Basalt fountain 2pc set, polished inside.</p>\r\n\r\n\r\n', 'BasaltFountainSet.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(102, 'fc57f0f8-1c24-11ee-9885-89d07af14ba3', 'BASALT-SCF', 'special-carving-basalt-fountain', 'Special Carving Basalt Fountain', '<p>SPECIAL CARVING BASALT FOUNTAIN</p>\r\n\r\n\r\n', 'SpecialCarvingBasaltFountain.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(103, 'fc57f238-1c24-11ee-9885-89d07af14ba3', 'SWIRL-PAT-BASALT-F', 'swirl-pattern-basalt-fountain', 'Swirl Pattern Basalt Fountain', '<p>SWIRL BASALT FOUNTAIN</p>\r\n\r\n\r\n', 'SwirlPatternBasaltFountain.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(104, 'fc57f35a-1c24-11ee-9885-89d07af14ba3', 'P9207', 'calistoga-planter', 'Calistoga Planter', '<p>Calistoga Planter is a linear ribbed pottery that compliments both modern and traditional landscape designs. </p>\n<p>Available in the following glazes and sizes:</p>\n<ul>\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 13\" Belly, 22\" Height</li><li>Medium: 21\" Belly, 30\" Height</li>\n</ul><p></p>\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'CalistogaPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active', NULL, NULL),
(105, 'fc57f47c-1c24-11ee-9885-89d07af14ba3', 'P7288', 'cupertino-planter', 'Cupertino Planter', '<p>Cupertino Planter is a sleek, tall vase like pottery that compliments both modern and traditional landscape designs. </p>\r\n<p>Available in the following glazes and sizes:</p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 14\" Belly, 23\" Height</li><li>Medium: 15\" Belly, 32\" Height</li><li>Large: 22\" Belly, 39\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'CupertinoPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active', NULL, NULL),
(106, 'fc57f5a8-1c24-11ee-9885-89d07af14ba3', 'P9900', 'larkspur-planter', 'Larkspur Planter', '<p>Larkspur Planter is a traditional tall vase-like pottery that is perfect as landscape statement pieces for entryways, walkways or even as water features! </p>\r\n<p>Larkspur Planter is available in the following glazes and sizes: </p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 19\" Belly, 30\" Height</li><li>Medium: 20\" Belly, 39\" Height</li><li>Large: 22\" Belly, 47\" Height</li><li>X-Large: 24\" Belly, 55\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'LarkspurPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active', NULL, NULL),
(107, 'fc57f6e8-1c24-11ee-9885-89d07af14ba3', 'P9367', 'oakland-planter-', 'Oakland Planter ', '<p>Oakland Planter is a traditional wide pottery that is perfect for layered planting arrangements or for dwarf  trees.</p>\r\n<p>Available in the following glazes and sizes:</p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 20\" Belly, 21\" Height</li><li>Medium: 30\" Belly, 28\" Height</li><li>Large: 36\" Belly, 33\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'OaklandPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active', NULL, NULL),
(108, 'fc57f7f6-1c24-11ee-9885-89d07af14ba3', 'WC', 'lehigh-white-cement-94-lbs', 'Lehigh White Cement 94 Lbs ', '<p>Lehigh White Type I meets ASTM C150 Standard Specification for Portland Cement.</p>\r\n<p>Uses:</p>\r\n<ul><li>Precast and prestressed architectural concrete</li><li>Cast-in-place architectural and structural concrete</li><li>Architectural concrete masonry, cast stone, and terrazzo</li><li>Swimming pools and spas</li><li>Tile grout and concrete countertops</li></ul>\r\n\r\n\r\n', 'LehighWhiteCement94Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(109, 'fc57f918-1c24-11ee-9885-89d07af14ba3', 'PGG', 'perkgrout-grey', 'Perkgrout Grey', '<p>PerkGrout™ is a polymer modified pervious concrete using a non-shrink cement to produce a durable, crack-resistant, pervious grout for flagstone set in compacted base rock (crushed stone) or pervious concrete.</p><p>PerkGrout™</p>\r\n\r\n<ul><li>Eliminates messy fines and washouts</li><li>Crack-resistant and long lasting</li><li>Reduces weeds, critters and other maintenance</li><li>Permeable</li></ul>\r\n\r\n<p>PerkGrout™ is supplied in 30 lb. sacks in either ‘Grey’ or ‘Tan’ color. Exactly one full quart of water is mixed with each sack, either in a mortar type mixer, in a bucket with a drill mixer, or in a tub by hand.</p><p>Custom colors for large orders are possible and one can add their own powder concrete color pigment.</p><p>Coverage:</p><p>Each 30 lb. sack covers approximately 17 square feet of flagstone area. This assumes mostly larger, 18” size flagstone pieces, 1” to 2” wide joints and 2”depth.</p><p>Handy homeowners and landscape professionals can install PerkGrout™.</p><p>How to Install PerkGrout Video: https://perviousproducts.com/perkgrout-how-to-video/</p><p></p><p></p>\r\n\r\n\r\n', 'PerkgroutGrey.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(110, 'fc57fa3a-1c24-11ee-9885-89d07af14ba3', 'PGT', 'perkgrout-tan', 'Perkgrout Tan', '<p>PerkGrout™ is a polymer modified pervious concrete using a non-shrink cement to produce a durable, crack-resistant, pervious grout for flagstone set in compacted base rock (crushed stone) or pervious concrete.</p><p>PerkGrout™</p>\r\n\r\n<ul><li>Eliminates messy fines and washouts</li><li>Crack-resistant and long lasting</li><li>Reduces weeds, critters and other maintenance</li><li>Permeable</li></ul>\r\n\r\n<p>PerkGrout™ is supplied in 30 lb. sacks in either ‘Grey’ or ‘Tan’ color. Exactly one full quart of water is mixed with each sack, either in a mortar type mixer, in a bucket with a drill mixer, or in a tub by hand.</p><p>Custom colors for large orders are possible and one can add their own powder concrete color pigment.</p><p>Coverage:</p><p>Each 30 lb. sack covers approximately 17 square feet of flagstone area. This assumes mostly larger, 18” size flagstone pieces, 1” to 2” wide joints and 2”depth.</p><p>Handy homeowners and landscape professionals can install PerkGrout™.</p><p>How to Install PerkGrout Video: https://perviousproducts.com/perkgrout-how-to-video/</p><p></p><p></p>\r\n\r\n\r\n', 'PerkgroutGreyTan.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active', NULL, NULL),
(111, 'fc57fce2-1c24-11ee-9885-89d07af14ba3', 'QKS', 'quikrete-base-coat-stucco-60-lbs', 'Quikrete Base Coat Stucco 60 Lbs ', '<p>QUIKRETE Scratch and Brown Base Coat Stucco (No. 1139) is a portland cement based stucco used for construction and repair of stucco walls. Complies with ASTM C 926 requirements for cement based plaster.</p>\r\n<p>Use For:</p>\r\n<ul><li>Scratch and brown coat in a three coat stucco application</li><li>Apply directly to masonry walls in a two coat stucco application</li></ul>\r\n\r\n', 'QuikreteBaseCoatStucco60Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(112, 'fc57fe0e-1c24-11ee-9885-89d07af14ba3', 'QKFSCM', 'quikrete-concrete-mix-80-lbs', 'Quikrete Concrete Mix 80 Lbs', '<p>QUIKRETE Concrete Mix (No. 1101) is the original 4000 psi average compressive strength blend of portland cement, sand, and gravel or stone. Just add water. Use for any general concrete work.</p>\r\n<p>Use for Setting Posts and Building:</p>\r\n<ul><li>Sidewalks</li><li>Floors</li><li>Steps</li><li>Patios</li><li>Curbs</li><li>Downspout Troughs</li></ul>\r\n\r\n', 'QuikreteBaseCoatStucco80Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(113, 'fc57ff3a-1c24-11ee-9885-89d07af14ba3', 'QKFPC			', 'quikrete-fence-post-mix-80-lbs', 'Quikrete Fence Post Mix 80 Lbs', '<p>Quikrete 80 lbs. Concrete Mix can be used for building or repairing foundation walls, sidewalks, curbs, steps and ramps and for setting posts. This mix designed for pouring concrete 2 in. thick or more. Quikrete 80 lbs. Concrete Mix consists of a uniformly blended, properly proportioned mixture of gravel, sand and Portland cement.</p><p>Use for making repairs to foundation walls, walkways or steps and setting mailboxes and posts.</p>\r\n<p>For pouring concrete 2 in. thick or more:</p>\r\n<ul><li>Just add water</li><li>60 minute working time</li><li> High-strength 4000 psi concrete</li><li>Meets ASTM C 387 compressive strength requirements</li><li>Curbs</li></ul>\r\n\r\n', 'QuikreteFencePostMix80Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(114, 'fc58003e-1c24-11ee-9885-89d07af14ba3', 'QKA', 'quikrete-high-performance-blacktop-repair-50-lbs', 'Quikrete High Performance Blacktop Repair 50 Lbs', '<p>QUIKRETE High Performance Blacktop Repair (No. 1701-52, -62) is a specifically formulated high performance asphalt cold patch material for repairing potholes and cracks over 1\" (25.4 mm) wide in asphalt pavements. It is suitable for use on roads, driveways, parking lots, and walkways. All-season formulation is suitable for making permanent repairs in wet or dry conditions.</p>\r\n\r\n', 'QuikreteHighPerformanceBlacktopRepair50.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(115, 'fc580142-1c24-11ee-9885-89d07af14ba3', 'OKMM', 'quikrete-masons-mix-80-lbs', 'Quikrete Masons Mix 80 Lbs', '<p>QUIKRETE Mason Mix (No. 1136) is a high strength Commercial Grade dry pre-blended mixture of sand and cements specially selected for masonry applications. Meets N, S, M requirements as specified in ASTM C270. Just add water.</p>\r\n<p>Use for Structural Masonry Applications both Above and Below</p>\r\n<ul><li>Grade</li><li>Walls</li><li>Tuck-Pointing</li><li>Columns</li><li>Brick/Stone Veneers</li></ul>\r\n', 'QuikreteMasonsMix80.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(116, 'fc5802b4-1c24-11ee-9885-89d07af14ba3', 'QKM', 'quikrete-mortar-mix-80-lbs', 'Quikrete Mortar Mix 80 Lbs', '<p>QUIKRETE Mortar Mix (No. 1102) is a blend of masonry cement and graded sand , designed to meet ASTM C 270 for Type N Mortar. Just add water.</p>\r\n<p>Use For Construction & Repair of Brick, Block & Stone:</p>\r\n<ul><li>Barbecues</li><li>Pillars</li><li>Walls</li><li>Tuck-pointing mortar joints</li><li>Planters</li></ul>\r\n', 'QuikreteMortarMix80.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(117, 'fc5803b8-1c24-11ee-9885-89d07af14ba3', 'GTS', 'quikrete-thin-set-sanded-gray-50-lbs', 'Quikrete Thin Set Sanded - Gray 50 Lbs', '<p>QUIKRETE Thin Set Multi-Purpose (No. 1550) is a blend of portland cement, sand and special polymer additives for the installation of tiles over a variety of surfaces, including properly prepared exterior grade plywood. Requires no additional latex or fortifiers.</p>\r\n<p>Apply over:</p>\r\n<ul><li>Plywood</li><li>Concrete</li><li>Concrete block</li><li>Cementitious backer units</li><li>Wall board</li><li>Portland Cement Plaster</li></ul>\r\n', 'QuikreteThinSetSandedGray50.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(118, 'fc5804da-1c24-11ee-9885-89d07af14ba3', '47#C', 'quikrete-portland-cement-94-lbs', 'Quikrete Portland Cement 94 Lbs', '<p>QUIKRETE Portland Cement (No. 1124) complies with current ASTM C150 and Federal Specifications for portland cement. Can be mixed with aggregate and other ingredients to make concrete mix, mortar mix, and base coat stucco. Available in Type I, Type I/II and Type III.</p>\r\n<p>To make Concrete Mix:</p>\r\n<ul><li>3 parts All-Purpose Gravel (No. 1151)</li><li>2 parts All-Purpose Sand (No. 1152)</li><li>1 part Portland Cement (by volume)</li></ul>\r\n<p>To make Type S Mortar Mix:</p>\r\n<ul><li>3 1/2 to 4 1/2 parts Mason Sand (No. 1952)</li><li>1/2 part Hydrated Lime</li><li>1 part Portland Cement (by volume)</li></ul>\r\n', 'QuikretePortlandCement94.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(119, 'fc5805de-1c24-11ee-9885-89d07af14ba3', 'QKPMSVMG', 'quikrete-plastic-cement-94-lbs', 'Quikrete Plastic Cement 94 Lbs', '<p>QUIKRETE Plastic Cement (No. 2121) complies with ASTM C 1328 Type M and S. Blended cement specifically designed for use with plaster sand to make Base Coat Stucco.</p>\r\n<p>To make Scratch and Base Coat Stucco Mix:</p>\r\n<ul><li>3 to 4 parts Plaster Sand</li><li>1 part Plastic Cement (by volume)</li></ul>\r\n', 'QuikretePlasticCement94.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(120, 'fc5806e2-1c24-11ee-9885-89d07af14ba3', 'CGS5035		', 'coregravel-driveway-', 'Coregravel Driveway ', '<ul><li>CORE Gravel™ 50-35HD</li><li>Use: Heavy Duty - commercial paths, residential driveways, </li><li>restaurant patios, and more</li><li>Gravel size: 7 – 15 mm</li><li>Cell Size: 50 mm wide x 35 mm deep</li><li>Cell Wall Thickness: 2.0 mm</li><li>Sheet Size: 1.15 m x .78 m (= 9.7 sq.ft.)</li><li>Cell Colour: White (virgin plastic) </li><li>Geotextile Fabric: Yes</li><li>Compressive Strength: 150 t/m2 (empty)</li><li>Suitable for vehicles: Yes</li></ul>\r\n\r\n<p>CORE Gravel™ is a gravel stabilizing system that consists of a foundation of connected honeycomb-celled panels with a geotextile backing. Once filled with gravel this system is ideal for public spaces, vehicle or pedestrian traffic with no compromise in strength and durability. This eco-friendly system costs less than other parking systems, including asphalt, concrete and block pavers.</p>\r\n<p>CORE Gravel™ solves the problems associated with loose gravel; sinking, migrating and forming ruts. This is a proven solution for hassle-free gravel paving for all types of vehicle or pedestrian traffic with no compromise in strength and durability. The underside incorporates a durable geotextile which is heat welded to each cell, allowing water to drain easily while preventing weed growth. All panel edges have an interlocking system that makes for easy installation, even on steep grades.</p>\r\n<p>Proprietary manufacturing process provides a rigid honeycomb core design that holds its uniform hexagon shape while providing maximum load bearing. When filled with gravel the product is practically invisible, making for attractive driveways, pathways and patio installations. This porous and eco-friendly surface allows for storm water to permeate into the soil, dramatically reducing runoff problems.</p>\r\n<p>CORE Gravel™ is an excellent gravel stabilizing system.</p>\r\n\r\n<span id=\"pdf-link\"><a href=\"http://localhost:5001/pdf/50-35_gravel_spec_sheet-1.pdf\" target=\"_blank\"><span class=\"pdf-ico\"></span><span class=\"pdf-view\">View Product Information</span></a></span>\r\n\r\n\r\n', 'CoregravelDriveway.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(121, 'fc580886-1c24-11ee-9885-89d07af14ba3', 'CGS3818			', 'coregravel-pathway-', 'Coregravel Pathway ', '<ul><li>CORE Path™ 38-18</li><li>Use: Heavy Duty - commercial paths, residential driveways, </li><li>restaurant patios, and more</li><li>Gravel size: 3 - 10 mm</li><li>Cell Size: 38 mm wide x 18 mm deep/li><li>Cell Wall Thickness: 1.0 mm</li><li>Sheet Size: 1.15 m x .8 m (= 9.9 sq. ft.)</li><li>Cell Colour: White (virgin plastic) </li><li>Geotextile Fabric: Yes</li><li>Compressive Strength: 40 t/m2 (empty)</li><li>Suitable for vehicles: No, pedestrian traffic only</li></ul>\r\n\r\n<p>CORE Gravel™ is a gravel stabilizing system that consists of a foundation of connected honeycomb-celled panels with a geotextile backing. Once filled with gravel this system is ideal for public spaces, vehicle or pedestrian traffic with no compromise in strength and durability. This eco-friendly system costs less than other parking systems, including asphalt, concrete and block pavers.</p>\r\n<p>CORE Gravel™ solves the problems associated with loose gravel; sinking, migrating and forming ruts. This is a proven solution for hassle-free gravel paving for all types of vehicle or pedestrian traffic with no compromise in strength and durability. The underside incorporates a durable geotextile which is heat welded to each cell, allowing water to drain easily while preventing weed growth. All panel edges have an interlocking system that makes for easy installation, even on steep grades.</p>\r\n<p>Proprietary manufacturing process provides a rigid honeycomb core design that holds its uniform hexagon shape while providing maximum load bearing. When filled with gravel the product is practically invisible, making for attractive driveways, pathways and patio installations. This porous and eco-friendly surface allows for storm water to permeate into the soil, dramatically reducing runoff problems.</p>\r\n<p>CORE Gravel™ is an excellent gravel stabilizing system.</p>\r\n\r\n<span id=\"pdf-link\"><a href=\"http://localhost:5001/pdf/38-18_core_path_spec_sheet-1.pdf\" target=\"_blank\"><span class=\"pdf-ico\"></span><span class=\"pdf-view\">View Product Information</span></a></span>\r\n\r\n\r\n', 'CoregravelPathway.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(122, 'fc580a02-1c24-11ee-9885-89d07af14ba3', 'GATORNW', 'gator-geotextile-fabric', 'Gator Geotextile Fabric', '<p>GATOR FABRIC GF4.4 (100 lbf) is a needle punched non-woven geotextile made of polypropylene fibers. GATOR FABRIC GF4.4 geotextile is ideal for drainage, filtration and will allow water flow of 135 gallons per minutes per square foot (613 L/min/sq. m.) in paver or retaining wall applications. Its filament fibers are used for soil separation and drainage. They combine high durability along with excellent physical and hydraulic properties. It is non-biodegradable and resistant to most soil chemicals. Great for patios, walkways and driveways.\r\n</p>\r\n\r\n<p>IDEAL FOR: </p>\r\n\r\n<ul>\r\n<li>Drainage control</li>\r\n<li>Protection against erosion </li>\r\n<li>Behind retaining walls</li>\r\n<li>Paver sub base foundation</li>\r\n<li>Gator Base foundation application</li>\r\n<li>General landscape</li>\r\n<li>Soil separation</li>\r\n</ul>\r\n<p>FEATURES</p>\r\n<ul>\r\n<li>Specially treated to be hydrophilic, it allows high-water flow</li>\r\n<li>(135 Gal/min/sq. ft. (613 L/min/sq. m.))</li>\r\n<li>Drainage and filtration</li>\r\n<li>Soil separation</li>\r\n<li>Erosion control</li>\r\n<li>UV-Resistance</li>\r\n<li>Inert to soil chemicals (Alkalis, Acids)</li>\r\n<li>Inert to biological degradation</li>\r\n<li>Easy to handle</li>\r\n<li>High strength/dimensionally stable</li>\r\n</ul>\r\n\r\n<p>PLEASE NOTE: </p>\r\n<p>Gator Geotextile Fabric is sold in 6’ width and in 1’ lineal foot increments. It is cut to order and only comes in 6\' width.  </p>\r\n<p>Full rolls of 300\' length can be purchased by special order. </p>\r\n\r\n<p><a href=\"https://alliancegator.com/gator-grids-fabrics/gator-fabric-gf4-4/\" target=\"_blank\">Information Link<a></p>\r\n\r\n\r\n', 'GatorGeotextileFabric.png', NULL, NULL, 'Active', NULL, NULL),
(123, 'fc580b88-1c24-11ee-9885-89d07af14ba3', 'PBB			', 'plastic-bender-board-1x4x20-', 'Plastic Bender Board 1\"x4\"x20’ ', '<p>PLASTIC BENDER BOARD 1\"x4\"x20\'</p>\r\n', 'PlasticBenderBoard1x4x20.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(124, 'fc580c96-1c24-11ee-9885-89d07af14ba3', '24PBB', 'plastic-bender-board-2x4x20-', 'Plastic Bender Board 2\"x4\"x20’ ', '<p>PLASTIC BENDER BOARD 2\"x4\"x20\'</p>\r\n', 'PlasticBenderBoard2x4x20.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(125, 'fc580d90-1c24-11ee-9885-89d07af14ba3', 'PBBS', 'plastic-bender-stakes', 'Plastic Bender Stakes', '<p>PLASTIC BENDER BOARD STAKES</p>\r\n', 'PlasticBenderBoardStakes.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(126, 'fc580e8a-1c24-11ee-9885-89d07af14ba3', '30S', '0-30-lapis-lustre-sand-100-lbs', '#0/30 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\n<p>Coarse/Medium Aquarium: NO #0/30</p>\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\n', '030LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(127, 'fc580f84-1c24-11ee-9885-89d07af14ba3', '20S', '1-20-lapis-lustre-sand-100-lbs', '#1/20 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \r\n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\r\n\r\n<p>Coarse/Medium Aquarium: NO #1/20</p>\r\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\r\n', '1-20LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(128, 'fc581100-1c24-11ee-9885-89d07af14ba3', '216S', '2-16-lapis-lustre-sand-100-lbs', '#2/16 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \r\n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\r\n\r\n<p>Coarse/Medium Aquarium: NO #2/16</p>\r\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\r\n', '2-16LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(129, 'fc581204-1c24-11ee-9885-89d07af14ba3', 'AZOMITEP', 'azomite-powder-44-lbs', 'Azomite Powder 44 Lbs ', '<p>Azomite is a natural fertilizer (described in Secrets of the Soil as rock dust) that is actually an ancient deposit of aluminum silicate clay and marine minerals. In use for over 50 years as a source of available potash (0.2%) and over 70 trace minerals, including calcium (1.8%), sodium (0.1%), and magnesium (0.5%).\r\n</p><p>APPLICATION RATE: 0.25-2 tons per acre, or 0.25-2 lb per 10 sq. ft.</p>\r\n<p>Use as an annual top dressing on citrus trees, where soil pH is 6.5 or lower, at 5 lb/tree, or 15 lb on blight-stricken trees./p><p>Azomite can also used in animal feeds at a rate of 0.5% of feed mixture, as a trace mineral supplement and a natural anti-caking agent.</p>', 'azomitePowder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(130, 'fc58134e-1c24-11ee-9885-89d07af14ba3', 'BOBQ', 'black-owl-biochar', 'Black Owl Biochar', '<p>As one of the few  Black Owl Biochar (\"B.O.B\") has become the sought after biochar, due to its consistency of its optimally-designed characteristics for:\r\n</p>\r\n<ul><li>Building healthy soil</li><li> Hosting beneficial microbes and fungi</li><li>Reducing acidity Improving tilth and aeration</li><li>Retaining nutrients</li><li>Water-holding capacity = 5-6x its weight, good in droughts</li><li>Saving on irrigation water</li></ul>\r\n<br/>\r\n<p>An application rate of 5%-10% is typical to maximize the utility of your potting mix/soil.  BOB\'s particle size remains in the essential root area and won\'t wash through the soil like other amendments. It is therefore, typically a one-time application.</p>\r\n<p>All Black Owl Biochar (TM) products have greater than 70% Organic Carbon. IBI defines a Class One biochar as any biochar consisting of anything greater than 60% Organic Carbon. Black Owl Biochar\'s Pure & Natural, Premium Organic Biochar is OMRI-Listed.</p>', 'BlackOwlBiochar.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(131, 'fc5815a6-1c24-11ee-9885-89d07af14ba3', 'BOBEUQ', 'black-owl-biochar-environmental-ultra', 'Black Owl Biochar Environmental Ultra', '<p>Black Owl Biochar Environmental Ultra (TM) is a premiere biochar ideal for environmental cleanup.  This OMRI-Listed and Washington State Registered for Organic Use biochar has a surface area of approximately 800 square meters per gram, high porosity, ideal particle-size and can:\r\n</p>\r\n<ul><li>Remediate sediments and wetlands</li><li>Remove 99.5% of most problem heavy metals</li><li>Filter stormwater</li><li>Remove DOD, TSS, Toxins</li><li>Immobilize biopathogens such as E.coli/Salmonella</li></ul>\r\n<br/>\r\n<p>Black Owl Biochar\'s Environmental Ultra, for use in biorention systems and L.I.D. solutions is a \"green\" and affordable alternative to activated carbon.  Environmental Ultra has been used in several large-scale projects including municipal and private rain gardens, marine protection and soil detoxification and revegetation.</p>\r\n<p>Our OMRI-Listed Black Owl Biochar Environmental Ultra has greater than 80% Organic Carbon.  IBI defines a Class One biochar as any biochar consisting of anything greater than 60% Organic Carbon.</p>', 'BlackOwlBiocharEnvironmentalUltra.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(132, 'fc581754-1c24-11ee-9885-89d07af14ba3', 'BSF', 'filled-burlap-sand-bag', 'Filled Burlap Sand Bag', '<p>Burlap bags are filled to order with 50 lbs. of sand. Great for flood control.</p>\r\n<p>Please call us ahead of time to prepare your order as it takes time and labor for us to fill the sandbags. </p>', 'FilledBurlapSandBag.jpg', NULL, NULL, 'Active', NULL, NULL),
(133, 'fc58184e-1c24-11ee-9885-89d07af14ba3', 'QKSANDBAG', 'prefilled-poly-woven-sand-bag-50-lbs', 'Prefilled Poly Woven Sand Bag 50 Lbs', '<p>Poly bags are filled to order with 50 lbs. of sand. Great for flood control.</p>\r\n<p>Please call us ahead of time to prepare your order as it takes time and labor for us to fill the sandbags. </p>', 'PrefilledPokyWovenSanBag50lbs.jpg', NULL, NULL, 'Active', NULL, NULL),
(134, 'fc581948-1c24-11ee-9885-89d07af14ba3', 'ATOBL', 'antigo-boulder-', 'Antigo Boulder ', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: White, Cream, Light Gray, Buff</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents, Focal Features</li>\r\n</ul>\r\n\r\n<p>Antigo Boulders are a natural cream and buff colored limestone boulders. Attractive as a focal feature in a garden. </p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'AntigoBolder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(135, 'fc581ac4-1c24-11ee-9885-89d07af14ba3', 'BCBL', 'bouquet-canyon-boulders', 'Bouquet Canyon Boulders', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Schist</li>\r\n<li>Color Range: Greens, Greys, Tans, Rusts</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents</li>\r\n</ul>\r\n\r\n<p>Bouquet Canyon Boulders are green-gray schist boulders with natural rust bronze coloration. Natural local stone.</p>\r\n<p>Bouquet Canyon Boulders may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'bouquetCanyonBoulders.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(136, 'fc581ce0-1c24-11ee-9885-89d07af14ba3', 'CCBL', 'chiefcliff-boulders', 'Chiefcliff Boulders', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Argillite </li>\r\n<li>Color Range: Grays, Blues, Tans</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents</li>\r\n</ul>\r\n\r\n<p>Chiefcliff Boulders are decorative gray angular Argillite landscape boulders. These are sedimentary rocks with green moss and lichen highlights. Blocky and irregular shapes. Weight is from 150 pounds to over 4,000 pounds. Size range varies from 16 inches wide by 18 inches tall by 18 inches long to 30 inches wide by 48 inches tall by 60 inches long. Colors range from light grays, blue grays to browns.</p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'ChiefcliffBoulders.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL),
(137, 'fc581eb6-1c24-11ee-9885-89d07af14ba3', 'CFGB', 'crawford-granite-boulder', 'Crawford Granite Boulder', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Granite </li>\r\n<li>Color Range: Charcoal Gray, Dark Blue, Red, Rusts</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents, Focal Features</li>\r\n</ul>\r\n\r\n<p>Crawford Granite Boulders have an unique rust coloration making this an attractive focal feature in a garden.</p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'CrawfordGraniteBoulder.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_type` enum('Registered','Guest') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Registered',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `reset_token` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `refresh_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `customer_type`, `username`, `name`, `password`, `email`, `email_verified_at`, `reset_token`, `refresh_token`, `created_at`, `updated_at`) VALUES
(1, 'c13fd472-1c24-11ee-9885-89d07af14ba3', 'Registered', 'jmcclint279', 'Joseph McClintock', '$2y$10$nnpnvxU9hg0qGFz7wSj3nuj1./1qMVGIH.FtolFDS5YgWy9A2TPxW', 'joseph@nativemeadow.com', NULL, '', '1777ce44bb0617f8da4fdf79505abf1593eccefddd7b4cf00a5a7a15924b5d3e7b3f61', '2023-06-08 17:13:41', '2024-03-11 15:11:09'),
(2, 'c13fd77e-1c24-11ee-9885-89d07af14ba3', 'Registered', 'bernyone', 'Bernie One', '$2a$10$pFmxN80QJ3kTuxt4t4lad.s5I9tHEKgEGvkYcv3FAX.zWjdVAWwB.', 'bernyone@test.com', NULL, '', '4d42be9f7d45b5ec1df09cb3e6d953904f779f2db5979006d91fac1fded878ef058692', '2023-06-08 17:39:45', '2024-03-18 15:03:41'),
(3, 'c13fd8aa-1c24-11ee-9885-89d07af14ba3', 'Registered', NULL, 'Bernie Two', '$2y$10$WIN3NO3cuWleu4eLETEBReiUnrxOdMim6xhl.4KcBvKb3lHuNyz.e', 'bernietwo@test.com', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJlcm5pZXR3b0B0ZXN0LmNvbSIsImlhdCI6MTcxMDgwMTYzNywiZXhwIjoxNzEwODA1MjM3fQ.v2hnurIMCrNAl9uMo_VJGp3c5s3zPhayXEN0vjGeiQ4', NULL, '2023-06-30 17:47:08', '2024-03-18 15:40:37'),
(8, 'aa049ccb-c3ab-4019-8160-131ca5a354ec', 'Registered', NULL, 'Berny Five', '$2y$10$pzami38pSTFRQ2yKfnw8xOKSkWEm2j7PgACY1gcmRY0vyRwSlYufe', 'bernyfive@test.com', NULL, '', NULL, '2023-09-06 12:17:03', '2023-09-06 12:17:03'),
(9, '26384557-49fc-4a09-8bec-ea1f98c7213d', 'Registered', NULL, 'Berny Eight', '$2y$10$OZCYAdJzMcsdyuKSKaPeuOFVy0Fv5wLzAzlXaZfUyboNyVBjAoe/6', 'bernyeight@test.com', NULL, '', NULL, '2023-09-06 16:30:41', '2023-09-06 16:30:41'),
(10, '390cbe84-5f43-4e66-97f8-9e7ae5fd1d38', 'Registered', NULL, 'Berny Nine', '$2y$10$lg2LHES.Tix7w8QYbZ.gGesSfl2WQWKx0Cwbhgsy/sWK1KehcKCf.', 'bernynine@test.com', NULL, '', NULL, '2023-09-06 16:46:23', '2023-09-06 16:46:23'),
(11, '14ababed-72bb-4cae-9323-92c79ef7f386', 'Registered', NULL, 'Berny Ten', '$2y$10$/cEvF.pXbFMYsApNHJVkmefGWZi6O9jt1ViG.sOo83QGRlmLZQmVm', 'bernyten@test.com', NULL, '', NULL, '2023-09-06 17:09:13', '2023-09-06 17:09:13'),
(12, '7c93b2da-30de-4c20-a2ae-17e5dece3bd9', 'Registered', 'bernyeleven', 'Berny Eleven', '$2y$10$7N6bQOrktMbLskoXGqBVJu5yu3jgnlUNj5cARAbzcrX9q7d2Rszwy', 'bernyeleven@test.com', NULL, '', NULL, '2023-09-06 20:44:55', '2023-09-06 20:44:55'),
(13, '88f1cb89-f985-45b0-8356-5200d518247b', 'Registered', 'bernytwelve', 'Berny Twelve', '$2y$10$GW5.u4VvR/DTSDzv6M2EZeoTgyjT24FEk2Kcu6uBibO9tq/6IYJ3i', 'bernytwelve@test.com', NULL, '', NULL, '2023-09-07 17:26:29', '2023-09-07 17:26:29'),
(14, '08c6eb30-79cf-4c52-95d5-68cb7b275683', 'Registered', 'bernytwenty', 'Berny Twenty', '$2y$10$5s2YP2Cp05dm6WXfkylJhO1h48V2eh1gdoPni1kIP1L6HxmgudedK', 'bernytwenty@test.com', NULL, '', NULL, '2023-09-07 21:08:21', '2023-09-07 21:08:21'),
(15, '2fe2703f-6bd6-47a8-a1f6-bdbbe7d26d26', 'Registered', 'bernytwentytwo', 'Berny Twentytwo', '$2y$10$bvgdD8ypIeYIXaSZ8ZkkW.pvfsbJpfTuBG8AUvTQ24KqrqLpZkEBW', 'bernytwentytwo@test.com', NULL, '', NULL, '2023-09-08 16:34:43', '2023-09-08 16:34:43'),
(16, 'f0fa6074-5587-4704-826a-78669015ed99', 'Registered', 'bernytwentythre', 'Berny Twentythree', '$2y$10$hmgdJpkvLFievWekPp.4IuHkuurOxNnXTuJ1Z8ztseKYZJjiqDvg2', 'bernytwentythree@test.com', NULL, '', NULL, '2023-09-08 17:37:34', '2023-09-08 17:37:34'),
(19, 'd4d03f4c-eb66-409f-9635-5898f343b1e7', 'Registered', NULL, 'Prime Man', '$2a$10$uQxP2RFZZIWaFIhumi.7nOtJAqQTR8GhZmPL1dL/7QO1hpTG4VYQm', 'prime@man.com', NULL, '315ce2e7735e34da1e7e5bde2e419ae5dea5a8fd1ba260a860ce7c22285b307a20b8ad', 'acf3c7a156da6b4b0d5e78316a2f2d9607b4d6da7867c0449d1c6ebfb48fa76d2862b2', '2023-12-31 18:33:03', NULL),
(20, 'aee174e1-9332-4bad-a3b3-89404419f3ba', 'Registered', NULL, 'Nigel Man', '$2a$10$HZO4f2kdyukxlrOKQDweEOBzFUFRxD9.SFxAlUg3KFY684CyBJ/qO', 'nigman@test.com', NULL, 'b78b8431ac2c95d6ae07c6a2cdf6600c7d9418e44fa490c95b5f3b15f545a0414480d4', '3d7f611320482d15d8a39d3fb2aeb8c286261528c52dc68777a34c92229083a470acc2', '2024-01-10 01:25:54', NULL),
(21, '64538eb3-c6f0-4cbe-8a96-04ad4d197b35', 'Registered', NULL, 'Berner One ', '$2a$10$8sxWc3H.78vNixiZirjaT.ixUbh8sKduGYYr10CSus5iaS2F./VJa', 'bernerone@test.com', NULL, 'd27794acb7a6d8eaf91ab72c25245d323bb1ef8846306f9646f2d0348959a959906877', '57ffc08672424a9de55800125b0d103765532bbd5684075a5fa4602029518b75a9a09c', '2024-01-12 17:27:09', '2024-01-12 15:25:19'),
(22, 'c27e51ae-1801-4e04-8719-e2efbb443005', 'Registered', NULL, 'Burny Sixteen', '$2a$10$/ib.b6jNmrZt6Oe1hAwXCedslsBqtRbIBg2qS5cVMdGlEYnITVo2S', 'burnsixteen@test.com', NULL, '950d38693ac2d126c64dc9d5595fa39793380bb337076015884be44f980bc04ba3645f', '44e9599213b56c64db7ba7cbeb8b66320c192681f02e31af6b25bff8f67e9f0ae1b9e7', '2024-03-03 00:38:05', NULL),
(23, '27ae7911-f5bd-4df8-b280-fba776a267f1', 'Registered', NULL, 'Bernie Fiftyone', '$2a$10$AOekriFNYti1ae9DdbdwiuBLWbYl6uW5DVB7x.ynM8On2ySrZj7g.', 'berniefiftyone@test.com', NULL, '7b460f670df86902ff9aaa73c85039a9a6431772446e2aea9176be246cda955f00f8ea', NULL, '2024-03-13 00:48:45', '2024-03-12 17:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int NOT NULL,
  `user_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('Billing','Shipping','BillingShipping') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company` varchar(29) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user_uuid`, `name`, `type`, `phone`, `address`, `city`, `state_province`, `postal_code`, `country`, `company`, `created_at`, `updated_at`) VALUES
(19, 'd4d03f4c-eb66-409f-9635-5898f343b1e7', 'Prime Man', 'BillingShipping', '650 783 7475', '1772 Terrace Drive', 'Belmont', 'CA', '94002', 'USA', NULL, '2024-01-03 10:28:54', '2024-01-03 10:31:06'),
(20, 'c13fd472-1c24-11ee-9885-89d07af14ba3', NULL, 'Shipping', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', NULL, NULL, '2024-01-08 18:34:10', NULL),
(21, 'aee174e1-9332-4bad-a3b3-89404419f3ba', NULL, 'Shipping', '689 945 5686', '20 Somewhere St', 'San Carlos', 'CA', '940003', NULL, NULL, '2024-01-10 01:26:46', NULL),
(22, '64538eb3-c6f0-4cbe-8a96-04ad4d197b35', NULL, 'Shipping', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', NULL, NULL, '2024-01-12 17:50:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_phone`
--

CREATE TABLE `user_phone` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('home','work','mobile','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mobile',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_sku_unique` (`sku`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_category_id_foreign` (`category_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_category_foreign` (`parent_category`);
ALTER TABLE `categories` ADD FULLTEXT KEY `search_catagories` (`title`,`description`);

--
-- Indexes for table `category_categories`
--
ALTER TABLE `category_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_categories_category_id_foreign` (`category_id`),
  ADD KEY `category_categories_parent_category_id_foreign` (`parent_category_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_products_product_foreign` (`product_id`),
  ADD KEY `categories_products_category_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_uuid` (`cart_uuid`),
  ADD KEY `user-order` (`user_id`),
  ADD KEY `user_address_id` (`address_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prices_product_foreign` (`product_id`);
ALTER TABLE `prices` ADD FULLTEXT KEY `price_search` (`title`,`description`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);
ALTER TABLE `products` ADD FULLTEXT KEY `product_search` (`title`,`description`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `user_phone`
--
ALTER TABLE `user_phone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_phone_uuid_unique` (`uuid`),
  ADD KEY `users_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `category_categories`
--
ALTER TABLE `category_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_phone`
--
ALTER TABLE `user_phone`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_category_foreign` FOREIGN KEY (`parent_category`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_categories`
--
ALTER TABLE `category_categories`
  ADD CONSTRAINT `category_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `categories_products_category_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `categories_products_product_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `cart_uuid` FOREIGN KEY (`cart_uuid`) REFERENCES `carts` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_address` FOREIGN KEY (`address_id`) REFERENCES `user_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_product_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_fk` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_phone`
--
ALTER TABLE `user_phone`
  ADD CONSTRAINT `users_uuid` FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
