-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 10:07 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proiectlaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authers`
--

CREATE TABLE `authers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authers`
--

INSERT INTO `authers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ion Creanga', '2022-01-27 10:53:36', '2022-01-27 18:37:27'),
(2, 'Mihai Eminescu', '2022-01-27 10:53:36', '2022-01-27 18:37:33'),
(3, 'I. L. Caragiale', '2022-01-27 10:53:36', '2022-01-27 18:37:42'),
(4, 'Rus Fokson', '2022-01-27 10:53:36', '2022-01-27 18:38:09'),
(5, 'Liviu Rebreanu', '2022-01-27 10:53:36', '2022-01-27 18:38:17'),
(6, 'Amira Barrows', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(7, 'Dr. Lonzo Nitzsche Jr.', '2022-01-27 10:53:36', '2022-01-27 10:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `auther_id` bigint(20) UNSIGNED DEFAULT NULL,
  `publisher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `category_id`, `auther_id`, `publisher_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Amintiri din copilarie', 3, 1, 5, 'Y', '2022-01-27 10:53:36', '2022-01-27 18:39:59'),
(2, 'Poesii', 5, 2, 3, 'N', '2022-01-27 10:53:36', '2022-01-27 18:40:14'),
(3, 'Picturile mele', 3, 4, 4, 'Y', '2022-01-27 10:53:36', '2022-01-27 18:58:50'),
(4, 'Luceafarul', 5, 2, 1, 'Y', '2022-01-27 10:53:36', '2022-01-27 18:40:51'),
(6, 'D-l Goe', 4, 3, 5, 'Y', '2022-01-27 10:53:36', '2022-01-27 18:41:14'),
(8, 'Exemplu 1', 7, 2, 4, 'Y', '2022-01-27 10:53:36', '2022-01-27 18:45:45'),
(9, 'Exemplu 2', 5, 7, 10, 'N', '2022-01-27 10:53:36', '2022-01-27 18:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `issue_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_day` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`id`, `student_id`, `book_id`, `issue_date`, `return_date`, `issue_status`, `return_day`, `created_at`, `updated_at`) VALUES
(2, 1, 3, '2022-01-27 20:58:50', '2022-02-15 22:00:00', 'Y', '2022-01-27 18:58:50', '2022-01-27 18:45:30', '2022-01-27 18:58:50'),
(3, 5, 9, '2022-01-26 22:00:00', '2022-02-15 22:00:00', 'N', NULL, '2022-01-27 18:46:01', '2022-01-27 18:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Thriller', '2022-01-27 10:53:36', '2022-01-27 18:39:06'),
(2, 'Aventura', '2022-01-27 10:53:36', '2022-01-27 18:39:10'),
(3, 'Clasic', '2022-01-27 10:53:36', '2022-01-27 18:39:14'),
(4, 'Nuvela', '2022-01-27 10:53:36', '2022-01-27 18:39:29'),
(5, 'Dragoste', '2022-01-27 10:53:36', '2022-01-27 18:39:35'),
(6, 'Golda Purdy', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(7, 'Dr. Talon Turner', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(8, 'Dr. Fritz Price', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(9, 'Mr. Alexander Raynor', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(10, 'Joel Turner', '2022-01-27 10:53:36', '2022-01-27 10:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_28_031441_create_settings_table', 1),
(6, '2021_12_28_032107_create_students_table', 1),
(7, '2021_12_28_032155_create_admins_table', 1),
(8, '2021_12_28_032307_create_publishers_table', 1),
(9, '2021_12_28_032327_create_categories_table', 1),
(10, '2021_12_28_032552_create_authers_table', 1),
(11, '2021_12_28_032555_create_books_table', 1),
(12, '2021_12_28_032649_create_book_issues_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Litera', '2022-01-27 10:53:36', '2022-01-27 18:38:32'),
(2, 'Delfin', '2022-01-27 10:53:36', '2022-01-27 18:38:37'),
(3, 'Curtea Veche', '2022-01-27 10:53:36', '2022-01-27 18:38:44'),
(4, 'Paladin', '2022-01-27 10:53:36', '2022-01-27 18:38:50'),
(5, 'Polirom', '2022-01-27 10:53:36', '2022-01-27 18:38:57'),
(6, 'Jewell Kunze', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(7, 'Jeromy Shanahan', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(8, 'Tyshawn Wyman', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(9, 'Dorcas Morissette', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(10, 'Brown Hilpert DDS', '2022-01-27 10:53:36', '2022-01-27 10:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `return_days`, `fine`, `created_at`, `updated_at`) VALUES
(1, '20', '5', '2022-01-27 10:53:36', '2022-01-27 10:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `gender`, `email`, `phone`, `address`, `class`, `created_at`, `updated_at`) VALUES
(1, 'Butuza Calin', '22', 'male', 'butuzacalin08@gmail.com', '(234) 333-4353', 'STR. CARIEREI nr. 127, BRAŞOV, 500052', 'Cal 2', '2022-01-27 10:53:36', '2022-01-27 18:43:38'),
(2, 'Todea Tudor', '23', 'male', 'tthiel@example.org', '763.638.5567', 'Strada Tudor Vladimirescu 42 C, Drobeta-Turnu', 'Cal 3', '2022-01-27 10:53:36', '2022-01-27 18:44:05'),
(5, 'Petric Ovidiu', '23', 'male', 'rschaefer@example.net', '509.598.8027', 'STR. DIAMANTULUI nr. 8, CAVNIC', 'Cal 3', '2022-01-27 10:53:36', '2022-01-27 18:44:26'),
(6, 'Pictor Rus Vlad', '23', 'male', 'mabelle22@example.com', '(618) 276-0067', 'STR. MADACH IMRE nr. 1-5 ap. 25, BIHOR, 410021', 'Cal 1', '2022-01-27 10:53:36', '2022-01-27 18:44:53'),
(10, 'Achim Andrei', '22', 'male', 'fhartmann@example.net', '(830) 598-8442', 'Strada Dumbrava Rosie 4, 105400, Prahova', 'Cal 4', '2022-01-27 10:53:36', '2022-01-27 18:45:10'),
(11, 'Reva Doyle', '28', 'female', 'kelvin.boyle@example.org', '+1 (442) 201-2311', '1296 Kenna Junctions\nBlickton, VA 86641-7711', 'Rerum repellendus voluptates quam.', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(12, 'Meredith Hane', '20', 'male', 'alene.eichmann@example.org', '+1 (559) 793-8233', '156 Sally Rue Apt. 405\nEast Sofia, MD 67026', 'Cum dolores enim quisquam.', '2022-01-27 10:53:36', '2022-01-27 10:53:36'),
(13, 'Stanton Hettinger', '61', 'female', 'dwill@example.com', '636-288-7166', '52289 Von Plaza\nDurgantown, MI 37897', 'Omnis voluptatum perspiciatis illum.', '2022-01-27 10:53:37', '2022-01-27 10:53:37'),
(14, 'Miss Rafaela Grimes Sr.', '19', 'female', 'dejon.weimann@example.org', '540.733.9362', '860 Sheila Plains\nCodyhaven, CA 36813', 'Iste tenetur debitis.', '2022-01-27 10:53:37', '2022-01-27 10:53:37'),
(15, 'Mr. Demond Dicki', '75', 'female', 'zella43@example.org', '818-453-4670', '2353 Stephen Wells Apt. 113\nDarrylburgh, WI 88790-9767', 'Quidem rerum qui.', '2022-01-27 10:53:37', '2022-01-27 10:53:37'),
(16, 'Prof. Zora Stokes', '74', 'female', 'amani.crona@example.org', '+1 (657) 998-9597', '9324 Verla Islands Apt. 257\nLake Travonport, MA 71796-8707', 'Nulla sed omnis quisquam.', '2022-01-27 10:53:37', '2022-01-27 10:53:37'),
(17, 'Hector Abernathy DDS', '26', 'male', 'nikolaus.molly@example.com', '726.764.6775', '21676 Gabriella Inlet Suite 528\nNorth Alyssonhaven, ND 89482', 'Sed sapiente vitae beatae.', '2022-01-27 10:53:37', '2022-01-27 10:53:37'),
(18, 'Brandi Erdman', '36', 'male', 'adell.gislason@example.com', '+1-413-275-0352', '8675 Yundt Plain\nEast Lelia, KY 14445-3653', 'Et dolorem quod cumque.', '2022-01-27 10:53:37', '2022-01-27 10:53:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$10$ay7t.KHnzVxBjBLddSrFsOgASj5Zdy6Hld22X0ORE7YmvnbnXHyW.', '2022-01-27 10:53:36', '2022-01-27 10:53:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authers`
--
ALTER TABLE `authers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_auther_id_foreign` (`auther_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_issues_student_id_foreign` (`student_id`),
  ADD KEY `book_issues_book_id_foreign` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authers`
--
ALTER TABLE `authers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_auther_id_foreign` FOREIGN KEY (`auther_id`) REFERENCES `authers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_issues_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
