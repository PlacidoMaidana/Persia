-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-04-2023 a las 10:49:07
-- Versión del servidor: 5.6.48-log
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c1561704_persia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bases`
--

CREATE TABLE `bases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desc_base` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas_diarias`
--

CREATE TABLE `cajas_diarias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `inicio_efectivo` decimal(19,2) DEFAULT NULL,
  `cerrado` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_operador` int(11) DEFAULT NULL,
  `total_efectivo` decimal(11,2) DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas_diarias`
--

INSERT INTO `cajas_diarias` (`id`, `fecha_apertura`, `inicio_efectivo`, `cerrado`, `id_operador`, `total_efectivo`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, '2022-09-08 11:26:49', '0.00', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_localidad` bigint(20) UNSIGNED NOT NULL,
  `e_mail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cond_iva` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_fce` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `cuit`, `fecha_alta`, `direccion`, `tel`, `id_localidad`, `e_mail`, `observaciones`, `cond_iva`, `registro_fce`, `created_at`, `updated_at`) VALUES
(9, 'DANIEL PILAHG', '30712270612', '0023-01-10 00:00:00', NULL, '3624613167', 4, NULL, NULL, 'RI', NULL, '2023-01-11 16:00:00', '2023-01-11 17:52:00'),
(10, 'TOLEDO RUBEL LEANDRO', '20261630592', '2023-01-02 00:00:00', NULL, '3704565257', 5, NULL, NULL, 'RI', NULL, '2023-01-11 16:34:00', '2023-01-11 17:52:14'),
(11, 'EMPRESA V.M.F.S.R.L.', '30708950900', '2022-12-31 00:00:00', NULL, '3624226736', 3, NULL, NULL, 'RI', NULL, '2023-01-12 17:19:00', '2023-03-14 16:54:37'),
(12, 'WALTER BRINACH', NULL, '2023-01-04 00:00:00', NULL, '364814961', 3, NULL, NULL, NULL, NULL, '2023-01-13 15:03:37', '2023-01-13 15:03:37'),
(13, 'LAURA DODDA', NULL, '2023-01-13 00:00:00', NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-01-13 17:50:10', '2023-01-13 17:50:10'),
(14, 'sonia', '27279818100', '2023-01-04 00:00:00', 'calle s/n', '3624615313', 3, NULL, NULL, NULL, NULL, '2023-01-30 16:02:14', '2023-01-30 16:02:14'),
(15, 'FRAGOSO MARIA SILVIA', '31112442', NULL, 'ARREBALSAGA 30', '+54 9 362 489-4777', 3, NULL, NULL, NULL, NULL, '2023-01-31 23:34:10', '2023-01-31 23:34:10'),
(16, 'RAMON CESAR', '31850369', '0003-02-01 00:00:00', 'fortin los pozos 4300', '3624800910', 3, 'cgomez_1985@live.com', 'prueba', 'NR', NULL, '2023-02-01 23:51:00', '2023-03-15 01:42:55'),
(17, 'JAVIER / SILVIA ROBERT', NULL, '2023-01-31 00:00:00', NULL, '+54 9 362 433-8109 / 362 411-2806', 3, NULL, NULL, 'CF', NULL, '2023-02-02 17:42:00', '2023-02-18 14:53:43'),
(18, 'ZURLO SERGIO', NULL, '2023-01-31 00:00:00', NULL, '+54 9 3725 40-9136', 3, NULL, NULL, NULL, NULL, '2023-02-02 17:52:45', '2023-02-02 17:52:45'),
(19, 'HUGO RIVERO', NULL, '2022-12-09 00:00:00', NULL, '+54 9 362 422-7248', 3, NULL, NULL, NULL, NULL, '2023-02-02 18:04:15', '2023-02-02 18:04:15'),
(20, 'ANALIA CASTRO', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-02-02 23:13:01', '2023-02-02 23:13:01'),
(21, 'EMPRESA ROMAX', NULL, '2022-11-03 00:00:00', NULL, NULL, 3, NULL, NULL, 'RI', NULL, '2023-02-02 23:29:00', '2023-03-14 16:54:46'),
(22, 'YOLANDA FERNANDEZ', NULL, '2023-01-19 00:00:00', 'FORMOSA', '3704688301', 5, NULL, NULL, NULL, NULL, '2023-02-03 16:48:12', '2023-02-03 16:48:12'),
(23, 'OSVALDO SOSA', NULL, '2023-02-03 00:00:00', NULL, '3624935745', 3, NULL, NULL, NULL, NULL, '2023-02-03 18:22:44', '2023-02-03 18:22:44'),
(24, 'MARCELO CRISTALDO', NULL, NULL, NULL, '3624607766', 3, NULL, '', NULL, NULL, '2023-02-03 20:54:13', '2023-02-03 20:54:13'),
(25, 'VICTOR CANTERO', NULL, '2022-08-16 00:00:00', NULL, '362 520-2012', 3, NULL, NULL, NULL, NULL, '2023-02-03 22:46:50', '2023-02-03 22:46:50'),
(26, 'YOLANDA RIVAS', NULL, '2022-09-20 00:00:00', NULL, '362 438-4846', 3, NULL, NULL, NULL, NULL, '2023-02-03 23:16:01', '2023-02-03 23:16:01'),
(27, 'SEBASTIAN SANGIACOMO', NULL, '2022-11-25 00:00:00', NULL, ' 3794720202', 2, NULL, NULL, NULL, NULL, '2023-02-03 23:21:25', '2023-02-03 23:21:25'),
(28, 'Heitrich Roberto Javier', NULL, '2022-12-22 00:00:00', NULL, '364 468-1334', 3, NULL, NULL, NULL, NULL, '2023-02-04 00:42:30', '2023-02-04 00:42:30'),
(29, 'AYELEN ROMERO', NULL, '2023-01-13 00:00:00', NULL, '3735 56-6895', 3, NULL, NULL, NULL, NULL, '2023-02-04 01:23:28', '2023-02-04 01:23:28'),
(30, 'MARTIN ORTIZ', NULL, '2023-01-17 00:00:00', '', '3624780378', 3, NULL, NULL, NULL, NULL, '2023-02-04 17:39:04', '2023-02-04 17:39:04'),
(31, 'DANIEL MORENO', NULL, NULL, 'Fortín Aguilar 545', '362 466-2227', 3, 'sofiamadera08@gmail.com', NULL, NULL, NULL, '2023-02-06 18:14:39', '2023-02-06 18:14:39'),
(32, 'ARQ CRISTIAN MONZON', NULL, '2023-01-21 00:00:00', NULL, '362 460-3991', 3, NULL, NULL, NULL, NULL, '2023-02-06 22:42:50', '2023-02-06 22:42:50'),
(33, 'EMPRESA CUBELS', NULL, '2023-01-20 00:00:00', NULL, '362 423-7604  /  362 409-2716', 3, NULL, NULL, 'RI', NULL, '2023-02-06 22:59:00', '2023-03-14 16:55:04'),
(34, 'ARQ. NANCY BASTIANI', NULL, '2022-12-20 00:00:00', NULL, '362 470-4776', 3, NULL, NULL, 'RI', NULL, '2023-02-06 23:11:00', '2023-03-14 16:54:53'),
(35, 'VIVIANA VIRILLI', NULL, '2023-01-31 00:00:00', NULL, '+54 9 362 471-4481', 3, NULL, NULL, NULL, NULL, '2023-02-06 23:28:14', '2023-02-06 23:28:14'),
(36, 'DAMIAN LUNARDINI', NULL, '2023-01-31 00:00:00', NULL, '362 469-2127', 3, NULL, NULL, NULL, NULL, '2023-02-06 23:50:11', '2023-02-06 23:50:11'),
(37, 'ROSA / APONTE ENRIQUE', NULL, '2023-01-06 00:00:00', 'BARRIO ESPAÑA - MZ 66 CS 2', '3624875714', 3, NULL, NULL, 'CF', NULL, '2023-02-07 00:23:00', '2023-02-07 00:37:09'),
(38, 'NORMA BEATRIZ ROJAS', NULL, '2023-02-07 00:00:00', 'AV LAS HERAS A 2 CUADRAS DE LA CARCEL', '+54 9 362 520-5109', 3, NULL, NULL, NULL, NULL, '2023-02-07 16:19:10', '2023-02-07 16:19:10'),
(39, 'EREMIRA ARECHAVALA LILI', NULL, '2023-02-04 00:00:00', NULL, '+54 9 362 473-2827', 3, NULL, NULL, NULL, NULL, '2023-02-07 17:08:56', '2023-02-07 17:08:56'),
(40, 'MARISEL CESPEDES', NULL, '2023-02-08 00:00:00', NULL, '3624 649131', 3, NULL, NULL, 'RI', NULL, '2023-02-08 14:48:00', '2023-03-15 01:41:48'),
(42, 'PETROVICH Y SRA', NULL, '2023-02-08 00:00:00', NULL, '+54 9 362 410-2752', 3, NULL, NULL, 'CF', NULL, '2023-02-08 16:41:00', '2023-03-15 01:42:28'),
(43, 'SILVANA TORRES RIOS', NULL, '2023-02-08 00:00:00', NULL, '3625223119', 3, NULL, NULL, 'RI', NULL, '2023-02-09 01:56:00', '2023-03-09 16:25:51'),
(44, 'FERNANDA TECNO', NULL, '2023-02-08 00:00:00', NULL, '+54 9 11 5508-3131', 3, NULL, NULL, NULL, NULL, '2023-02-09 17:52:58', '2023-02-09 17:52:58'),
(45, 'EMPRESA CACOSI AMARAY', NULL, '2023-02-09 00:00:00', NULL, '3624968836', 3, NULL, NULL, NULL, NULL, '2023-02-09 23:36:44', '2023-02-09 23:36:44'),
(46, 'EMPRESA CHACO CONSTRUCCIONES', NULL, '2022-09-30 00:00:00', NULL, '362 466-5533 González Perini', 3, NULL, '362 466-5533 González Perini', 'RI', NULL, '2023-02-10 16:31:00', '2023-03-14 16:55:30'),
(47, 'PATRICIA ROMERO', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-11 17:27:51', '2023-02-11 17:27:51'),
(48, 'FERNANDA GAMA', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-13 03:43:47', '2023-02-13 03:43:47'),
(49, 'ANABELA ALSINA', NULL, '2023-02-13 00:00:00', NULL, '362 438-9111', 3, NULL, NULL, 'RI', NULL, '2023-02-13 16:20:00', '2023-03-15 01:42:50'),
(50, 'VALERIA ACEVEDO', NULL, '2023-02-13 00:00:00', NULL, '3624928398', 3, NULL, NULL, 'RI', NULL, '2023-02-13 17:55:00', '2023-03-15 01:42:40'),
(51, 'ROMINA PUCHETA', NULL, '2023-02-13 00:00:00', NULL, '362 410-8797', 3, NULL, NULL, 'CF', NULL, '2023-02-13 23:14:00', '2023-02-13 23:15:41'),
(52, 'LUZ GARCIA REDONDO', NULL, '2023-02-13 00:00:00', NULL, '362 466-9560', 3, NULL, NULL, 'RI', NULL, '2023-02-14 01:45:00', '2023-03-15 01:39:16'),
(53, 'SERGIO SLEYKAL', NULL, NULL, NULL, '362 436-5886', 3, NULL, NULL, 'RI', NULL, '2023-02-14 15:25:00', '2023-03-15 01:39:32'),
(54, 'FERNANDO', NULL, '2023-02-14 00:00:00', NULL, '362 430-1602', 3, NULL, NULL, 'RI', NULL, '2023-02-14 16:34:00', '2023-03-15 01:39:39'),
(55, 'EMPRESA PALACIOS CONSTRUCCIONES', NULL, NULL, NULL, '+54 9 362 456-6349 Gaston Gonzalez', 3, NULL, NULL, 'RI', NULL, '2023-02-14 16:57:00', '2023-03-14 16:52:15'),
(56, 'ING PEDRO MARTINEZ', NULL, '2023-02-15 00:00:00', NULL, '3624814222 - 3794773176 FABIO', 3, NULL, NULL, 'CF', NULL, '2023-02-15 17:27:00', '2023-03-11 00:27:45'),
(57, 'NICOLAS BALCZA', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-15 18:06:46', '2023-02-15 18:06:46'),
(58, 'NICOLAS BALCAZA', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-15 18:07:14', '2023-02-15 18:07:14'),
(59, 'EVANGELINA ZARACHO', NULL, NULL, NULL, '362 524-0455', 3, NULL, NULL, 'RI', NULL, '2023-02-16 01:47:00', '2023-03-15 01:39:49'),
(60, '@POLLERIA TIKI WALTER', NULL, '2023-02-16 00:00:00', NULL, '362 492-5524', 3, NULL, NULL, 'RI', NULL, '2023-02-16 15:47:00', '2023-03-15 01:40:04'),
(61, 'RAMIREZ SERGIO LOCAL', NULL, '2023-02-16 00:00:00', NULL, '3624539732', 3, NULL, NULL, 'RI', NULL, '2023-02-16 17:35:00', '2023-03-15 01:36:27'),
(62, '@SERGIO', NULL, '2023-02-16 00:00:00', NULL, '+54 9 3794 60-0567', 3, NULL, NULL, 'RI', NULL, '2023-02-17 00:45:00', '2023-03-15 01:38:04'),
(63, 'EMA ARCADE', NULL, '2023-02-17 00:00:00', NULL, '+54 9 364 433-7592', 3, NULL, NULL, 'RI', NULL, '2023-02-17 22:22:00', '2023-03-15 01:38:22'),
(64, 'RITA PAVON / PEDRO', NULL, '2023-02-21 00:00:00', NULL, 'arq sonia', 3, NULL, NULL, 'RI', NULL, '2023-02-21 16:19:00', '2023-03-15 01:38:34'),
(65, '@ELISEO RAMIREZ', NULL, '2023-02-21 00:00:00', NULL, '3794616464', 3, NULL, NULL, 'RI', NULL, '2023-02-21 22:58:00', '2023-03-15 01:38:44'),
(66, 'EMPRESA MAXI CONSTRUCCIONES', NULL, '2023-02-22 00:00:00', NULL, '362 515-1500', 3, NULL, NULL, 'RI', NULL, '2023-02-22 15:25:00', '2023-03-14 16:51:35'),
(67, 'JUAN CARLOS GODOY', NULL, '2023-02-22 00:00:00', NULL, '+54 9 362 462-6005', 3, NULL, NULL, 'RI', NULL, '2023-02-23 01:31:00', '2023-03-15 01:38:56'),
(68, 'VALENZUELA ROCIO MARICEL', '30-71636650-9', '2023-02-23 00:00:00', 'MZ 79 - PC 4 - 125 VIV - FONTANA', '3624015945', 3, NULL, NULL, NULL, NULL, '2023-02-23 16:40:37', '2023-02-23 16:40:37'),
(69, 'LUCAS EMANUEL QUIROGA', NULL, '2023-02-24 00:00:00', NULL, '362 411-9113', 3, NULL, NULL, 'RI', NULL, '2023-02-24 22:57:00', '2023-03-15 01:39:06'),
(70, 'Consumidor final', '1', '2023-02-25 00:00:00', NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-02-25 16:05:55', '2023-02-25 16:05:55'),
(71, 'POLLERIA Y FIAMBRERIA', NULL, '2023-02-27 00:00:00', NULL, '+54 9 3794 39-9907', 3, NULL, NULL, 'RI', NULL, '2023-02-27 15:10:00', '2023-03-15 01:35:14'),
(72, 'ARIEL BENELLI', NULL, '2023-02-27 00:00:00', NULL, '+54 9 362 430-8094', 3, NULL, NULL, 'RI', NULL, '2023-02-27 16:43:00', '2023-03-15 01:35:25'),
(73, 'EMPRESA ILAG CONSTRUCCIONES', NULL, '2023-02-27 00:00:00', NULL, '+54 9 362 438-2033 PAO MONACO', 3, NULL, '+54 9 362 438-2033 PAO MONACO', 'RI', NULL, '2023-02-27 17:01:00', '2023-03-15 01:35:38'),
(74, 'BLANCO EUGENIO DANIEL', NULL, '2023-02-27 00:00:00', 'MACHAGAI', '+54 9 3734 60-5810', 3, NULL, NULL, 'RI', NULL, '2023-02-28 17:17:00', '2023-03-24 17:20:34'),
(75, 'JORGE RODRIGUEZ', NULL, '2023-02-28 00:00:00', NULL, '+54 9 362 489-3938', 3, NULL, NULL, NULL, NULL, '2023-03-01 01:05:21', '2023-03-01 01:05:21'),
(76, 'EMPRESA GRADO 3 ARQ Y CONSTR.', NULL, '2023-03-01 00:00:00', NULL, '+54 9 362 410-3234 Sosa Santoro, Pedro A.', 3, NULL, '+54 9 362 410-3234 Sosa Santoro, Pedro A.', 'RI', NULL, '2023-03-01 22:53:00', '2023-03-15 01:35:51'),
(77, 'LINARES PABLO CRISTIAN', NULL, '2023-03-01 00:00:00', 'LAS HERAS 3500', '3624523958', 3, NULL, NULL, NULL, NULL, '2023-03-01 23:43:58', '2023-03-01 23:43:58'),
(78, 'TERESA ALLENDE', NULL, '2023-03-01 00:00:00', 'Donovan 1530', '+54 9 362 477-6125', 3, NULL, NULL, 'RI', NULL, '2023-03-02 00:42:00', '2023-03-15 01:36:01'),
(79, 'AGUSTIN RAMIREZ', NULL, '2023-03-02 00:00:00', 'Fray Bertaca 1930', '+54 9 362 420-7192', 3, NULL, NULL, 'RI', NULL, '2023-03-02 23:17:00', '2023-03-15 01:36:10'),
(80, 'ALFREDO Y AMALIA', NULL, '2023-03-02 00:00:00', 'Mz 40 Mb 2 Casa 31 Barrio San Cayetano Ampliación ', '3624746442', 3, NULL, NULL, NULL, NULL, '2023-03-03 01:35:35', '2023-03-03 01:35:35'),
(81, 'DANIEL', NULL, '2023-03-03 00:00:00', NULL, '+54 9 362 454-2607', 3, NULL, NULL, NULL, NULL, '2023-03-03 15:07:44', '2023-03-03 15:07:44'),
(82, 'ANA FERNANDEZ', NULL, '2023-03-06 00:00:00', NULL, '3624188557', 3, NULL, 'FLAVIA', 'CF', NULL, '2023-03-03 15:11:00', '2023-03-14 15:34:58'),
(83, 'HUGO OJEDA', NULL, '2023-03-03 00:00:00', NULL, '3624668203', 3, NULL, NULL, NULL, NULL, '2023-03-04 01:07:04', '2023-03-04 01:07:04'),
(84, 'MARIA BORDA', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-03-04 19:32:38', '2023-03-04 19:32:38'),
(86, 'ARQ. DIEGO DEMIANIUK', NULL, '2023-03-06 00:00:00', NULL, '+54 9 362 460-9329', 3, NULL, 'SONIA', 'RI', NULL, '2023-03-06 18:27:00', '2023-03-15 01:35:04'),
(87, 'POCHO GOMEZ', NULL, '2023-03-06 00:00:00', NULL, '+54 9 3794 20-5764', 3, NULL, 'CESAR', 'CF', NULL, '2023-03-06 23:08:00', '2023-03-15 01:34:49'),
(88, 'CORRALON SILVIA CHAVEZ - VILLA BERTHET', NULL, '2023-03-06 00:00:00', NULL, '+54 9 3735 48-5521', 3, NULL, NULL, 'RI', NULL, '2023-03-07 00:48:00', '2023-03-15 01:34:41'),
(89, 'FABRICIO BARCESA', NULL, '2023-03-06 00:00:00', NULL, '+54 9 362 482-7535', 3, NULL, NULL, 'RI', NULL, '2023-03-07 01:01:00', '2023-03-15 01:34:20'),
(91, 'DANIEL PIANTANIDA', NULL, '2023-03-07 00:00:00', NULL, '3624542607', 3, NULL, NULL, NULL, NULL, '2023-03-07 14:55:55', '2023-03-07 14:55:55'),
(92, 'SUSANA LOBOS LOCAL', NULL, '2023-03-04 00:00:00', NULL, '3624618651', 3, NULL, NULL, 'RI', NULL, '2023-03-07 16:01:00', '2023-03-09 16:36:42'),
(93, 'MOLINA FERNANDO', NULL, '2023-03-07 00:00:00', NULL, '+54 9 362 482-1999', 3, NULL, NULL, NULL, NULL, '2023-03-07 17:01:05', '2023-03-07 17:01:05'),
(94, 'AMARILLA DIEGO', NULL, '2023-03-07 00:00:00', NULL, '3624861058', 3, NULL, NULL, NULL, NULL, '2023-03-08 00:05:35', '2023-03-08 00:05:35'),
(95, 'JUAN PABLO MARTINEZ', NULL, '2023-03-09 00:00:00', NULL, '3624870441', 3, NULL, NULL, NULL, NULL, '2023-03-08 16:34:13', '2023-03-08 16:34:13'),
(96, 'HENGEN MARTIN', NULL, NULL, NULL, '+54 9 362 425-8569', 3, NULL, NULL, 'RI', NULL, '2023-03-09 02:07:00', '2023-03-15 01:32:01'),
(97, 'MARTINEZ GUSTAVO OLIGARIO', NULL, '2023-03-09 00:00:00', 'PJE PERTILE 265', '3624848910', 3, NULL, NULL, NULL, NULL, '2023-03-09 15:31:03', '2023-03-09 15:31:03'),
(98, '@ESTEBAN JULIAN GONZALEZ', NULL, '2023-03-09 00:00:00', NULL, '3624623090', 3, NULL, NULL, 'RI', NULL, '2023-03-09 17:01:00', '2023-03-15 01:31:54'),
(99, 'MATIAS SANCHEZ', NULL, '2023-03-11 00:00:00', NULL, '3624204633', 3, NULL, NULL, 'RI', NULL, '2023-03-11 17:19:00', '2023-03-15 01:31:40'),
(101, 'CORRALON FEDERICO', NULL, '2023-03-11 00:00:00', NULL, '3624626946', 3, NULL, NULL, 'RI', NULL, '2023-03-11 18:32:00', '2023-03-15 01:31:22'),
(102, 'GABRIEL CACERES', NULL, '2023-03-13 00:00:00', NULL, '54 9 3795 05-5043', 3, NULL, 'CESAR', 'RI', NULL, '2023-03-13 22:54:00', '2023-03-15 01:30:47'),
(103, 'MEANA JUAN CARLOS Y LUISA VELOSO', NULL, '2023-03-15 00:00:00', NULL, '+54 9 362 475-7609', 3, NULL, NULL, NULL, NULL, '2023-03-15 15:27:47', '2023-03-15 15:27:47'),
(104, 'ROBERTO QUIÑONEZ', NULL, NULL, NULL, '3704 55-9742', 3, NULL, 'Proyecto diseño y construcción', NULL, NULL, '2023-03-16 19:45:57', '2023-03-16 19:45:57'),
(105, 'Norma Peña', NULL, '2023-03-07 00:00:00', 'Franklin 1350', '+54 9 362 456-7822', 3, NULL, NULL, NULL, NULL, '2023-03-16 22:35:58', '2023-03-16 22:35:58'),
(106, 'VANEZA OJEDA local', NULL, '2023-03-16 00:00:00', NULL, '3624658115', 3, NULL, NULL, 'RI', NULL, '2023-03-17 01:14:00', '2023-03-17 01:24:04'),
(107, 'Virginia Golobick', NULL, '2023-02-16 00:00:00', NULL, '+54 9 379 467-7488', 3, NULL, NULL, NULL, NULL, '2023-03-17 01:50:55', '2023-03-17 01:50:55'),
(108, 'ALDO JAVIER CABAÑA', NULL, '2023-02-15 00:00:00', NULL, '+54 9 364 452-4853 ', 3, NULL, NULL, NULL, NULL, '2023-03-17 17:52:05', '2023-03-17 17:52:05'),
(109, 'GUSTAVO REIGENBORN', NULL, '2023-03-20 00:00:00', NULL, '+54 9 364 410-3367', 3, NULL, NULL, 'CF', NULL, '2023-03-20 15:39:00', '2023-03-20 15:59:52'),
(110, 'JONAS', NULL, '2023-03-20 00:00:00', NULL, '3625249846', 3, NULL, NULL, NULL, NULL, '2023-03-21 01:05:55', '2023-03-21 01:05:55'),
(111, 'CLAUDIO BOTELLO', NULL, '2023-03-21 00:00:00', NULL, '3794772599', 2, NULL, NULL, NULL, NULL, '2023-03-21 15:07:56', '2023-03-21 15:07:56'),
(112, 'BRIAN EDUARDO', NULL, '2023-03-21 00:00:00', NULL, '3624802019', 3, NULL, NULL, NULL, NULL, '2023-03-21 18:14:54', '2023-03-21 18:14:54'),
(113, 'MARCELO CRUZ', NULL, '2023-03-21 00:00:00', NULL, '3624307374 - 3794802336', 3, NULL, NULL, NULL, NULL, '2023-03-22 02:00:21', '2023-03-22 02:00:21'),
(114, 'BRIAN BRITEZ', NULL, '2023-03-22 00:00:00', NULL, '+54 9 362 400-7343', 3, NULL, NULL, NULL, NULL, '2023-03-22 14:48:35', '2023-03-22 14:48:35'),
(115, 'NILDA VECINA', NULL, '2023-03-22 00:00:00', NULL, '+54 9 3794 09-5509', 3, NULL, NULL, NULL, NULL, '2023-03-23 01:47:30', '2023-03-23 01:47:30'),
(116, 'LILIAN GODOY', NULL, '2023-03-23 00:00:00', NULL, '+54 9 362 407-4426', 3, NULL, NULL, NULL, NULL, '2023-03-23 15:27:39', '2023-03-23 15:27:39'),
(117, 'PRADO PABLO', NULL, '2023-03-27 00:00:00', NULL, '3624074426', 3, NULL, NULL, NULL, NULL, '2023-03-28 02:02:01', '2023-03-28 02:02:01'),
(118, 'Hernan Romero', NULL, '2023-03-28 00:00:00', NULL, NULL, 3, ' <hromero@fabricasrl.com.ar>', NULL, NULL, NULL, '2023-03-28 22:28:20', '2023-03-28 22:28:20'),
(119, 'GARCIA  SANTICH', NULL, '2023-03-29 00:00:00', NULL, '3624337229', 3, NULL, NULL, NULL, NULL, '2023-03-29 17:15:55', '2023-03-29 17:15:55'),
(120, 'Nobile Ruben Jose', '20167169512', '2023-03-31 00:00:00', NULL, '3624545502', 3, NULL, NULL, NULL, NULL, '2023-04-01 00:33:45', '2023-04-01 00:33:45'),
(121, 'DANIEL ROMERO', NULL, '2023-04-01 00:00:00', NULL, '+54 9 362 466-9046', 3, NULL, NULL, NULL, NULL, '2023-04-01 15:49:30', '2023-04-01 15:49:30'),
(122, 'BEATRIZ FERNANDEZ', NULL, '2023-04-01 00:00:00', NULL, '+54 9 362 466-0351', 3, NULL, NULL, NULL, NULL, '2023-04-01 17:59:50', '2023-04-01 17:59:50'),
(123, 'PASKO SRL', NULL, '2023-04-03 00:00:00', NULL, '+54 9 362 438-7997 NADIA', 3, NULL, NULL, 'RI', NULL, '2023-04-03 22:24:00', '2023-04-03 22:43:00'),
(124, 'ALBERTO GUZMAN', NULL, '2023-04-03 00:00:00', NULL, '+54 9 362 485-0461', 3, NULL, NULL, NULL, NULL, '2023-04-03 23:06:14', '2023-04-03 23:06:14'),
(125, 'CLAUDIO ROMERO', NULL, '2023-03-30 00:00:00', NULL, '3624232424', 3, NULL, NULL, NULL, NULL, '2023-04-04 16:38:44', '2023-04-04 16:38:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancos`
--

CREATE TABLE `cuentas_bancos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banco` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_cta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cuenta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cbu` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentas_bancos`
--

INSERT INTO `cuentas_bancos` (`id`, `banco`, `sucursal`, `tipo_cta`, `nro_cuenta`, `cbu`, `created_at`, `updated_at`) VALUES
(1, 'NUEVO BANCO DEL CHACO', 'Resistencia', 'Caja de ahorro', '0003000003948802', '3110030211000039488022', '2022-10-19 15:06:00', '2023-02-03 18:13:32'),
(2, 'BANCO PATAGONIA', 'Resistencia', 'Caja Ahorra', '208-208012869-000', '0340208708208012869000', '2023-01-09 17:38:00', '2023-02-03 18:12:57'),
(3, 'MERCADO PAGO', NULL, NULL, 'decar.silo.tela.mp', '0000003100074852580722', '2023-02-03 18:10:51', '2023-02-03 18:10:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 0, 0, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 13, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 13, 'cuit', 'text', 'Cuit', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 13, 'fecha_alta', 'date', 'Fecha Alta', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 13, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 5),
(62, 13, 'tel', 'text', 'Tel', 0, 1, 1, 1, 1, 1, '{}', 6),
(63, 13, 'id_localidad', 'number', 'Id Localidad', 1, 1, 1, 1, 1, 1, '{}', 7),
(64, 13, 'e_mail', 'text', 'E Mail', 0, 1, 1, 1, 1, 1, '{}', 9),
(65, 13, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 10),
(66, 13, 'cond_iva', 'select_dropdown', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{\"default\":\"RI\",\"options\":{\"RI\":\"Responsable inscripto\",\"MO\":\"Monotributo\",\"CF\":\"Consumidor Final\",\"NR\":\"No responsable\",\"Exe\":\"Exento\"}}', 11),
(67, 13, 'registro_fce', 'text', 'Registro Fce', 0, 1, 1, 1, 1, 1, '{}', 12),
(68, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(69, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(85, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 16, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 4),
(89, 16, 'id_cliente', 'text', 'Id Cliente', 0, 0, 0, 1, 1, 1, '{}', 5),
(91, 16, 'totalgravado', 'text', 'Totalgravado', 0, 0, 0, 0, 0, 0, '{}', 7),
(92, 16, 'total', 'text', 'Total', 0, 0, 0, 0, 0, 0, '{}', 8),
(93, 16, 'monto_iva', 'text', 'Monto Iva', 0, 0, 0, 0, 0, 0, '{}', 9),
(94, 16, 'id_vendedor', 'text', 'Id Vendedor', 0, 0, 0, 1, 1, 1, '{}', 14),
(96, 16, 'id_factura', 'text', 'Id Factura', 0, 0, 0, 0, 0, 0, '{}', 10),
(98, 16, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{\"display\":{\"height\":\"5\"}}', 22),
(100, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
(101, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(103, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 17, 'apellidoynombre', 'text', 'Apellidoynombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(105, 17, 'cuil', 'text', 'Cuil', 0, 1, 1, 1, 1, 1, '{}', 3),
(106, 17, 'dni', 'text', 'Dni', 0, 1, 1, 1, 1, 1, '{}', 4),
(107, 17, 'fecha_ingreso', 'date', 'Fecha Ingreso', 0, 1, 1, 1, 1, 1, '{}', 5),
(108, 17, 'categoria', 'text', 'Categoria', 0, 1, 1, 1, 1, 1, '{}', 6),
(109, 17, 'estado', 'text', 'Estado', 0, 1, 1, 1, 1, 1, '{}', 7),
(110, 17, 'fecha_nacimiento', 'date', 'Fecha Nacimiento', 0, 1, 1, 1, 1, 1, '{}', 8),
(111, 17, 'estadocivil', 'text', 'Estadocivil', 0, 1, 1, 1, 1, 1, '{}', 9),
(112, 17, 'domicilio', 'text', 'Domicilio', 0, 1, 1, 1, 1, 1, '{}', 10),
(113, 17, 'telefonos', 'text', 'Telefonos', 0, 1, 1, 1, 1, 1, '{}', 11),
(114, 17, 'observaciones', 'text', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 12),
(115, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 1, 1, '{}', 13),
(116, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 1, 1, 1, '{}', 14),
(118, 16, 'nota_pedido_belongsto_empleado_relationship', 'relationship', 'Vendedor 1', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(119, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(120, 18, 'rubro', 'text', 'Rubro', 0, 1, 1, 1, 1, 1, '{}', 2),
(121, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(122, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(123, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(124, 19, 'rubro_id', 'text', 'Rubro Id', 1, 0, 0, 1, 1, 1, '{}', 2),
(125, 19, 'descripcion_subrubro', 'text', 'Descripcion Subrubro', 0, 1, 1, 1, 1, 1, '{}', 4),
(126, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(127, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(128, 19, 'subrubro_belongsto_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rubro\",\"table\":\"rubros\",\"type\":\"belongsTo\",\"column\":\"rubro_id\",\"key\":\"id\",\"label\":\"rubro\",\"pivot_table\":\"caja_diaria\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(129, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(131, 20, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 2),
(132, 20, 'rubro_id', 'text', 'Rubro Id', 1, 0, 0, 1, 1, 1, '{}', 4),
(133, 20, 'subrubro_id', 'text', 'Subrubro Id', 1, 0, 0, 1, 1, 1, '{}', 6),
(134, 20, 'preciovta', 'text', 'Preciovta', 0, 1, 1, 1, 1, 1, '{}', 8),
(136, 20, 'tasa_iva', 'number', 'Tasa Iva', 0, 1, 1, 1, 1, 1, '{}', 9),
(137, 20, 'unidad', 'select_dropdown', 'Unidad', 0, 0, 1, 1, 1, 1, '{\"default\":\"m2\",\"options\":{\"kg\":\"kg\",\"grs\":\"gr\",\"m2\":\"m2\",\"ml\":\"ml\",\"Paquete\":\"Paquete\",\"Bolsas\":\"Bolsas\",\"Unidad\":\"Unidad\",\"Litros\":\"Litros\",\"Balde\":\"Balde\",\"Otros\":\"Otros\"}}', 10),
(140, 20, 'activo', 'select_dropdown', 'Activo', 0, 1, 1, 1, 1, 1, '{\"default\":\"SI\",\"options\":{\"SI\":\"SI\",\"NO\":\"NO\"}}', 3),
(143, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 18),
(144, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(145, 20, 'producto_hasone_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rubro\",\"table\":\"rubros\",\"type\":\"belongsTo\",\"column\":\"rubro_id\",\"key\":\"id\",\"label\":\"rubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(146, 20, 'producto_belongsto_subrubro_relationship', 'relationship', 'subrubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Subrubro\",\"table\":\"subrubros\",\"type\":\"belongsTo\",\"column\":\"subrubro_id\",\"key\":\"id\",\"label\":\"descripcion_subrubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(147, 16, 'nota_pedido_belongsto_cliente_relationship', 'relationship', 'cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"id_cliente\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(148, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(149, 23, 'provincia', 'text', 'Provincia', 1, 1, 1, 1, 1, 1, '{}', 2),
(150, 23, 'localidad', 'text', 'Localidad', 1, 1, 1, 1, 1, 1, '{}', 3),
(151, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(152, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(153, 13, 'cliente_belongsto_localidade_relationship', 'relationship', 'localidades', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Localidad\",\"table\":\"localidades\",\"type\":\"belongsTo\",\"column\":\"id_localidad\",\"key\":\"id\",\"label\":\"localidad\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(154, 20, 'id_molde', 'text', 'Id Molde', 0, 1, 1, 1, 1, 1, '{}', 11),
(155, 20, 'manual_procedimiento', 'text_area', 'Manual Procedimiento', 0, 0, 0, 1, 1, 1, '{}', 15),
(158, 20, 'unidades_mt2', 'text', 'Unidades Mt2', 0, 1, 1, 1, 1, 1, '{}', 13),
(159, 20, 'paquetes_mt2', 'text', 'Paquetes Mt2', 0, 1, 1, 1, 1, 1, '{}', 14),
(160, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(161, 24, 'tipo1', 'text', 'Tipo1', 0, 1, 1, 1, 1, 1, '{}', 2),
(162, 24, 'tipo2', 'text', 'Tipo2', 0, 1, 1, 1, 1, 1, '{}', 3),
(163, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(164, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(165, 16, 'descuento', 'text', 'Recargo /Descuento (+/-)', 0, 1, 1, 1, 1, 1, '{}', 12),
(166, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(167, 25, 'razonsocial', 'text', 'Razón Social', 0, 1, 1, 1, 1, 1, '{}', 2),
(168, 25, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 3),
(169, 25, 'nombre_comercial', 'text', 'Nombre Comercial', 0, 1, 1, 1, 1, 1, '{}', 4),
(170, 25, 'web', 'text', 'Web', 0, 1, 1, 1, 1, 1, '{}', 5),
(171, 25, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 6),
(172, 25, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{}', 7),
(173, 25, 'cuit', 'text', 'Cuit', 0, 1, 1, 1, 1, 1, '{}', 8),
(174, 25, 'cond_iva', 'select_dropdown', 'Condición Iva', 0, 1, 1, 1, 1, 1, '{\"default\":\"RI\",\"options\":{\"RI\":\"Responsable inscripto\",\"MO\":\"Monotributo\",\"CF\":\"Consumidor Final\",\"NR\":\"No responsable\",\"Exe\":\"Exento\"}}', 9),
(175, 25, 'nombre_contacto', 'text', 'Nombre Contacto', 0, 1, 1, 1, 1, 1, '{}', 10),
(176, 25, 'telefono_contacto', 'text', 'Telefono Contacto', 0, 1, 1, 1, 1, 1, '{}', 11),
(177, 25, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 12),
(178, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
(179, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(180, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(181, 26, 'tipo_factura', 'select_dropdown', 'Tipo Factura', 1, 1, 1, 1, 1, 1, '{\"default\":\"A\",\"options\":{\"A\":\"A\",\"B\":\"B\",\"C\":\"C\",\"INT\":\"INT\",\"NCI\":\"NCI\",\"NDI\":\"NDI\",\"NCA\":\"NCA\",\"NCB\":\"NCB\",\"NCC\":\"NCC\",\"NDA\":\"NDA\",\"NDB\":\"NDB\",\"NDC\":\"NDC\"}}', 3),
(182, 26, 'pto_venta', 'number', 'Pto Venta', 1, 1, 1, 1, 1, 1, '{}', 4),
(183, 26, 'nro_factura', 'number', 'Nro Factura', 1, 1, 1, 1, 1, 1, '{}', 5),
(184, 26, 'id_proveedor', 'text', 'Id Proveedor', 1, 0, 0, 1, 1, 1, '{}', 7),
(185, 26, 'fecha', 'date', 'Fecha', 1, 1, 1, 1, 1, 1, '{}', 2),
(186, 26, 'observaciones', 'text_area', 'Observaciones', 0, 0, 0, 1, 1, 1, '{}', 31),
(187, 26, 'id_tipo_gasto', 'text', 'Id Tipo Gasto', 1, 0, 0, 1, 1, 1, '{}', 9),
(188, 26, 'fecha_carga', 'date', 'Fecha Carga', 0, 1, 1, 1, 1, 1, '{}', 6),
(189, 26, 'subtotal', 'number', 'Subtotal', 0, 1, 1, 1, 1, 1, '{}', 11),
(194, 26, 'iva', 'number', 'Iva', 0, 0, 0, 0, 0, 0, '{}', 16),
(198, 26, 'otros_impuestos', 'number', 'Otros Impuestos', 0, 0, 0, 0, 0, 0, '{}', 20),
(200, 26, 'total_factura', 'number', 'Total Factura', 1, 1, 1, 1, 1, 1, '{}', 22),
(206, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 32),
(207, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 33),
(208, 26, 'facturas_compra_belongsto_proveedore_relationship', 'relationship', 'Proveedor', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Proveedor\",\"table\":\"proveedores\",\"type\":\"belongsTo\",\"column\":\"id_proveedor\",\"key\":\"id\",\"label\":\"razonsocial\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(209, 26, 'facturas_compra_belongsto_tipos_gasto_relationship', 'relationship', 'Tipo gasto', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Tipo_gasto\",\"table\":\"tipos_gastos\",\"type\":\"belongsTo\",\"column\":\"id_tipo_gasto\",\"key\":\"id\",\"label\":\"tipo2\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(220, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(221, 31, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(222, 31, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 6),
(223, 31, 'pto_vta', 'text', 'Pto Vta', 0, 0, 0, 1, 1, 1, '{}', 7),
(224, 31, 'nro_recibo', 'text', 'Nro Recibo', 0, 0, 0, 1, 1, 1, '{}', 8),
(226, 31, 'id_nota_pedido', 'text', 'Id Nota Pedido', 0, 0, 0, 1, 1, 0, '{}', 3),
(227, 31, 'id_factura_compra', 'text', 'Id Factura Compra', 0, 0, 0, 0, 0, 0, '{}', 4),
(228, 31, 'modalidad_pago', 'select_dropdown', 'Modalidad Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Efectivo\",\"options\":{\"Efectivo\":\"Efectivo\",\"Cheque\":\"Cheque\",\"Transferencia\":\"Transferencia\",\"Tarjeta D\\u00e9bito\":\"Tarjeta D\\u00e9bito\",\"Tarjeta Cr\\u00e9dito\":\"Tarjeta Cr\\u00e9dito\",\"Retenciones\":\"Retenciones\"}}', 10),
(229, 31, 'nro_cheque', 'text', 'Nro Cheque', 0, 0, 1, 1, 1, 1, '{}', 13),
(231, 31, 'id_cuenta_bancaria', 'text', 'Id Cuenta Bancaria', 0, 0, 0, 1, 1, 1, '{}', 11),
(232, 31, 'detalle', 'text_area', 'Detalle', 0, 1, 1, 1, 1, 1, '{}', 29),
(235, 31, 'tipo_movimiento', 'select_dropdown', 'Tipo Movimiento', 0, 1, 1, 1, 1, 1, '{\"default\":\"Gastos\\/Egresos\",\"options\":{\"Gastos\\/Egresos\":\"Gastos\\/Egresos\",\"Cobranza\\/Ingresos\":\"Cobranza\\/Ingresos\",\"Extracciones\":\"Extracciones\",\"Deposito bancario\":\"Deposito bancario\",\"Movimiento entre Usuarios\":\"Movimiento entre Usuarios\",\"Movimiento entre Bancos\":\"Movimiento entre Bancos\"}}', 2),
(236, 31, 'importe_egreso', 'text', 'Importe Egreso', 0, 1, 1, 1, 1, 1, '{}', 23),
(237, 31, 'importe_ingreso', 'text', 'Importe Ingreso', 0, 1, 1, 1, 1, 1, '{}', 22),
(238, 31, 'id_usuario', 'text', 'Id Usuario', 0, 0, 0, 0, 0, 0, '{}', 27),
(239, 31, 'id_caja', 'text', 'Id Caja', 0, 1, 1, 1, 1, 1, '{}', 26),
(242, 31, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 18),
(243, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(244, 18, 'categoria', 'select_dropdown', 'Categoria', 0, 1, 1, 1, 1, 1, '{\"default\":\"Productos Reventa\",\"options\":{\"Productos Reventa\":\"Productos Reventa\",\"Materia Prima\":\"Materia Prima\",\"Elaboraci\\u00f3n Propia\":\"Elaboraci\\u00f3n Propia\",\"Obras\":\"Obras\"}}', 3),
(245, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(246, 36, 'fecha_orden', 'date', 'Fecha Orden', 0, 1, 1, 1, 1, 1, '{}', 3),
(247, 36, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 7),
(248, 36, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente\",\"options\":{\"Pendiente\":\"Pendiente\",\"En Proceso\":\"En Proceso\",\"Terminado\":\"Terminado\",\"Empaquetado y controlado\":\"Empaquetado y controlado\",\"Entregado\":\"Entregado\"}}', 8),
(249, 36, 'fecha_entrada_proceso', 'date', 'Fecha Entrada Proceso', 0, 1, 1, 1, 1, 1, '{}', 9),
(250, 36, 'fecha_salida_proceso', 'date', 'Fecha Salida Proceso', 0, 1, 1, 1, 1, 1, '{}', 10),
(251, 36, 'id_producto', 'text', 'Id Producto', 0, 0, 0, 1, 1, 1, '{}', 4),
(252, 36, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 6),
(254, 36, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 11),
(255, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(256, 16, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente Aprobacion\",\"options\":{\"Rechazado\":\"Rechazado\",\"Pendiente Aprobacion\":\"Pendiente Aprobacion\",\"Pendiente Entrega\":\"Aprobado - Pendiente Entrega\",\"Entregado\":\"Entregado\"}}', 11),
(257, 36, 'ordenes_fabricacion_belongsto_producto_relationship', 'relationship', 'productos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Producto\",\"table\":\"productos\",\"type\":\"belongsTo\",\"column\":\"id_producto\",\"key\":\"id\",\"label\":\"descripcion\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(260, 20, 'precio_compra', 'text', 'Precio Compra', 0, 1, 1, 1, 1, 1, '{}', 16),
(261, 20, 'unidad_compra', 'text', 'Unidad Compra', 0, 1, 1, 1, 1, 1, '{}', 17),
(266, 20, 'id_base', 'text', 'Id Base', 0, 1, 1, 1, 1, 1, '{}', 12),
(267, 44, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(268, 44, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 2),
(269, 44, 'cant_moldes', 'number', 'Cant Moldes', 0, 1, 1, 1, 1, 1, '{}', 3),
(270, 44, 'mt2_por_molde', 'number', 'Mt2 Por Molde', 0, 1, 1, 1, 1, 1, '{}', 4),
(271, 44, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(272, 44, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(273, 20, 'producto_belongsto_molde_relationship', 'relationship', 'moldes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Molde\",\"table\":\"moldes\",\"type\":\"belongsTo\",\"column\":\"id_molde\",\"key\":\"id\",\"label\":\"descripcion\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 20),
(277, 16, 'id_vendedor_2', 'text', 'Id Vendedor 2', 0, 0, 0, 1, 1, 1, '{}', 20),
(278, 16, 'tipo_presupuesto', 'select_dropdown', 'Tipo Presupuesto', 0, 1, 1, 1, 1, 1, '{\"default\":\"Productos\",\"options\":{\"Productos\":\"Productos\",\"Muebles\":\"Muebles\",\"Obras\":\"Obras\"}}', 3),
(279, 16, 'nota_pedido_belongsto_empleado_relationship_1', 'relationship', 'Vendedor 2', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor_2\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(280, 31, 'mov_financiero_belongsto_empleado_relationship', 'relationship', 'Operador', 0, 1, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_usuario\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 24),
(281, 36, 'id_pedido', 'text', 'Id Pedido', 0, 1, 1, 1, 1, 1, '{}', 3),
(282, 46, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(283, 46, 'Forma_pago_Muebles', 'text_area', 'Forma Pago Muebles', 0, 1, 1, 1, 1, 1, '{}', 2),
(284, 46, 'Forma_pago_Obras', 'text_area', 'Forma Pago Obras', 0, 1, 1, 1, 1, 1, '{}', 3),
(285, 46, 'Forma_pago_Productos', 'text_area', 'Forma Pago Productos', 0, 1, 1, 1, 1, 1, '{}', 4),
(286, 46, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(287, 46, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(290, 31, 'mov_financiero_belongsto_cuentas_banco_relationship', 'relationship', 'Cuenta banco', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cuentas_Banco\",\"table\":\"cuentas_bancos\",\"type\":\"belongsTo\",\"column\":\"id_cuenta_bancaria\",\"key\":\"id\",\"label\":\"banco\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(291, 48, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(292, 48, 'banco', 'text', 'Banco', 0, 1, 1, 1, 1, 1, '{}', 2),
(293, 48, 'sucursal', 'text', 'Sucursal', 0, 1, 1, 1, 1, 1, '{}', 3),
(294, 48, 'tipo_cta', 'text', 'Tipo Cta', 0, 1, 1, 1, 1, 1, '{}', 4),
(295, 48, 'nro_cuenta', 'text', 'Nro Cuenta', 0, 1, 1, 1, 1, 1, '{}', 5),
(296, 48, 'cbu', 'text', 'Cbu', 0, 1, 1, 1, 1, 1, '{}', 6),
(297, 48, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(298, 48, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(299, 16, 'nro_remito', 'text', 'Nro Remito', 0, 0, 1, 1, 0, 1, '{}', 18),
(300, 16, 'fecha_entrega', 'date', 'Fecha Entrega', 0, 1, 1, 1, 1, 1, '{}', 19),
(303, 26, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Cancelada\",\"options\":{\"Cancelada\":\"Cancelada\",\"Pendiente\":\"Pendiente\"}}', 16),
(304, 16, 'modalidad_venta', 'select_dropdown', 'Modalidad Venta', 0, 1, 1, 1, 1, 1, '{\"default\":\"Otros\",\"options\":{\"Contado\":\"Contado\",\"Otros\":\"Otros\"}}', 21),
(305, 16, 'Anexo_Presupuesto', 'rich_text_box', 'Anexo Presupuesto', 0, 1, 1, 1, 1, 1, '{}', 23),
(306, 50, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(307, 50, 'desc_tipo', 'text', 'Desc Tipo', 0, 1, 1, 1, 1, 1, '{}', 2),
(308, 50, 'porc_comision', 'text', 'Porc Comision', 0, 1, 1, 1, 1, 1, '{}', 3),
(309, 50, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(310, 50, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(311, 16, 'nota_pedido_belongsto_tipos_presupuesto_relationship', 'relationship', 'tipos_presupuestos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\tipo_presupuesto\",\"table\":\"tipos_presupuestos\",\"type\":\"belongsTo\",\"column\":\"tipo_presupuesto\",\"key\":\"desc_tipo\",\"label\":\"desc_tipo\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-01-09 01:12:38', '2022-02-18 17:26:30'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(13, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Models\\Cliente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-11 23:35:14', '2023-01-09 14:30:27'),
(16, 'nota_pedidos', 'nota-pedidos', 'Nota Pedido', 'Nota Pedidos', NULL, 'App\\Models\\nota_pedido', NULL, 'App\\Http\\Controllers\\Voyager\\PedidosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:34:43', '2023-02-21 02:10:28'),
(17, 'empleados', 'empleados', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:40:47', '2022-02-10 02:15:28'),
(18, 'rubros', 'rubros', 'Rubro', 'Rubros', NULL, 'App\\Models\\Rubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:04:32', '2022-11-30 00:08:28'),
(19, 'subrubros', 'subrubros', 'Subrubro', 'Subrubros', NULL, 'App\\Models\\Subrubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:05:02', '2022-01-18 15:39:51'),
(20, 'productos', 'productos', 'Producto', 'Productos', NULL, 'App\\Models\\Producto', NULL, 'App\\Http\\Controllers\\Voyager\\ProductosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-18 14:30:46', '2023-02-03 17:53:15'),
(23, 'localidades', 'localidades', 'Localidade', 'Localidades', NULL, 'App\\Models\\Localidad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(24, 'tipos_gastos', 'tipos-gastos', 'Tipos Gasto', 'Tipos Gastos', NULL, 'App\\Models\\Tipo_gasto', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-08 00:36:04', '2022-02-16 18:08:45'),
(25, 'proveedores', 'proveedores', 'Proveedor', 'Proveedores', NULL, 'App\\Models\\Proveedor', NULL, 'App\\Http\\Controllers\\Voyager\\ProveedoresController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:13:49', '2023-01-10 23:08:07'),
(26, 'facturas_compras', 'facturas-compras', 'Facturas Compra', 'Facturas Compras', NULL, 'App\\Models\\Factura_Compra', NULL, 'App\\Http\\Controllers\\Voyager\\facturas_comprasController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:17:00', '2023-01-04 15:49:59'),
(31, 'mov_financieros', 'movimientos_financieros', 'Mov Financiero', 'Mov Financieros', NULL, 'App\\Models\\MovFinanciero', NULL, 'App\\Http\\Controllers\\Voyager\\MovFinancieroController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-17 01:14:52', '2023-01-09 14:24:00'),
(36, 'ordenes_fabricacion', 'ordenes_fabricacion', 'Ordenes Fabricacion', 'Ordenes Fabricacion', NULL, 'App\\Models\\OrdenesFabricacion', NULL, 'App\\Http\\Controllers\\Voyager\\OrdenesFabricController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-30 23:47:34', '2022-09-23 17:55:09'),
(44, 'moldes', 'moldes', 'Molde', 'Moldes', NULL, 'App\\Models\\Molde', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(46, 'formaspago', 'formaspago', 'Formaspago', 'Formaspagos', NULL, 'App\\Models\\Formaspago', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-09-10 02:27:30', '2022-09-10 02:28:19'),
(48, 'cuentas_bancos', 'cuentas-bancos', 'Cuentas Banco', 'Cuentas Bancos', NULL, 'App\\Models\\Cuentas_Banco', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(50, 'tipos_presupuestos', 'tipos-presupuestos', 'Tipos Presupuesto', 'Tipos Presupuestos', NULL, 'App\\Models\\tipo_presupuesto', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-02-21 01:56:39', '2023-02-21 01:56:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_facturas_compras`
--

CREATE TABLE `detalles_facturas_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_factura_compra` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `cantidad` decimal(12,2) DEFAULT NULL,
  `precio_c` decimal(15,8) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_linea` decimal(12,3) DEFAULT NULL,
  `unidad` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dosificaciones`
--

CREATE TABLE `dosificaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_insumo_producto` bigint(20) UNSIGNED DEFAULT NULL,
  `cant_unid_produc` decimal(12,5) DEFAULT NULL,
  `unidad_consumo_produccion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_liston` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dosificaciones`
--

INSERT INTO `dosificaciones` (`id`, `id_producto`, `color`, `id_insumo_producto`, `cant_unid_produc`, `unidad_consumo_produccion`, `created_at`, `updated_at`, `base_liston`) VALUES
(11, 1, 'azul claro', 9, '10.00000', 'kg', '2022-08-09 22:59:11', '2022-08-09 22:59:11', NULL),
(12, 1, 'azul claro', 7, '1.00000', 'kg', '2022-08-09 22:59:11', '2022-08-09 22:59:11', NULL),
(56, 24, 'beige', 6, '2.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(57, 24, 'beige', 7, '3.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(58, 24, 'beige', 2, '4.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(59, 25, 'gris', 6, '10.00000', 'kg', '2022-11-30 00:57:07', '2022-11-30 00:57:07', 'Base'),
(60, 25, 'gris', 7, '5.00000', 'kg', '2022-11-30 00:57:07', '2022-11-30 00:57:07', 'Base'),
(99, 3, 'cemento', 9, '48.00000', 'kg', '2023-01-10 15:49:10', '2023-01-10 15:49:10', 'Base'),
(100, 3, '', 7, '8.00000', 'balde', '2023-01-10 15:49:10', '2023-01-10 15:49:10', 'Base'),
(101, 3, '', 6, '6.00000', 'balde', '2023-01-10 15:49:10', '2023-01-10 15:49:10', 'Base'),
(192, 42, 'cemento', 9, '48.00000', 'kg', '2023-01-10 17:48:41', '2023-01-10 17:48:41', 'Base'),
(193, 42, 'amarillo', 8, '1.50000', 'kg', '2023-01-10 17:48:41', '2023-01-10 17:48:41', 'Base'),
(194, 42, '', 7, '8.00000', 'balde', '2023-01-10 17:48:41', '2023-01-10 17:48:41', 'Base'),
(195, 42, '', 6, '6.00000', 'balde', '2023-01-10 17:48:41', '2023-01-10 17:48:41', 'Base'),
(204, 43, 'cemento', 9, '48.00000', 'kg', '2023-01-10 17:50:45', '2023-01-10 17:50:45', 'Base'),
(205, 43, 'amarillo', 8, '1.50000', 'kg', '2023-01-10 17:50:45', '2023-01-10 17:50:45', 'Base'),
(206, 43, '', 7, '8.00000', 'balde', '2023-01-10 17:50:45', '2023-01-10 17:50:45', 'Base'),
(207, 43, '', 6, '6.00000', 'balde', '2023-01-10 17:50:45', '2023-01-10 17:50:45', 'Base'),
(208, 44, 'cemento', 9, '48.00000', 'kg', '2023-01-10 17:52:13', '2023-01-10 17:52:13', 'Base'),
(209, 44, 'amarillo', 8, '1.50000', 'kg', '2023-01-10 17:52:13', '2023-01-10 17:52:13', 'Base'),
(210, 44, '', 7, '8.00000', 'balde', '2023-01-10 17:52:13', '2023-01-10 17:52:13', 'Base'),
(211, 44, '', 6, '6.00000', 'balde', '2023-01-10 17:52:13', '2023-01-10 17:52:13', 'Base'),
(233, 17, 'cemento', 9, '48.00000', 'kg', '2023-02-13 15:49:19', '2023-02-13 15:49:19', 'Base'),
(234, 17, '', 7, '8.00000', 'balde', '2023-02-13 15:49:19', '2023-02-13 15:49:19', 'Base'),
(235, 17, '', 6, '6.00000', 'balde', '2023-02-13 15:49:19', '2023-02-13 15:49:19', 'Base'),
(236, 29, 'cemento', 9, '48.00000', 'kg', '2023-02-13 16:53:06', '2023-02-13 16:53:06', 'Base'),
(237, 29, '', 7, '8.00000', 'balde', '2023-02-13 16:53:06', '2023-02-13 16:53:06', 'Base'),
(238, 29, '', 6, '6.00000', 'balde', '2023-02-13 16:53:06', '2023-02-13 16:53:06', 'Base'),
(239, 30, 'cemento', 9, '48.00000', 'kg', '2023-02-13 16:53:25', '2023-02-13 16:53:25', 'Base'),
(240, 30, '', 7, '8.00000', 'balde', '2023-02-13 16:53:25', '2023-02-13 16:53:25', 'Base'),
(241, 30, '', 6, '6.00000', 'balde', '2023-02-13 16:53:25', '2023-02-13 16:53:25', 'Base'),
(242, 35, 'cemento', 9, '48.00000', 'kg', '2023-02-13 16:53:45', '2023-02-13 16:53:45', 'Base'),
(243, 35, '', 7, '8.00000', 'balde', '2023-02-13 16:53:45', '2023-02-13 16:53:45', 'Base'),
(244, 35, '', 6, '6.00000', 'balde', '2023-02-13 16:53:45', '2023-02-13 16:53:45', 'Base'),
(245, 39, 'cemento', 9, '48.00000', 'kg', '2023-02-13 16:57:37', '2023-02-13 16:57:37', 'Base'),
(246, 39, '', 7, '8.00000', 'balde', '2023-02-13 16:57:37', '2023-02-13 16:57:37', 'Base'),
(247, 39, '', 6, '6.00000', 'balde', '2023-02-13 16:57:38', '2023-02-13 16:57:38', 'Base'),
(248, 46, 'cemento', 9, '48.00000', 'kg', '2023-02-13 16:58:26', '2023-02-13 16:58:26', 'Base'),
(249, 46, '', 7, '8.00000', 'balde', '2023-02-13 16:58:26', '2023-02-13 16:58:26', 'Base'),
(250, 46, '', 6, '6.00000', 'balde', '2023-02-13 16:58:26', '2023-02-13 16:58:26', 'Base'),
(260, 31, 'cemento', 9, '48.00000', 'kg', '2023-02-14 01:28:07', '2023-02-14 01:28:07', 'Base'),
(261, 31, '', 7, '8.00000', 'balde', '2023-02-14 01:28:07', '2023-02-14 01:28:07', 'Base'),
(262, 31, '', 6, '6.00000', 'balde', '2023-02-14 01:28:07', '2023-02-14 01:28:07', 'Base'),
(263, 32, 'cemento', 9, '48.00000', 'kg', '2023-02-14 01:29:10', '2023-02-14 01:29:10', 'Base'),
(264, 32, '', 7, '8.00000', 'balde', '2023-02-14 01:29:10', '2023-02-14 01:29:10', 'Base'),
(265, 32, '', 6, '6.00000', 'balde', '2023-02-14 01:29:10', '2023-02-14 01:29:10', 'Base'),
(266, 33, 'cemento', 9, '48.00000', 'kg', '2023-02-14 01:33:51', '2023-02-14 01:33:51', 'Base'),
(267, 33, '', 7, '8.00000', 'balde', '2023-02-14 01:33:51', '2023-02-14 01:33:51', 'Base'),
(268, 33, '', 6, '6.00000', 'balde', '2023-02-14 01:33:51', '2023-02-14 01:33:51', 'Base'),
(269, 34, 'cemento', 9, '48.00000', 'kg', '2023-02-14 01:36:38', '2023-02-14 01:36:38', 'Base'),
(270, 34, '', 7, '8.00000', 'balde', '2023-02-14 01:36:38', '2023-02-14 01:36:38', 'Base'),
(271, 34, '', 6, '6.00000', 'balde', '2023-02-14 01:36:39', '2023-02-14 01:36:39', 'Base'),
(272, 36, 'cemento', 9, '48.00000', 'kg', '2023-02-14 01:40:03', '2023-02-14 01:40:03', 'Base'),
(273, 36, '', 7, '8.00000', 'balde', '2023-02-14 01:40:03', '2023-02-14 01:40:03', 'Base'),
(274, 36, '', 6, '6.00000', 'balde', '2023-02-14 01:40:04', '2023-02-14 01:40:04', 'Base'),
(275, 38, 'cemento', 9, '48.00000', 'kg', '2023-02-14 15:56:09', '2023-02-14 15:56:09', 'Base'),
(276, 38, '', 7, '8.00000', 'balde', '2023-02-14 15:56:09', '2023-02-14 15:56:09', 'Base'),
(277, 38, '', 6, '6.00000', 'balde', '2023-02-14 15:56:09', '2023-02-14 15:56:09', 'Base'),
(281, 37, 'cemento', 9, '48.00000', 'kg', '2023-02-14 23:56:48', '2023-02-14 23:56:48', 'Base'),
(282, 37, '', 7, '8.00000', 'balde', '2023-02-14 23:56:48', '2023-02-14 23:56:48', 'Base'),
(283, 37, '', 6, '6.00000', 'balde', '2023-02-14 23:56:48', '2023-02-14 23:56:48', 'Base'),
(284, 40, 'cemento', 9, '48.00000', 'kg', '2023-02-15 18:06:52', '2023-02-15 18:06:52', 'Base'),
(285, 40, '', 7, '8.00000', 'balde', '2023-02-15 18:06:52', '2023-02-15 18:06:52', 'Base'),
(286, 40, '', 6, '6.00000', 'balde', '2023-02-15 18:06:52', '2023-02-15 18:06:52', 'Base'),
(287, 41, 'cemento', 9, '48.00000', 'kg', '2023-02-15 18:07:12', '2023-02-15 18:07:12', 'Base'),
(288, 41, '', 7, '8.00000', 'balde', '2023-02-15 18:07:12', '2023-02-15 18:07:12', 'Base'),
(289, 41, '', 6, '6.00000', 'balde', '2023-02-15 18:07:12', '2023-02-15 18:07:12', 'Base'),
(290, 45, 'cemento', 9, '48.00000', 'kg', '2023-03-07 16:02:48', '2023-03-07 16:02:48', 'Base'),
(291, 45, '', 7, '8.00000', 'balde', '2023-03-07 16:02:48', '2023-03-07 16:02:48', 'Base'),
(292, 45, '', 6, '6.00000', 'balde', '2023-03-07 16:02:48', '2023-03-07 16:02:48', 'Base');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apellidoynombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuil` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `categoria` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `estadocivil` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domicilio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefonos` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(249) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `apellidoynombre`, `cuil`, `dni`, `fecha_ingreso`, `categoria`, `estado`, `fecha_nacimiento`, `estadocivil`, `domicilio`, `telefonos`, `observaciones`, `created_at`, `updated_at`) VALUES
(5, 'HERETICHI FLAVIA LUCINA', '27328850082', '32885008', '2019-03-01 00:00:00', 'VENDEDORA', 'ACTIVA', '1987-02-07 00:00:00', 'SOLTERA', 'JOSE MARIA TOLEDO 560', '3624691537', NULL, NULL, '2023-01-03 01:54:10'),
(6, 'RIOS MIRTA LAURA', '27306145776', '30614577', '2020-02-02 00:00:00', 'VENDEDORA DE MUEBLE', 'ACTIVA', '1983-12-19 00:00:00', 'SOLTERA', 'JUAM PABLO DUARTE 1435', '362702911', NULL, NULL, '2023-01-03 01:53:39'),
(7, 'LOPEZ FERNANDEZ HORACIO MARCELO', '23242093739', '24209373', '2020-08-01 00:00:00', 'ADMINISTRATIVO', 'ACTIVO', NULL, 'CASADO', 'MZ93PC23 BARRIO 263', '3625190143', NULL, NULL, NULL),
(9, 'MADERA SOFIA SANDRA', '27362112147', '36211214', NULL, 'VENDEDORA ONLINE', 'ACTIVA', '1991-12-12 00:00:00', 'SOLTERA', 'FORTIN AGUILAR 545', '3625244227', NULL, NULL, NULL),
(10, 'FERRI SONIA', '27279818100', '279810', '2015-04-15 00:00:00', 'VENDEDORA - CEO', 'ACTIVA', '1980-05-09 00:00:00', 'SOLTERA', 'FALUCHO 560', '3624615313', NULL, NULL, NULL),
(11, 'CESAR RITO GOMEZ', '23318503969', '21850369', '1985-12-06 00:00:00', 'VENDEDOR ONLINE', 'ACTIVA', '2015-04-15 00:00:00', 'SOLTERA', 'FALUCHO 560', '3624800910', NULL, NULL, '2023-01-13 15:00:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razon_social` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_comercial` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_mail` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localidad` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cond_iva` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vto_iva` datetime DEFAULT NULL,
  `inicio_act` datetime DEFAULT NULL,
  `logo` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe_max_fce` decimal(13,2) DEFAULT NULL,
  `cbu` decimal(22,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_compras`
--

CREATE TABLE `facturas_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_proveedor` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_gasto` bigint(20) UNSIGNED NOT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `subtotal` decimal(13,3) DEFAULT NULL,
  `iva` decimal(19,3) DEFAULT NULL,
  `otros_impuestos` decimal(13,3) DEFAULT NULL,
  `total_factura` decimal(19,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado_pago` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facturas_compras`
--

INSERT INTO `facturas_compras` (`id`, `tipo_factura`, `pto_venta`, `nro_factura`, `id_proveedor`, `fecha`, `observaciones`, `id_tipo_gasto`, `fecha_carga`, `subtotal`, `iva`, `otros_impuestos`, `total_factura`, `created_at`, `updated_at`, `estado_pago`) VALUES
(11, 'A', 10, 999, 2, '2023-01-02 00:00:00', NULL, 1, '2023-01-02 22:12:22', '200.000', '210.000', NULL, '1210.000', '2023-01-03 01:12:22', '2023-01-03 01:12:22', 'Cancelada'),
(12, 'A', 10, 14014, 1, '2023-01-04 00:00:00', 'xxxxxxdfsfsdf', 1, '2023-01-03 13:31:18', '12000.000', '1500.000', '500.000', '14000.000', '2023-01-03 16:31:18', '2023-01-04 17:08:07', 'Cancelada'),
(13, 'A', 10, 15015, 1, '2023-01-03 00:00:00', 'alba maidana', 1, '2023-01-03 13:41:57', '17000.000', '3000.000', NULL, '20000.000', '2023-01-03 16:41:57', '2023-01-04 17:29:52', 'Cancelada'),
(14, 'A', 1, 1234, 1, '2023-01-03 00:00:00', NULL, 1, '2023-01-03 21:41:42', NULL, '210.000', NULL, '1210.000', '2023-01-04 00:41:42', '2023-01-04 00:41:42', 'Cancelada'),
(15, 'A', 12, 1212, 1, '2023-01-03 00:00:00', NULL, 1, '2023-01-03 23:06:06', NULL, NULL, NULL, '51000.000', '2023-01-04 02:06:06', '2023-01-04 02:06:06', 'Cancelada'),
(16, 'A', 1, 4444, 3, '2023-01-02 00:00:00', 'pago factura luz 01-23', 5, '2023-01-05 11:51:04', '1000.000', '210.000', '0.000', '1210.000', '2023-01-05 14:51:04', '2023-01-05 14:51:04', 'Cancelada'),
(17, 'INT', 1, 1, 4, '2023-01-10 00:00:00', NULL, 7, '2023-01-10 19:41:34', NULL, NULL, NULL, '10000.000', '2023-01-10 22:41:34', '2023-01-10 22:41:34', 'Cancelada'),
(18, 'INT', 1, 2, 9, '2023-01-11 00:00:00', NULL, 15, '2023-01-11 13:31:49', NULL, NULL, NULL, '35000.000', '2023-01-11 16:31:49', '2023-01-28 15:47:18', 'Cancelada'),
(19, 'INT', 1, 3, 10, '2023-01-12 00:00:00', NULL, 3, '2023-01-12 13:52:12', NULL, NULL, NULL, '54000.000', '2023-01-12 16:52:12', '2023-01-12 16:52:24', 'Cancelada'),
(20, 'INT', 1, 4, 11, '2023-01-12 00:00:00', NULL, 2, '2023-01-12 13:54:22', NULL, NULL, NULL, '68340.000', '2023-01-12 16:54:22', '2023-01-12 16:54:22', 'Cancelada'),
(21, 'INT', 1, 5, 12, '2023-01-12 00:00:00', NULL, 1, '2023-01-12 13:59:07', NULL, NULL, NULL, '25936.930', '2023-01-12 16:59:07', '2023-01-12 16:59:07', 'Cancelada'),
(22, 'A', 2, 2, 14, '2022-12-07 00:00:00', NULL, 6, '2023-01-20 00:00:00', '300000.000', NULL, NULL, '300000.000', '2023-01-20 23:17:53', '2023-01-20 23:17:53', 'Cancelada'),
(23, 'A', 2, 2, 14, '2022-12-07 00:00:00', NULL, 6, '2023-01-20 00:00:00', '300000.000', NULL, NULL, '300000.000', '2023-01-20 23:18:29', '2023-01-20 23:18:29', 'Cancelada'),
(24, 'A', 1, 144, 15, '2022-12-07 00:00:00', NULL, 2, '2023-01-20 00:00:00', '5040.000', NULL, NULL, '29040.000', '2023-01-20 23:28:24', '2023-01-20 23:28:24', 'Cancelada'),
(25, 'A', 1, 7791, 16, '2022-12-16 00:00:00', NULL, 11, '2023-01-21 00:00:00', '1983.470', NULL, NULL, '2469.420', '2023-01-21 15:44:45', '2023-01-21 15:44:45', 'Cancelada'),
(26, 'A', 1, 1123, 16, '2022-12-21 00:00:00', NULL, 11, '2023-01-21 00:00:00', '3103.970', NULL, NULL, '3864.440', '2023-01-21 15:49:26', '2023-01-21 15:49:26', 'Cancelada'),
(27, 'A', 1, 6073, 16, '2011-12-28 00:00:00', NULL, 11, '2022-01-21 00:00:00', '3419.830', NULL, NULL, '4257.690', '2023-01-21 16:09:06', '2023-01-21 16:09:06', 'Cancelada'),
(28, 'A', 1, 14871, 17, '2022-12-29 00:00:00', NULL, 12, '2023-01-21 00:00:00', '182049.580', NULL, NULL, '220280.000', '2023-01-21 16:17:08', '2023-01-21 16:17:08', 'Cancelada'),
(29, 'A', 1, 6184, 18, '2022-12-28 00:00:00', NULL, 6, '2022-01-21 00:00:00', '23810.050', NULL, NULL, '28810.660', '2023-01-21 16:21:28', '2023-01-21 16:21:28', 'Cancelada'),
(30, 'A', 1, 6318, 19, '2022-12-29 00:00:00', NULL, 6, '2023-01-21 00:00:00', '17628.100', NULL, NULL, '21330.000', '2023-01-21 16:26:32', '2023-01-21 16:26:32', 'Cancelada'),
(31, 'A', 15, 74039, 20, '2022-02-21 00:00:00', NULL, 8, '2023-01-21 00:00:00', NULL, NULL, NULL, '5000.000', '2023-01-21 16:37:05', '2023-01-21 16:37:05', 'Cancelada'),
(32, 'A', 13, 15663, 21, '2022-12-16 00:00:00', NULL, 8, '2023-01-21 00:00:00', '2216.530', NULL, NULL, '3000.000', '2023-01-21 16:38:35', '2023-01-21 16:38:35', 'Cancelada'),
(33, 'A', 1, 14985982, 22, '2022-10-06 00:00:00', NULL, 7, '2023-01-21 00:00:00', '4784.850', NULL, NULL, '5789.670', '2023-01-21 16:46:14', '2023-01-21 16:46:14', 'Cancelada'),
(34, 'A', 1, 1488386, 22, '2022-12-06 00:00:00', NULL, 7, '2023-01-21 00:00:00', '11378.660', NULL, NULL, '13768.180', '2023-01-21 16:48:13', '2023-01-21 16:48:13', 'Cancelada'),
(35, 'A', 1, 1494828, 22, '0022-12-06 00:00:00', NULL, 7, '2023-01-21 00:00:00', '7542.550', NULL, NULL, '9126.490', '2023-01-21 16:49:49', '2023-01-21 16:49:49', 'Cancelada'),
(36, 'A', 1, 1507039, 22, '2022-12-06 00:00:00', NULL, 7, '2023-01-21 00:00:00', '5658.800', NULL, NULL, '6847.150', '2023-01-21 16:51:52', '2023-01-21 16:51:52', 'Cancelada'),
(37, 'A', 1, 12, 23, '2022-11-16 00:00:00', NULL, 6, '2023-01-21 00:00:00', NULL, NULL, NULL, '7179.690', '2023-01-21 16:59:42', '2023-01-21 16:59:42', 'Cancelada'),
(38, 'A', 1, 12, 23, '2022-11-16 00:00:00', NULL, 6, '2023-01-21 00:00:00', NULL, NULL, NULL, '7179.690', '2023-01-21 17:00:18', '2023-01-21 17:00:18', 'Cancelada'),
(39, 'A', 1, 11, 23, '2022-12-08 00:00:00', NULL, 6, '2023-01-21 00:00:00', '3735.400', NULL, NULL, '18381.240', '2023-01-21 17:03:37', '2023-01-21 17:03:37', 'Cancelada'),
(40, 'C', 2, 83, 24, '2022-12-27 00:00:00', NULL, 6, '2023-01-21 00:00:00', NULL, NULL, NULL, '10000.000', '2023-01-21 17:07:01', '2023-01-21 17:07:01', 'Cancelada'),
(41, 'B', 1, 1100019688, 18, '2023-01-04 00:00:00', NULL, 13, '2023-01-04 00:00:00', NULL, NULL, NULL, '999.200', '2023-02-03 20:00:06', '2023-02-03 20:00:06', 'Cancelada'),
(42, 'A', 1, 1200018903, 21, '2022-11-26 00:00:00', NULL, 8, '2023-02-03 00:00:00', '2204.260', NULL, NULL, '3000.000', '2023-02-03 20:02:41', '2023-02-03 20:02:41', 'Cancelada'),
(43, 'A', 1, 190005402, 19, '2023-01-25 00:00:00', NULL, 9, '2023-02-03 00:00:00', '22305.790', NULL, NULL, '26990.000', '2023-02-03 22:46:02', '2023-02-03 22:46:02', 'Cancelada'),
(44, 'A', 1, 1900006368, 19, '2023-01-12 00:00:00', NULL, 9, '2023-02-03 00:00:00', '31231.400', NULL, NULL, '37790.000', '2023-02-03 22:48:58', '2023-02-03 22:48:58', 'Cancelada'),
(45, 'A', 1, 1200021442, 21, '2023-01-26 00:00:00', NULL, 8, '2023-02-03 00:00:00', NULL, NULL, NULL, '2190.000', '2023-02-03 22:50:42', '2023-02-03 22:50:42', 'Cancelada'),
(46, 'A', 1, 1500003372, 20, '2023-01-06 00:00:00', NULL, 8, '2023-02-03 00:00:00', NULL, NULL, NULL, '5000.000', '2023-02-03 22:54:15', '2023-02-03 22:54:15', 'Cancelada'),
(47, 'A', 1, 1500003454, 20, '2023-01-13 00:00:00', NULL, 8, '2023-02-03 00:00:00', NULL, NULL, NULL, '16500.000', '2023-02-03 22:56:45', '2023-02-03 22:56:45', 'Cancelada'),
(48, 'A', 1, 1500008646, 20, '2023-01-27 00:00:00', NULL, 8, '2023-02-03 00:00:00', NULL, NULL, NULL, '100000.000', '2023-02-03 22:58:53', '2023-02-03 22:58:53', 'Cancelada'),
(49, 'A', 1, 1600002639, 28, '2023-01-26 00:00:00', NULL, 9, '2023-02-03 00:00:00', '2479.340', NULL, NULL, '3000.000', '2023-02-03 23:03:58', '2023-02-03 23:03:58', 'Cancelada'),
(50, 'A', 1, 190006283, 19, '2022-12-15 00:00:00', NULL, 6, '2023-02-03 00:00:00', '92850.620', NULL, NULL, '102600.000', '2023-02-03 23:06:14', '2023-02-03 23:06:14', 'Cancelada'),
(51, 'A', 1, 1900006241, 19, '2022-12-01 00:00:00', NULL, 9, '2023-02-03 00:00:00', '16611.570', NULL, NULL, '20100.000', '2023-02-03 23:22:16', '2023-02-03 23:22:16', 'Cancelada'),
(52, 'B', 1, 600471909, 30, '2022-12-20 00:00:00', NULL, 8, '2022-02-03 00:00:00', NULL, NULL, NULL, '3184.900', '2023-02-03 23:26:13', '2023-02-03 23:26:13', 'Cancelada'),
(53, 'INT', 1, 13670, 31, '2022-12-16 00:00:00', NULL, 12, '2023-02-03 00:00:00', NULL, NULL, NULL, '68050.000', '2023-02-03 23:29:48', '2023-02-03 23:29:48', 'Cancelada'),
(54, 'A', 1, 6381, 32, '2022-12-16 00:00:00', NULL, 11, '2023-02-03 00:00:00', NULL, NULL, NULL, '25000.000', '2023-02-03 23:51:03', '2023-02-03 23:51:03', 'Cancelada'),
(55, 'INT', 1, 13671, 34, '2023-03-06 00:00:00', NULL, 8, '2023-03-06 12:14:54', NULL, NULL, NULL, '5000.000', '2023-03-06 15:14:54', '2023-03-06 15:14:54', 'Cancelada'),
(56, 'INT', 1, 13672, 36, '2023-03-07 00:00:00', NULL, 2, '2023-03-07 17:59:10', NULL, NULL, NULL, '94092.000', '2023-03-07 20:59:10', '2023-03-07 20:59:10', 'Cancelada'),
(57, 'INT', 1, 13673, 37, '2023-03-16 00:00:00', NULL, 8, '2023-03-28 18:08:28', NULL, NULL, NULL, '5000.000', '2023-03-28 21:08:28', '2023-03-28 21:24:51', 'Cancelada'),
(58, 'INT', 1, 23633, 21, '2023-03-14 00:00:00', NULL, 8, '2023-03-28 18:12:06', NULL, NULL, NULL, '5000.000', '2023-03-28 21:12:06', '2023-03-28 21:23:15', 'Cancelada'),
(59, 'INT', 1, 13675, 38, '2023-03-28 00:00:00', NULL, 3, '2023-03-28 18:14:53', NULL, NULL, NULL, '8000.000', '2023-03-28 21:14:53', '2023-03-28 21:14:53', 'Cancelada'),
(60, 'INT', 1, 5880, 2, '2023-03-16 00:00:00', NULL, 12, '2023-03-28 18:16:16', NULL, NULL, NULL, '14300.000', '2023-03-28 21:16:16', '2023-03-28 21:21:34', 'Cancelada'),
(61, 'INT', 1, 23634, 36, '2023-03-28 00:00:00', NULL, 2, '2023-03-28 18:27:07', NULL, NULL, NULL, '89092.000', '2023-03-28 21:27:07', '2023-03-28 21:27:07', 'Cancelada'),
(62, 'INT', 1, 2661, 35, '2023-03-15 00:00:00', NULL, 13, '2023-03-28 18:29:02', NULL, NULL, NULL, '600.000', '2023-03-28 21:29:02', '2023-03-28 21:29:02', 'Cancelada'),
(63, 'INT', 1, 29040, 15, '2023-01-31 00:00:00', NULL, 2, '2023-03-28 18:33:57', NULL, NULL, NULL, '29040.000', '2023-03-28 21:33:57', '2023-03-28 21:33:57', 'Cancelada'),
(64, 'INT', 1, 9606, 16, '2023-03-15 00:00:00', NULL, 11, '2023-03-28 18:36:26', NULL, NULL, NULL, '5255.500', '2023-03-28 21:36:26', '2023-03-28 21:36:26', 'Cancelada'),
(65, 'INT', 1, 2654, 35, '2023-03-13 00:00:00', NULL, 13, '2023-03-28 18:42:49', NULL, NULL, NULL, '1100.000', '2023-03-28 21:42:49', '2023-03-28 21:42:49', 'Cancelada'),
(66, 'INT', 1, 8282, 20, '2023-03-11 00:00:00', NULL, 8, '2023-03-28 18:45:11', NULL, NULL, NULL, '2000.000', '2023-03-28 21:45:11', '2023-03-28 21:45:11', 'Cancelada'),
(67, 'INT', 1, 3134, 1, '2023-03-10 00:00:00', NULL, 12, '2023-03-28 18:47:28', NULL, NULL, NULL, '2898.510', '2023-03-28 21:47:28', '2023-03-28 21:47:28', 'Cancelada'),
(68, 'INT', 1, 8418, 20, '2023-03-20 00:00:00', NULL, 8, '2023-03-28 18:49:27', NULL, NULL, NULL, '5000.000', '2023-03-28 21:49:27', '2023-03-28 21:49:27', 'Cancelada'),
(69, 'INT', 1, 29928, 33, '2023-02-28 00:00:00', NULL, 12, '2023-03-28 18:51:12', NULL, NULL, NULL, '18000.000', '2023-03-28 21:51:12', '2023-03-28 21:53:11', 'Cancelada'),
(70, 'INT', 1, 2587, 35, '2023-02-28 00:00:00', NULL, 13, '2023-03-28 18:54:57', NULL, NULL, NULL, '550.000', '2023-03-28 21:54:57', '2023-03-28 21:54:57', 'Cancelada'),
(71, 'INT', 1, 19330, 35, '2023-02-27 00:00:00', NULL, 13, '2023-03-28 18:57:08', NULL, NULL, NULL, '3470.000', '2023-03-28 21:57:08', '2023-03-28 21:57:08', 'Cancelada'),
(72, 'INT', 1, 9284, 16, '2023-02-28 00:00:00', NULL, 11, '2023-03-28 18:59:42', NULL, NULL, NULL, '1358.180', '2023-03-28 21:59:42', '2023-03-28 21:59:42', 'Cancelada'),
(73, 'INT', 1, 5607, 39, '2022-12-30 00:00:00', NULL, 7, '2023-03-28 19:03:24', NULL, NULL, NULL, '15000.000', '2023-03-28 22:03:24', '2023-03-28 22:03:24', 'Cancelada'),
(74, 'INT', 1, 9242, 40, '2023-03-01 00:00:00', NULL, 14, '2023-03-28 19:10:17', NULL, NULL, NULL, '14690.000', '2023-03-28 22:10:17', '2023-03-28 22:10:17', 'Cancelada'),
(75, 'INT', 1, 583, 33, '2023-03-07 00:00:00', NULL, 13, '2023-03-28 19:12:09', NULL, NULL, NULL, '32400.000', '2023-03-28 22:12:09', '2023-03-28 22:12:09', 'Cancelada'),
(76, 'INT', 1, 7669, 35, '2023-03-28 00:00:00', NULL, 13, '2023-03-28 19:13:36', NULL, NULL, NULL, '71828.290', '2023-03-28 22:13:36', '2023-03-28 22:14:44', 'Cancelada'),
(77, 'INT', 1, 849, 33, '2023-03-10 00:00:00', NULL, 12, '2023-03-28 19:45:50', NULL, NULL, NULL, '21600.000', '2023-03-28 22:45:50', '2023-03-28 22:45:50', 'Cancelada'),
(78, 'INT', 1, 6536, 19, '2023-03-01 00:00:00', NULL, 9, '2023-03-28 19:47:55', NULL, NULL, NULL, '49530.000', '2023-03-28 22:47:55', '2023-03-28 22:47:55', 'Cancelada'),
(79, 'INT', 1, 26956, 35, '2023-03-01 00:00:00', NULL, 13, '2023-03-28 19:49:47', NULL, NULL, NULL, '1033.000', '2023-03-28 22:49:47', '2023-03-28 22:49:47', 'Cancelada'),
(80, 'INT', 1, 27068, 35, '2023-03-02 00:00:00', NULL, 13, '2023-03-28 19:51:17', NULL, NULL, NULL, '283.500', '2023-03-28 22:51:17', '2023-03-28 22:51:17', 'Cancelada'),
(81, 'INT', 1, 1698, 37, '2023-03-02 00:00:00', NULL, 8, '2023-03-28 19:52:49', NULL, NULL, NULL, '5000.000', '2023-03-28 22:52:49', '2023-03-28 22:52:49', 'Cancelada'),
(82, 'INT', 1, 130128, 33, '2023-03-02 00:00:00', NULL, 12, '2023-03-28 19:54:18', NULL, NULL, NULL, '7200.000', '2023-03-28 22:54:18', '2023-03-28 22:54:18', 'Cancelada'),
(83, 'INT', 1, 130130, 33, '2023-03-02 00:00:00', NULL, 13, '2023-03-28 19:55:45', NULL, NULL, NULL, '3600.000', '2023-03-28 22:55:45', '2023-03-28 22:55:45', 'Cancelada'),
(84, 'INT', 1, 130633, 33, '2023-03-08 00:00:00', NULL, 12, '2023-03-28 19:57:29', NULL, NULL, NULL, '3600.000', '2023-03-28 22:57:29', '2023-03-28 22:57:29', 'Cancelada'),
(85, 'INT', 1, 18628, 21, '2023-03-09 00:00:00', NULL, 8, '2023-03-28 19:58:44', NULL, NULL, NULL, '5000.000', '2023-03-28 22:58:44', '2023-03-28 22:58:44', 'Cancelada'),
(86, 'INT', 1, 5733, 2, '2023-03-09 00:00:00', NULL, 12, '2023-03-28 20:00:16', NULL, NULL, NULL, '20480.000', '2023-03-28 23:00:16', '2023-03-28 23:00:16', 'Cancelada'),
(87, 'INT', 1, 3120, 1, '2023-03-07 00:00:00', NULL, 12, '2023-03-28 20:02:21', NULL, NULL, NULL, '5434.690', '2023-03-28 23:02:21', '2023-03-28 23:02:21', 'Cancelada'),
(88, 'INT', 1, 2606, 35, '2023-03-03 00:00:00', NULL, 13, '2023-03-28 20:05:12', NULL, NULL, NULL, '5260.000', '2023-03-28 23:05:12', '2023-03-28 23:05:12', 'Cancelada'),
(89, 'INT', 1, 13037777, 33, '2023-03-06 00:00:00', NULL, 12, '2023-03-28 20:07:21', NULL, NULL, NULL, '3600.000', '2023-03-28 23:07:21', '2023-03-28 23:07:21', 'Cancelada'),
(90, 'INT', 1, 130503, 33, '2023-03-07 00:00:00', NULL, 12, '2023-03-28 20:09:45', NULL, NULL, NULL, '3600.000', '2023-03-28 23:09:45', '2023-03-28 23:09:45', 'Cancelada'),
(91, 'INT', 1, 5734, 41, '2023-03-07 00:00:00', NULL, 8, '2023-03-28 20:13:39', NULL, NULL, NULL, '5000.000', '2023-03-28 23:13:39', '2023-03-28 23:13:39', 'Cancelada'),
(92, 'INT', 1, 40666, 42, '2023-03-15 00:00:00', NULL, 12, '2023-03-28 20:19:11', NULL, NULL, NULL, '4743.150', '2023-03-28 23:19:11', '2023-03-28 23:19:11', 'Cancelada'),
(93, 'INT', 1, 28066, 35, '2023-03-15 00:00:00', NULL, 13, '2023-03-28 20:20:59', NULL, NULL, NULL, '1444.690', '2023-03-28 23:20:59', '2023-03-28 23:20:59', 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_ventas`
--

CREATE TABLE `facturas_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_cliente` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `cae` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto_iva21` decimal(19,2) DEFAULT NULL,
  `monto_iva10` decimal(19,2) DEFAULT NULL,
  `id_factura_ref` bigint(20) DEFAULT NULL,
  `concepto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalGravado` decimal(12,2) DEFAULT NULL,
  `cod_comprobante_afip` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaspago`
--

CREATE TABLE `formaspago` (
  `id` int(10) UNSIGNED NOT NULL,
  `Forma_pago_Muebles` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Forma_pago_Obras` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Forma_pago_Productos` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `formaspago`
--

INSERT INTO `formaspago` (`id`, `Forma_pago_Muebles`, `Forma_pago_Obras`, `Forma_pago_Productos`, `created_at`, `updated_at`) VALUES
(1, 'muebles', 'forma pago Obras - aceptamos todas las tarjetas', '• NO INCLUYE FLETE  •El pago puede ser por transferencia bancaria o efectivo.    •El pago con cheque diferido puede ser 0-15 -30-60 –tiene recargo (30 días 3% y 60 días 5%).    •El pago con tarjetas-maestro-Mastercard-visa y cabal-Tienen un 20% de recargo.    •El pago con tarjeta Pymes Nación tiene un recargo del 2%    •Formas de pago con tarjeta Tuya, en 6 cuotas, 7 %. En 12 cuotas 17 % de recargo.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provincia` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `provincia`, `localidad`, `created_at`, `updated_at`) VALUES
(1, 'CORRIENTES', 'BELLA VISTA', '2022-02-08 00:21:00', '2023-02-03 18:19:19'),
(2, 'CORRIENTES', 'CORRIENTES', '2022-02-08 00:21:00', '2023-02-03 18:19:39'),
(3, 'CHACO', 'RESISTENCIA', '2022-02-08 00:21:00', '2023-02-03 18:20:00'),
(4, 'CHACO', 'SAENZ PEÑA', '2022-02-08 00:21:00', '2023-02-03 18:20:20'),
(5, 'FORMOSA', 'FORMOSA', '2023-01-07 16:45:04', '2023-01-07 16:45:04'),
(6, 'CHACO', 'SAN MARTIN', '2023-02-03 18:17:40', '2023-02-03 18:17:40'),
(7, 'CHACO', 'QUITILIPI', '2023-02-03 18:17:57', '2023-02-03 18:17:57'),
(8, 'CHACO', 'ESCONDIDA', '2023-02-03 18:20:40', '2023-02-03 18:20:40'),
(9, 'CHACO', 'COLONIA BENITEZ', '2023-02-03 18:21:09', '2023-02-03 18:21:09'),
(10, 'CHACO', 'MARGARITA BELEN', '2023-02-03 18:23:13', '2023-02-03 18:23:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 'vendedores', '2023-02-01 23:38:36', '2023-02-01 23:38:36'),
(3, 'administracion', '2023-02-01 23:50:43', '2023-02-01 23:51:01'),
(4, 'ventas_con_prod', '2023-02-08 16:05:08', '2023-02-08 16:05:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 2, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 34, 1, '2022-01-09 01:12:38', '2022-03-15 16:11:59', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', 34, 2, '2022-01-09 01:12:38', '2023-01-06 18:56:06', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2022-01-09 01:12:38', '2022-03-15 16:11:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-01-09 01:12:38', '2022-03-15 16:11:45', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 3, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 4, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.pages.index', NULL),
(17, 1, 'Clientes', '', '_self', NULL, '#000000', 31, 1, '2022-01-11 23:35:14', '2023-02-21 02:13:04', 'voyager.clientes.index', 'null'),
(19, 1, 'Nota Pedidos', '', '_self', NULL, '#000000', 31, 2, '2022-01-13 01:34:43', '2023-02-21 02:13:04', 'voyager.nota-pedidos.index', 'null'),
(20, 1, 'Empleados', '', '_self', NULL, NULL, 33, 1, '2022-01-13 01:40:47', '2022-03-15 16:10:02', 'voyager.empleados.index', NULL),
(21, 1, 'Rubros', '', '_self', NULL, NULL, 33, 2, '2022-01-16 00:04:32', '2022-03-15 16:10:05', 'voyager.rubros.index', NULL),
(22, 1, 'Subrubros', '', '_self', NULL, NULL, 33, 3, '2022-01-16 00:05:02', '2022-03-15 16:10:08', 'voyager.subrubros.index', NULL),
(23, 1, 'Productos', '', '_self', NULL, '#000000', 33, 5, '2022-01-18 14:30:46', '2022-08-11 01:25:30', 'voyager.productos.index', 'null'),
(24, 1, 'Localidades', '', '_self', NULL, NULL, 33, 6, '2022-02-08 00:20:36', '2022-08-11 01:25:30', 'voyager.localidades.index', NULL),
(25, 1, 'Tipos Gastos', '', '_self', NULL, NULL, 33, 7, '2022-02-08 00:36:04', '2022-12-15 03:46:53', 'voyager.tipos-gastos.index', NULL),
(26, 1, 'Proveedores', '', '_self', NULL, '#000000', 32, 1, '2022-02-12 00:13:49', '2022-12-15 03:48:30', 'voyager.proveedores.index', 'null'),
(27, 1, 'Facturas Compras', '', '_self', NULL, '#000000', 32, 2, '2022-02-12 00:17:00', '2022-12-15 03:46:53', 'voyager.facturas-compras.index', 'null'),
(30, 1, 'Iva Compras', '/IVAcompras', '_self', NULL, '#000000', 35, 10, '2022-03-15 16:04:14', '2023-02-28 22:13:02', NULL, ''),
(31, 1, 'VENTAS', '', '_self', NULL, '#000000', NULL, 10, '2022-03-15 16:08:00', '2023-01-06 18:58:50', NULL, ''),
(32, 1, 'COMPRAS', '', '_self', NULL, '#000000', NULL, 11, '2022-03-15 16:08:27', '2023-01-06 18:58:50', NULL, ''),
(33, 1, 'TABLAS BASICAS', '', '_self', NULL, '#000000', NULL, 9, '2022-03-15 16:08:56', '2023-01-06 18:58:57', NULL, ''),
(34, 1, 'PERMISOS', '', '_self', NULL, '#000000', NULL, 8, '2022-03-15 16:09:06', '2023-01-06 18:58:56', NULL, ''),
(35, 1, 'INFORMES', '', '_self', NULL, '#000000', NULL, 14, '2022-03-15 16:10:53', '2023-02-21 02:13:00', NULL, ''),
(36, 1, 'TESORERIA', '', '_self', NULL, '#000000', NULL, 12, '2022-03-15 16:11:31', '2023-01-06 18:58:41', NULL, ''),
(37, 1, 'IVA Ventas', '/IVAventas', '_self', NULL, '#000000', 35, 11, '2022-03-16 01:10:07', '2023-02-28 22:13:02', NULL, ''),
(39, 1, 'Informe de Ventas', '/Informeventas', '_self', NULL, '#000000', 35, 2, '2022-03-25 18:57:20', '2023-02-28 22:10:16', NULL, ''),
(41, 1, 'Informe Compras', '/Informecompras', '_self', NULL, '#000000', 35, 1, '2022-03-29 01:27:30', '2023-02-28 22:10:16', NULL, ''),
(42, 1, 'Productos', '/informe_productos', '_self', NULL, '#000000', 35, 7, '2022-04-04 22:59:12', '2023-02-28 22:13:02', NULL, ''),
(43, 1, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 13, '2022-05-30 16:16:17', '2023-02-21 02:13:00', NULL, ''),
(44, 1, 'Ordenes de Fabricacion', '', '_self', NULL, '#000000', 43, 1, '2022-05-30 23:17:32', '2022-06-01 18:05:22', 'voyager.ordenes_fabricacion.index', 'null'),
(46, 1, 'Moldes', '', '_self', NULL, NULL, 33, 4, '2022-08-10 22:52:51', '2022-08-11 01:25:30', 'voyager.moldes.index', NULL),
(48, 1, 'Formaspagos', '', '_self', NULL, NULL, 33, 8, '2022-09-10 02:27:30', '2023-01-06 18:56:03', 'voyager.formaspago.index', NULL),
(49, 1, 'Cuentas Bancos', '', '_self', NULL, NULL, 33, 9, '2022-10-19 15:05:46', '2023-01-06 18:56:15', 'voyager.cuentas-bancos.index', NULL),
(50, 1, 'Remitos', '/Remitos', '_self', NULL, '#000000', 43, 2, '2022-11-11 14:59:51', '2022-11-17 16:25:27', NULL, ''),
(51, 1, 'Informe de producción', '/Informeproduccion', '_self', NULL, '#000000', 35, 6, '2022-12-13 16:17:29', '2023-02-28 22:13:01', NULL, ''),
(52, 1, 'Movimientos financieros', '', '_self', NULL, '#000000', 36, 1, '2022-12-15 03:53:05', '2023-01-06 18:56:17', 'voyager.movimientos_financieros.index', 'null'),
(53, 1, 'Flujo Financiero', '/informe_flujofinanciero', '_self', NULL, '#000000', 35, 8, '2022-12-17 01:54:05', '2023-02-28 22:13:02', NULL, ''),
(54, 2, 'VENTAS', '', '_self', NULL, '#000000', NULL, 1, '2023-02-01 23:39:02', '2023-02-01 23:41:50', NULL, ''),
(55, 2, 'Clientes', '/admin/clientes', '_self', NULL, '#000000', 54, 1, '2023-02-01 23:41:37', '2023-02-01 23:41:51', NULL, ''),
(56, 2, 'Notas Pedido', '/admin/nota-pedidos', '_self', NULL, '#000000', 54, 2, '2023-02-01 23:41:37', '2023-02-01 23:47:16', NULL, ''),
(57, 2, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 2, '2023-02-01 23:43:08', '2023-02-28 22:14:48', NULL, ''),
(58, 2, 'Ordenes de Fabricacion', '/admin/ordenes_fabricacion', '_self', NULL, '#000000', 57, 1, '2023-02-01 23:45:15', '2023-02-01 23:45:20', NULL, ''),
(59, 2, 'Remitos', '/Remitos', '_self', NULL, '#000000', 57, 2, '2023-02-01 23:45:48', '2023-02-01 23:47:34', NULL, ''),
(60, 3, 'COMPRAS', '', '_self', NULL, '#000000', NULL, 1, '2023-02-01 23:53:09', '2023-02-01 23:54:04', NULL, ''),
(61, 3, 'TESORERIA', '', '_self', NULL, '#000000', NULL, 2, '2023-02-01 23:53:23', '2023-02-01 23:54:10', NULL, ''),
(62, 3, 'Proveedores', '/admin/proveedores', '_self', NULL, '#000000', 60, 1, '2023-02-01 23:53:38', '2023-02-01 23:55:58', NULL, ''),
(63, 3, 'Factura de Compras', '/admin/facturas-compras', '_self', NULL, '#000000', 60, 2, '2023-02-01 23:53:59', '2023-02-01 23:56:33', NULL, ''),
(64, 3, 'Movimientos Financieros', '/admin/movimientos_financieros', '_self', NULL, '#000000', 61, 1, '2023-02-01 23:54:34', '2023-02-01 23:57:54', NULL, ''),
(65, 4, 'VENTAS', '', '_self', NULL, '#000000', NULL, 1, '2023-02-08 16:05:23', '2023-02-08 16:06:16', NULL, ''),
(66, 4, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 2, '2023-02-08 16:05:36', '2023-02-28 22:13:56', NULL, ''),
(69, 4, 'Clientes', '/admin/clientes', '_self', NULL, '#000000', 65, 1, '2023-02-08 16:06:05', '2023-02-08 16:08:27', NULL, ''),
(70, 4, 'Notas Pedido', '/admin/nota-pedidos', '_self', NULL, '#000000', 65, 2, '2023-02-08 16:06:31', '2023-02-08 16:09:05', NULL, ''),
(71, 4, 'Productos', '', '_self', NULL, '#000000', 65, 3, '2023-02-08 16:06:51', '2023-02-08 16:13:40', 'voyager.productos.index', 'null'),
(73, 4, 'Remitos', '/Remitos', '_self', NULL, '#000000', 66, 1, '2023-02-08 16:07:26', '2023-02-08 16:09:50', NULL, ''),
(74, 4, 'Ordenes de Fabricación', '/admin/ordenes_fabricacion', '_self', NULL, '#000000', 66, 2, '2023-02-08 16:07:44', '2023-02-08 16:09:18', NULL, ''),
(76, 1, 'Informe Ingresos', '/Informeingresos', '_self', NULL, '#000000', 35, 4, '2023-02-21 01:46:14', '2023-02-28 22:13:01', NULL, ''),
(77, 1, 'Informe Egresos', '/Informeegresos', '_self', NULL, '#000000', 35, 5, '2023-02-21 01:46:27', '2023-02-28 22:13:01', NULL, ''),
(78, 1, 'Comisiones sobre Ventas', '/Informecomisiones', '_self', NULL, '#000000', 35, 9, '2023-02-21 01:48:08', '2023-02-28 22:13:02', NULL, ''),
(80, 1, 'Tipos Presupuestos', '', '_self', NULL, NULL, 33, 10, '2023-02-21 01:56:40', '2023-02-21 02:13:04', 'voyager.tipos-presupuestos.index', NULL),
(81, 1, 'Cuentas Corrientes', '/Informectacte', '_self', NULL, '#000000', 35, 3, '2023-02-28 22:12:36', '2023-02-28 22:17:20', NULL, ''),
(82, 4, 'Cuentas Corrientes', '/Informectacte', '_self', NULL, '#000000', 65, 4, '2023-02-28 22:13:42', '2023-02-28 22:15:54', NULL, ''),
(83, 2, 'Cuentas Corrienets', '/Informectacte', '_self', NULL, '#000000', 54, 3, '2023-02-28 22:14:26', '2023-02-28 22:16:20', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(29, '2022_01_10_230234_create_caja_diaria_table', 1),
(30, '2022_01_10_230236_create_clientes_table', 1),
(31, '2022_01_10_230238_create_cuentas_banco_table', 1),
(32, '2022_01_10_230239_create_detalles_facturas_compras_table', 1),
(33, '2022_01_10_230241_create_empresa_table', 1),
(34, '2022_01_10_230242_create_facturas_compras_table', 1),
(35, '2022_01_10_230243_create_factura_venta_table', 1),
(36, '2022_01_10_230245_create_jurisdicciones_table', 1),
(37, '2022_01_10_230246_create_localidades_table', 1),
(38, '2022_01_10_230249_create_nota_pedido_table', 1),
(39, '2022_01_10_230250_create_ordenes_fabricacion_table', 1),
(40, '2022_01_10_230253_create_empleados_table', 1),
(41, '2022_01_10_230254_create_productos_table', 1),
(42, '2022_01_10_230255_create_proveedores_table', 1),
(43, '2022_01_10_230257_create_renglones_notapedido_table', 1),
(44, '2022_01_10_230258_create_rubro_table', 1),
(45, '2022_01_10_230300_create_subrubro_table', 1),
(46, '2022_01_10_230302_create_tipos_gastos_table', 1),
(47, '2022_02_03_222628_dosificaciones', 1),
(48, '2022_02_03_223021_bases_listones', 1),
(49, '2022_02_03_224535_moldes', 1),
(50, '2022_02_03_224951_mov__financieros', 1),
(51, '2022_02_07_160048_relaciones', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moldes`
--

CREATE TABLE `moldes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cant_moldes` int(11) DEFAULT NULL,
  `mt2_por_molde` decimal(12,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `moldes`
--

INSERT INTO `moldes` (`id`, `descripcion`, `cant_moldes`, `mt2_por_molde`, `created_at`, `updated_at`) VALUES
(1, 'Moldes para pisos', 1, '1.000', '2022-02-12 21:13:06', '2023-02-03 00:44:41'),
(2, 'Moldes de revestimiento', 1, '1.000', '2022-08-12 00:59:51', '2023-02-03 00:44:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mov_financieros`
--

CREATE TABLE `mov_financieros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `pto_vta` int(11) DEFAULT NULL,
  `nro_recibo` int(11) DEFAULT NULL,
  `id_nota_pedido` bigint(20) UNSIGNED DEFAULT NULL,
  `id_factura_compra` bigint(20) UNSIGNED DEFAULT NULL,
  `modalidad_pago` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cheque` int(11) DEFAULT NULL,
  `id_cuenta_bancaria` bigint(20) UNSIGNED DEFAULT NULL,
  `detalle` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_movimiento` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe_egreso` decimal(11,2) DEFAULT NULL,
  `importe_ingreso` decimal(11,2) DEFAULT NULL,
  `id_usuario` tinyint(4) DEFAULT NULL,
  `id_caja` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mov_financieros`
--

INSERT INTO `mov_financieros` (`id`, `fecha`, `pto_vta`, `nro_recibo`, `id_nota_pedido`, `id_factura_compra`, `modalidad_pago`, `nro_cheque`, `id_cuenta_bancaria`, `detalle`, `tipo_movimiento`, `importe_egreso`, `importe_ingreso`, `id_usuario`, `id_caja`, `created_at`, `updated_at`) VALUES
(104, '2023-01-11 00:00:00', 1, NULL, 0, NULL, 'Tarjeta Débito', NULL, 2, 'Marketinkg - Alejandro', 'Gastos/Egresos', '35000.00', NULL, 2, NULL, '2023-01-11 16:21:14', '2023-01-11 16:21:14'),
(105, '2023-01-11 00:00:00', 1, NULL, 0, 18, 'Tarjeta Débito', NULL, 2, NULL, 'Gastos/Egresos', '35000.00', NULL, 2, NULL, '2023-01-11 16:31:49', '2023-01-28 15:47:18'),
(106, '2023-01-12 00:00:00', 1, NULL, 0, 19, 'Efectivo', NULL, 1, 'SUELDO + BONO DEL GOBIERNO', 'Gastos/Egresos', '54000.00', NULL, 2, NULL, '2023-01-12 16:52:12', '2023-01-12 16:52:24'),
(107, '2023-01-12 00:00:00', 1, NULL, 0, 20, 'Efectivo', NULL, NULL, 'RECIBI 2769511', 'Gastos/Egresos', '68340.00', NULL, 2, NULL, '2023-01-12 16:54:22', '2023-01-12 16:54:22'),
(108, '2023-01-12 00:00:00', 1, NULL, 0, 21, 'Tarjeta Débito', NULL, 1, NULL, 'Gastos/Egresos', '25936.93', NULL, 2, NULL, '2023-01-12 16:59:07', '2023-01-12 16:59:07'),
(109, '2023-01-10 00:00:00', 1, 4, 28, NULL, 'Tarjeta Crédito', NULL, 1, 'CANCELADO', 'Cobranza/Ingresos', NULL, '46827.00', 2, NULL, '2023-01-12 17:06:23', '2023-01-12 17:06:24'),
(110, '2023-01-13 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', NULL, NULL, 2, NULL, '2023-01-13 14:42:10', '2023-01-13 14:42:10'),
(111, '2023-01-13 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'PERSONAL + VACACIONES DE MARTIN', 'Gastos/Egresos', '53500.00', NULL, 2, NULL, '2023-01-13 14:43:32', '2023-01-13 14:43:32'),
(112, '2022-12-09 00:00:00', 1, 5, 63, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '33000.00', 7, NULL, '2023-02-02 22:58:26', '2023-02-02 22:58:27'),
(113, '2023-02-02 00:00:00', 1, 6, 63, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '34360.00', 7, NULL, '2023-02-02 23:44:38', '2023-02-02 23:44:38'),
(114, '2023-01-19 00:00:00', 1, 7, 67, NULL, 'Transferencia', NULL, NULL, 'MERCADO PAGO', 'Cobranza/Ingresos', NULL, '13500.00', 2, NULL, '2023-02-03 17:09:51', '2023-02-03 17:09:51'),
(116, '2023-02-03 00:00:00', 1, 9, 68, NULL, 'Efectivo', NULL, NULL, 'EKOS - 2 TON\r\nCURADOR	Pegamento\r\n\r\nTOTAL 12.670', 'Cobranza/Ingresos', NULL, '1200.00', 7, NULL, '2023-02-03 18:25:26', '2023-02-15 17:40:00'),
(117, '2023-01-29 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, 1, 'PAGO DE IVA', 'Gastos/Egresos', '128807.29', NULL, 3, NULL, '2023-02-03 19:53:20', '2023-02-03 19:53:20'),
(118, '2023-01-29 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, 1, 'SUELDO', 'Gastos/Egresos', '8000.00', NULL, 3, NULL, '2023-02-03 19:55:32', '2023-02-03 19:55:32'),
(119, '2023-01-16 00:00:00', 1, 10, 55, NULL, 'Efectivo', NULL, NULL, 'Mueble de cocina Bajo mesada, alacena y bajo desayunador.-', 'Cobranza/Ingresos', NULL, '260000.00', 4, NULL, '2023-02-03 22:44:17', '2023-02-03 22:44:17'),
(120, '2022-09-09 00:00:00', 1, 11, 71, NULL, 'Efectivo', NULL, NULL, 'PIEDRA LISTON SIN JUNTAS 1 TONO	9,5	M2		76 PAQ. 		GRAFITO	$  30.752', 'Cobranza/Ingresos', NULL, '21000.00', 7, NULL, '2023-02-03 23:09:06', '2023-02-03 23:09:06'),
(121, '2022-11-25 00:00:00', 1, 12, 72, NULL, 'Efectivo', NULL, NULL, 'PISO RECTO GRANDE	90m2\r\nPISO CIRCULAR GRANDE	90m2', 'Cobranza/Ingresos', NULL, '183744.00', 7, NULL, '2023-02-03 23:41:37', '2023-02-03 23:42:06'),
(122, '2022-12-22 00:00:00', 1, 13, 73, NULL, 'Transferencia', NULL, 3, NULL, 'Cobranza/Ingresos', NULL, '30000.00', 7, NULL, '2023-02-04 00:48:33', '2023-02-04 00:48:33'),
(123, '2022-02-03 00:00:00', 1, 14, 67, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '12500.00', 7, NULL, '2023-02-04 01:09:29', '2023-02-04 01:09:29'),
(124, '2022-12-26 00:00:00', 1, 15, 74, NULL, 'Transferencia', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '450410.40', 7, NULL, '2023-02-04 01:18:55', '2023-02-04 01:18:55'),
(125, '2023-01-17 00:00:00', 1, 16, 75, NULL, 'Efectivo', NULL, NULL, 'REV EKOS 2 TONOS	4,5	M2	144	36		BEIGE CLARO /GRAFITO	+ 0,5 LTS', 'Cobranza/Ingresos', NULL, '20700.00', 7, NULL, '2023-02-04 17:44:44', '2023-02-04 17:44:44'),
(126, '2023-01-21 00:00:00', 1, 17, 76, NULL, 'Efectivo', NULL, NULL, 'CIRCULAR CHICO	60	M2	375	...	retiro 100	CEMENTO', 'Cobranza/Ingresos', NULL, '50000.00', 7, NULL, '2023-02-06 22:46:57', '2023-02-09 17:25:30'),
(127, '2023-01-27 00:00:00', 1, 18, 77, NULL, 'Efectivo', NULL, NULL, 'SOLARIUM 50X50 CM	36	U			ATERMICOS 100% EDUARDO	BLANCO\r\nLAJA SAN JUAN ATERMICO	32	U', 'Cobranza/Ingresos', NULL, '97824.00', 7, NULL, '2023-02-06 23:25:22', '2023-02-06 23:25:22'),
(129, '2023-01-31 00:00:00', 1, 19, 78, NULL, 'Efectivo', NULL, NULL, 'PISO ADOQUIN MADERA 20x60	12	M2	100 U	......		GRAFITO	2 LTS.	3 BOLSAS', 'Cobranza/Ingresos', NULL, '29000.00', 7, NULL, '2023-02-06 23:48:11', '2023-02-06 23:48:11'),
(130, '2023-01-31 00:00:00', 1, 20, 79, NULL, 'Efectivo', NULL, NULL, 'FACTURA A	REV. PIEDRA EKOS 	5	M2	180 U	45 PAQ.		NEGRO+GRAFITO+BORDÓ	NO	NO	 $  32.125', 'Cobranza/Ingresos', NULL, '32124.40', 7, NULL, '2023-02-07 00:22:03', '2023-02-07 00:22:04'),
(131, '2023-02-06 00:00:00', 1, 21, 80, NULL, 'Tarjeta Crédito', NULL, 1, 'GREEN BLOCK SIN H° --> 45 U\r\n\r\nFLETE: DIEGO $5000 (ABONA EN DOMICILIO)', 'Cobranza/Ingresos', NULL, '29403.00', 7, NULL, '2023-02-07 00:34:25', '2023-02-07 02:04:30'),
(132, '2023-02-07 00:00:00', 1, 22, 81, NULL, 'Efectivo', NULL, NULL, 'REV UHMA 3 TONOS --> 1.5 M2\r\n\r\n0.5 LTS CURADOR TRANSP.', 'Cobranza/Ingresos', NULL, '2000.00', 7, NULL, '2023-02-07 16:23:06', '2023-02-07 16:23:06'),
(133, '2023-01-31 00:00:00', 1, 23, 82, NULL, 'Efectivo', NULL, NULL, 'DURMIENTES DE H°A° 80X28	\r\n\r\n6	U', 'Cobranza/Ingresos', NULL, '7000.00', 7, NULL, '2023-02-07 17:02:26', '2023-02-07 17:02:26'),
(134, '2023-02-04 00:00:00', 1, 24, 83, NULL, 'Efectivo', NULL, NULL, 'TOTAL CON MANO DE OBRA\r\n $  158.470', 'Cobranza/Ingresos', NULL, '29285.00', 7, NULL, '2023-02-07 17:20:25', '2023-02-07 17:20:25'),
(135, '2023-01-13 00:00:00', 1, 25, 84, NULL, 'Efectivo', NULL, NULL, 'ADOQUIN RECTO GRANDE	45\r\nPLACA ANTIHUMEDAD - TRAVERSO 26x52 cm	8\r\nPIEDRA LISTON SIN JUNTA	16', 'Cobranza/Ingresos', NULL, '86062.00', 7, NULL, '2023-02-07 23:50:25', '2023-02-07 23:50:25'),
(136, NULL, 1, 26, 90, NULL, 'Efectivo', NULL, NULL, 'REV UHMA 3 TONOS - 8 M2\r\n2 BOLSAS DE PEGAM\r\n0.5 LTS CURADOR', 'Cobranza/Ingresos', NULL, '25000.00', 7, NULL, '2023-02-09 02:06:23', '2023-02-09 02:06:23'),
(137, '2023-02-09 00:00:00', 1, 27, 76, NULL, 'Transferencia', NULL, 1, 'cancela', 'Cobranza/Ingresos', NULL, '36400.00', 7, NULL, '2023-02-09 17:25:58', '2023-02-09 17:26:24'),
(138, '2023-02-09 00:00:00', 1, 28, 89, NULL, 'Efectivo', NULL, NULL, 'EKOS 3 TONOS NEGRO - 3 BOLS PEG - 1LTS CURAD', 'Cobranza/Ingresos', NULL, '25000.00', 7, NULL, '2023-02-10 01:58:07', '2023-02-10 01:58:07'),
(139, '2023-02-04 00:00:00', 1, NULL, 0, 11, 'Efectivo', NULL, NULL, NULL, 'Gastos-Egresos', '1210.00', NULL, 3, NULL, '2023-02-04 03:00:00', '2023-02-04 03:00:00'),
(140, '2023-01-04 00:00:00', 1, NULL, 0, 12, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '14000.00', NULL, 3, NULL, '2023-01-03 16:31:00', '2023-01-04 17:08:00'),
(141, '2023-01-03 00:00:00', 1, NULL, 0, 13, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '20000.00', NULL, 3, NULL, '2023-01-03 16:41:00', '2023-01-04 17:29:00'),
(142, '2023-01-03 00:00:00', 1, NULL, 0, 14, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1210.00', NULL, 3, NULL, '2023-01-04 00:41:00', '2023-01-04 00:41:00'),
(143, '2023-01-03 00:00:00', 1, NULL, 0, 15, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '51000.00', NULL, 3, NULL, '2023-01-04 02:06:00', '2023-01-04 02:06:00'),
(144, '2023-01-02 00:00:00', 1, NULL, 0, 16, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1210.00', NULL, 3, NULL, '2023-01-05 14:51:00', '2023-01-05 14:51:00'),
(145, '2023-01-10 00:00:00', 1, NULL, 0, 17, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, 3, NULL, '2023-01-10 22:41:00', '2023-01-10 22:41:00'),
(146, '2022-12-07 00:00:00', 1, NULL, 0, 22, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '300000.00', NULL, 3, NULL, '2023-01-20 23:17:00', '2023-01-20 23:17:00'),
(147, '2022-12-07 00:00:00', 1, NULL, 0, 23, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '300000.00', NULL, 3, NULL, '2023-01-20 23:18:00', '2023-01-20 23:18:00'),
(148, '2022-12-07 00:00:00', 1, NULL, 0, 24, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '29040.00', NULL, 3, NULL, '2023-01-20 23:28:00', '2023-01-20 23:28:00'),
(149, '2022-12-16 00:00:00', 1, NULL, 0, 25, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '2469.42', NULL, 3, NULL, '2023-01-21 15:44:00', '2023-01-21 15:44:00'),
(150, '2022-12-21 00:00:00', 1, NULL, 0, 26, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3864.44', NULL, 3, NULL, '2023-01-21 15:49:00', '2023-01-21 15:49:00'),
(151, '2011-12-28 00:00:00', 1, NULL, 0, 27, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4257.69', NULL, 3, NULL, '2023-01-21 16:09:00', '2023-01-21 16:09:00'),
(152, '2022-12-29 00:00:00', 1, NULL, 0, 28, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '220280.00', NULL, 3, NULL, '2023-01-21 16:17:00', '2023-01-21 16:17:00'),
(153, '2022-12-28 00:00:00', 1, NULL, 0, 29, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '28810.66', NULL, 3, NULL, '2023-01-21 16:21:00', '2023-01-21 16:21:00'),
(154, '2022-12-29 00:00:00', 1, NULL, 0, 30, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '21330.00', NULL, 3, NULL, '2023-01-21 16:26:00', '2023-01-21 16:26:00'),
(155, '2022-02-21 00:00:00', 1, NULL, 0, 31, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-01-21 16:37:00', '2023-01-21 16:37:00'),
(156, '2022-12-16 00:00:00', 1, NULL, 0, 32, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3000.00', NULL, 3, NULL, '2023-01-21 16:38:00', '2023-01-21 16:38:00'),
(157, '2022-10-06 00:00:00', 1, NULL, 0, 33, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5789.67', NULL, 3, NULL, '2023-01-21 16:46:00', '2023-01-21 16:46:00'),
(158, '2022-12-06 00:00:00', 1, NULL, 0, 34, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '13768.18', NULL, 3, NULL, '2023-01-21 16:48:00', '2023-01-21 16:48:00'),
(159, '2022-12-06 00:00:00', 1, NULL, 0, 35, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '9126.49', NULL, 3, NULL, '2023-01-21 16:49:00', '2023-01-21 16:49:00'),
(160, '2022-12-06 00:00:00', 1, NULL, 0, 36, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '6847.15', NULL, 3, NULL, '2023-01-21 16:51:00', '2023-01-21 16:51:00'),
(161, '2022-11-16 00:00:00', 1, NULL, 0, 37, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '7179.69', NULL, 3, NULL, '2023-01-21 16:59:00', '2023-01-21 16:59:00'),
(162, '2022-11-16 00:00:00', 1, NULL, 0, 38, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '7179.69', NULL, 3, NULL, '2023-01-21 17:00:00', '2023-01-21 17:00:00'),
(163, '2022-12-08 00:00:00', 1, NULL, 0, 39, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '18381.24', NULL, 3, NULL, '2023-01-21 17:03:00', '2023-01-21 17:03:00'),
(164, '2022-12-27 00:00:00', 1, NULL, 0, 40, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, 3, NULL, '2023-01-21 17:07:00', '2023-01-21 17:07:00'),
(165, '2023-01-04 00:00:00', 1, NULL, 0, 41, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '999.20', NULL, 3, NULL, '2023-02-03 20:00:00', '2023-02-03 20:00:00'),
(166, '2022-11-26 00:00:00', 1, NULL, 0, 42, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3000.00', NULL, 3, NULL, '2023-02-03 20:02:00', '2023-02-03 20:02:00'),
(167, '2023-01-25 00:00:00', 1, NULL, 0, 43, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '26990.00', NULL, 3, NULL, '2023-02-03 22:46:00', '2023-02-03 22:46:00'),
(168, '2023-01-12 00:00:00', 1, NULL, 0, 44, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '37790.00', NULL, 3, NULL, '2023-02-03 22:48:00', '2023-02-03 22:48:00'),
(169, '2023-01-26 00:00:00', 1, NULL, 0, 45, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '2190.00', NULL, 3, NULL, '2023-02-03 22:50:00', '2023-02-03 22:50:00'),
(170, '2023-01-06 00:00:00', 1, NULL, 0, 46, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-02-03 22:54:00', '2023-02-03 22:54:00'),
(171, '2023-01-13 00:00:00', 1, NULL, 0, 47, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '16500.00', NULL, 3, NULL, '2023-02-03 22:56:00', '2023-02-03 22:56:00'),
(172, '2023-01-27 00:00:00', 1, NULL, 0, 48, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '100000.00', NULL, 3, NULL, '2023-02-03 22:58:00', '2023-02-03 22:58:00'),
(173, '2023-01-26 00:00:00', 1, NULL, 0, 49, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3000.00', NULL, 3, NULL, '2023-02-03 23:03:00', '2023-02-03 23:03:00'),
(174, '2022-12-15 00:00:00', 1, NULL, 0, 50, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '102600.00', NULL, 3, NULL, '2023-02-03 23:06:00', '2023-02-03 23:06:00'),
(175, '2022-12-01 00:00:00', 1, NULL, 0, 51, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '20100.00', NULL, 3, NULL, '2023-02-03 23:22:00', '2023-02-03 23:22:00'),
(176, '2022-12-20 00:00:00', 1, NULL, 0, 52, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3184.90', NULL, 3, NULL, '2023-02-03 23:26:00', '2023-02-03 23:26:00'),
(177, '2022-12-16 00:00:00', 1, NULL, 0, 53, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '68050.00', NULL, 3, NULL, '2023-02-03 23:29:00', '2023-02-03 23:29:00'),
(178, '2022-12-16 00:00:00', 1, NULL, 0, 54, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '25000.00', NULL, 3, NULL, '2023-02-03 23:51:00', '2023-02-03 23:51:00'),
(179, '2023-02-15 00:00:00', 1, 29, 82, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '7731.20', 2, NULL, '2023-02-15 16:51:17', '2023-02-15 16:52:26'),
(180, '2023-02-15 00:00:00', 1, 30, 107, NULL, 'Efectivo', NULL, NULL, 'PODOTACTILES 40X40CM - PREVENCION - COLOR AMARILLO	9.60	m2	TOTAL17,760.00', 'Cobranza/Ingresos', NULL, '10000.00', 7, NULL, '2023-02-15 17:34:52', '2023-02-15 17:34:52'),
(181, '2023-02-15 00:00:00', 1, 31, 65, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '4000.00', 7, NULL, '2023-02-15 23:09:53', '2023-02-15 23:09:53'),
(182, '2023-02-15 00:00:00', 1, 32, 68, NULL, 'Efectivo', NULL, NULL, 'EKOS - 2 TON CURADOR Pegamento \r\nCANCELA SALDO', 'Cobranza/Ingresos', NULL, '11470.00', 7, NULL, '2023-02-16 01:51:19', '2023-02-16 01:51:19'),
(183, '2023-02-16 00:00:00', 1, 33, 73, NULL, 'Efectivo', NULL, NULL, 'ATERMICO ADOQUIN MADERA 20 X 60 CM	- 333 u\r\n\r\nCANCELA SALDO', 'Cobranza/Ingresos', NULL, '202050.00', 7, NULL, '2023-02-16 15:57:52', '2023-02-16 15:57:52'),
(184, '2023-02-16 00:00:00', 1, 34, 65, NULL, 'Transferencia', NULL, 3, 'DURMIENTE H°A° 28 X 100 CM - COLOR VARIOS 10u\r\n\r\nGEOKUBIK - 1 TONO	1.00m2\r\n\r\ncancela saldo', 'Cobranza/Ingresos', NULL, '27620.00', 7, NULL, '2023-02-16 16:06:25', '2023-02-16 16:06:25'),
(185, '2023-02-16 00:00:00', 1, 35, 111, NULL, 'Efectivo', NULL, NULL, 'EKOS 12.400\r\nCURADOR 550', 'Cobranza/Ingresos', NULL, '12950.00', 7, NULL, '2023-02-16 17:43:27', '2023-02-16 17:43:40'),
(186, '2023-02-17 00:00:00', 1, 36, 115, NULL, 'Efectivo', NULL, NULL, 'PENDIENTES 10 PAQ\r\n\r\nCANCELA SALDO', 'Cobranza/Ingresos', NULL, '15502.50', 7, NULL, '2023-02-17 17:24:41', '2023-02-17 17:24:41'),
(187, '2023-01-31 00:00:00', 1, 37, 61, NULL, 'Tarjeta Débito', NULL, 1, 'CANCELA MATERIALES', 'Cobranza/Ingresos', NULL, '89646.48', 7, NULL, '2023-02-18 15:13:01', '2023-03-01 17:13:31'),
(188, '2023-02-23 00:00:00', 1, 38, 123, NULL, 'Efectivo', NULL, NULL, 'CANCELA TOTAL\r\n\r\n3 m2 REVEST TRADICONAL GRAFITO + 1/2 LTS CURADOR', 'Cobranza/Ingresos', NULL, '17182.00', 7, NULL, '2023-02-23 16:44:05', '2023-02-23 16:44:05'),
(189, '2023-02-23 00:00:00', 1, 39, 89, NULL, 'Efectivo', NULL, NULL, 'ENTREGA PARCIAL', 'Cobranza/Ingresos', NULL, '25000.00', 7, NULL, '2023-02-24 14:55:07', '2023-02-24 14:55:07'),
(190, '2023-02-24 00:00:00', 1, 40, 81, NULL, 'Efectivo', NULL, NULL, 'cancela saldo con diego fletero', 'Cobranza/Ingresos', NULL, '5900.00', 7, NULL, '2023-02-24 17:05:24', '2023-02-24 17:05:24'),
(191, '2023-02-28 00:00:00', 1, 41, 78, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '29898.88', 7, NULL, '2023-02-28 16:52:24', '2023-02-28 16:53:53'),
(192, '2023-02-27 00:00:00', 1, 42, 129, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '42000.00', 7, NULL, '2023-02-28 17:26:24', '2023-02-28 17:26:25'),
(193, '2023-02-27 00:00:00', 1, 43, 130, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '2368.00', 2, NULL, '2023-02-28 17:35:33', '2023-02-28 17:36:02'),
(194, '2023-02-27 00:00:00', 1, 44, 121, NULL, 'Transferencia', NULL, 2, NULL, 'Cobranza/Ingresos', NULL, '24163.70', 2, NULL, '2023-02-28 17:43:23', '2023-02-28 17:43:23'),
(195, '2023-03-01 00:00:00', 1, 45, 131, NULL, 'Transferencia', NULL, 2, 'REVENTA + IVA', 'Cobranza/Ingresos', NULL, '3637.26', 7, NULL, '2023-03-01 16:32:37', '2023-03-01 16:32:37'),
(196, '2023-02-23 00:00:00', 1, 46, 61, NULL, 'Efectivo', NULL, NULL, 'mano de obra', 'Cobranza/Ingresos', NULL, '35000.00', 7, NULL, '2023-03-01 17:15:37', '2023-03-01 17:15:37'),
(197, '2023-02-23 00:00:00', 1, 47, 61, NULL, 'Tarjeta Débito', NULL, 1, 'cancela mano de obra', 'Cobranza/Ingresos', NULL, '41019.00', 7, NULL, '2023-03-01 17:16:33', '2023-03-01 17:16:33'),
(198, '2023-03-01 00:00:00', 1, 48, 136, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '51200.00', 7, NULL, '2023-03-01 23:49:10', '2023-03-01 23:49:10'),
(199, '2023-02-26 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'Gas oil', 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-02 22:11:44', '2023-03-02 22:11:44'),
(200, '2023-02-24 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'Gas oil', 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-02 22:23:57', '2023-03-02 22:23:57'),
(201, '2023-02-24 00:00:00', 1, NULL, 0, NULL, 'Tarjeta Débito', NULL, NULL, NULL, 'Gastos/Egresos', '15103.54', NULL, 3, NULL, '2023-03-02 22:28:01', '2023-03-02 22:28:01'),
(202, '2023-03-02 00:00:00', 1, 49, 84, NULL, 'Transferencia', NULL, 2, 'cancela saldo', 'Cobranza/Ingresos', NULL, '86061.20', 7, NULL, '2023-03-04 00:38:31', '2023-03-04 00:38:31'),
(203, '2023-03-03 00:00:00', 1, 50, 144, NULL, 'Efectivo', NULL, NULL, '1 M2 EKOS 2 TONOS - GRAFITO MEDIO + BLANCO', 'Cobranza/Ingresos', NULL, '2400.00', 7, NULL, '2023-03-04 01:10:48', '2023-03-04 01:10:48'),
(204, '2023-03-04 00:00:00', 1, 51, 135, NULL, 'Efectivo', NULL, NULL, '150 guia\r\n8 prevencion\r\n2 señal \r\n\r\namarillas', 'Cobranza/Ingresos', NULL, '20000.00', 7, NULL, '2023-03-04 17:10:37', '2023-03-04 17:10:37'),
(205, '2023-03-04 00:00:00', 1, 52, 145, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '2400.00', 7, NULL, '2023-03-04 17:33:41', '2023-03-04 17:33:41'),
(206, '2023-02-24 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4170.00', NULL, 3, NULL, '2023-03-06 14:14:31', '2023-03-06 14:14:31'),
(207, '2023-03-23 00:00:00', 1, NULL, 0, NULL, 'Tarjeta Débito', NULL, NULL, NULL, 'Gastos/Egresos', '8340.00', NULL, 3, NULL, '2023-03-06 14:19:55', '2023-03-06 14:19:55'),
(208, '2023-02-23 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4170.00', NULL, 3, NULL, '2023-03-06 14:23:47', '2023-03-06 14:23:48'),
(209, '2023-02-23 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4170.00', NULL, 3, NULL, '2023-03-06 14:24:38', '2023-03-06 14:24:38'),
(210, '2023-03-23 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4170.00', NULL, 3, NULL, '2023-03-06 14:25:49', '2023-03-06 14:25:49'),
(211, '2023-03-16 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '8000.00', NULL, 3, NULL, '2023-03-06 14:43:10', '2023-03-06 14:43:10'),
(212, '2023-02-16 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3864.00', NULL, 3, NULL, '2023-03-06 14:45:13', '2023-03-06 14:45:13'),
(213, '2023-02-25 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3600.00', NULL, 3, NULL, '2023-03-06 14:47:51', '2023-03-06 14:47:51'),
(214, '2023-02-21 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4170.00', NULL, 3, NULL, '2023-03-06 14:49:30', '2023-03-06 14:49:30'),
(215, '2023-02-13 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-06 15:09:59', '2023-03-06 15:09:59'),
(216, '2023-02-08 00:00:00', 1, NULL, 0, 55, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-06 15:14:53', '2023-03-06 15:14:54'),
(217, '2023-02-07 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '19200.00', NULL, 3, NULL, '2023-03-06 15:22:34', '2023-03-06 15:22:34'),
(218, '2023-03-06 00:00:00', 1, 53, 143, NULL, 'Efectivo', NULL, NULL, 'SEÑA', 'Cobranza/Ingresos', NULL, '30000.00', 7, NULL, '2023-03-07 14:53:52', '2023-03-07 14:53:53'),
(219, '2023-03-07 00:00:00', 1, 54, 152, NULL, 'Efectivo', NULL, NULL, 'SEÑA', 'Cobranza/Ingresos', NULL, '22650.00', 7, NULL, '2023-03-07 15:00:43', '2023-03-07 15:00:43'),
(220, '2023-03-07 00:00:00', 1, 55, 155, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '6000.00', 7, NULL, '2023-03-07 16:21:59', '2023-03-07 16:21:59'),
(221, NULL, 1, 56, 107, NULL, 'Efectivo', NULL, NULL, 'CANCELA', 'Cobranza/Ingresos', NULL, '7760.00', 7, NULL, '2023-03-07 17:05:29', '2023-03-07 17:05:29'),
(222, '2023-01-30 00:00:00', 1, NULL, 0, 56, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '94092.00', NULL, 3, NULL, '2023-03-07 20:59:10', '2023-03-07 20:59:11'),
(223, '2023-03-07 00:00:00', 1, 57, 157, NULL, 'Efectivo', NULL, NULL, '2 M2 KEBRACHO COLOR MADERA\r\n\r\n1 KG PASTINA', 'Cobranza/Ingresos', NULL, '10800.00', 7, NULL, '2023-03-07 23:21:02', '2023-03-07 23:21:02'),
(224, '2023-03-09 00:00:00', 1, 58, 159, NULL, 'Efectivo', NULL, NULL, '1 M2 REVES P TRADICIONAL GRAFITO.', 'Cobranza/Ingresos', NULL, '4550.00', 7, NULL, '2023-03-08 16:37:55', '2023-03-08 16:37:55'),
(225, '2023-03-08 00:00:00', 1, 59, 129, NULL, 'Efectivo', NULL, NULL, 'cancela total', 'Cobranza/Ingresos', NULL, '50000.00', 7, NULL, '2023-03-08 23:18:52', '2023-03-08 23:18:52'),
(226, '2023-03-08 00:00:00', 1, 60, 61, NULL, 'Efectivo', NULL, NULL, 'cancela 3 pegam -->\r\n$16000', 'Cobranza/Ingresos', NULL, '11095.19', 7, NULL, '2023-03-09 01:50:00', '2023-03-09 01:50:36'),
(227, '2023-03-09 00:00:00', 1, 61, 162, NULL, 'Tarjeta Crédito', NULL, 1, 'TARJETA TUYA\r\n\r\nTRAVERTILIT BEIGE CLARO 2.5 M2', 'Cobranza/Ingresos', NULL, '13763.75', 7, NULL, '2023-03-09 15:35:33', '2023-03-09 15:35:33'),
(228, '2023-03-09 00:00:00', 1, 62, 165, NULL, 'Efectivo', NULL, NULL, 'SEÑA MATERIALES', 'Cobranza/Ingresos', NULL, '38000.00', 7, NULL, '2023-03-09 17:31:43', '2023-03-09 17:31:43'),
(229, '2023-03-09 00:00:00', 1, 63, 167, NULL, 'Efectivo', NULL, NULL, 'CANCELA HOY -\r\nRETIRA MAÑANA', 'Cobranza/Ingresos', NULL, '4170.00', 7, NULL, '2023-03-10 00:16:10', '2023-03-10 00:16:10'),
(230, '2023-03-09 00:00:00', 1, 64, 163, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '1325.00', 7, NULL, '2023-03-10 00:19:26', '2023-03-10 00:19:26'),
(231, '2023-03-09 00:00:00', 1, 65, 166, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '3300.00', 7, NULL, '2023-03-10 00:20:35', '2023-03-10 00:20:38'),
(232, '2023-03-07 00:00:00', 1, 66, 83, NULL, 'Efectivo', NULL, NULL, 'cancela materiales', 'Cobranza/Ingresos', NULL, '29281.88', 7, NULL, '2023-03-10 00:35:12', '2023-03-10 00:35:12'),
(234, '2023-03-10 00:00:00', 1, 68, 167, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '4170.00', 7, NULL, '2023-03-10 15:26:14', '2023-03-10 15:26:14'),
(235, '2023-03-01 00:00:00', 1, 69, 153, NULL, 'Efectivo', NULL, NULL, '6.5 LTS CURADOR', 'Cobranza/Ingresos', NULL, '7150.00', 7, NULL, '2023-03-10 16:21:56', '2023-03-10 16:21:56'),
(236, '2023-03-10 00:00:00', 1, 70, 154, NULL, 'Efectivo', NULL, NULL, 'cancela', 'Cobranza/Ingresos', NULL, '4650.00', 7, NULL, '2023-03-10 16:52:39', '2023-03-10 16:52:39'),
(237, '2023-03-10 00:00:00', 1, 71, 169, NULL, 'Efectivo', NULL, NULL, 'retira mañana 12 un', 'Cobranza/Ingresos', NULL, '7104.00', 7, NULL, '2023-03-11 00:31:09', '2023-03-11 00:31:09'),
(238, '2023-03-13 00:00:00', 1, 72, 147, NULL, 'Efectivo', NULL, NULL, '38 m2 pisos 40x40 cemento\r\n\r\n4 lts curador', 'Cobranza/Ingresos', NULL, '56720.00', 7, NULL, '2023-03-13 22:46:35', '2023-03-13 22:46:35'),
(239, '2023-03-13 00:00:00', 1, 73, 145, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '7203.36', 7, NULL, '2023-03-14 15:41:08', '2023-03-14 15:41:08'),
(240, '2023-03-14 00:00:00', 1, 74, 89, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '38249.79', 7, NULL, '2023-03-14 18:27:55', '2023-03-14 18:27:55'),
(241, '2023-03-14 00:00:00', 1, 75, 143, NULL, 'Efectivo', NULL, NULL, 'EKOS - 2 TONO 10 M2\r\nPegamento 2 BOLSAS\r\nCURADOR 2LTS', 'Cobranza/Ingresos', NULL, '15000.00', 7, NULL, '2023-03-15 01:29:02', '2023-03-15 01:29:02'),
(242, '2023-03-14 00:00:00', 1, 76, 125, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '2200.00', 7, NULL, '2023-03-15 01:49:00', '2023-03-15 01:49:00'),
(243, '2023-03-15 00:00:00', 1, 77, 173, NULL, 'Efectivo', NULL, NULL, 'SEÑA -->REV ADOQ RECTO CHICO -CEMENTO 140.00 m2\r\nREV ADOQ CIRCULAR CHICO-NEGRO 50.00 m2', 'Cobranza/Ingresos', NULL, '100000.00', 7, NULL, '2023-03-15 15:16:14', '2023-03-15 15:18:48'),
(244, '2023-03-15 00:00:00', 1, 78, 158, NULL, 'Efectivo', NULL, NULL, '6 m2 placas antih madera', 'Cobranza/Ingresos', NULL, '21000.00', 7, NULL, '2023-03-15 17:00:09', '2023-03-15 17:00:18'),
(245, '2023-03-15 00:00:00', 1, 79, 158, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '2490.00', 7, NULL, '2023-03-16 15:34:53', '2023-03-16 15:34:53'),
(246, '2023-03-11 00:00:00', 1, 80, 55, NULL, 'Efectivo', NULL, NULL, 'Recibo N° 5-1807.-', 'Cobranza/Ingresos', NULL, '170000.00', 4, NULL, '2023-03-16 22:30:42', '2023-03-16 22:30:42'),
(247, '2023-03-03 00:00:00', 1, 81, 179, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '115000.00', 4, NULL, '2023-03-16 22:43:39', '2023-03-16 22:43:40'),
(248, '2023-03-16 00:00:00', 1, 82, 152, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '22648.44', 7, NULL, '2023-03-17 00:36:20', '2023-03-17 00:36:20'),
(250, '2022-02-12 00:00:00', 1, 83, 175, NULL, 'Efectivo', NULL, NULL, 'cancelo', 'Cobranza/Ingresos', NULL, '96770.00', 7, NULL, '2023-03-17 00:50:03', '2023-03-17 00:50:03'),
(251, '2023-01-02 00:00:00', 1, 84, 48, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '25410.25', 7, NULL, '2023-03-17 00:54:33', '2023-03-17 00:54:34'),
(252, '2023-01-13 00:00:00', 1, 85, 51, NULL, 'Efectivo', NULL, NULL, 'CANCELO', 'Cobranza/Ingresos', NULL, '69732.30', 7, NULL, '2023-03-17 01:20:39', '2023-03-17 01:20:39'),
(253, '2023-03-18 00:00:00', 1, 86, 180, NULL, 'Tarjeta Crédito', NULL, 1, 'PAGA CON TUYA PRECIO DE LISTA --> $60.500', 'Cobranza/Ingresos', NULL, '50000.00', 7, NULL, '2023-03-18 17:42:40', '2023-03-18 17:42:52'),
(254, NULL, 1, 87, 183, NULL, 'Efectivo', NULL, NULL, 'SEÑA 50%', 'Cobranza/Ingresos', NULL, '8500.00', 7, NULL, '2023-03-21 01:08:03', '2023-03-21 01:08:03'),
(255, '2023-03-21 00:00:00', 1, 88, 184, NULL, 'Transferencia', NULL, 3, 'SEÑA 50%', 'Cobranza/Ingresos', NULL, '5400.00', 7, NULL, '2023-03-21 15:10:08', '2023-03-21 15:10:08'),
(256, '2023-03-21 00:00:00', 1, 89, 90, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '25110.00', 7, NULL, '2023-03-21 17:22:46', '2023-03-21 17:22:47'),
(257, '2023-03-21 00:00:00', 1, 90, 135, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '25421.20', 7, NULL, '2023-03-21 22:35:25', '2023-03-21 22:35:25'),
(258, '2023-03-21 00:00:00', 1, 91, 143, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '9998.30', 7, NULL, '2023-03-22 01:15:59', '2023-03-22 01:15:59'),
(259, '2023-03-21 00:00:00', 1, 92, 186, NULL, 'Efectivo', NULL, NULL, 'CANCELA', 'Cobranza/Ingresos', NULL, '6000.80', 7, NULL, '2023-03-22 02:06:26', '2023-03-22 02:06:26'),
(260, '2023-03-23 00:00:00', 1, 93, 183, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '8498.23', 2, NULL, '2023-03-23 16:23:26', '2023-03-23 16:23:26'),
(261, '2023-03-23 00:00:00', 1, 94, 151, NULL, 'Efectivo', NULL, NULL, 'SALDO TOTAL $38673.5', 'Cobranza/Ingresos', NULL, '20000.00', 7, NULL, '2023-03-23 22:38:06', '2023-03-23 22:39:54'),
(262, '2023-03-24 00:00:00', 1, 95, 194, NULL, 'Tarjeta Crédito', NULL, 1, 'TUYA', 'Cobranza/Ingresos', NULL, '51449.20', 7, NULL, '2023-03-24 17:17:38', '2023-03-24 17:17:38'),
(263, '2023-03-24 00:00:00', 1, 96, 195, NULL, 'Efectivo', NULL, NULL, 'SALDO $200', 'Cobranza/Ingresos', NULL, '5100.00', 7, NULL, '2023-03-24 17:49:59', '2023-03-24 17:49:59'),
(265, '2023-03-27 00:00:00', 1, 97, 198, NULL, 'Tarjeta Crédito', NULL, 1, 'TUYA EN 10 CUOTAS', 'Cobranza/Ingresos', NULL, '78671.54', 7, NULL, '2023-03-28 02:07:53', '2023-03-28 02:07:53'),
(266, '2023-03-16 00:00:00', 1, NULL, 0, 57, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 21:08:28', '2023-03-28 21:24:50'),
(267, '2023-03-14 00:00:00', 1, NULL, 0, 58, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 21:12:06', '2023-03-28 21:23:14'),
(268, '2023-03-21 00:00:00', 1, NULL, 0, 59, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '8000.00', NULL, 3, NULL, '2023-03-28 21:14:53', '2023-03-28 21:14:53'),
(269, '2023-03-16 00:00:00', 1, NULL, 0, 60, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '14300.00', NULL, 3, NULL, '2023-03-28 21:16:15', '2023-03-28 21:21:34'),
(270, '2023-03-22 00:00:00', 1, NULL, 0, 61, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '89092.00', NULL, 3, NULL, '2023-03-28 21:27:07', '2023-03-28 21:27:07'),
(271, '2023-03-15 00:00:00', 1, NULL, 0, 62, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '600.00', NULL, 3, NULL, '2023-03-28 21:29:02', '2023-03-28 21:29:02'),
(272, '2023-01-31 00:00:00', 1, NULL, 0, 63, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '29040.00', NULL, 3, NULL, '2023-03-28 21:33:57', '2023-03-28 21:33:57'),
(273, '2023-03-15 00:00:00', 1, NULL, 0, 64, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5255.50', NULL, 3, NULL, '2023-03-28 21:36:26', '2023-03-28 21:36:26'),
(274, '2023-03-13 00:00:00', 1, NULL, 0, 65, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1100.00', NULL, 3, NULL, '2023-03-28 21:42:49', '2023-03-28 21:42:49'),
(275, '2023-03-11 00:00:00', 1, NULL, 0, 66, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '2000.00', NULL, 3, NULL, '2023-03-28 21:45:11', '2023-03-28 21:45:11'),
(276, '2023-03-10 00:00:00', 1, NULL, 0, 67, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '2898.51', NULL, 3, NULL, '2023-03-28 21:47:28', '2023-03-28 21:47:28'),
(277, '2023-03-20 00:00:00', 1, NULL, 0, 68, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 21:49:27', '2023-03-28 21:49:27'),
(278, '2023-02-28 00:00:00', 1, NULL, 0, 69, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '18000.00', NULL, 3, NULL, '2023-03-28 21:51:12', '2023-03-28 21:53:11'),
(279, '2023-02-28 00:00:00', 1, NULL, 0, 70, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '550.00', NULL, 3, NULL, '2023-03-28 21:54:57', '2023-03-28 21:54:57'),
(280, '2023-02-27 00:00:00', 1, NULL, 0, 71, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3470.00', NULL, 3, NULL, '2023-03-28 21:57:08', '2023-03-28 21:57:08'),
(281, '2023-02-28 00:00:00', 1, NULL, 0, 72, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1358.18', NULL, 3, NULL, '2023-03-28 21:59:42', '2023-03-28 21:59:42'),
(282, '2022-12-30 00:00:00', 1, NULL, 0, 73, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '15000.00', NULL, 3, NULL, '2023-03-28 22:03:23', '2023-03-28 22:03:24'),
(283, '2023-03-01 00:00:00', 1, NULL, 0, 74, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '14690.00', NULL, 3, NULL, '2023-03-28 22:10:17', '2023-03-28 22:10:17'),
(284, '2023-03-07 00:00:00', 1, NULL, 0, 75, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '32400.00', NULL, 3, NULL, '2023-03-28 22:12:09', '2023-03-28 22:12:09'),
(285, '2023-03-09 00:00:00', 1, NULL, 0, 76, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '71828.29', NULL, 3, NULL, '2023-03-28 22:13:36', '2023-03-28 22:14:44'),
(286, '2023-03-10 00:00:00', 1, NULL, 0, 77, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '21600.00', NULL, 3, NULL, '2023-03-28 22:45:50', '2023-03-28 22:45:50'),
(287, '2023-03-01 00:00:00', 1, NULL, 0, 78, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '49530.00', NULL, 3, NULL, '2023-03-28 22:47:55', '2023-03-28 22:47:55'),
(288, '2023-03-01 00:00:00', 1, NULL, 0, 79, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1033.00', NULL, 3, NULL, '2023-03-28 22:49:47', '2023-03-28 22:49:48'),
(289, '2023-03-02 00:00:00', 1, NULL, 0, 80, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '283.50', NULL, 3, NULL, '2023-03-28 22:51:17', '2023-03-28 22:51:18'),
(290, '2023-03-02 00:00:00', 1, NULL, 0, 81, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 22:52:49', '2023-03-28 22:52:49'),
(291, '2023-03-02 00:00:00', 1, NULL, 0, 82, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '7200.00', NULL, 3, NULL, '2023-03-28 22:54:18', '2023-03-28 22:54:18'),
(292, '2023-03-02 00:00:00', 1, NULL, 0, 83, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3600.00', NULL, 3, NULL, '2023-03-28 22:55:45', '2023-03-28 22:55:46'),
(293, '2023-03-08 00:00:00', 1, NULL, 0, 84, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3600.00', NULL, 3, NULL, '2023-03-28 22:57:29', '2023-03-28 22:57:29'),
(294, '2023-03-09 00:00:00', 1, NULL, 0, 85, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 22:58:44', '2023-03-28 22:58:44'),
(295, '2023-03-09 00:00:00', 1, NULL, 0, 86, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '20480.00', NULL, 3, NULL, '2023-03-28 23:00:16', '2023-03-28 23:00:16'),
(296, '2023-03-07 00:00:00', 1, NULL, 0, 87, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5434.69', NULL, 3, NULL, '2023-03-28 23:02:20', '2023-03-28 23:02:21'),
(297, '2023-03-03 00:00:00', 1, NULL, 0, 88, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5260.00', NULL, 3, NULL, '2023-03-28 23:05:10', '2023-03-28 23:05:12'),
(298, '2023-03-06 00:00:00', 1, NULL, 0, 89, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3600.00', NULL, 3, NULL, '2023-03-28 23:07:21', '2023-03-28 23:07:21'),
(299, '2023-03-07 00:00:00', 1, NULL, 0, 90, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3600.00', NULL, 3, NULL, '2023-03-28 23:09:45', '2023-03-28 23:09:45'),
(300, '2023-03-07 00:00:00', 1, NULL, 0, 91, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '5000.00', NULL, 3, NULL, '2023-03-28 23:13:39', '2023-03-28 23:13:40'),
(301, '2023-03-15 00:00:00', 1, NULL, 0, 92, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '4743.15', NULL, 3, NULL, '2023-03-28 23:19:11', '2023-03-28 23:19:11'),
(302, '2023-03-13 00:00:00', 1, NULL, 0, 93, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1444.69', NULL, 3, NULL, '2023-03-28 23:20:59', '2023-03-28 23:20:59'),
(303, '2023-03-29 00:00:00', 1, 98, 202, NULL, 'Efectivo', NULL, NULL, 'SEÑA', 'Cobranza/Ingresos', NULL, '1000.00', 7, NULL, '2023-03-29 17:19:42', '2023-03-29 17:19:42'),
(304, '2023-03-30 00:00:00', 1, 99, 195, NULL, 'Efectivo', NULL, NULL, 'cancelo el primer dia', 'Cobranza/Ingresos', NULL, '200.00', 7, NULL, '2023-03-30 16:46:03', '2023-03-30 16:46:03'),
(305, '2023-03-07 00:00:00', 1, 100, 83, NULL, 'Efectivo', NULL, NULL, 'arreglo decimales', 'Cobranza/Ingresos', NULL, '1.90', 7, NULL, '2023-03-30 17:45:31', '2023-03-30 17:45:31'),
(306, '2023-03-01 00:00:00', 1, 101, 136, NULL, 'Efectivo', NULL, NULL, 'cancela mismo dia', 'Cobranza/Ingresos', NULL, '-5.30', 7, NULL, '2023-03-30 18:05:02', '2023-03-30 18:05:02'),
(307, '2023-03-30 00:00:00', 1, 102, 151, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '27700.00', 7, NULL, '2023-03-30 23:58:01', '2023-03-30 23:58:01'),
(308, '2023-03-30 00:00:00', 1, 103, 165, NULL, 'Efectivo', NULL, NULL, 'cancela saldo materiales', 'Cobranza/Ingresos', NULL, '10973.50', 7, NULL, '2023-03-30 23:58:27', '2023-03-30 23:58:27'),
(309, '2023-04-01 00:00:00', 1, 104, 180, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '28710.21', 7, NULL, '2023-04-01 17:49:57', '2023-04-01 17:49:58'),
(310, '2023-04-01 00:00:00', 1, 105, 206, NULL, 'Efectivo', NULL, NULL, 'SEÑA', 'Cobranza/Ingresos', NULL, '5000.00', 7, NULL, '2023-04-01 18:13:00', '2023-04-01 18:13:00'),
(311, '2023-04-03 00:00:00', 1, 106, 202, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '4610.00', 7, NULL, '2023-04-03 17:15:49', '2023-04-03 17:15:49'),
(312, '2023-04-04 00:00:00', 1, 107, 206, NULL, 'Efectivo', NULL, NULL, 'cancela saldo', 'Cobranza/Ingresos', NULL, '5368.00', 7, NULL, '2023-04-04 15:35:42', '2023-04-04 15:35:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_pedidos`
--

CREATE TABLE `nota_pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_cliente` bigint(20) UNSIGNED DEFAULT NULL,
  `totalgravado` decimal(12,2) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `monto_iva` decimal(9,2) DEFAULT '0.00',
  `id_vendedor` bigint(20) UNSIGNED DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `descuento` decimal(13,2) DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modalidad_venta` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_vendedor_2` bigint(20) DEFAULT NULL,
  `tipo_presupuesto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_remito` bigint(20) DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `Anexo_Presupuesto` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='if nro_remito=0\r\n Ult_remito =  select max(nro_remito) from nota_pedidos\r\n nro_remito=+1\r\n';

--
-- Volcado de datos para la tabla `nota_pedidos`
--

INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `modalidad_venta`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`, `Anexo_Presupuesto`) VALUES
(28, '2023-03-02 00:00:00', 9, '38700.00', '46827.00', '8127.00', 6, NULL, NULL, NULL, '2023-01-11 16:24:46', '2023-03-02 23:17:44', 'Entregado', 'Otros', 6, 'Productos', NULL, NULL, NULL),
(48, '2023-03-16 00:00:00', 10, '23100.00', '25410.25', '4410.04', 9, NULL, '-9.09', NULL, '2023-01-13 00:47:10', '2023-03-17 00:53:20', 'Pendiente Entrega', 'Otros', 9, 'Productos', NULL, NULL, NULL),
(49, '2022-12-20 00:00:00', 11, '113980.00', '117228.43', '20345.43', NULL, NULL, '-15.00', NULL, '2023-01-13 16:38:48', '2023-02-07 23:33:45', 'Entregado', 'Otros', NULL, 'Productos', NULL, '2023-01-12 00:00:00', NULL),
(50, '2023-01-13 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, '-15.00', NULL, '2023-01-13 17:54:53', '2023-01-13 17:54:53', 'Pendiente Aprobacion', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(51, '2023-03-16 00:00:00', 13, '67800.00', '69732.30', '12102.30', NULL, NULL, '-15.00', NULL, '2023-01-13 17:58:12', '2023-03-17 01:20:52', 'Entregado', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(55, '2023-01-16 00:00:00', 15, '608991.00', '487192.80', '102310.49', 6, NULL, '-20.00', NULL, '2023-02-01 00:40:42', '2023-02-03 22:33:47', 'Pendiente Entrega', 'Contado', NULL, 'Muebles', NULL, '2023-02-13 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/January2023/2023-1-19 PRESUPUESTO MUEBLE Cocina_page-00011.jpg\" alt=\"\" width=\"1125\" height=\"1625\" /></p>'),
(56, '2023-01-31 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'PIEDRA LISTON SIN JUNTA	13	M2				BEIGE	2Ltts	2Bolsas', '2023-02-01 16:02:45', '2023-02-01 16:02:45', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(57, '2023-01-31 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'PIEDRA LISTON SIN JUNTA	13	M2				BEIGE	2Ltts	2Bolsas', '2023-02-01 16:50:16', '2023-02-01 16:50:16', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(58, '2023-01-31 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'PIEDRA LISTON SIN JUNTA	13	M2				BEIGE	2Ltts	2Bolsas', '2023-02-01 16:51:08', '2023-02-01 16:51:08', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(59, '2023-01-31 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, '10.00', 'PIEDRA LISTON SIN JUNTA	13	M2				BEIGE	2Ltts	2Bolsas', '2023-02-02 14:55:25', '2023-02-02 14:55:25', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, '2023-02-13 00:00:00', NULL),
(60, '2023-01-31 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, '10.00', 'PIEDRA LISTON SIN JUNTA	13	M2				BEIGE	2Ltts	2Bolsas', '2023-02-02 15:03:37', '2023-02-02 15:03:37', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, '2023-02-13 00:00:00', '<p>...</p>'),
(61, '2023-03-03 00:00:00', 17, '152170.00', '176760.67', '30677.47', 9, NULL, '-4.00', 'TRADICIONAL COLOR BEIGE + OBRA\r\n\r\nMATERIALES TOTAL cotizado (Prec lista) $ 74.705,40 \r\n\r\nMANO DE OBRA TOTAL cotizado (efectivo) $ 68.900,00', '2023-02-02 17:47:51', '2023-03-03 17:07:19', 'Entregado', 'Otros', NULL, 'Productos', NULL, '2023-02-13 00:00:00', '<p><img title=\"PRESUP MATERIALES\" src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/8ca14f75-25ee-413e-9bf6-ee6a7c67f91e1.jpg\" alt=\"\" width=\"326\" height=\"225\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"PRESUP MANO DE OBRA\" src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/0c82a408-85f6-4f70-9967-6419634286b4.jpg\" alt=\"\" width=\"325\" height=\"164\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"ESQUEMA FACHADA\" src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/4fdcbe73-4d1b-474a-b791-79035bdeeaef.jpg\" alt=\"\" width=\"318\" height=\"136\" /></p>'),
(63, '2022-12-09 00:00:00', 19, '94640.00', '67383.68', '14150.57', NULL, NULL, '-28.80', NULL, '2023-02-02 22:55:03', '2023-02-04 00:54:24', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-06 00:00:00', NULL),
(65, '2023-03-03 00:00:00', 20, '37200.00', '31620.00', '6640.20', 5, NULL, '-15.00', NULL, '2023-02-03 00:00:11', '2023-03-03 17:07:48', 'Entregado', 'Contado', NULL, 'Productos', NULL, NULL, NULL),
(67, '2023-03-30 00:00:00', 22, '23080.00', '26001.00', '5460.21', 9, NULL, '12.66', NULL, '2023-02-03 17:04:08', '2023-03-30 16:25:16', 'Entregado', 'Contado', 6, 'Productos', NULL, '2023-02-03 00:00:00', NULL),
(68, '2023-02-15 00:00:00', 23, '12670.00', '12670.00', '2660.70', 9, NULL, NULL, 'COLOR CEMENTO + NARANJA (LA MUESTRA TRAJO EL CLIENTE)', '2023-02-03 18:24:44', '2023-02-16 01:55:32', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-13 00:00:00', NULL),
(69, '2023-02-03 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, '-30.00', NULL, '2023-02-03 21:00:07', '2023-02-03 21:00:07', 'Pendiente Entrega', 'Contado', NULL, 'Productos', NULL, '2023-02-10 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/WhatsApp Image 2023-02-02 at 18.07.48.jpeg\" alt=\"\" /></p>'),
(70, '2023-02-03 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, '-30.00', NULL, '2023-02-03 21:01:46', '2023-02-03 21:01:46', 'Pendiente Entrega', 'Contado', NULL, 'Productos', NULL, '2023-02-10 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/WhatsApp Image 2023-02-02 at 18.07.48.jpeg\" alt=\"\" /></p>'),
(71, '2023-03-14 00:00:00', 25, '39900.00', '30723.00', '6451.83', 10, NULL, '-23.00', NULL, '2023-02-03 23:03:02', '2023-03-15 01:36:17', 'Pendiente Entrega', 'Contado', NULL, 'Productos', NULL, '2023-02-06 00:00:00', NULL),
(72, '2022-12-07 00:00:00', 27, '288000.00', '183744.00', '38586.24', 10, NULL, '-36.20', NULL, '2023-02-03 23:28:57', '2023-02-27 17:51:05', 'Entregado', 'Contado', 5, 'Productos', NULL, '2023-02-06 00:00:00', NULL),
(73, '2023-03-03 00:00:00', 28, '266400.00', '232034.40', '48727.22', 9, NULL, '-12.90', 'ATERMICOS COLOR BLANCO 20X60 SIMIL MADERA', '2023-02-04 00:46:06', '2023-03-03 17:08:20', 'Entregado', 'Contado', 10, 'Productos', NULL, '2023-02-06 00:00:00', NULL),
(74, '2022-12-26 00:00:00', 21, '480000.00', '450410.40', '78170.40', 10, NULL, '-22.45', NULL, '2023-02-04 01:17:26', '2023-02-04 01:17:54', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, '2023-02-28 00:00:00', NULL),
(75, '2023-02-15 00:00:00', 30, '20800.00', '20800.00', '4368.00', 9, NULL, NULL, 'EKOS BEIGE CLARO + GRAFITO', '2023-02-04 17:42:49', '2023-02-15 17:13:01', 'Entregado', 'Contado', 6, 'Productos', NULL, '2023-02-06 00:00:00', NULL),
(76, '2023-02-15 00:00:00', 32, '96000.00', '86400.00', '18144.00', 9, NULL, '-10.00', 'CIRCULAR CHICO	60	M2	375	...	retiro 100	CEMENTO', '2023-02-06 22:45:31', '2023-02-15 17:52:44', 'Entregado', 'Contado', 10, 'Productos', NULL, '2023-02-10 00:00:00', NULL),
(77, '2023-03-30 00:00:00', 34, '96000.00', '97824.00', '20543.04', 10, NULL, '1.90', 'SOLARIUM 50X50 CM	36	U (ATERMICOS 100% EDUARDO)\r\n\r\nLAJA SAN JUAN ATERMICO	32	U\r\n\r\nCOLOR BLANCO', '2023-02-06 23:23:06', '2023-03-30 17:40:51', 'Entregado', 'Contado', 5, 'Productos', NULL, '2023-02-07 00:00:00', NULL),
(78, '2023-02-28 00:00:00', 35, '43200.00', '58898.88', '12368.76', 5, NULL, '36.34', 'PISO ADOQUIN MADERA 20x60	12	M2	100 U	......		GRAFITO	2 LTS.	3 BOLSAS', '2023-02-06 23:40:35', '2023-02-28 23:38:37', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-21 00:00:00', NULL),
(79, '2023-02-20 00:00:00', 36, '24500.00', '32124.40', '6746.12', 5, NULL, '31.12', 'FACTURA A	\r\nREV. PIEDRA EKOS 	5	M2	180 U	45 PAQ.		NEGRO+GRAFITO+BORDÓ', '2023-02-07 00:20:32', '2023-02-20 16:37:15', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-15 00:00:00', NULL),
(80, '2023-02-06 00:00:00', 37, '20250.00', '29403.00', '5103.00', 9, NULL, '20.00', 'GREEN BLOCK SIN H° --> 45 U\r\n\r\nFLETE: DIEGO + $5000 (ABONA EN EL DOMICILIO)', '2023-02-07 00:25:33', '2023-02-07 23:19:16', 'Entregado', 'Otros', 11, 'Productos', NULL, '2023-02-07 00:00:00', NULL),
(81, '2023-02-24 00:00:00', 38, '7900.00', '7900.00', '1659.00', 9, NULL, NULL, 'BEIGE + GRAFITO + TERRACOTA (MUESTRA LOCAL)', '2023-02-07 16:20:43', '2023-02-24 17:03:56', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-14 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/8ca14f75-25ee-413e-9bf6-ee6a7c67f91e.jpg\" alt=\"\" /></p>'),
(82, '2023-02-15 00:00:00', 18, '19800.00', '14731.20', '3093.55', 9, NULL, '-25.60', 'RECIBO N° 1781\r\n\r\nDURMIENTE 80X28CM COLOR MARRON CHOCOLATE (LO MAS OSCURO POSIBLE)', '2023-02-07 17:00:44', '2023-02-15 16:53:38', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-08 00:00:00', NULL),
(83, '2023-03-30 00:00:00', 39, '71890.00', '58568.78', '12299.44', 9, NULL, '-18.53', 'PIEDRA LISTON SIN JUNTA	11	M2		88 PAQ		BEIGE\r\n	1 LTS	3 BOLSAS	 \r\n\r\nVITREAUX LATEX INT7EXT CON METACRILATO COLOR CAFE - 1 lt rinde 5 m2	2	LTS		\r\n\r\n CON MANO DE OBRA --> $  158.470,00', '2023-02-07 17:16:30', '2023-03-30 17:47:45', 'Entregado', 'Contado', 10, 'Productos', NULL, '2023-02-14 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/WhatsApp Image 2023-03-04 at 11.41.42.jpeg\" alt=\"\" width=\"541\" height=\"389\" /></p>\r\n<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/WhatsApp Image 2023-03-04 at 11.41.42 (1).jpeg\" alt=\"\" width=\"550\" height=\"377\" /></p>\r\n<p>&nbsp;</p>'),
(84, '2023-03-03 00:00:00', 29, '199540.00', '172123.20', '36145.87', 5, NULL, '-13.74', 'ADOQUIN RECTO GRANDE- COLOR	NEGRO\r\n\r\nPLACA ANTIHUMEDAD - TRAVERSO 26x52 cm	8	M2	60 U	.....		BLANCO\r\n\r\nPIEDRA LISTON SIN JUNTA	COLOR  GRAFITO', '2023-02-07 23:45:37', '2023-03-03 17:09:33', 'Entregado', 'Contado', 6, 'Productos', NULL, '2023-02-08 00:00:00', NULL),
(85, '2023-02-08 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'LOSETAS ATERMICAS PARA PISCINA 6X2.5 M\r\nWAPP SOFIA', '2023-02-08 14:55:40', '2023-02-08 14:55:40', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-10 00:00:00', NULL),
(86, '2023-02-08 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'LOSETAS ATERMICAS PARA PISCINA 6X2.5 M\r\nWAPP SOFIA', '2023-02-08 14:55:40', '2023-02-08 14:55:40', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-10 00:00:00', NULL),
(87, '2023-02-08 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'LOSETAS ATERMICAS PARA PISCINA 6X2.5 M\r\nWAPP SOFIA', '2023-02-08 14:57:51', '2023-02-08 14:57:51', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-08 00:00:00', NULL),
(89, '2023-03-13 00:00:00', 42, '96290.00', '88249.79', '18532.45', 9, NULL, '-8.35', 'MATERIALES\r\n\r\nEKOS 3 TONOS \r\nNEGRO/MARRON/TERRACOTA', '2023-02-08 17:01:20', '2023-03-13 22:25:42', 'Entregado', 'Contado', 10, 'Productos', 1, '2023-03-22 00:00:00', NULL),
(90, '2023-02-08 00:00:00', 43, '50110.00', '50110.00', '10523.10', 9, NULL, NULL, 'UHMA 3 TONOS BAIGE + GRAFITO + TERRACOTA (MUESTRA LOCAL)', '2023-02-09 02:03:53', '2023-02-09 02:03:53', 'Pendiente Entrega', 'Contado', 11, 'Productos', NULL, '2023-02-20 00:00:00', NULL),
(91, '2023-03-10 00:00:00', 44, '77500.00', '77500.00', '16275.00', 9, NULL, NULL, 'M.O. RENOVACION PISOS DE COCINA', '2023-02-09 18:08:58', '2023-03-10 23:06:16', 'Rechazado', 'Contado', 10, 'Productos', NULL, '2023-02-23 00:00:00', NULL),
(92, '2023-02-24 00:00:00', 45, '96000.00', '98736.00', '17136.00', 9, NULL, '-15.00', 'LAJA SAN JUAN COLOR CEMENTO 60 M2 --> 333 U', '2023-02-09 23:42:35', '2023-02-24 15:48:24', 'Rechazado', 'Otros', 10, 'Productos', NULL, '2023-02-23 00:00:00', NULL),
(93, '2022-12-13 00:00:00', 46, '8309400.00', '10054374.00', '1744974.00', 10, NULL, NULL, 'color cemento', '2023-02-10 16:55:33', '2023-02-27 17:53:10', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, '2023-02-13 00:00:00', NULL),
(96, '2023-02-11 00:00:00', 47, '33470.00', '30123.00', '6325.83', 5, NULL, '-10.00', NULL, '2023-02-11 17:46:04', '2023-02-11 17:46:04', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-25 00:00:00', NULL),
(98, '2023-02-13 00:00:00', 48, '64000.00', '57600.00', '12096.00', 5, NULL, '-10.00', NULL, '2023-02-13 03:46:00', '2023-02-13 03:46:54', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-18 00:00:00', NULL),
(99, '2023-02-13 00:00:00', 49, '76910.00', '69219.00', '14535.99', 9, NULL, '-10.00', 'REVEST 1 SOLO COLOR - MODELO A ELECCION\r\n\r\nPEGAM Y CURAD OPCINALES', '2023-02-13 16:24:24', '2023-02-13 16:24:24', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-28 00:00:00', NULL),
(100, '2023-02-18 00:00:00', 50, '19570.00', '17613.00', '3698.73', 9, NULL, '-10.00', 'REVEST SIMIL PIEDRA - 1 COLOR', '2023-02-13 17:57:00', '2023-02-18 15:49:43', 'Rechazado', 'Contado', NULL, 'Productos', NULL, '2023-02-27 00:00:00', NULL),
(101, '2023-03-10 00:00:00', 51, '86010.00', '73108.50', '15352.79', 9, NULL, '-15.00', '1 solo color cualquiera (excepto negro)', '2023-02-13 23:19:29', '2023-03-10 23:42:41', 'Rechazado', 'Contado', NULL, 'Productos', NULL, '2023-02-28 00:00:00', NULL),
(103, '2023-02-24 00:00:00', 53, '90000.00', '76500.00', '16065.00', 9, NULL, '-15.00', 'COLOR MADERA', '2023-02-14 15:30:55', '2023-02-24 15:50:56', 'Rechazado', 'Contado', 11, 'Productos', NULL, '2023-02-28 00:00:00', NULL),
(104, '2023-03-10 00:00:00', 54, '36000.00', '30600.00', '6426.00', 9, NULL, '-15.00', 'COLOR MADERA', '2023-02-14 16:36:12', '2023-03-10 23:43:00', 'Rechazado', 'Contado', 11, 'Productos', NULL, '2023-02-28 00:00:00', NULL),
(105, '2023-03-10 00:00:00', 55, '140000.00', '112000.00', '23520.00', 6, NULL, '-20.00', 'MODELOS VARIOS COLOR CEMENTO: MISMO PRECIO', '2023-02-14 17:01:10', '2023-03-10 23:45:19', 'Rechazado', 'Contado', 9, 'Productos', NULL, '2023-02-14 00:00:00', NULL),
(107, '2023-03-07 00:00:00', 56, '17760.00', '17760.00', '3729.60', 9, NULL, NULL, '60 unidades\r\n\r\nLuz Garcia Redondo \r\nFABIO vino a señar', '2023-02-15 17:32:04', '2023-03-08 00:29:20', 'Entregado', 'Contado', 10, 'Productos', NULL, '2023-02-24 00:00:00', NULL),
(108, '2023-02-15 00:00:00', 58, '36000.00', '30600.00', '6426.00', 5, NULL, '-15.00', NULL, '2023-02-15 18:42:04', '2023-02-15 18:42:04', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-02-24 00:00:00', NULL),
(109, '2023-03-10 00:00:00', 60, '931000.00', '744800.00', '156408.00', 9, NULL, '-20.00', '150 m2 green block vehiculo', '2023-02-16 15:50:24', '2023-03-10 23:47:18', 'Rechazado', 'Contado', NULL, 'Productos', NULL, '2023-04-17 00:00:00', NULL),
(111, '2023-02-16 00:00:00', 61, '12700.00', '12700.00', '2667.00', 9, NULL, NULL, 'EKOS EN STOCK', '2023-02-16 17:42:38', '2023-02-16 17:44:08', 'Entregado', 'Contado', 10, 'Productos', NULL, '2023-02-16 00:00:00', NULL),
(113, '2023-03-13 00:00:00', 62, '185440.00', '157624.00', '33101.04', 9, NULL, '-15.00', NULL, '2023-02-17 00:47:57', '2023-03-13 17:50:08', 'Rechazado', 'Contado', NULL, 'Productos', NULL, '2023-02-16 00:00:00', NULL),
(115, '2023-03-03 00:00:00', 24, '23850.00', '15502.50', '3255.53', 5, NULL, '-35.00', 'PENDIENTES 10 PAQ\r\n\r\nNEGRO + GRAF + TERRAC', '2023-02-17 17:23:24', '2023-03-04 00:52:13', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-17 00:00:00', NULL),
(116, '2023-03-15 00:00:00', 63, '105000.00', '84000.00', '17640.00', 9, NULL, '-20.00', 'MODELO A ELECCION - COLOR CEMENTO', '2023-02-17 22:24:38', '2023-03-15 22:52:49', 'Rechazado', 'Contado', 10, 'Productos', NULL, '2023-03-10 00:00:00', NULL),
(117, '2023-03-10 00:00:00', 64, '1104435.00', '1104435.00', '231931.35', 10, NULL, NULL, NULL, '2023-02-21 16:22:57', '2023-03-10 18:12:28', 'Pendiente Aprobacion', 'Contado', 9, 'Obras', NULL, '2023-02-21 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/February2023/WhatsApp Image 2023-02-21 at 11.05.43.jpeg\" alt=\"\" width=\"271\" height=\"312\" /></p>'),
(118, '2023-03-10 00:00:00', 65, '60800.00', '54720.00', '11491.20', 9, NULL, '-10.00', 'VEREDA / ZONA VEHICULO', '2023-02-21 23:00:57', '2023-03-10 18:01:10', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-07 00:00:00', NULL),
(119, '2023-03-15 00:00:00', 66, '68250.00', '54600.00', '11466.00', 9, NULL, '-20.00', 'MODELO A ELECCION - 1 TONO - NO INCLUYE NEGRO', '2023-02-22 15:28:55', '2023-03-15 22:51:35', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-08 00:00:00', NULL),
(121, '2023-03-10 00:00:00', 34, '2960.00', '3581.60', '621.60', 9, NULL, '0.00', 'GREGORIAN BEIGE - 10 U\r\n\r\nEKOS BEIGE + NARANJA', '2023-02-22 17:11:07', '2023-03-10 16:27:52', 'Entregado', 'Otros', 10, 'Productos', NULL, '2023-03-08 00:00:00', NULL),
(122, '2023-03-10 00:00:00', 67, '35225.00', '28180.00', '5917.80', 9, NULL, '-20.00', 'TRADICIONAL GRAFITO 40 PAQ - \r\n\r\n con descuento .....: $28.000', '2023-02-23 01:33:38', '2023-03-10 17:32:50', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-02-23 00:00:00', NULL),
(123, '2023-03-03 00:00:00', 68, '14200.00', '17182.00', '3608.22', 9, NULL, '21.00', 'ABONA CON TUYA DEBITO\r\n\r\n3 m2 REVEST TRADICONAL GRAFITO + 1/2 LTS CURADOR', '2023-02-23 16:42:13', '2023-03-04 00:26:14', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-02-23 00:00:00', NULL),
(124, '2023-03-10 00:00:00', 69, '93000.00', '74400.00', '15624.00', 9, NULL, '-20.00', 'color ocre viejo - en stock', '2023-02-24 22:59:22', '2023-03-10 17:31:51', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-02-24 00:00:00', NULL),
(125, '2023-03-14 00:00:00', 70, '2200.00', '2200.00', '462.00', 6, NULL, NULL, NULL, '2023-02-25 16:07:32', '2023-03-15 01:49:45', 'Entregado', 'Contado', NULL, 'Productos', NULL, '2023-02-25 00:00:00', NULL),
(126, '2023-03-10 00:00:00', 71, '108000.00', '86400.00', '18144.00', 9, NULL, '-20.00', 'COLOR MADERA', '2023-02-27 15:12:05', '2023-03-10 17:28:19', 'Rechazado', 'Contado', 11, NULL, NULL, '2023-03-13 00:00:00', NULL),
(127, '2023-02-27 00:00:00', 72, '82000.00', '69700.00', '14637.00', 9, NULL, '-15.00', NULL, '2023-02-27 16:44:48', '2023-02-27 16:44:48', 'Pendiente Aprobacion', 'Contado', 11, NULL, NULL, '2023-03-13 00:00:00', NULL),
(128, '2023-02-27 00:00:00', 73, '98000.00', '83300.00', '17493.00', 9, NULL, '-15.00', NULL, '2023-02-27 17:02:18', '2023-02-28 01:20:58', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-06 00:00:00', NULL),
(129, '2023-03-24 00:00:00', 74, '123270.00', '92082.69', '19337.36', 9, NULL, '-25.30', 'PIEDRA LISTON CON JUNTA - 3 TONOS	\r\nGRAFITO + GRAF OSC + CEMENTO', '2023-02-28 17:21:39', '2023-03-24 23:55:40', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-06 00:00:00', NULL),
(130, '2023-02-28 00:00:00', 70, '2368.00', '2368.00', '497.28', 10, NULL, NULL, NULL, '2023-02-28 17:34:35', '2023-02-28 17:38:48', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-02-27 00:00:00', NULL),
(131, '2023-03-03 00:00:00', 34, '3006.00', '3006.00', '631.26', 9, NULL, '0.00', NULL, '2023-03-01 00:41:11', '2023-03-03 17:08:57', 'Entregado', 'Contado', 10, NULL, NULL, '2023-03-01 00:00:00', NULL),
(132, '2023-02-28 00:00:00', NULL, NULL, NULL, '0.00', 9, NULL, '-10.00', '2 TONOS MARRONES', '2023-03-01 01:11:31', '2023-03-01 01:11:31', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-03-07 00:00:00', NULL),
(133, '2023-03-15 00:00:00', 75, '15640.00', '14076.00', '2955.96', 9, NULL, '-10.00', '2 TONOS MARRONES', '2023-03-01 01:15:55', '2023-03-15 22:49:24', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-07 00:00:00', NULL),
(134, '2023-03-15 00:00:00', 75, '11320.00', '11320.00', '2377.20', 9, NULL, NULL, 'COLOR MADERA', '2023-03-01 01:20:20', '2023-03-15 22:49:09', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-07 00:00:00', NULL),
(135, '2023-03-04 00:00:00', 76, '50468.00', '45421.20', '9538.45', 9, NULL, '-10.00', NULL, '2023-03-01 23:02:27', '2023-03-04 17:23:37', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-08 00:00:00', NULL),
(136, '2023-03-30 00:00:00', 77, '60300.00', '51194.70', '10750.89', 9, NULL, '-15.10', 'con descuento .....: $51,200 EFECTIVO', '2023-03-01 23:46:15', '2023-03-30 18:05:54', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-06 00:00:00', NULL),
(137, '2023-03-07 00:00:00', 78, '81610.00', '73449.00', '15424.29', 9, NULL, '-10.00', 'MATERIALES', '2023-03-02 17:01:54', '2023-03-08 00:39:02', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(138, '2023-03-07 00:00:00', 78, '124600.00', '124600.00', '26166.00', 9, NULL, NULL, 'MANO DE OBRA', '2023-03-02 17:11:54', '2023-03-08 00:38:38', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(139, '2023-03-07 00:00:00', 78, '11210.00', '11210.00', '2354.10', 9, NULL, NULL, 'MATERIALES 2', '2023-03-02 17:25:07', '2023-03-08 00:38:18', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(140, '2023-03-10 00:00:00', 79, '111150.00', '94477.50', '19840.28', 9, NULL, '-15.00', NULL, '2023-03-02 23:23:29', '2023-03-10 23:05:54', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-16 00:00:00', NULL),
(142, '2023-03-07 00:00:00', 80, '28000.00', '28000.00', '5880.00', 9, NULL, NULL, 'MANO DE OBRA', '2023-03-03 01:38:40', '2023-03-08 00:37:45', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-09 00:00:00', NULL),
(143, '2023-03-23 00:00:00', 82, '61540.00', '54998.30', '11549.64', 5, NULL, '-10.63', 'PENDIENTE 10 PAQ\r\n\r\nCOLORES MARFIL+TERRACOTA (solo 2 tonos)\r\ndice 3 tonos antes pero solo son 2 tonos.\r\nquedo asi porque la señora se decidio a ultimo momento. queda el mismo presup.', '2023-03-03 15:13:45', '2023-03-23 16:28:48', 'Entregado', 'Contado', 9, NULL, 2, '2023-03-23 00:00:00', NULL),
(145, '2023-03-30 00:00:00', 83, '9720.00', '9603.36', '2016.71', 9, NULL, '-1.20', 'grafito medio + cemento\r\n(muestra en anexo)', '2023-03-04 17:32:15', '2023-03-30 18:09:15', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-10 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/WhatsApp Image 2023-03-03 at 19.34.31.jpeg\" alt=\"ekos grafito medio + cemento + blanco?\" width=\"280\" height=\"498\" /></p>'),
(146, '2023-03-04 00:00:00', 84, '24670.00', '22203.00', '4662.63', 5, NULL, '-10.00', NULL, '2023-03-04 19:34:37', '2023-03-04 19:34:37', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-03-10 00:00:00', NULL),
(147, '2023-03-27 00:00:00', 86, '70900.00', '56720.00', '11911.20', 9, NULL, '-20.00', 'PENDIENTE SOLO CURADOR 4 LTS', '2023-03-06 18:28:58', '2023-03-27 15:55:44', 'Pendiente Entrega', 'Contado', 10, NULL, NULL, '2023-03-20 00:00:00', NULL),
(148, '2023-03-15 00:00:00', 87, '96250.00', '77000.00', '16170.00', 9, NULL, '-20.00', NULL, '2023-03-06 23:10:25', '2023-03-15 22:49:51', 'Rechazado', 'Contado', 11, NULL, NULL, '2023-03-20 00:00:00', NULL),
(149, '2023-03-13 00:00:00', 88, '238650.00', '238650.00', '50116.50', 9, NULL, NULL, NULL, '2023-03-07 00:52:42', '2023-03-13 23:20:06', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-20 00:00:00', NULL),
(150, '2023-03-09 00:00:00', 89, '1100.00', '990.00', '207.90', 9, NULL, '-10.00', NULL, '2023-03-07 01:03:31', '2023-03-09 17:44:25', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-20 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/2acef14d-ba53-4fa1-a779-a04ab9cbe8a0.jpg\" alt=\"\" width=\"287\" height=\"219\" /></p>'),
(151, '2023-03-21 00:00:00', 89, '47700.00', '47700.00', '10017.00', 9, NULL, NULL, 'MANO DE OBRA', '2023-03-07 01:19:39', '2023-03-21 18:06:38', 'Pendiente Entrega', 'Contado', 10, 'Obras', NULL, '2023-03-20 00:00:00', NULL),
(152, '2023-03-16 00:00:00', 91, '55800.00', '45298.44', '9512.67', 9, NULL, '-18.82', 'ENTREGADO 100 U --> 16 M2', '2023-03-07 14:59:56', '2023-03-16 15:51:29', 'Pendiente Entrega', 'Contado', 10, NULL, NULL, '2023-03-21 00:00:00', NULL),
(153, '2023-03-10 00:00:00', 70, '7150.00', '7150.00', '1501.50', 9, NULL, NULL, 'SOLEDAD', '2023-03-07 15:23:32', '2023-03-10 16:22:25', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-01 00:00:00', NULL),
(154, '2023-03-10 00:00:00', 92, '4650.00', '4650.00', '976.50', 9, NULL, NULL, 'MARRON ROJIZO', '2023-03-07 16:03:19', '2023-03-10 16:52:56', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-08 00:00:00', NULL),
(155, '2023-03-07 00:00:00', 35, '6000.00', '6000.00', '1260.00', 9, NULL, NULL, NULL, '2023-03-07 16:21:19', '2023-03-07 16:21:19', 'Entregado', 'Contado', 5, NULL, NULL, '2023-03-07 00:00:00', NULL),
(156, '2023-03-07 00:00:00', 93, '28800.00', '25920.00', '5443.20', 9, NULL, '-10.00', 'COLOR MADERA', '2023-03-07 17:02:28', '2023-03-08 00:12:41', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-03-07 00:00:00', NULL),
(157, '2023-03-07 00:00:00', 91, '10800.00', '10800.00', '2268.00', 9, NULL, NULL, 'COLOR MARRON ROJIZO', '2023-03-07 23:19:35', '2023-03-07 23:22:00', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-10 00:00:00', NULL),
(158, '2023-03-17 00:00:00', 94, '23490.00', '23490.00', '4932.90', 9, NULL, NULL, 'PLACAS + PEGAMENTO + SELLADOR + TORNILLOS\r\n\r\nPENDIENTE SOLO MOLDURAS', '2023-03-08 00:07:19', '2023-03-18 00:37:29', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-08 00:00:00', NULL),
(159, '2023-03-09 00:00:00', 95, '4550.00', '4550.00', '955.50', 9, NULL, NULL, 'COLOR GRAFITO', '2023-03-08 16:35:42', '2023-03-10 00:13:52', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-09 00:00:00', NULL),
(160, '2023-03-09 00:00:00', 89, '1100.00', '990.00', '207.90', 9, NULL, '-10.00', 'TRADICIONAL COLOR GRAFITO', '2023-03-08 22:45:49', '2023-03-09 17:44:45', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-22 00:00:00', NULL),
(161, '2023-03-20 00:00:00', 96, '36025.00', '32422.50', '6808.73', 9, NULL, '-10.00', 'MATERIALES', '2023-03-09 15:14:52', '2023-03-20 16:00:53', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(162, '2023-03-15 00:00:00', 97, '11375.00', '13763.75', '2388.75', 9, NULL, NULL, 'COLOR BEIGE CLARITO / MARFIL', '2023-03-09 15:33:50', '2023-03-15 16:44:56', 'Entregado', 'Otros', NULL, NULL, NULL, '2023-03-16 00:00:00', NULL),
(163, '2023-03-09 00:00:00', 70, '1325.00', '1325.00', '278.25', 9, NULL, NULL, 'RETIRA STOCK JORGE SANCHEZ', '2023-03-09 16:30:55', '2023-03-09 23:29:26', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-03 00:00:00', NULL),
(164, '2023-03-20 00:00:00', 98, '43750.00', '35000.00', '7350.00', 9, NULL, '-20.00', 'modelo y color a eleccion', '2023-03-09 17:03:18', '2023-03-20 16:02:54', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-16 00:00:00', NULL),
(165, '2023-03-10 00:00:00', 89, '54415.00', '48973.50', '10284.44', 9, NULL, '-10.00', 'color grafito oscuro - MUESTRA LOCAL', '2023-03-09 17:30:12', '2023-03-10 15:39:49', 'Pendiente Entrega', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(166, '2023-03-09 00:00:00', 70, '3300.00', '3300.00', '693.00', 10, NULL, NULL, 'ROSELA VECINA', '2023-03-09 23:27:15', '2023-03-09 23:27:15', 'Entregado', 'Contado', 9, NULL, NULL, '2023-03-09 00:00:00', NULL),
(167, '2023-03-17 00:00:00', 70, '8340.00', '8340.00', '1751.40', 9, NULL, NULL, 'DANIEL PIANTAMIDA', '2023-03-10 00:14:07', '2023-03-17 16:56:54', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-09 00:00:00', NULL),
(168, '2023-03-20 00:00:00', 98, '66500.00', '53200.00', '11172.00', 9, NULL, '-20.00', NULL, '2023-03-10 17:21:39', '2023-03-20 16:02:41', 'Rechazado', 'Contado', NULL, NULL, NULL, '2023-03-10 00:00:00', NULL),
(169, '2023-03-10 00:00:00', 56, '7104.00', '7104.00', '1491.84', 9, NULL, NULL, 'PENDIENTES 12 /24 podtactiles', '2023-03-11 00:30:16', '2023-03-11 00:30:16', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-11 00:00:00', NULL),
(170, '2023-03-20 00:00:00', 96, '117000.00', '74880.00', '15724.80', 9, NULL, '-36.00', 'MANO DE OBRA', '2023-03-11 01:37:20', '2023-03-20 16:00:40', 'Rechazado', 'Contado', 10, NULL, NULL, '2023-03-17 00:00:00', NULL),
(171, '2023-03-11 00:00:00', 99, '56170.00', '56170.00', '11795.70', 6, NULL, NULL, NULL, '2023-03-11 17:28:02', '2023-03-11 17:28:02', 'Pendiente Aprobacion', 'Contado', NULL, 'Pisos', NULL, NULL, NULL),
(172, '2023-03-20 00:00:00', 101, '1161000.00', '928800.00', '195048.00', 6, NULL, '-20.00', NULL, '2023-03-11 18:42:27', '2023-03-20 15:22:46', 'Rechazado', 'Contado', 9, NULL, NULL, '2023-03-11 00:00:00', NULL),
(173, '2023-03-15 00:00:00', 88, '241400.00', '217260.00', '45624.60', 9, NULL, '-10.00', NULL, '2023-03-13 18:12:48', '2023-03-15 15:14:59', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-20 00:00:00', NULL),
(174, '2023-03-13 00:00:00', 102, '9650.00', '9650.00', '2026.50', 9, NULL, NULL, NULL, '2023-03-13 22:58:02', '2023-03-13 22:58:28', 'Pendiente Aprobacion', 'Contado', 11, NULL, NULL, '2023-03-20 00:00:00', NULL),
(175, '2022-02-12 00:00:00', 103, '96770.00', '96770.00', '20321.70', 9, NULL, NULL, 'UHMA BEIGE+TERRACOTA+GRAFITO\r\n\r\nCIRCULAR CHICO BEIGE\r\n\r\nSALDO CANCELADO EN 2022', '2023-03-15 15:30:53', '2023-03-17 00:47:38', 'Pendiente Entrega', 'Contado', 10, NULL, NULL, '2023-03-29 00:00:00', NULL),
(176, '2023-03-16 00:00:00', 42, '73550.00', '73550.00', '15445.50', 9, NULL, NULL, 'MANO DE OBRA', '2023-03-16 00:34:05', '2023-03-17 01:18:06', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-03-16 00:00:00', NULL),
(178, '2023-03-16 00:00:00', 104, '139500.00', '97650.00', '20506.50', 5, NULL, '-30.00', NULL, '2023-03-16 19:53:46', '2023-03-16 19:53:46', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, '2023-03-23 00:00:00', NULL),
(179, '2023-03-16 00:00:00', 105, '212570.00', '191313.00', '40175.73', 6, NULL, '-10.00', NULL, '2023-03-16 22:42:10', '2023-03-16 22:42:10', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, NULL, NULL),
(180, '2023-04-01 00:00:00', 106, '99900.00', '78711.21', '16529.35', 9, NULL, '-21.21', 'pendiente entrega con adrian modelo\r\n\r\npendiente relevamiento\r\n\r\nCOLOR GRAFITO - PAGA 50MIL CON TUYA --> $60500', '2023-03-17 01:15:53', '2023-04-01 17:57:50', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-30 00:00:00', NULL),
(181, '2023-03-20 00:00:00', 108, '264000.00', '255552.00', '44352.00', NULL, NULL, '-20.00', NULL, '2023-03-17 17:53:49', '2023-03-20 15:05:53', 'Pendiente Aprobacion', 'Otros', NULL, NULL, NULL, '2023-03-31 00:00:00', NULL),
(182, '2023-03-20 00:00:00', 109, '54600.00', '49140.00', '10319.40', 9, NULL, '-10.00', 'COLOR BEIGE CLARITO', '2023-03-20 15:42:14', '2023-03-20 15:42:14', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-04-03 00:00:00', NULL),
(183, '2023-03-23 00:00:00', 110, '19140.00', '16998.23', '3569.63', 9, NULL, '-11.19', NULL, '2023-03-21 01:07:19', '2023-03-23 16:30:00', 'Entregado', 'Contado', 11, NULL, 3, '2023-03-23 00:00:00', NULL),
(184, '2023-03-21 00:00:00', 111, '10800.00', '10800.00', '2268.00', 9, NULL, NULL, 'COLOR GRAFITO MEDIO (TIPO LA SAN LUIS DE MUESTRARIO EN EL LOCAL)', '2023-03-21 15:09:22', '2023-03-21 15:12:21', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-03-24 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/IMG-20190322-WA0019.jpg\" alt=\"\" width=\"332\" height=\"367\" /></p>'),
(185, '2023-03-27 00:00:00', 112, '34125.00', '30712.50', '6449.63', 9, NULL, '-10.00', '2 m2 color GRAFITO\r\n5.5 m2 color BEIGE', '2023-03-21 18:17:14', '2023-03-27 17:41:15', 'Pendiente Aprobacion', 'Contado', 11, NULL, NULL, '2023-04-04 00:00:00', NULL),
(186, '2023-03-22 00:00:00', 113, '5200.00', '6000.80', '1260.17', 9, NULL, '15.40', 'COLOR BLANCO', '2023-03-22 02:04:53', '2023-03-23 00:23:17', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-22 00:00:00', NULL),
(187, '2023-03-22 00:00:00', 114, '195300.00', '175770.00', '36911.70', 9, NULL, '-10.00', 'MANO DE OBRA EXTERIOR -  PARED MEDIANERA', '2023-03-22 15:13:01', '2023-03-22 15:13:02', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-04-05 00:00:00', NULL),
(188, '2023-03-22 00:00:00', 114, '66150.00', '59535.00', '12502.35', 9, NULL, '-10.00', 'MANO DE OBRA INTERIOR - PAREDES COCINA', '2023-03-22 15:20:04', '2023-03-22 15:20:04', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-03-29 00:00:00', NULL),
(189, '2023-03-22 00:00:00', 114, '71300.00', '71300.00', '14973.00', 9, NULL, NULL, 'MATERIALES P/ EXTERIOR 31 M2\r\n\r\nREVOQUE FORMA VERTICAL - COLOR GRAFITO', '2023-03-22 15:46:20', '2023-03-22 15:55:10', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-03-29 00:00:00', NULL),
(190, '2023-03-22 00:00:00', 114, '34300.00', '34300.00', '7203.00', 9, NULL, NULL, 'MATERIALES P/ INTERIOR\r\n\r\nREVOQUE FORMA VERTICAL - COLOR GRAFITO', '2023-03-22 15:51:41', '2023-03-22 17:27:55', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-03-29 00:00:00', NULL),
(191, '2023-03-22 00:00:00', 114, '34300.00', '34300.00', '7203.00', 9, NULL, NULL, 'MATERIALES P/ INTERIRO 10.5 M2\r\n\r\nREVOQUE FORMA VERTICAL - COLOR GRAFITO', '2023-03-22 15:54:48', '2023-03-22 15:54:48', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-03-29 00:00:00', NULL),
(192, '2023-03-22 00:00:00', 115, '72800.00', '65003.12', '13650.66', 9, NULL, '-10.71', 'COLOR CEMENTO O BEIGE CLARO', '2023-03-23 01:50:02', '2023-03-23 01:50:02', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-03-29 00:00:00', NULL),
(193, '2023-03-30 00:00:00', 116, '65600.00', '63500.80', '11020.80', 9, NULL, '-20.00', NULL, '2023-03-23 15:28:38', '2023-03-30 17:02:22', 'Rechazado', 'Otros', NULL, NULL, NULL, '2023-03-30 00:00:00', NULL),
(194, '2023-03-24 00:00:00', 74, '53150.00', '51449.20', '8929.20', 9, NULL, '-20.00', NULL, '2023-03-24 17:08:28', '2023-03-24 17:21:13', 'Pendiente Entrega', 'Otros', NULL, NULL, NULL, '2023-03-24 00:00:00', NULL),
(195, '2023-03-30 00:00:00', 74, '5300.00', '5300.00', '1113.00', 9, NULL, NULL, 'STOCK \r\nGRAFITO+OSCURO+CEMENTO', '2023-03-24 17:49:10', '2023-03-30 16:46:19', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-03-24 00:00:00', NULL),
(196, '2023-03-27 00:00:00', 21, '0.00', '0.00', '0.00', 10, NULL, NULL, NULL, '2023-03-27 22:08:10', '2023-03-27 22:08:10', 'Pendiente Aprobacion', 'Contado', 9, NULL, NULL, '2023-03-27 00:00:00', NULL),
(197, '2023-03-27 00:00:00', 21, '833000.00', '708050.00', '148690.50', 10, NULL, '-15.00', NULL, '2023-03-27 22:09:15', '2023-03-27 22:09:15', 'Pendiente Aprobacion', 'Contado', 9, NULL, NULL, '2023-03-27 00:00:00', NULL),
(198, '2023-03-27 00:00:00', 117, '73800.00', '78671.54', '13653.74', 5, NULL, '-11.90', '78650 CON TUYA EN 10 CUOTAS', '2023-03-28 02:04:04', '2023-03-28 02:06:58', 'Pendiente Entrega', 'Otros', 9, NULL, NULL, '2023-04-07 00:00:00', NULL),
(199, '2023-03-28 00:00:00', 34, '60500.00', '73205.00', '12705.00', 9, NULL, NULL, NULL, '2023-03-28 18:03:21', '2023-03-28 18:03:21', 'Pendiente Aprobacion', 'Otros', 10, NULL, NULL, '2023-04-04 00:00:00', NULL),
(200, '2023-03-28 00:00:00', 118, '1095000.00', '1059960.00', '183960.00', 9, NULL, '-20.00', NULL, '2023-03-28 22:32:37', '2023-03-28 22:32:37', 'Pendiente Aprobacion', 'Otros', 10, NULL, NULL, '2023-04-04 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/WhatsApp Image 2023-01-18 at 09.45.37.jpeg\" alt=\"\" width=\"277\" height=\"367\" /></p>'),
(201, '2023-03-29 00:00:00', 118, '963600.00', '886126.56', '153790.56', 9, NULL, '-24.00', NULL, '2023-03-28 22:36:14', '2023-03-29 15:32:14', 'Pendiente Aprobacion', 'Otros', 10, NULL, NULL, '2023-04-04 00:00:00', '<p><img src=\"http://c1561704.ferozo.com/persia/public//storage/nota-pedidos/March2023/Screenshot_20210512-130816.png\" alt=\"\" width=\"296\" height=\"223\" /></p>'),
(202, '2023-03-29 00:00:00', 119, '5610.00', '5610.00', '1178.10', 9, NULL, NULL, 'BASE MARRON + GIRASOL (KEBRACHO ES LA MUESTRA)', '2023-03-29 17:19:00', '2023-03-29 17:19:00', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-04-03 00:00:00', NULL),
(203, '2023-04-01 00:00:00', 120, '44450.00', '43027.60', '7467.60', 6, NULL, '-20.00', 'color girazol - como el kebracho', '2023-04-01 00:45:21', '2023-04-01 15:41:52', 'Pendiente Entrega', 'Otros', 9, NULL, NULL, '2023-04-05 00:00:00', '<p><img src=\"blob:https://web.whatsapp.com/5a5958f5-5718-4450-80f8-9df0b410d07c\" alt=\"\" /></p>'),
(204, '2023-04-01 00:00:00', 121, '18600.00', '22506.00', '3906.00', 9, NULL, NULL, 'COLOR A ELECCION (EXCEPTO NEGRO O BLANCO)', '2023-04-01 15:51:46', '2023-04-01 15:51:46', 'Pendiente Aprobacion', 'Otros', NULL, NULL, NULL, '2023-04-01 00:00:00', NULL),
(205, '2023-04-01 00:00:00', NULL, NULL, NULL, '0.00', 9, NULL, NULL, '8 PLACAS SOLAS PARA CIELORRASO', '2023-04-01 18:01:12', '2023-04-01 18:01:12', 'Pendiente Entrega', 'Contado', NULL, NULL, NULL, '2023-04-01 00:00:00', NULL),
(206, '2023-04-04 00:00:00', 122, '10368.00', '10368.00', '2177.28', 9, NULL, NULL, '8 PLACAS SOLAS PARA CIELORRASO', '2023-04-01 18:01:53', '2023-04-04 15:36:27', 'Entregado', 'Contado', NULL, NULL, NULL, '2023-04-01 00:00:00', NULL),
(207, '2023-04-03 00:00:00', 123, '152000.00', '164608.40', '28568.40', 9, NULL, '-10.50', NULL, '2023-04-03 22:28:13', '2023-04-03 22:28:13', 'Pendiente Aprobacion', 'Otros', NULL, NULL, NULL, '2023-04-17 00:00:00', NULL),
(208, '2023-04-03 00:00:00', 124, '39200.00', '41744.90', '7244.98', NULL, NULL, '-11.99', NULL, '2023-04-03 23:10:15', '2023-04-03 23:10:35', 'Pendiente Aprobacion', 'Otros', NULL, NULL, NULL, '2023-04-17 00:00:00', NULL),
(209, '2023-04-03 00:00:00', 74, '29100.00', '35211.00', '6111.00', 9, NULL, NULL, NULL, '2023-04-04 01:13:48', '2023-04-04 01:13:48', 'Pendiente Entrega', 'Otros', NULL, NULL, NULL, '2023-04-10 00:00:00', NULL),
(210, '2023-04-04 00:00:00', 106, '248400.00', '248400.00', '52164.00', 9, NULL, NULL, 'MANO DE OBRA', '2023-04-04 15:53:08', '2023-04-04 15:53:09', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-04-11 00:00:00', NULL),
(211, '2023-04-04 00:00:00', 106, '34280.00', '34280.00', '7198.80', 9, NULL, NULL, 'MATERIALES', '2023-04-04 15:57:34', '2023-04-04 15:57:34', 'Pendiente Aprobacion', 'Contado', 10, NULL, NULL, '2023-04-11 00:00:00', NULL),
(212, '2023-04-04 00:00:00', 125, '73080.00', '73080.00', '15346.80', 9, NULL, NULL, NULL, '2023-04-04 16:41:42', '2023-04-04 16:41:42', 'Pendiente Aprobacion', 'Contado', NULL, NULL, NULL, '2023-04-06 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_fabricacion`
--

CREATE TABLE `ordenes_fabricacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_orden` datetime DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_entrada_proceso` datetime DEFAULT NULL,
  `fecha_salida_proceso` datetime DEFAULT NULL,
  `id_producto` bigint(20) UNSIGNED DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `id_pedido` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ordenes_fabricacion`
--

INSERT INTO `ordenes_fabricacion` (`id`, `fecha_orden`, `observaciones`, `estado`, `fecha_entrada_proceso`, `fecha_salida_proceso`, `id_producto`, `cantidad`, `id_pedido`, `created_at`, `updated_at`) VALUES
(71, '2023-02-01 00:00:00', NULL, 'En Proceso', NULL, NULL, 15, '1.00', 55, NULL, '2023-02-03 17:21:25'),
(72, '2023-02-03 00:00:00', NULL, 'Entregado', '2023-02-13 00:00:00', '2023-02-17 00:00:00', 49, '13.00', 61, NULL, '2023-02-21 17:34:52'),
(74, '2023-02-03 00:00:00', NULL, 'Entregado', '2023-02-01 00:00:00', '2023-02-03 00:00:00', 50, '4.00', 67, NULL, '2023-02-06 17:44:54'),
(75, '2023-02-03 00:00:00', 'tal vez falten 4 o 6 paquetes mas', 'Entregado', '2023-02-13 00:00:00', '2023-02-14 00:00:00', 54, '1.50', 68, NULL, '2023-02-16 01:55:06'),
(77, '2023-02-03 00:00:00', NULL, 'Entregado', '2023-01-30 00:00:00', '2023-02-13 00:00:00', 105, '333.00', 73, NULL, '2023-03-02 22:57:38'),
(78, '2023-02-03 00:00:00', NULL, 'En Proceso', '2022-12-26 00:00:00', '2023-04-12 00:00:00', 17, '300.00', 74, NULL, '2023-02-22 14:47:19'),
(79, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-02-06 00:00:00', '2023-02-08 00:00:00', 46, '10.00', 65, NULL, '2023-02-17 15:29:19'),
(80, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-02-14 00:00:00', '2023-02-15 00:00:00', 62, '1.00', 65, NULL, '2023-02-17 15:30:11'),
(82, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-02-07 00:00:00', '2023-02-09 00:00:00', 54, '4.50', 75, NULL, '2023-02-13 23:35:21'),
(83, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-01-30 00:00:00', '2023-02-07 00:00:00', 29, '60.00', 76, NULL, '2023-02-07 23:12:29'),
(84, '2023-02-06 00:00:00', NULL, 'Entregado', NULL, NULL, 92, '32.00', 77, NULL, '2023-02-07 23:10:14'),
(85, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-02-22 00:00:00', '2023-02-27 00:00:00', 38, '12.00', 78, NULL, '2023-03-02 23:11:55'),
(86, '2023-02-06 00:00:00', NULL, 'Entregado', '2023-02-06 00:00:00', '2023-02-14 00:00:00', 55, '5.00', 79, NULL, '2023-02-17 15:30:46'),
(87, '2023-02-06 00:00:00', NULL, 'Entregado', NULL, NULL, 40, '45.00', 80, NULL, '2023-02-07 16:04:35'),
(88, '2023-02-07 00:00:00', NULL, 'Entregado', '2023-02-21 00:00:00', '2023-02-22 00:00:00', 58, '1.50', 81, NULL, '2023-02-27 16:04:19'),
(89, '2023-02-07 00:00:00', NULL, 'Entregado', '2023-02-06 00:00:00', '2023-02-08 00:00:00', 46, '6.00', 82, NULL, '2023-02-15 16:49:57'),
(90, '2023-02-07 00:00:00', 'grafito', 'Entregado', '2023-02-22 00:00:00', '2023-02-28 00:00:00', 50, '11.00', 83, NULL, '2023-03-08 23:45:52'),
(91, '2023-02-08 00:00:00', NULL, 'Empaquetado y controlado', '2023-02-22 00:00:00', '2023-03-23 00:00:00', 58, '8.00', 90, NULL, '2023-03-08 23:47:03'),
(92, '2023-02-09 00:00:00', NULL, 'Entregado', '2023-02-08 00:00:00', '2023-02-14 00:00:00', 113, '45.00', 84, NULL, '2023-03-02 22:59:05'),
(93, '2023-02-09 00:00:00', NULL, 'Entregado', '2023-02-01 00:00:00', '2023-02-14 00:00:00', 50, '16.00', 84, NULL, '2023-03-02 23:10:12'),
(95, '2023-02-09 00:00:00', NULL, 'Entregado', '2023-02-22 00:00:00', '2023-03-02 00:00:00', 126, '13.50', 89, NULL, '2023-03-22 16:28:46'),
(96, '2023-02-10 00:00:00', NULL, 'En Proceso', '2023-01-02 00:00:00', '2023-03-20 00:00:00', 127, '274.00', 93, NULL, '2023-02-22 15:10:33'),
(97, '2023-02-10 00:00:00', NULL, 'En Proceso', NULL, NULL, 40, '11500.00', 93, NULL, '2023-02-14 14:39:12'),
(98, '2023-02-10 00:00:00', NULL, 'En Proceso', NULL, NULL, 128, '191.00', 93, NULL, '2023-02-14 15:18:23'),
(102, '2023-02-15 11:03:16', NULL, 'Pendiente', NULL, NULL, 49, '9.50', 71, NULL, NULL),
(104, '2023-02-15 00:00:00', NULL, 'Entregado', '2023-02-28 00:00:00', NULL, 150, '9.60', 107, NULL, '2023-03-08 23:48:23'),
(105, '2023-02-17 00:00:00', NULL, 'Entregado', '2023-01-24 00:00:00', '2023-01-27 00:00:00', 45, '9.00', 28, NULL, '2023-03-01 23:09:07'),
(106, '2023-02-23 00:00:00', NULL, 'Entregado', '2023-02-24 00:00:00', '2023-02-23 00:00:00', 50, '3.00', 123, NULL, '2023-02-27 16:47:42'),
(108, '2023-02-23 00:00:00', NULL, 'Entregado', '2023-02-23 00:00:00', '2023-02-23 00:00:00', 50, '3.00', 123, NULL, '2023-02-23 17:41:20'),
(109, '2023-02-28 00:00:00', NULL, 'Entregado', NULL, NULL, 47, '4.00', 129, NULL, '2023-03-22 16:33:06'),
(110, '2023-02-28 00:00:00', NULL, 'Entregado', '2023-02-27 00:00:00', '2023-02-27 00:00:00', 147, '1.28', 130, NULL, '2023-02-28 17:39:33'),
(111, '2023-02-28 00:00:00', NULL, 'Entregado', '2023-02-28 00:00:00', '2023-03-03 00:00:00', 54, '3.50', 121, NULL, '2023-03-08 23:46:20'),
(112, '2023-02-28 00:00:00', NULL, 'Entregado', '2023-02-28 00:00:00', '2023-03-02 00:00:00', 143, '1.60', 121, NULL, '2023-03-01 23:10:07'),
(114, '2023-03-01 00:00:00', NULL, 'Entregado', '2023-03-01 00:00:00', '2023-03-01 00:00:00', 179, '3.00', 131, NULL, '2023-03-02 23:13:08'),
(115, '2023-03-01 00:00:00', NULL, 'Entregado', NULL, NULL, 40, '30.00', 136, NULL, '2023-03-06 16:26:15'),
(116, '2023-03-01 00:00:00', NULL, 'Entregado', NULL, NULL, 41, '60.00', 136, NULL, '2023-03-06 16:20:11'),
(122, '2023-03-04 00:00:00', NULL, 'Entregado', '2023-03-06 00:00:00', '2023-03-10 00:00:00', 151, '24.00', 135, NULL, '2023-03-22 16:35:46'),
(123, '2023-03-04 00:00:00', NULL, 'Entregado', '2023-03-06 00:00:00', '2023-03-10 00:00:00', 150, '1.28', 135, NULL, '2023-03-22 16:39:35'),
(124, '2023-03-04 00:00:00', NULL, 'Entregado', '2023-03-06 00:00:00', '2023-03-10 00:00:00', 152, '2.00', 135, NULL, '2023-03-22 16:38:11'),
(125, '2023-03-04 00:00:00', NULL, 'Entregado', '2023-03-13 00:00:00', '2023-03-13 00:00:00', 54, '2.00', 145, NULL, '2023-03-13 17:50:33'),
(126, '2023-03-07 00:00:00', NULL, 'Entregado', '2023-03-09 00:00:00', '2023-03-17 00:00:00', 55, '10.00', 143, NULL, '2023-03-23 16:31:50'),
(127, '2023-03-07 00:00:00', NULL, 'Entregado', '2023-03-06 00:00:00', '2023-03-15 00:00:00', 33, '30.00', 152, NULL, '2023-03-22 17:19:02'),
(128, '2023-03-07 00:00:00', NULL, 'Entregado', '2023-03-22 00:00:00', '2023-03-22 00:00:00', 45, '1.00', 154, NULL, '2023-03-22 17:11:02'),
(129, '2023-03-07 00:00:00', NULL, 'Entregado', NULL, NULL, 45, '2.00', 157, NULL, '2023-03-22 17:12:10'),
(130, '2023-03-07 00:00:00', NULL, 'Entregado', NULL, NULL, 196, '1.00', 157, NULL, '2023-03-23 16:40:06'),
(132, '2023-03-08 00:00:00', NULL, 'Entregado', NULL, NULL, 50, '1.00', 159, NULL, '2023-03-08 23:53:25'),
(133, '2023-03-09 00:00:00', NULL, 'En Proceso', '2023-03-09 00:00:00', '2023-03-15 00:00:00', 59, '2.50', 162, NULL, '2023-03-10 00:29:36'),
(134, '2023-03-09 00:00:00', NULL, 'Entregado', '2023-03-10 00:00:00', '2023-03-17 00:00:00', 49, '8.50', 165, NULL, '2023-03-22 17:13:07'),
(135, '2023-03-09 00:00:00', NULL, 'Entregado', NULL, NULL, 102, '3.00', 165, NULL, '2023-03-22 16:42:06'),
(137, '2023-03-10 00:00:00', NULL, 'Entregado', '2023-03-10 00:00:00', '2023-03-10 00:00:00', 150, '3.84', 169, NULL, '2023-03-13 17:56:12'),
(138, '2023-03-13 00:00:00', NULL, 'Entregado', NULL, NULL, 17, '38.00', 147, NULL, '2023-03-22 16:40:21'),
(139, '2023-03-15 00:00:00', NULL, 'En Proceso', '2023-03-20 00:00:00', '2023-04-11 00:00:00', 206, '140.00', 173, NULL, '2023-03-22 17:02:13'),
(140, '2023-03-15 09:15:23', NULL, 'Pendiente', NULL, NULL, 207, '50.00', 173, NULL, NULL),
(142, '2023-03-15 09:31:20', NULL, 'Pendiente', NULL, NULL, 58, '7.00', 175, NULL, NULL),
(143, '2023-03-15 09:31:20', NULL, 'Pendiente', NULL, NULL, 142, '19.00', 175, NULL, NULL),
(144, '2023-03-15 09:31:20', NULL, 'Pendiente', NULL, NULL, 115, '11.20', 175, NULL, NULL),
(145, '2023-03-18 00:00:00', NULL, 'En Proceso', '2023-03-21 00:00:00', '2023-03-24 00:00:00', 147, '54.00', 180, NULL, '2023-03-22 16:49:53'),
(146, '2023-03-20 00:00:00', NULL, 'Entregado', '2023-03-23 00:00:00', '2023-03-23 00:00:00', 133, '3.00', 183, NULL, '2023-03-23 16:34:54'),
(147, '2023-03-21 00:00:00', NULL, 'Empaquetado y controlado', '2023-03-22 00:00:00', '2023-03-22 00:00:00', 46, '3.00', 184, NULL, '2023-03-23 16:34:11'),
(148, '2023-03-24 11:22:49', NULL, 'Pendiente', NULL, NULL, 144, '23.00', 194, NULL, NULL),
(149, '2023-03-24 11:22:49', NULL, 'Pendiente', NULL, NULL, 196, '2.00', 194, NULL, NULL),
(151, '2023-03-24 11:50:17', NULL, 'Pendiente', NULL, NULL, 47, '1.00', 195, NULL, NULL),
(152, '2023-03-27 20:04:27', NULL, 'Pendiente', NULL, NULL, 116, '36.00', 198, NULL, NULL),
(153, '2023-03-29 11:19:18', NULL, 'Pendiente', NULL, NULL, 57, '1.00', 202, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 'browse_bread', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(3, 'browse_database', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(4, 'browse_media', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(5, 'browse_compass', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(6, 'browse_menus', 'menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(7, 'read_menus', 'menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(8, 'edit_menus', 'menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(9, 'add_menus', 'menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(10, 'delete_menus', 'menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(11, 'browse_roles', 'roles', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(12, 'read_roles', 'roles', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(13, 'edit_roles', 'roles', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(14, 'add_roles', 'roles', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(15, 'delete_roles', 'roles', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(16, 'browse_users', 'users', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(17, 'read_users', 'users', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(18, 'edit_users', 'users', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(19, 'add_users', 'users', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(20, 'delete_users', 'users', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(21, 'browse_settings', 'settings', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(22, 'read_settings', 'settings', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(23, 'edit_settings', 'settings', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(24, 'add_settings', 'settings', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(25, 'delete_settings', 'settings', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(26, 'browse_categories', 'categories', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(27, 'read_categories', 'categories', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(28, 'edit_categories', 'categories', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(29, 'add_categories', 'categories', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(30, 'delete_categories', 'categories', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(31, 'browse_posts', 'posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(32, 'read_posts', 'posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(33, 'edit_posts', 'posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(34, 'add_posts', 'posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(35, 'delete_posts', 'posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(36, 'browse_pages', 'pages', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(37, 'read_pages', 'pages', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(38, 'edit_pages', 'pages', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(39, 'add_pages', 'pages', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(40, 'delete_pages', 'pages', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(56, 'browse_clientes', 'clientes', '2022-01-11 23:35:14', '2022-01-11 23:35:14'),
(57, 'read_clientes', 'clientes', '2022-01-11 23:35:14', '2022-01-11 23:35:14'),
(58, 'edit_clientes', 'clientes', '2022-01-11 23:35:14', '2022-01-11 23:35:14'),
(59, 'add_clientes', 'clientes', '2022-01-11 23:35:14', '2022-01-11 23:35:14'),
(60, 'delete_clientes', 'clientes', '2022-01-11 23:35:14', '2022-01-11 23:35:14'),
(66, 'browse_nota_pedidos', 'nota_pedidos', '2022-01-13 01:34:43', '2022-01-13 01:34:43'),
(67, 'read_nota_pedidos', 'nota_pedidos', '2022-01-13 01:34:43', '2022-01-13 01:34:43'),
(68, 'edit_nota_pedidos', 'nota_pedidos', '2022-01-13 01:34:43', '2022-01-13 01:34:43'),
(69, 'add_nota_pedidos', 'nota_pedidos', '2022-01-13 01:34:43', '2022-01-13 01:34:43'),
(70, 'delete_nota_pedidos', 'nota_pedidos', '2022-01-13 01:34:43', '2022-01-13 01:34:43'),
(71, 'browse_empleados', 'empleados', '2022-01-13 01:40:47', '2022-01-13 01:40:47'),
(72, 'read_empleados', 'empleados', '2022-01-13 01:40:47', '2022-01-13 01:40:47'),
(73, 'edit_empleados', 'empleados', '2022-01-13 01:40:47', '2022-01-13 01:40:47'),
(74, 'add_empleados', 'empleados', '2022-01-13 01:40:47', '2022-01-13 01:40:47'),
(75, 'delete_empleados', 'empleados', '2022-01-13 01:40:47', '2022-01-13 01:40:47'),
(76, 'browse_rubros', 'rubros', '2022-01-16 00:04:32', '2022-01-16 00:04:32'),
(77, 'read_rubros', 'rubros', '2022-01-16 00:04:32', '2022-01-16 00:04:32'),
(78, 'edit_rubros', 'rubros', '2022-01-16 00:04:32', '2022-01-16 00:04:32'),
(79, 'add_rubros', 'rubros', '2022-01-16 00:04:32', '2022-01-16 00:04:32'),
(80, 'delete_rubros', 'rubros', '2022-01-16 00:04:32', '2022-01-16 00:04:32'),
(81, 'browse_subrubros', 'subrubros', '2022-01-16 00:05:02', '2022-01-16 00:05:02'),
(82, 'read_subrubros', 'subrubros', '2022-01-16 00:05:02', '2022-01-16 00:05:02'),
(83, 'edit_subrubros', 'subrubros', '2022-01-16 00:05:02', '2022-01-16 00:05:02'),
(84, 'add_subrubros', 'subrubros', '2022-01-16 00:05:02', '2022-01-16 00:05:02'),
(85, 'delete_subrubros', 'subrubros', '2022-01-16 00:05:02', '2022-01-16 00:05:02'),
(86, 'browse_productos', 'productos', '2022-01-18 14:30:46', '2022-01-18 14:30:46'),
(87, 'read_productos', 'productos', '2022-01-18 14:30:46', '2022-01-18 14:30:46'),
(88, 'edit_productos', 'productos', '2022-01-18 14:30:46', '2022-01-18 14:30:46'),
(89, 'add_productos', 'productos', '2022-01-18 14:30:46', '2022-01-18 14:30:46'),
(90, 'delete_productos', 'productos', '2022-01-18 14:30:46', '2022-01-18 14:30:46'),
(91, 'browse_localidades', 'localidades', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(92, 'read_localidades', 'localidades', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(93, 'edit_localidades', 'localidades', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(94, 'add_localidades', 'localidades', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(95, 'delete_localidades', 'localidades', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(96, 'browse_tipos_gastos', 'tipos_gastos', '2022-02-08 00:36:04', '2022-02-08 00:36:04'),
(97, 'read_tipos_gastos', 'tipos_gastos', '2022-02-08 00:36:04', '2022-02-08 00:36:04'),
(98, 'edit_tipos_gastos', 'tipos_gastos', '2022-02-08 00:36:04', '2022-02-08 00:36:04'),
(99, 'add_tipos_gastos', 'tipos_gastos', '2022-02-08 00:36:04', '2022-02-08 00:36:04'),
(100, 'delete_tipos_gastos', 'tipos_gastos', '2022-02-08 00:36:04', '2022-02-08 00:36:04'),
(101, 'browse_proveedores', 'proveedores', '2022-02-12 00:13:49', '2022-02-12 00:13:49'),
(102, 'read_proveedores', 'proveedores', '2022-02-12 00:13:49', '2022-02-12 00:13:49'),
(103, 'edit_proveedores', 'proveedores', '2022-02-12 00:13:49', '2022-02-12 00:13:49'),
(104, 'add_proveedores', 'proveedores', '2022-02-12 00:13:49', '2022-02-12 00:13:49'),
(105, 'delete_proveedores', 'proveedores', '2022-02-12 00:13:49', '2022-02-12 00:13:49'),
(106, 'browse_facturas_compras', 'facturas_compras', '2022-02-12 00:17:00', '2022-02-12 00:17:00'),
(107, 'read_facturas_compras', 'facturas_compras', '2022-02-12 00:17:00', '2022-02-12 00:17:00'),
(108, 'edit_facturas_compras', 'facturas_compras', '2022-02-12 00:17:00', '2022-02-12 00:17:00'),
(109, 'add_facturas_compras', 'facturas_compras', '2022-02-12 00:17:00', '2022-02-12 00:17:00'),
(110, 'delete_facturas_compras', 'facturas_compras', '2022-02-12 00:17:00', '2022-02-12 00:17:00'),
(116, 'browse_mov_financieros', 'mov_financieros', '2022-02-17 01:14:52', '2022-02-17 01:14:52'),
(117, 'read_mov_financieros', 'mov_financieros', '2022-02-17 01:14:52', '2022-02-17 01:14:52'),
(118, 'edit_mov_financieros', 'mov_financieros', '2022-02-17 01:14:52', '2022-02-17 01:14:52'),
(119, 'add_mov_financieros', 'mov_financieros', '2022-02-17 01:14:52', '2022-02-17 01:14:52'),
(120, 'delete_mov_financieros', 'mov_financieros', '2022-02-17 01:14:52', '2022-02-17 01:14:52'),
(121, 'browse_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 23:47:34', '2022-05-30 23:47:34'),
(122, 'read_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 23:47:34', '2022-05-30 23:47:34'),
(123, 'edit_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 23:47:34', '2022-05-30 23:47:34'),
(124, 'add_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 23:47:34', '2022-05-30 23:47:34'),
(125, 'delete_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 23:47:34', '2022-05-30 23:47:34'),
(126, 'browse_moldes', 'moldes', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(127, 'read_moldes', 'moldes', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(128, 'edit_moldes', 'moldes', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(129, 'add_moldes', 'moldes', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(130, 'delete_moldes', 'moldes', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(136, 'browse_formaspago', 'formaspago', '2022-09-10 02:27:30', '2022-09-10 02:27:30'),
(137, 'read_formaspago', 'formaspago', '2022-09-10 02:27:30', '2022-09-10 02:27:30'),
(138, 'edit_formaspago', 'formaspago', '2022-09-10 02:27:30', '2022-09-10 02:27:30'),
(139, 'add_formaspago', 'formaspago', '2022-09-10 02:27:30', '2022-09-10 02:27:30'),
(140, 'delete_formaspago', 'formaspago', '2022-09-10 02:27:30', '2022-09-10 02:27:30'),
(141, 'browse_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(142, 'read_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(143, 'edit_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(144, 'add_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(145, 'delete_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46'),
(146, 'browse_tipos_presupuestos', 'tipos_presupuestos', '2023-02-21 01:56:40', '2023-02-21 01:56:40'),
(147, 'read_tipos_presupuestos', 'tipos_presupuestos', '2023-02-21 01:56:40', '2023-02-21 01:56:40'),
(148, 'edit_tipos_presupuestos', 'tipos_presupuestos', '2023-02-21 01:56:40', '2023-02-21 01:56:40'),
(149, 'add_tipos_presupuestos', 'tipos_presupuestos', '2023-02-21 01:56:40', '2023-02-21 01:56:40'),
(150, 'delete_tipos_presupuestos', 'tipos_presupuestos', '2023-02-21 01:56:40', '2023-02-21 01:56:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(56, 1),
(56, 2),
(56, 4),
(56, 5),
(57, 1),
(57, 2),
(57, 4),
(57, 5),
(58, 1),
(58, 2),
(58, 4),
(58, 5),
(59, 1),
(59, 2),
(59, 4),
(59, 5),
(60, 1),
(60, 2),
(60, 4),
(60, 5),
(66, 1),
(66, 2),
(66, 4),
(66, 5),
(67, 1),
(67, 2),
(67, 4),
(67, 5),
(68, 1),
(68, 2),
(68, 4),
(68, 5),
(69, 1),
(69, 2),
(69, 4),
(69, 5),
(70, 1),
(70, 2),
(70, 4),
(70, 5),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(86, 5),
(87, 1),
(87, 2),
(87, 5),
(88, 1),
(88, 2),
(88, 5),
(89, 1),
(89, 2),
(89, 5),
(90, 1),
(90, 2),
(90, 5),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(101, 3),
(102, 1),
(102, 2),
(102, 3),
(103, 1),
(103, 2),
(103, 3),
(104, 1),
(104, 2),
(104, 3),
(105, 1),
(105, 2),
(105, 3),
(106, 1),
(106, 2),
(106, 3),
(107, 1),
(107, 2),
(107, 3),
(108, 1),
(108, 2),
(108, 3),
(109, 1),
(109, 2),
(109, 3),
(110, 1),
(110, 2),
(110, 3),
(116, 1),
(116, 2),
(116, 3),
(116, 4),
(116, 5),
(117, 1),
(117, 2),
(117, 3),
(117, 4),
(117, 5),
(118, 1),
(118, 2),
(118, 3),
(118, 4),
(118, 5),
(119, 1),
(119, 2),
(119, 3),
(119, 4),
(119, 5),
(120, 1),
(120, 2),
(120, 3),
(120, 4),
(120, 5),
(121, 1),
(121, 2),
(121, 4),
(121, 5),
(122, 1),
(122, 2),
(122, 4),
(122, 5),
(123, 1),
(123, 2),
(123, 4),
(123, 5),
(124, 1),
(124, 2),
(124, 4),
(124, 5),
(125, 1),
(125, 2),
(125, 4),
(125, 5),
(126, 1),
(126, 2),
(127, 1),
(127, 2),
(128, 1),
(128, 2),
(129, 1),
(129, 2),
(130, 1),
(130, 2),
(136, 1),
(136, 2),
(137, 1),
(137, 2),
(138, 1),
(138, 2),
(139, 1),
(139, 2),
(140, 1),
(140, 2),
(141, 1),
(141, 2),
(142, 1),
(142, 2),
(143, 1),
(143, 2),
(144, 1),
(144, 2),
(145, 1),
(145, 2),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-08 00:13:05', '2022-02-08 00:13:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rubro_id` bigint(20) UNSIGNED NOT NULL,
  `subrubro_id` bigint(20) UNSIGNED NOT NULL,
  `preciovta` decimal(19,3) DEFAULT NULL,
  `tasa_iva` decimal(5,2) DEFAULT NULL,
  `unidad` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_compra` decimal(18,2) DEFAULT NULL,
  `unidad_compra` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_molde` bigint(20) UNSIGNED DEFAULT NULL,
  `id_base` int(11) DEFAULT NULL,
  `manual_procedimiento` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidades_mt2` decimal(10,2) DEFAULT NULL,
  `paquetes_mt2` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `rubro_id`, `subrubro_id`, `preciovta`, `tasa_iva`, `unidad`, `precio_compra`, `unidad_compra`, `activo`, `id_molde`, `id_base`, `manual_procedimiento`, `unidades_mt2`, `paquetes_mt2`, `created_at`, `updated_at`) VALUES
(2, 'Ferrite rojo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 00:54:17'),
(4, 'Pegamento Premecol flex x 30 kg', 4, 11, '5370.000', '21.00', 'Bolsas', '0.00', 'U', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-10 16:26:57'),
(5, 'Revestimiento para paredes Blanco Mate', 4, 10, NULL, NULL, 'm2', NULL, '1', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 02:43:40'),
(6, 'Arena', 5, 8, NULL, NULL, NULL, NULL, 'mt3', 'SI', NULL, 0, NULL, NULL, NULL, NULL, '2022-08-04 16:26:18'),
(7, 'Piedra', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 22:48:13', '2022-08-03 22:48:13'),
(8, 'Ferrite amarillo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 22:48:42', '2022-08-03 22:48:42'),
(9, 'cemento', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 22:49:05', '2022-08-03 22:49:05'),
(10, 'Ferrite rojo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 01:47:01'),
(11, 'cemento blanco', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 01:50:40'),
(12, 'cemento calcareo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-06 01:52:51', '2022-08-06 01:52:51'),
(13, 'xxxxxxx', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-06 02:03:16', '2022-08-06 02:03:16'),
(14, 'www', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-06 02:04:25', '2022-08-06 02:04:25'),
(15, 'MUEBLES DE COCINA', 3, 4, NULL, NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-10 15:50:23'),
(17, 'LAJA ESPAÑOLA 40 X 40 CM - COLOR CEMENTO', 1, 2, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, 1, NULL, '6.25', NULL, NULL, '2023-02-13 15:49:19'),
(20, 'Mampostería de 15\"', 6, 13, '3000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 02:44:09'),
(21, 'Mampostería de 15\"', 5, 13, '3000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-30 00:18:03', '2022-11-30 00:18:03'),
(22, 'Mamposteria de 15\"', 6, 13, '8000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-30 00:33:04', '2022-11-30 00:33:04'),
(27, 'MUEBLE PLACARES', 3, 4, NULL, NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-01-10 16:34:01', '2023-01-10 16:34:01'),
(29, 'ADOQUÍN CIRCULAR CHICO 40 X 40 CM - COLOR CEMENTO', 1, 1, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-13 16:53:06'),
(30, 'ADOQUÍN CIRCULAR GRANDE 40 X 40 CM - COLOR CEMENTO', 1, 1, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-13 16:53:25'),
(31, 'ADOOUÍN RECTO GRANDE 40X40 CM - COLOR CEMENTO', 1, 1, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:28:08'),
(32, 'ADOQUÍN RECTO CHICO 40 X 40 CM - COLOR CEMENTO', 1, 1, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:29:10'),
(33, 'LAJA GREGORIANA 40X40 CM - COLOR CEMENTO', 1, 2, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:33:51'),
(34, 'LAJA RIOJANA 40X40 CM - COLOR CEMENTO', 1, 2, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:36:39'),
(35, 'LAJA SAN JUAN 30 X 60 CM color CEMENTO', 1, 2, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-13 16:53:45'),
(36, 'LAJA SAN LUIS 40X40 CM - COLOR CEMENTO', 1, 2, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:40:04'),
(37, 'KEBRACHO 15 X 60 CM - CEMENTO', 1, 21, '3900.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '11.11', NULL, NULL, '2023-02-14 23:56:48'),
(38, 'ADOQUÍN MADERA 20 X 60 CM - CEMENTO', 1, 21, '3900.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '8.33', NULL, NULL, '2023-02-14 15:56:09'),
(39, 'DURMIENTE H° A° 28 X 100 CM COLOR CEMENTO', 1, 21, '3500.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '3.57', NULL, NULL, '2023-02-13 16:57:38'),
(40, 'GREEN BLOCK SIN ARMADURA 35 X 35 CM', 1, 1, '490.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '8.16', NULL, NULL, '2023-02-15 18:06:52'),
(41, 'GREEN BLOCK CON ARMADURA 35 X 35 CM', 1, 1, '760.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '8.16', NULL, NULL, '2023-02-15 18:07:12'),
(45, 'KEBRACHO 15 X 60 CM - COLORES VARIOS', 1, 21, '4650.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '11.11', NULL, NULL, '2023-03-07 16:02:48'),
(46, 'DURMIENTE H°A° 28 X 100 CM - COLOR VARIOS', 1, 21, '3600.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '3.57', NULL, NULL, '2023-02-13 16:58:26'),
(47, 'PIEDRA LISTON CON JUNTA - 3 TONOS', 2, 6, '5300.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 17:02:42'),
(48, 'PIEDRA LISTON CON JUNTA - 2 TONOS', 2, 6, '4860.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 17:03:05'),
(49, 'PIEDRA LISTON CON JUNTA - 1 TONOS', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 17:03:32'),
(50, 'PIEDRA LISTON SIN JUNTA - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 16:19:22'),
(51, 'PIEDRA LISTON SIN JUNTA - 2 TONO', 2, 6, '4860.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 17:14:55'),
(52, 'PIEDRA LISTON SIN JUNTA - 3 TONO', 2, 6, '5300.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', NULL, '2023-02-13 17:16:06'),
(53, 'EKOS - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:08:16'),
(54, 'EKOS - 2 TONO', 2, 6, '4860.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:11:09'),
(55, 'EKOS - 3 TONO', 2, 6, '5300.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:11:23'),
(56, 'UHMA - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:05:48'),
(57, 'UHMA - 2 TONO', 2, 6, '4860.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:06:07'),
(58, 'UHMA - 3 TONO', 2, 6, '5300.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:06:25'),
(59, 'TRAVERTILIT - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '40.00', '10.00', NULL, '2023-02-13 17:13:36'),
(62, 'GEOKUBIK - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:12:22'),
(66, 'ROKA - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '12.50', '3.00', NULL, '2023-03-20 15:40:42'),
(69, 'KORALINA - 1 TONO', 2, 6, '4550.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '33.00', '8.00', NULL, '2023-03-20 15:40:57'),
(72, 'ADOQUIN INDIVIDUAL- 1 TONO', 2, 6, '4200.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '90.00', NULL, NULL, '2023-01-13 15:41:33'),
(73, 'KEBRACHO  FINO 15 X 60 CM - COLOR CEMENTO', 2, 5, '2160.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '11.11', NULL, NULL, '2023-02-13 17:28:46'),
(74, 'KEBRACHO  FINO 15 X 60 CM - COLORES VARIOS', 2, 5, '2700.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '11.00', NULL, NULL, '2023-02-13 17:30:03'),
(75, 'KEBRACHO  FINO 15 X 60 CM - COLOR NEGRO', 2, 5, '3150.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '11.11', NULL, NULL, '2023-02-13 17:31:00'),
(76, 'KEBRACHO  FINO - BLANCO 15 X 60 CM', 2, 5, '4320.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '11.11', NULL, NULL, '2023-02-13 17:32:23'),
(77, 'ADOQUIN MADERA FINO 20 X 60 CM - COLOR CEMENTO', 2, 5, '2160.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '8.33', NULL, NULL, '2023-02-13 17:35:22'),
(78, 'ADOQUIN MADERA FINO 20 X 60 CM - COLORES VARIOS', 2, 5, '2700.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '8.33', NULL, NULL, '2023-02-13 17:36:04'),
(79, 'ADOQUIN MADERA FINO 20 X 60 CM - COLOR NEGRO', 2, 5, '3150.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '8.33', NULL, NULL, '2023-02-13 17:36:48'),
(80, 'ADOQUIN MADERA FINO - BLANCO 20 X 60 CM', 2, 5, '4000.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '8.00', NULL, NULL, '2023-01-13 15:54:35'),
(81, 'ADOQUÍN CIRCULAR CHICO - 40 X 40 CM - BLANCO', 1, 1, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 00:12:42'),
(82, 'ADOQUÍN CIRCULAR GRANDE - 40 X 40 CM - BLANCO', 1, 1, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 00:05:21'),
(83, 'ADOOUÍN RECTO CHICO - 40 X 40 CM - BLANCO', 1, 1, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:29:31'),
(84, 'ADOQUIN RECTO GRANDE - 40 X 40 CM - BLANCO', 1, 1, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:25:39'),
(85, 'LAJA ESPAÑOLA 40 X 40 CM - BLANCO', 1, 2, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:32:36'),
(86, 'LAJA GREGORIANA - 40 X40 CM - BLANCO', 1, 2, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:34:07'),
(87, 'LAJA RIOJANA - 40 X 40 CM - BLANCO', 1, 2, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:36:59'),
(88, 'LAJA SAN JUAN 40 X 40 CM - BLANCO', 1, 2, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:42:24'),
(89, 'LAJA SAN LUIS 40 X 40 CM - BLANCO', 1, 2, '2400.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:40:23'),
(90, 'DURMIENTE H°A° 28 X 100 CM - BLANCO', 1, 21, '5400.000', NULL, 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '3.57', NULL, NULL, '2023-02-13 16:58:57'),
(91, 'CURADOR TRANSPARENTE', 4, 10, '1500.000', '21.00', 'Litros', NULL, '1', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-20 17:37:10'),
(92, 'ATERMICO - SAN JUAN - 30 X 60 CM', 1, 22, '1300.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '5.55', NULL, NULL, '2023-02-13 16:48:04'),
(93, 'PASTINA ATERMICA X 5 KG - BLANCA', 4, 3, '4170.000', '21.00', 'Bolsas', NULL, '1', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-10 16:25:53'),
(94, 'PASTINA ATERMICA X 5 KG - BEIGE', 4, 3, '4170.000', '21.00', 'Bolsas', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-10 16:26:07'),
(95, 'BORDE BALLENA 40 X 50 CM COMPUESTO', 4, 22, '1500.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:30:33'),
(96, 'BORDE CON GUARDA 40 X 50 CM COMPUESTO', 4, 22, '1500.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:31:48'),
(97, 'SOLARIUM 50 X 50 CM COMPUESTO', 4, 22, '1500.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:32:08'),
(98, 'ESQUINERO BALLENA ATERMICO 50X50 COMPUESTO', 4, 22, '1500.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:33:19'),
(99, 'ESQUINERO INVERTIDO BALLENA 40X40 COMPUESTO', 4, 22, '1400.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:34:14'),
(100, 'BORDE JAMAICA ATERMICO 50 X 50 COMPUESTO', 4, 22, '1650.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:36:46'),
(101, 'BORDE JAMAICA PESTAÑA 5 CM ATERMICO 50X50CM COMP', 4, 22, '1800.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:38:11'),
(102, 'ESQUINERO PIEDRA LISTON SIN JUNTA - 1 TONO', 2, 6, '1300.000', '21.00', 'ml', NULL, NULL, 'SI', 2, NULL, NULL, '9.00', '2.25', NULL, '2023-02-13 17:17:21'),
(103, 'DURMIENTE DE H° A° 28 X 50 - COLOR VARIOS', 1, 21, '1800.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '7.14', NULL, NULL, '2023-02-13 17:00:03'),
(104, 'DURMIENTE DE H° A° 28 X 50 - COLOR  CEMENTO', 1, 21, '1750.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '7.14', NULL, NULL, '2023-02-13 17:00:26'),
(105, 'ATERMICO ADOQUIN MADERA 20 X 60 CM', 1, 22, '870.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '8.33', NULL, NULL, '2023-02-13 16:48:22'),
(106, 'ATERMICO DURMIENTE DE H° A° 28 X 100 -', 1, 22, '4550.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '3.57', NULL, NULL, '2023-02-13 16:48:51'),
(107, 'SIMI MADERA ATERMICO 25 X 50 CM COMPUESTO', 4, 22, '850.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:18:43'),
(108, 'SOLARIUM  50 X 50 CM - 100 % ATERMICO EDU', 4, 22, '1350.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:32:22'),
(109, 'BORDE JAMAICA 50X50CM  100 % ATERMICO EDU', 4, 22, '1350.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:38:37'),
(110, 'BORDE BALLENA 40 X 50 CM - 100% ATERMICO EDU', 4, 22, '1350.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:31:25'),
(111, 'ESQUINERO BALLENA 50 X 50 CM  - 100% ATERMICO EDU', 4, 22, '1350.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:34:36'),
(112, 'KEBRACHO 15 X 60 CM - ATERMICO', 1, 22, '870.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '11.00', NULL, NULL, '2023-02-10 23:27:07'),
(113, 'ADOQUIN RECTO GRANDE 40 X 40 CM - COLOR NEGRO -', 1, 1, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '6.00', NULL, NULL, '2023-02-14 01:26:03'),
(114, 'ADOQUIN RECTO GRANDE 40 X 40 CM - COLOR VARIOS', 1, 1, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:26:45'),
(115, 'ADOQUÍN CIRCULAR CHICO 40 X 40 CM - COLORES VARIOS', 1, 1, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 00:13:17'),
(116, 'ADOQUÍN CIRCULAR CHICO 40 X 40 CM - COLOR NEGRO', 1, 1, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 00:13:45'),
(118, 'LAJA ESPAÑOLA 40 X 40 CM - COLOR NEGRO', 1, 2, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:32:57'),
(119, 'LAJA ESPAÑOLA 40 X 40 CM - COLORES VARIOS', 1, 2, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:33:14'),
(120, 'PLACA ANTIHUMEDAD- 26X52 CM -  MODELO PIEDRA', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '7.39', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:13'),
(121, 'DEMOLICION', 6, 18, '1260.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-02-08 18:07:27', '2023-02-08 18:07:27'),
(122, 'CONTRAPISO', 6, 18, '6840.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, 'M.O. EJECUCION DE CONRTRAPISO', '1.00', NULL, '2023-02-09 18:00:44', '2023-02-09 18:00:44'),
(123, 'COLOCACION DE PISOS', 6, 3, '5400.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, 'COLOCACION DE BALDOSAS', '1.00', NULL, '2023-02-09 18:02:46', '2023-02-09 18:02:46'),
(124, 'ALQUILER DE CONTENEDOR/  RETIRO DE ESCOMBROS', 6, 18, '10000.000', '21.00', 'Otros', NULL, NULL, 'SI', NULL, NULL, 'TERCIERIZADO', '1.00', NULL, '2023-02-09 18:08:22', '2023-02-09 18:08:22'),
(125, 'LAJA SAN JUAN 30X60 - COLORES VARIOS', 1, 2, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-02-14 01:42:58'),
(126, 'EKOS BASE NEGRA', 2, 6, '6380.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', NULL, '2023-02-13 17:11:53'),
(127, 'LOSETAS 0.80 X 0.60 X 0.05 color CEMENTO', 1, 3, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '2.08', NULL, '2023-02-10 16:35:22', '2023-02-10 16:35:22'),
(128, 'BANCO RECTO H°A° 1,50 x 0,50 x 0,45m color CEMENTO', 8, 24, '15000.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-13 16:50:01'),
(129, 'BANCOS H°A° WAVE 40x40x100 cm COLOR CEMENTO', 8, 24, '13200.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-02-13 16:52:18', '2023-02-13 16:52:18'),
(130, 'PIEDRA LISTON CON JUNTA - BASE NEGRA', 2, 6, '6380.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '32.00', '8.00', '2023-02-13 17:05:13', '2023-02-13 17:05:13'),
(131, 'UHMA - BASE NEGRA', 2, 6, '6380.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', '2023-02-13 17:07:25', '2023-02-13 17:07:25'),
(132, 'GEOKUBIK - BASE NEGRA', 2, 6, '6380.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', '2023-02-13 17:13:07', '2023-02-13 17:13:07'),
(133, 'TRAVERTILIT - BASE NEGRA', 2, 6, '6380.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', '2023-02-13 17:14:16', '2023-02-13 17:14:16'),
(134, 'ESQUINERO PIEDRA LISTON SIN JUNTA -BASE NEGRA', 2, 6, '3240.000', '21.00', 'ml', NULL, NULL, 'SI', 2, NULL, NULL, '9.00', '2.25', '2023-02-13 17:18:53', '2023-02-13 17:18:53'),
(138, 'REVENTA PIEDRA LISTON CON JUNTA - 3 TONOS', 2, 6, '3175.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '32.00', '8.00', '2023-02-13 23:59:25', '2023-02-13 23:59:25'),
(139, 'ADOQUÍN CIRCULAR GRANDE 40X40 CM - COLORES VARIOS', 1, 1, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '6.25', NULL, '2023-02-14 00:10:12', '2023-02-14 00:10:12'),
(140, 'ADOQUÍN CIRCULAR GRANDE 40X40 CM - COLOR NEGRO', 1, 1, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 00:11:27', '2023-02-14 00:11:27'),
(141, 'ADOQUÍN RECTO CHICO 40X40 CM - COLORES VARIOS', 1, 1, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:30:29', '2023-02-14 01:30:29'),
(142, 'ADOQUÍN RECTO CHICO 40 X 40 CM - COLOR NEGRO', 1, 1, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '6.25', NULL, '2023-02-14 01:31:15', '2023-02-14 01:31:15'),
(143, 'LAJA GREGORIANA 40X40 CM - COLORES VARIOS', 1, 2, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:34:59', '2023-02-14 01:34:59'),
(144, 'LAJA GREGORIANA 40X40 CM - COLOR NEGRO', 1, 2, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:35:50', '2023-02-14 01:35:50'),
(145, 'LAJA RIOJANA 40X40 CM - COLORES VARIOS', 1, 2, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:37:41', '2023-02-14 01:37:41'),
(146, 'LAJA RIOJANA 40X40 CM - COLOR NEGRO', 1, 2, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:38:22', '2023-02-14 01:38:22'),
(147, 'LAJA SAN LUIS 40X40 CM - COLORES VARIOS', 1, 2, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:41:02', '2023-02-14 01:41:02'),
(148, 'LAJA SAN LUIS 40X40 CM - COLOR NEGRO', 1, 2, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:41:37', '2023-02-14 01:41:37'),
(149, 'LAJA SAN JUAN 30X60 CM - COLOR NEGRO', 1, 2, '2050.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:44:05', '2023-02-14 01:44:05'),
(150, 'PODOTACTILES 40X40CM - PREVENCION - COLOR AMARILLO', 1, 3, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '6.25', NULL, '2023-02-14 01:48:38', '2023-02-14 01:48:38'),
(151, 'PODOTACTILES 40X40CM - GUIA - COLOR AMARILLO', 1, 3, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 01:49:32', '2023-02-14 01:49:32'),
(152, 'PODOTACTILES 40X40CM - SEÑAL - COLOR AMARILLO', 1, 3, '1850.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '6.25', NULL, '2023-02-14 01:51:07', '2023-02-14 01:51:07'),
(153, 'ADOQUÍN MADERA 20X60 CM - COLORES VARIOS', 1, 21, '4650.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '8.33', NULL, '2023-02-14 16:06:13', '2023-02-14 16:06:13'),
(154, 'ADOQUÍN MADERA 20X60 CM - COLOR NEGRO', 1, 21, '8000.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '8.33', NULL, '2023-02-14 16:07:31', '2023-02-14 16:07:31'),
(155, 'ADOQUÍN MADERA 20X60 CM - BLANCO', 1, 21, '8640.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '8.33', NULL, '2023-02-14 16:08:32', '2023-02-14 16:08:32'),
(156, 'PODOTACTILES 40X40CM - GUIA - CEMENTO', 1, 3, '1750.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-14 16:58:51', '2023-02-14 16:58:51'),
(157, 'PLACA ANTIHUMEDAD- 26X52 CM -  MODELO TRAVERSO', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '7.39', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:18'),
(158, 'PLACA ANTIHUMEDAD- 26X52 CM -  MODELO MIRASOL', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '7.39', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:24'),
(159, 'PLACA ANTIHUMEDAD- 60X60 CM - MODELO MEDITERRANEO', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '2.77', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:31'),
(160, 'PLACA ANTIHUMEDAD- 60X60 CM - MODELO SOL', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '2.77', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:36'),
(161, 'PLACA ANTIHUMEDAD- 60X60 CM - MODELO UBED', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '2.77', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:41'),
(162, 'PLACA ANTIHUMEDAD- 60X60 CM - MODELO VERONA', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '2.77', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:47'),
(163, 'PLACA ANTIHUMEDAD- 50X50 CM - MODELO MADERA', 4, 23, '3600.000', '21.00', 'm2', '2600.00', '4', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:53:54'),
(164, 'COLOCACION PLACAS ANTIHUMEDAD', 6, 23, '4500.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, 'ESTIMATIVO (INCLUYE INSUMOS)', NULL, NULL, '2023-02-14 18:20:09', '2023-02-14 18:20:09'),
(165, 'KEBRACHO 15 X 60 CM - COLOR NEGRO', 1, 21, '8000.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '11.11', NULL, '2023-02-15 18:01:19', '2023-02-15 18:01:19'),
(166, 'KEBRACHO 15 X 60 CM - COLOR BLANCO', 1, 21, '8640.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '11.11', NULL, '2023-02-15 18:02:54', '2023-02-15 18:02:54'),
(167, 'DURMIENTE H°A° 28 X 100 CM - COLOR NEGRO', 1, 21, '5000.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '3.57', NULL, '2023-02-15 18:05:15', '2023-02-15 18:05:15'),
(168, 'ZAPATAS', 6, 13, '21600.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-02-21 16:09:38', '2023-02-21 16:09:38'),
(169, 'PILOTINES', 6, 13, '2430.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-02-21 16:10:40', '2023-02-21 16:10:40'),
(170, 'VIGA ENCADENADO', 6, 13, '5805.000', '21.00', 'ml', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-21 16:12:02', '2023-02-21 16:12:02'),
(171, 'CAPA AISLADORA', 6, 20, '2160.000', '21.00', 'ml', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-21 16:13:05', '2023-02-21 16:13:05'),
(172, 'COLUMNAS', 6, 13, '5400.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-21 16:14:07', '2023-02-21 16:14:07'),
(173, 'MAMPOSTERUIA LADRILLO 15 - FUND.', 6, 13, '3375.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-21 16:16:42', '2023-02-21 16:16:42'),
(174, 'MAMPOSTERUIA LADRILLO 15 - ELEV.', 6, 13, '3780.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-21 16:17:36', '2023-02-21 16:17:36'),
(175, 'REVENTA - EKOS 2 TONOS', 2, 6, '3400.000', '21.00', 'm2', NULL, NULL, 'SI', 2, NULL, NULL, '36.00', '9.00', '2023-02-22 17:06:41', '2023-02-22 17:06:41'),
(176, 'REVENTA - GREGORIANA 40X40 - COLORES VARIOS', 1, 2, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-02-22 17:08:12', '2023-02-22 17:08:12'),
(177, 'Colocación Revest Simil PIEDRAS H (p baja)', 6, 6, '4200.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-24 01:31:24', '2023-02-24 01:31:24'),
(178, 'Aplicación de curador', 6, 10, '1100.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-02-24 01:32:31', '2023-02-24 01:32:31'),
(179, 'REVENTA ATERMICO - SAN JUAN - 30 X 60 CM', 1, 22, '1002.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '5.55', NULL, NULL, '2023-03-01 15:20:54'),
(180, 'REVENTA PODOTACTILES 40X40CM-GUIA-AMARILLO', 1, 3, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-01 22:59:27', '2023-03-01 22:59:27'),
(181, 'REVENTA PODOTACTILES 40X40CM-PREVENCION-AMARILLO', 1, 3, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-01 23:00:37', '2023-03-01 23:00:37'),
(182, 'REVENTA PODOTACTILES 40X40CM-SEÑAL-AMARILLO', 1, 3, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-01 23:01:39', '2023-03-01 23:01:39'),
(183, 'GLOBAL 1 - LLAVES FACHADA COMPLETA TERESA ALLENDE', 6, 13, '22000.000', '21.00', 'Otros', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 00:37:22', '2023-03-02 00:37:22'),
(184, 'Aplicación de PINTURA', 6, 10, '3000.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 01:32:25', '2023-03-02 01:32:25'),
(185, 'PINTURA FURTESPERANZA A TONO X LTS', 6, 10, '2600.000', '21.00', 'Litros', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 01:43:23', '2023-03-02 01:43:23'),
(186, 'ENDUIDO PARA EXTERIORES X KG', 6, 11, '1150.000', '21.00', 'kg', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 01:46:59', '2023-03-02 01:46:59'),
(188, 'HIERRO 8°', 6, 19, '3530.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 01:52:26', '2023-03-02 01:52:26'),
(189, 'BOLSA DE CEMENTO X 50KG', 6, 19, '2600.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 01:53:40', '2023-03-02 01:53:40'),
(190, 'ARENA X 30KG', 6, 19, '600.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:01:06', '2023-03-02 17:01:06'),
(191, 'Rodillo pintor mc pin Fib 06', 6, 10, '350.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:04:43', '2023-03-02 17:04:43'),
(192, 'LIJA N° 100', 6, 20, '200.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:07:47', '2023-03-02 17:07:47'),
(193, 'GLOBAL 1 - REPARACION PISOS FLOTANTES', 6, 5, '28000.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-03 01:38:09', '2023-03-03 01:38:09'),
(194, 'REVENTA ADOQ RECTO CHICO 40X40 CM - COLORES VARIO', 1, 1, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-07 00:52:04', '2023-03-07 00:52:04'),
(196, 'PASTINA COLOR VARIOS X KG', 1, 11, '1500.000', '21.00', 'kg', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-07 16:21:02', '2023-03-07 16:21:02'),
(197, 'DURMIENTES 50X28 CM COLOR MADERA', 1, 21, '1800.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-07 17:01:45', '2023-03-07 17:01:45'),
(198, 'PALET', 1, 1, '1000.000', '21.00', 'Unidad', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-08 00:02:20', '2023-03-08 00:02:20'),
(199, 'ESQUINERO PIEDRA LISTON 1 TONO', 2, 6, '1300.000', '21.00', 'ml', NULL, NULL, 'SI', 2, NULL, NULL, '9.00', NULL, '2023-03-09 17:22:50', '2023-03-09 17:22:50'),
(200, 'Cal comun x 25 kg', 1, 18, '1190.000', '21.00', 'Bolsas', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-11 01:22:39', '2023-03-11 01:22:39'),
(201, 'COLOC DE PISOS - HENGEN MARTIN', 6, 18, '117000.000', '21.00', 'Otros', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-11 01:35:19', '2023-03-11 01:35:19'),
(202, 'REVENTA ADOQ RECTO GRANDE 40X40 CM - CEMENTO', 1, 1, '1290.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-13 17:09:09', '2023-03-13 17:09:09'),
(203, 'REVENTA ADOQ CIRC CHICO 40X40 CM - COLOR NEGRO', 1, 1, '1440.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-13 18:09:46', '2023-03-13 18:09:46'),
(204, 'REVENTA ADOQ CIRC CHICO 40X40 CM - COLOR NEGRO', 1, 1, '1440.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-13 18:10:57', '2023-03-13 18:10:57'),
(205, 'REVENTA ADOQ CIRC CHICO 40X40 CM - COLORES VARIOS', 1, 1, '1290.000', '21.00', 'Unidad', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-14 14:52:40', '2023-03-14 14:52:40'),
(206, 'REVENTA ADOQ RECTO CHICO 40X40 CM - CEMENTO', 1, 1, '1210.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, NULL, '2023-03-14 15:55:36'),
(207, 'REVENTA ADOQ CIRCULAR CHICO 40 X 40 CM - NEGRO', 1, 1, '1440.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '6.25', NULL, '2023-03-14 15:57:24', '2023-03-14 15:57:24'),
(208, 'Colocación Revest Simil PIEDRAS H (p alta)', 6, 6, '5200.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-03-16 00:40:28', '2023-03-16 00:40:28'),
(209, 'MOLDURAS ANTIHUMEDAD- 52 CM L', 4, 23, '500.000', '21.00', 'ml', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 00:54:02'),
(210, 'LIMPIEZA Y RASQUETEO', 6, 10, '980.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-22 15:01:57', '2023-03-22 15:01:57'),
(211, 'APLICACION DE BASE ACRILICA NIVELADORA - FONDO', 6, 10, '2100.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-22 15:03:40', '2023-03-22 15:03:40'),
(212, 'APLICACION DE REVOQUE TEXTURADO', 6, 10, '3220.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-22 15:05:59', '2023-03-22 15:05:59'),
(213, 'PLASTER FORMA X 3O KG (rinde 11 a 13 m2)', 4, 10, '24400.000', '21.00', 'Balde', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-22 15:42:57'),
(214, 'PLASTER BASE GRUPO C COLOR GRAFITO X 10 LTS', 4, 10, '22500.000', '21.00', 'Balde', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-22 15:41:40'),
(215, 'PLASTER BASE GRUPO C COLOR GRAFITO X 4 LTS', 4, 10, '9900.000', '21.00', 'Balde', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-22 15:48:52', '2023-03-22 15:48:52'),
(216, 'PASTINA COMUN A TONO X KG', 1, 10, '1500.000', '21.00', 'kg', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-03-22 16:30:33', '2023-03-22 16:30:33'),
(217, 'REVENTA LAJA SAN JUAN 30 X 60 CM color CEMENTO', 1, 2, '1210.000', '21.00', 'm2', NULL, NULL, 'SI', 1, NULL, NULL, '5.55', NULL, '2023-03-28 18:02:42', '2023-03-28 18:02:42'),
(218, 'PINTURA BLANCA PILETA RAKOTON', 4, 20, '2900.000', '21.00', 'Litros', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-04-04 01:12:01', '2023-04-04 01:12:01'),
(219, 'COLOCACION DE PISOS', 6, 1, '3000.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-04-04 15:45:19', '2023-04-04 15:45:19'),
(220, 'EJECUCION JUNTAS DE DILATACION', 6, 11, '1000.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, '1.00', NULL, '2023-04-04 15:47:22', '2023-04-04 15:47:22'),
(221, 'APLICACION DE CURADOR (Ojeda)', 6, 10, '600.000', '21.00', 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2023-04-04 15:48:30', '2023-04-04 15:48:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razonsocial` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_comercial` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` char(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cond_iva` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_contacto` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_contacto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` char(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `razonsocial`, `direccion`, `nombre_comercial`, `web`, `telefono`, `mail`, `cuit`, `cond_iva`, `nombre_contacto`, `telefono_contacto`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 'SANTIANO y VICTOR S.R.L.', 'Av 25 de MAYO 1799', 'SANTIANO y VICTOR S.R.L.', NULL, NULL, NULL, '30-71472882-9', 'RI', NULL, NULL, NULL, '2022-02-12 00:15:00', '2022-03-15 18:14:35'),
(2, 'Hierros Lider', 'Ruta NAcional 11 Km 1025', NULL, NULL, NULL, NULL, '32-25546879-0', 'RI', NULL, NULL, NULL, '2022-02-12 00:15:00', '2022-03-15 18:14:05'),
(3, 'SECHEEP', 'Belgrano 566 -Saenz Peña-', 'SECHEEP', 'www.secheep.com.ar', NULL, NULL, '30-54575473-4', 'RI', NULL, NULL, NULL, '2023-01-05 14:48:48', '2023-01-05 14:48:48'),
(4, 'La Segunda Cooperativa de Seguro', NULL, 'La Segunda', NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-10 20:46:22', '2023-01-10 20:46:22'),
(9, 'ALEJANDRO CIFUENTE', NULL, NULL, NULL, '3624212724', NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-11 16:25:37', '2023-01-11 16:25:37'),
(10, 'FLAVIA HERETCHI', NULL, NULL, NULL, '3624691537', NULL, NULL, 'CF', NULL, NULL, NULL, '2023-01-12 16:51:38', '2023-01-12 16:51:38'),
(11, 'ALQUILER', 'AV. BELGRANO 1521', NULL, NULL, NULL, NULL, NULL, 'CF', NULL, NULL, NULL, '2023-01-12 16:53:41', '2023-01-12 16:53:41'),
(12, 'PRÉSTAMO FINANCIERA', NULL, NULL, NULL, NULL, NULL, NULL, 'CF', NULL, NULL, NULL, '2023-01-12 16:56:20', '2023-01-12 16:56:20'),
(13, 'PERSONAL DE FABRICA', NULL, NULL, NULL, '3624535080', NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-13 14:41:51', '2023-01-13 14:41:51'),
(14, 'MEDINA ROBERTO DANIEL', 'LAUTARO 1446', 'MEDINA ROBERTO DANIEL', NULL, NULL, NULL, '20291377654', 'MO', 'ROBERTO', NULL, NULL, '2023-01-19 21:09:12', '2023-01-19 21:09:12'),
(15, 'ALCANTARA BEATRUZ SUSANA', 'RUTA 16 KM20', 'ALCANTAR BEATRIZ SUSANA', NULL, NULL, NULL, '23100270994', 'RI', 'SUSANA', NULL, NULL, '2023-01-20 23:26:09', '2023-01-20 23:26:09'),
(16, 'PAPELERA MARANO', 'JUAN DOMINGO PERON 763', 'PAPELERA MARANO', NULL, '3624429254-3624433846', NULL, '30686076451', 'RI', NULL, NULL, NULL, '2023-01-21 15:40:35', '2023-01-21 15:40:35'),
(17, 'FERRTERIA SERGIO', 'AVENIDA ALVEAR 3335', 'FERRETERIA SERGIO', NULL, '3624465993', NULL, '20220474942', 'RI', NULL, NULL, NULL, '2023-01-21 16:15:22', '2023-01-21 16:15:22'),
(18, 'FERRETERIA EL MOLINO', 'AVENIDA ALVEAR 1486', 'FERRETERIA EL MOLINO', NULL, '3624461966', NULL, '30642995851', 'RI', NULL, NULL, NULL, '2023-01-21 16:19:25', '2023-01-21 16:19:25'),
(19, 'GABARDINI', 'AVENIDA ALVEAR 2860', 'GABARDINI', NULL, '3624463252', NULL, '306452877332', 'RI', NULL, NULL, NULL, '2023-01-21 16:25:25', '2023-01-21 16:25:25'),
(20, 'ESTACION DE SERVICIO CASTELLI', 'AVENIDA CASTELLI 714', 'ESTACION DE SERVICIO CASTELLI', NULL, '3624426863', NULL, '30707861378', 'RI', NULL, NULL, NULL, '2023-01-21 16:32:18', '2023-01-21 16:32:18'),
(21, 'AUTO STAR SRL', 'AVENIDAS HERNANDARIAS Y MARCONI 1695', 'AUTO STAR SRL', NULL, '3624435728', NULL, '30585653620', 'RI', NULL, NULL, NULL, '2023-01-21 16:34:13', '2023-01-21 16:34:13'),
(22, 'PROSEGUR ACTIVA ARGENTINA SA', 'JULIO A ROCA 4530-FLORIDA BS.AS', 'PROSEGUR ACTIVA ARGENTINA SA', NULL, '011-47098088', NULL, '30709776564', 'RI', NULL, NULL, NULL, '2023-01-21 16:44:25', '2023-01-21 16:44:25'),
(23, 'TELECOMO ARGENTINA SA', 'LA PAMPA 2295-CABA', NULL, NULL, NULL, NULL, '30639453738', 'RI', NULL, NULL, NULL, '2023-01-21 16:53:54', '2023-01-21 16:53:54'),
(24, 'RIOS MIRTA LAURA', 'JUAN PABLO DUARTE 1435', NULL, NULL, NULL, NULL, '27306145776', 'MO', NULL, NULL, NULL, '2023-01-21 17:05:46', '2023-01-21 17:05:46'),
(25, 'AFIPXXXX', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-02-03 19:41:50', '2023-02-03 19:41:50'),
(26, 'DOS MIL SA', 'RUTA PROV. 105 Y RUTA 201', 'DOS MIL SA', NULL, NULL, NULL, '30687923878', 'RI', NULL, NULL, NULL, '2023-02-03 20:08:42', '2023-02-03 20:08:42'),
(27, 'RFB TECOLOGA SRL', 'PEATOAL UA D. PERON 179', NULL, NULL, NULL, NULL, '30708611170', 'RI', NULL, NULL, NULL, '2023-02-03 20:14:21', '2023-02-03 20:14:21'),
(28, 'VELAZCO PINTURAS', 'AV. 25 DE MAYO 1102', NULL, NULL, NULL, NULL, '20121861330', 'RI', NULL, NULL, NULL, '2023-02-03 23:02:09', '2023-02-03 23:02:09'),
(29, 'EL SOBERBIO', 'RIVADAVIA 757-EL SOBERBIO MISIONES', NULL, NULL, NULL, NULL, '30572365391', 'RI', NULL, NULL, NULL, '2023-02-03 23:13:34', '2023-02-03 23:13:34'),
(30, 'EXPRESO DEMONTE', 'RUTA 12 KM KM 1026 CORRIENTES', NULL, NULL, '03794978888', NULL, '33578089239', 'RI', NULL, NULL, NULL, '2023-02-03 23:24:36', '2023-02-03 23:24:36'),
(31, 'MORLLO JUAN', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-02-03 23:27:49', '2023-02-03 23:27:49'),
(32, 'PALLETS', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-02-03 23:49:41', '2023-02-03 23:49:41'),
(33, 'Corralon y ferreteria cascia', 'Av Edison 75 Resistencia', NULL, NULL, '3624444367', NULL, NULL, 'RI', NULL, NULL, NULL, '2023-03-06 14:11:42', '2023-03-06 14:11:42'),
(34, 'ESTACION DE SERVICIOS SHELL LA BALANZA', 'AV. 25 DE MAYO 1602', NULL, NULL, '3624463237', NULL, '30581533817', 'RI', NULL, NULL, NULL, '2023-03-06 15:13:18', '2023-03-06 15:13:18'),
(35, 'TERADA', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-03-06 15:24:38', '2023-03-06 15:24:38'),
(36, 'JUAN CARLOS ALQUILER', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-03-07 20:56:30', '2023-03-07 20:56:30'),
(37, 'P Y M SRL', 'AV ALVEAR 1580', NULL, NULL, NULL, NULL, '3063739748', 'RI', NULL, NULL, NULL, '2023-03-28 21:06:30', '2023-03-28 21:06:30'),
(38, 'HORACIO', NULL, NULL, NULL, '3625190143', 'horaciomarcelolopez@hotmail.com', NULL, 'RI', NULL, NULL, NULL, '2023-03-28 21:13:32', '2023-03-28 21:13:32'),
(39, 'CASTELLANAS', 'PERON 130', NULL, NULL, NULL, NULL, '30609135820', 'RI', NULL, NULL, NULL, '2023-03-28 22:01:20', '2023-03-28 22:01:20'),
(40, 'PINTURERI FUERTE ESPERANZA', 'AV 25 DE MAYO 780', NULL, NULL, NULL, NULL, '20295788802', 'RI', NULL, NULL, NULL, '2023-03-28 22:08:29', '2023-03-28 22:08:29'),
(41, 'EL CRUCE', 'AV ALEAR Y RUTA 11', NULL, NULL, NULL, NULL, '30542675699', 'RI', NULL, NULL, NULL, '2023-03-28 23:12:18', '2023-03-28 23:12:18'),
(42, 'GUIDOLIFLORIO', 'RUTA 16 KM 10.1', NULL, NULL, NULL, NULL, '30641290242', 'RI', NULL, NULL, NULL, '2023-03-28 23:17:27', '2023-03-28 23:17:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renglones_notapedidos`
--

CREATE TABLE `renglones_notapedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `cantidad` decimal(19,2) DEFAULT NULL,
  `total_linea` decimal(19,3) DEFAULT NULL,
  `iva` decimal(5,2) DEFAULT NULL,
  `id_factura` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `renglones_notapedidos`
--

INSERT INTO `renglones_notapedidos` (`id`, `id_pedido`, `id_producto`, `cantidad`, `total_linea`, `iva`, `id_factura`, `created_at`, `updated_at`) VALUES
(337, 52, 4, '2.00', '9200.000', '21.00', NULL, '2023-01-28 16:00:03', '2023-01-28 16:00:03'),
(338, 52, 30, '10.00', '16000.000', '21.00', NULL, '2023-01-28 16:00:03', '2023-01-28 16:00:03'),
(347, 53, 47, '32.00', '156800.000', '21.00', NULL, '2023-01-31 00:21:19', '2023-01-31 00:21:19'),
(348, 53, 91, '32.00', '35200.000', '21.00', NULL, '2023-01-31 00:21:19', '2023-01-31 00:21:19'),
(349, 54, 15, '1.00', '500.000', '21.00', NULL, '2023-01-31 23:25:16', '2023-01-31 23:25:16'),
(359, 62, 101, '40.00', '57200.000', '21.00', NULL, '2023-02-02 18:08:09', '2023-02-02 18:08:09'),
(360, 62, 97, '32.00', '37440.000', '21.00', NULL, '2023-02-02 18:08:09', '2023-02-02 18:08:09'),
(366, 66, 50, '4.00', '16800.000', '21.00', NULL, '2023-02-03 16:50:17', '2023-02-03 16:50:17'),
(367, 66, 4, '4.00', '20720.000', '21.00', NULL, '2023-02-03 16:50:17', '2023-02-03 16:50:17'),
(368, 66, 91, '4.00', '4400.000', '21.00', NULL, '2023-02-03 16:50:17', '2023-02-03 16:50:17'),
(390, 55, 15, '1.00', '608991.000', '21.00', NULL, '2023-02-03 22:33:47', '2023-02-03 22:33:47'),
(401, 63, 101, '40.00', '57200.000', '21.00', NULL, '2023-02-04 00:54:24', '2023-02-04 00:54:24'),
(402, 63, 97, '32.00', '37440.000', '21.00', NULL, '2023-02-04 00:54:24', '2023-02-04 00:54:24'),
(407, 74, 17, '300.00', '480000.000', '21.00', NULL, '2023-02-04 01:17:54', '2023-02-04 01:17:54'),
(461, 80, 40, '45.00', '20250.000', '21.00', NULL, '2023-02-07 23:19:16', '2023-02-07 23:19:16'),
(472, 49, 40, '278.00', '113980.000', '21.00', NULL, '2023-02-07 23:33:45', '2023-02-07 23:33:45'),
(486, 88, 95, '38.00', '44460.000', '21.00', NULL, '2023-02-08 15:35:33', '2023-02-08 15:35:33'),
(487, 88, 4, '2.00', '10360.000', '21.00', NULL, '2023-02-08 15:35:33', '2023-02-08 15:35:33'),
(488, 88, 93, '2.00', '8040.000', '21.00', NULL, '2023-02-08 15:35:33', '2023-02-08 15:35:33'),
(495, 90, 58, '8.00', '39200.000', '21.00', NULL, '2023-02-09 02:03:53', '2023-02-09 02:03:53'),
(496, 90, 4, '2.00', '10360.000', '21.00', NULL, '2023-02-09 02:03:53', '2023-02-09 02:03:53'),
(497, 90, 91, '0.50', '550.000', '21.00', NULL, '2023-02-09 02:03:53', '2023-02-09 02:03:53'),
(525, 95, 54, '6.00', '27000.000', '21.00', NULL, '2023-02-11 17:31:18', '2023-02-11 17:31:18'),
(526, 95, 4, '1.00', '5370.000', '21.00', NULL, '2023-02-11 17:31:18', '2023-02-11 17:31:18'),
(527, 95, 91, '1.00', '1100.000', '21.00', NULL, '2023-02-11 17:31:18', '2023-02-11 17:31:18'),
(528, 96, 54, '6.00', '27000.000', '21.00', NULL, '2023-02-11 17:46:04', '2023-02-11 17:46:04'),
(529, 96, 4, '1.00', '5370.000', '21.00', NULL, '2023-02-11 17:46:04', '2023-02-11 17:46:04'),
(530, 96, 91, '1.00', '1100.000', '21.00', NULL, '2023-02-11 17:46:04', '2023-02-11 17:46:04'),
(532, 98, 29, '40.00', '64000.000', '21.00', NULL, '2023-02-13 03:46:54', '2023-02-13 03:46:54'),
(533, 99, 50, '13.00', '59150.000', '21.00', NULL, '2023-02-13 16:24:24', '2023-02-13 16:24:24'),
(534, 99, 4, '3.00', '16110.000', '21.00', NULL, '2023-02-13 16:24:24', '2023-02-13 16:24:24'),
(535, 99, 91, '1.50', '1650.000', '21.00', NULL, '2023-02-13 16:24:24', '2023-02-13 16:24:24'),
(542, 102, 150, '4.00', '7400.000', '21.00', NULL, '2023-02-14 01:52:18', '2023-02-14 01:52:18'),
(553, 82, 46, '6.00', '19800.000', '21.00', NULL, '2023-02-15 16:53:38', '2023-02-15 16:53:38'),
(557, 75, 54, '4.50', '20250.000', '21.00', NULL, '2023-02-15 17:13:01', '2023-02-15 17:13:01'),
(558, 75, 91, '0.50', '550.000', '21.00', NULL, '2023-02-15 17:13:01', '2023-02-15 17:13:01'),
(564, 76, 29, '60.00', '96000.000', '21.00', NULL, '2023-02-15 17:52:44', '2023-02-15 17:52:44'),
(565, 108, 46, '10.00', '36000.000', '21.00', NULL, '2023-02-15 18:42:04', '2023-02-15 18:42:04'),
(566, 68, 54, '1.50', '6750.000', '21.00', NULL, '2023-02-16 01:55:32', '2023-02-16 01:55:32'),
(567, 68, 91, '0.50', '550.000', '21.00', NULL, '2023-02-16 01:55:32', '2023-02-16 01:55:32'),
(568, 68, 4, '1.00', '5370.000', '21.00', NULL, '2023-02-16 01:55:33', '2023-02-16 01:55:33'),
(570, 110, 54, '2.50', '12150.000', '21.00', NULL, '2023-02-16 17:37:41', '2023-02-16 17:37:41'),
(571, 110, 91, '0.50', '550.000', '21.00', NULL, '2023-02-16 17:37:41', '2023-02-16 17:37:41'),
(574, 111, 54, '2.50', '12150.000', '21.00', NULL, '2023-02-16 17:44:08', '2023-02-16 17:44:08'),
(575, 111, 91, '0.50', '550.000', '21.00', NULL, '2023-02-16 17:44:08', '2023-02-16 17:44:08'),
(580, 114, 41, '244.00', '185440.000', '21.00', NULL, '2023-02-17 00:50:02', '2023-02-17 00:50:02'),
(588, 100, 50, '3.00', '13650.000', '21.00', NULL, '2023-02-18 15:49:43', '2023-02-18 15:49:43'),
(589, 100, 4, '1.00', '5370.000', '21.00', NULL, '2023-02-18 15:49:43', '2023-02-18 15:49:43'),
(590, 100, 91, '0.50', '550.000', '21.00', NULL, '2023-02-18 15:49:43', '2023-02-18 15:49:43'),
(594, 79, 55, '5.00', '24500.000', '21.00', NULL, '2023-02-20 16:37:16', '2023-02-20 16:37:16'),
(671, 92, 35, '60.00', '96000.000', '21.00', NULL, '2023-02-24 15:48:24', '2023-02-24 15:48:24'),
(672, 103, 46, '25.00', '90000.000', '21.00', NULL, '2023-02-24 15:50:56', '2023-02-24 15:50:56'),
(673, 81, 58, '1.50', '7350.000', '21.00', NULL, '2023-02-24 17:03:56', '2023-02-24 17:03:56'),
(674, 81, 91, '0.50', '550.000', '21.00', NULL, '2023-02-24 17:03:56', '2023-02-24 17:03:56'),
(679, 127, 142, '40.00', '82000.000', '21.00', NULL, '2023-02-27 16:44:48', '2023-02-27 16:44:48'),
(681, 72, 31, '90.00', '144000.000', '21.00', NULL, '2023-02-27 17:51:05', '2023-02-27 17:51:05'),
(682, 72, 30, '90.00', '144000.000', '21.00', NULL, '2023-02-27 17:51:06', '2023-02-27 17:51:06'),
(683, 93, 127, '274.00', '479500.000', '21.00', NULL, '2023-02-27 17:53:10', '2023-02-27 17:53:10'),
(684, 93, 40, '11500.00', '5175000.000', '21.00', NULL, '2023-02-27 17:53:10', '2023-02-27 17:53:10'),
(685, 93, 128, '191.00', '2654900.000', '21.00', NULL, '2023-02-27 17:53:10', '2023-02-27 17:53:10'),
(692, 128, 40, '200.00', '98000.000', '21.00', NULL, '2023-02-28 01:20:58', '2023-02-28 01:20:58'),
(700, 130, 147, '1.28', '2368.000', '21.00', NULL, '2023-02-28 17:38:48', '2023-02-28 17:38:48'),
(709, 78, 38, '12.00', '43200.000', '21.00', NULL, '2023-02-28 23:38:37', '2023-02-28 23:38:37'),
(789, 28, 45, '9.00', '38700.000', '21.00', NULL, '2023-03-02 23:17:44', '2023-03-02 23:17:44'),
(792, 141, 47, '15.00', '79500.000', '21.00', NULL, '2023-03-02 23:25:19', '2023-03-02 23:25:19'),
(793, 141, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-02 23:25:19', '2023-03-02 23:25:19'),
(794, 141, 91, '1.50', '1650.000', '21.00', NULL, '2023-03-02 23:25:19', '2023-03-02 23:25:19'),
(805, 61, 4, '2.00', '10360.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(806, 61, 49, '13.00', '54600.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(807, 61, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(808, 61, 177, '13.00', '54600.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(809, 61, 178, '13.00', '14300.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(810, 61, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-03 17:07:19', '2023-03-03 17:07:19'),
(811, 65, 46, '10.00', '33000.000', '21.00', NULL, '2023-03-03 17:07:48', '2023-03-03 17:07:48'),
(812, 65, 62, '1.00', '4200.000', '21.00', NULL, '2023-03-03 17:07:48', '2023-03-03 17:07:48'),
(813, 73, 105, '333.00', '266400.000', '21.00', NULL, '2023-03-03 17:08:20', '2023-03-03 17:08:20'),
(814, 131, 179, '3.00', '3006.000', '21.00', NULL, '2023-03-03 17:08:57', '2023-03-03 17:08:57'),
(815, 84, 113, '45.00', '85500.000', '21.00', NULL, '2023-03-03 17:09:33', '2023-03-03 17:09:33'),
(816, 84, 120, '8.00', '23600.000', '21.00', NULL, '2023-03-03 17:09:33', '2023-03-03 17:09:33'),
(817, 84, 50, '16.00', '67200.000', '21.00', NULL, '2023-03-03 17:09:33', '2023-03-03 17:09:33'),
(818, 84, 91, '7.00', '7700.000', '21.00', NULL, '2023-03-03 17:09:33', '2023-03-03 17:09:33'),
(819, 84, 4, '3.00', '15540.000', '21.00', NULL, '2023-03-03 17:09:33', '2023-03-03 17:09:33'),
(820, 123, 50, '3.00', '13650.000', '21.00', NULL, '2023-03-04 00:26:14', '2023-03-04 00:26:14'),
(821, 123, 91, '0.50', '550.000', '21.00', NULL, '2023-03-04 00:26:14', '2023-03-04 00:26:14'),
(829, 115, 47, '4.50', '23850.000', '21.00', NULL, '2023-03-04 00:52:13', '2023-03-04 00:52:13'),
(833, 144, 54, '1.00', '4860.000', '21.00', NULL, '2023-03-04 01:51:20', '2023-03-04 01:51:20'),
(834, 144, 54, '1.00', '4860.000', '21.00', NULL, '2023-03-04 01:51:20', '2023-03-04 01:51:20'),
(835, 135, 151, '24.00', '44400.000', '21.00', NULL, '2023-03-04 17:23:37', '2023-03-04 17:23:37'),
(836, 135, 150, '1.28', '2368.000', '21.00', NULL, '2023-03-04 17:23:37', '2023-03-04 17:23:37'),
(837, 135, 152, '2.00', '3700.000', '21.00', NULL, '2023-03-04 17:23:37', '2023-03-04 17:23:37'),
(843, 146, 59, '4.00', '18200.000', '21.00', NULL, '2023-03-04 19:34:37', '2023-03-04 19:34:37'),
(844, 146, 4, '1.00', '5370.000', '21.00', NULL, '2023-03-04 19:34:37', '2023-03-04 19:34:37'),
(845, 146, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-04 19:34:37', '2023-03-04 19:34:37'),
(875, 155, 196, '4.00', '6000.000', '21.00', NULL, '2023-03-07 16:21:19', '2023-03-07 16:21:19'),
(885, 157, 45, '2.00', '9300.000', '21.00', NULL, '2023-03-07 23:22:00', '2023-03-07 23:22:00'),
(886, 157, 196, '1.00', '1500.000', '21.00', NULL, '2023-03-07 23:22:00', '2023-03-07 23:22:00'),
(889, 156, 103, '16.00', '28800.000', '21.00', NULL, '2023-03-08 00:12:42', '2023-03-08 00:12:42'),
(890, 107, 150, '9.60', '17760.000', '21.00', NULL, '2023-03-08 00:29:20', '2023-03-08 00:29:20'),
(891, 142, 193, '1.00', '28000.000', '21.00', NULL, '2023-03-08 00:37:45', '2023-03-08 00:37:45'),
(892, 139, 189, '1.00', '2600.000', '21.00', NULL, '2023-03-08 00:38:18', '2023-03-08 00:38:18'),
(893, 139, 190, '1.00', '600.000', '21.00', NULL, '2023-03-08 00:38:18', '2023-03-08 00:38:18'),
(894, 139, 188, '2.00', '7060.000', '21.00', NULL, '2023-03-08 00:38:18', '2023-03-08 00:38:18'),
(895, 139, 191, '1.00', '350.000', '21.00', NULL, '2023-03-08 00:38:19', '2023-03-08 00:38:19'),
(896, 139, 192, '3.00', '600.000', '21.00', NULL, '2023-03-08 00:38:19', '2023-03-08 00:38:19'),
(897, 138, 177, '12.00', '50400.000', '21.00', NULL, '2023-03-08 00:38:38', '2023-03-08 00:38:38'),
(898, 138, 178, '12.00', '13200.000', '21.00', NULL, '2023-03-08 00:38:38', '2023-03-08 00:38:38'),
(899, 138, 184, '13.00', '39000.000', '21.00', NULL, '2023-03-08 00:38:38', '2023-03-08 00:38:38'),
(900, 138, 183, '1.00', '22000.000', '21.00', NULL, '2023-03-08 00:38:38', '2023-03-08 00:38:38'),
(901, 137, 62, '12.00', '54600.000', '21.00', NULL, '2023-03-08 00:39:03', '2023-03-08 00:39:03'),
(902, 137, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-08 00:39:03', '2023-03-08 00:39:03'),
(903, 137, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-08 00:39:03', '2023-03-08 00:39:03'),
(904, 137, 185, '2.00', '5200.000', '21.00', NULL, '2023-03-08 00:39:03', '2023-03-08 00:39:03'),
(905, 137, 186, '4.00', '4600.000', '21.00', NULL, '2023-03-08 00:39:03', '2023-03-08 00:39:03'),
(926, 150, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-09 17:44:25', '2023-03-09 17:44:25'),
(927, 160, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-09 17:44:45', '2023-03-09 17:44:45'),
(928, 166, 91, '3.00', '3300.000', '21.00', NULL, '2023-03-09 23:27:15', '2023-03-09 23:27:15'),
(929, 163, 47, '0.25', '1325.000', '21.00', NULL, '2023-03-09 23:29:26', '2023-03-09 23:29:26'),
(931, 159, 50, '1.00', '4550.000', '21.00', NULL, '2023-03-10 00:13:52', '2023-03-10 00:13:52'),
(946, 165, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-10 15:39:49', '2023-03-10 15:39:49'),
(947, 165, 49, '8.50', '38675.000', '21.00', NULL, '2023-03-10 15:39:50', '2023-03-10 15:39:50'),
(948, 165, 199, '3.00', '3900.000', '21.00', NULL, '2023-03-10 15:39:50', '2023-03-10 15:39:50'),
(949, 165, 4, '2.00', '10740.000', '21.00', NULL, '2023-03-10 15:39:50', '2023-03-10 15:39:50'),
(951, 153, 91, '6.50', '7150.000', '21.00', NULL, '2023-03-10 16:22:25', '2023-03-10 16:22:25'),
(954, 121, 143, '1.60', '2960.000', '21.00', NULL, '2023-03-10 16:27:52', '2023-03-10 16:27:52'),
(967, 154, 45, '1.00', '4650.000', '21.00', NULL, '2023-03-10 16:52:56', '2023-03-10 16:52:56'),
(971, 126, 46, '30.00', '108000.000', '21.00', NULL, '2023-03-10 17:28:19', '2023-03-10 17:28:19'),
(972, 124, 153, '20.00', '93000.000', '21.00', NULL, '2023-03-10 17:31:51', '2023-03-10 17:31:51'),
(973, 122, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-10 17:32:50', '2023-03-10 17:32:50'),
(974, 122, 50, '7.50', '34125.000', '21.00', NULL, '2023-03-10 17:32:51', '2023-03-10 17:32:51'),
(976, 118, 41, '80.00', '60800.000', '21.00', NULL, '2023-03-10 18:01:10', '2023-03-10 18:01:10'),
(977, 117, 168, '9.00', '194400.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(978, 117, 169, '32.00', '77760.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(979, 117, 170, '43.00', '249615.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(980, 117, 172, '9.00', '48600.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(981, 117, 173, '34.40', '116100.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(982, 117, 174, '86.00', '325080.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(983, 117, 171, '43.00', '92880.000', '21.00', NULL, '2023-03-10 18:12:28', '2023-03-10 18:12:28'),
(984, 140, 47, '15.00', '79500.000', '21.00', NULL, '2023-03-10 23:05:54', '2023-03-10 23:05:54'),
(985, 140, 4, '5.00', '26850.000', '21.00', NULL, '2023-03-10 23:05:54', '2023-03-10 23:05:54'),
(986, 140, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-10 23:05:54', '2023-03-10 23:05:54'),
(987, 140, 185, '1.00', '2600.000', '21.00', NULL, '2023-03-10 23:05:54', '2023-03-10 23:05:54'),
(988, 91, 121, '5.00', '6300.000', '21.00', NULL, '2023-03-10 23:06:16', '2023-03-10 23:06:16'),
(989, 91, 122, '5.00', '34200.000', '21.00', NULL, '2023-03-10 23:06:16', '2023-03-10 23:06:16'),
(990, 91, 123, '5.00', '27000.000', '21.00', NULL, '2023-03-10 23:06:16', '2023-03-10 23:06:16'),
(991, 91, 124, '1.00', '10000.000', '21.00', NULL, '2023-03-10 23:06:16', '2023-03-10 23:06:16'),
(992, 101, 62, '15.00', '68250.000', '21.00', NULL, '2023-03-10 23:42:41', '2023-03-10 23:42:41'),
(993, 101, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-10 23:42:41', '2023-03-10 23:42:41'),
(994, 101, 91, '1.50', '1650.000', '21.00', NULL, '2023-03-10 23:42:41', '2023-03-10 23:42:41'),
(995, 104, 46, '10.00', '36000.000', '21.00', NULL, '2023-03-10 23:43:00', '2023-03-10 23:43:00'),
(996, 105, 156, '80.00', '140000.000', '21.00', NULL, '2023-03-10 23:45:19', '2023-03-10 23:45:19'),
(997, 109, 41, '1225.00', '931000.000', '21.00', NULL, '2023-03-10 23:47:18', '2023-03-10 23:47:18'),
(998, 169, 150, '3.84', '7104.000', '21.00', NULL, '2023-03-11 00:30:16', '2023-03-11 00:30:16'),
(1009, 171, 54, '10.00', '48600.000', '21.00', NULL, '2023-03-11 17:28:02', '2023-03-11 17:28:02'),
(1010, 171, 4, '1.00', '5370.000', '21.00', NULL, '2023-03-11 17:28:02', '2023-03-11 17:28:02'),
(1011, 171, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-11 17:28:02', '2023-03-11 17:28:02'),
(1025, 113, 41, '244.00', '185440.000', '21.00', NULL, '2023-03-13 17:50:08', '2023-03-13 17:50:08'),
(1030, 89, 126, '13.50', '79650.000', '21.00', NULL, '2023-03-13 22:25:42', '2023-03-13 22:25:42'),
(1031, 89, 4, '3.00', '15540.000', '21.00', NULL, '2023-03-13 22:25:42', '2023-03-13 22:25:42'),
(1032, 89, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-13 22:25:42', '2023-03-13 22:25:42'),
(1044, 174, 113, '1.00', '2050.000', '21.00', NULL, '2023-03-13 22:58:28', '2023-03-13 22:58:28'),
(1045, 174, 148, '1.00', '2050.000', '21.00', NULL, '2023-03-13 22:58:29', '2023-03-13 22:58:29'),
(1046, 174, 150, '1.00', '1850.000', '21.00', NULL, '2023-03-13 22:58:29', '2023-03-13 22:58:29'),
(1047, 174, 151, '1.00', '1850.000', '21.00', NULL, '2023-03-13 22:58:29', '2023-03-13 22:58:29'),
(1048, 174, 152, '1.00', '1850.000', '21.00', NULL, '2023-03-13 22:58:29', '2023-03-13 22:58:29'),
(1053, 149, 194, '185.00', '238650.000', '21.00', NULL, '2023-03-13 23:20:07', '2023-03-13 23:20:07'),
(1059, 71, 49, '9.50', '39900.000', '21.00', NULL, '2023-03-15 01:36:18', '2023-03-15 01:36:18'),
(1061, 125, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-15 01:49:46', '2023-03-15 01:49:46'),
(1062, 173, 206, '140.00', '169400.000', '21.00', NULL, '2023-03-15 15:15:00', '2023-03-15 15:15:00'),
(1063, 173, 207, '50.00', '72000.000', '21.00', NULL, '2023-03-15 15:15:00', '2023-03-15 15:15:00'),
(1067, 162, 59, '2.50', '11375.000', '21.00', NULL, '2023-03-15 16:45:05', '2023-03-15 16:45:05'),
(1069, 134, 74, '2.00', '5400.000', '21.00', NULL, '2023-03-15 22:49:09', '2023-03-15 22:49:09'),
(1070, 134, 4, '1.00', '5370.000', '21.00', NULL, '2023-03-15 22:49:09', '2023-03-15 22:49:09'),
(1071, 134, 91, '0.50', '550.000', '21.00', NULL, '2023-03-15 22:49:09', '2023-03-15 22:49:09'),
(1072, 133, 54, '2.00', '9720.000', '21.00', NULL, '2023-03-15 22:49:24', '2023-03-15 22:49:24'),
(1073, 133, 4, '1.00', '5370.000', '21.00', NULL, '2023-03-15 22:49:24', '2023-03-15 22:49:24'),
(1074, 133, 91, '0.50', '550.000', '21.00', NULL, '2023-03-15 22:49:24', '2023-03-15 22:49:24'),
(1075, 148, 31, '55.00', '96250.000', '21.00', NULL, '2023-03-15 22:49:51', '2023-03-15 22:49:51'),
(1076, 119, 53, '15.00', '68250.000', '21.00', NULL, '2023-03-15 22:51:35', '2023-03-15 22:51:35'),
(1077, 116, 32, '60.00', '105000.000', '21.00', NULL, '2023-03-15 22:52:49', '2023-03-15 22:52:49'),
(1086, 152, 33, '30.00', '52500.000', '21.00', NULL, '2023-03-16 15:51:29', '2023-03-16 15:51:29'),
(1087, 152, 91, '3.00', '3300.000', '21.00', NULL, '2023-03-16 15:51:29', '2023-03-16 15:51:29'),
(1088, 178, 153, '30.00', '139500.000', '21.00', NULL, '2023-03-16 19:53:46', '2023-03-16 19:53:46'),
(1089, 179, 15, '1.00', '212570.000', '21.00', NULL, '2023-03-16 22:42:10', '2023-03-16 22:42:10'),
(1090, 175, 58, '7.00', '37100.000', '21.00', NULL, '2023-03-17 00:47:38', '2023-03-17 00:47:38'),
(1091, 175, 142, '19.00', '38950.000', '21.00', NULL, '2023-03-17 00:47:38', '2023-03-17 00:47:38'),
(1092, 175, 115, '11.20', '20720.000', '21.00', NULL, '2023-03-17 00:47:38', '2023-03-17 00:47:38'),
(1093, 48, 46, '7.00', '23100.000', '21.00', NULL, '2023-03-17 00:53:20', '2023-03-17 00:53:20'),
(1096, 176, 177, '11.50', '48300.000', '21.00', NULL, '2023-03-17 01:18:06', '2023-03-17 01:18:06'),
(1097, 176, 208, '2.00', '10400.000', '21.00', NULL, '2023-03-17 01:18:06', '2023-03-17 01:18:06'),
(1098, 176, 178, '13.50', '14850.000', '21.00', NULL, '2023-03-17 01:18:06', '2023-03-17 01:18:06'),
(1101, 51, 91, '3.00', '3300.000', '21.00', NULL, '2023-03-17 01:20:52', '2023-03-17 01:20:52'),
(1102, 51, 45, '15.00', '64500.000', '21.00', NULL, '2023-03-17 01:20:52', '2023-03-17 01:20:52'),
(1105, 167, 93, '1.00', '4170.000', '21.00', NULL, '2023-03-17 16:56:54', '2023-03-17 16:56:54'),
(1106, 167, 93, '1.00', '4170.000', '21.00', NULL, '2023-03-17 16:56:55', '2023-03-17 16:56:55'),
(1108, 158, 163, '6.00', '21060.000', '21.00', NULL, '2023-03-18 00:37:29', '2023-03-18 00:37:29'),
(1109, 158, 209, '6.00', '2430.000', '21.00', NULL, '2023-03-18 00:37:29', '2023-03-18 00:37:29'),
(1111, 181, 129, '20.00', '264000.000', '21.00', NULL, '2023-03-20 15:05:53', '2023-03-20 15:05:53'),
(1112, 172, 202, '900.00', '1161000.000', '21.00', NULL, '2023-03-20 15:22:46', '2023-03-20 15:22:46'),
(1113, 182, 69, '12.00', '54600.000', '21.00', NULL, '2023-03-20 15:42:14', '2023-03-20 15:42:14'),
(1114, 170, 201, '1.00', '117000.000', '21.00', NULL, '2023-03-20 16:00:40', '2023-03-20 16:00:40'),
(1115, 161, 113, '16.50', '33825.000', '21.00', NULL, '2023-03-20 16:00:53', '2023-03-20 16:00:53'),
(1116, 161, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-20 16:00:53', '2023-03-20 16:00:53'),
(1117, 168, 17, '38.00', '66500.000', '21.00', NULL, '2023-03-20 16:02:41', '2023-03-20 16:02:41'),
(1118, 164, 31, '25.00', '43750.000', '21.00', NULL, '2023-03-20 16:02:54', '2023-03-20 16:02:54'),
(1123, 184, 46, '3.00', '10800.000', '21.00', NULL, '2023-03-21 15:12:21', '2023-03-21 15:12:21'),
(1128, 151, 178, '9.00', '9900.000', '21.00', NULL, '2023-03-21 18:06:38', '2023-03-21 18:06:38'),
(1129, 151, 177, '9.00', '37800.000', '21.00', NULL, '2023-03-21 18:06:38', '2023-03-21 18:06:38'),
(1133, 187, 210, '31.00', '30380.000', '21.00', NULL, '2023-03-22 15:13:02', '2023-03-22 15:13:02'),
(1134, 187, 211, '31.00', '65100.000', '21.00', NULL, '2023-03-22 15:13:02', '2023-03-22 15:13:02'),
(1135, 187, 212, '31.00', '99820.000', '21.00', NULL, '2023-03-22 15:13:02', '2023-03-22 15:13:02'),
(1136, 188, 210, '10.50', '10290.000', '21.00', NULL, '2023-03-22 15:20:04', '2023-03-22 15:20:04'),
(1137, 188, 211, '10.50', '22050.000', '21.00', NULL, '2023-03-22 15:20:04', '2023-03-22 15:20:04'),
(1138, 188, 212, '10.50', '33810.000', '21.00', NULL, '2023-03-22 15:20:04', '2023-03-22 15:20:04'),
(1143, 191, 215, '1.00', '9900.000', '21.00', NULL, '2023-03-22 15:54:48', '2023-03-22 15:54:48'),
(1144, 191, 213, '1.00', '24400.000', '21.00', NULL, '2023-03-22 15:54:48', '2023-03-22 15:54:48'),
(1145, 189, 214, '1.00', '22500.000', '21.00', NULL, '2023-03-22 15:55:10', '2023-03-22 15:55:10'),
(1146, 189, 213, '2.00', '48800.000', '21.00', NULL, '2023-03-22 15:55:10', '2023-03-22 15:55:10'),
(1147, 190, 215, '1.00', '9900.000', '21.00', NULL, '2023-03-22 17:27:55', '2023-03-22 17:27:55'),
(1148, 190, 213, '1.00', '24400.000', '21.00', NULL, '2023-03-22 17:27:55', '2023-03-22 17:27:55'),
(1149, 186, 108, '4.00', '5200.000', '21.00', NULL, '2023-03-23 00:23:17', '2023-03-23 00:23:17'),
(1150, 192, 62, '16.00', '72800.000', '21.00', NULL, '2023-03-23 01:50:02', '2023-03-23 01:50:02'),
(1152, 143, 54, '10.00', '48600.000', '21.00', NULL, '2023-03-23 16:28:49', '2023-03-23 16:28:49'),
(1153, 143, 4, '2.00', '10740.000', '21.00', NULL, '2023-03-23 16:28:49', '2023-03-23 16:28:49'),
(1154, 143, 91, '2.00', '2200.000', '21.00', NULL, '2023-03-23 16:28:49', '2023-03-23 16:28:49'),
(1155, 183, 133, '3.00', '19140.000', '21.00', NULL, '2023-03-23 16:30:00', '2023-03-23 16:30:00'),
(1162, 194, 144, '23.00', '47150.000', '21.00', NULL, '2023-03-24 17:21:13', '2023-03-24 17:21:13'),
(1163, 194, 196, '2.00', '3000.000', '21.00', NULL, '2023-03-24 17:21:13', '2023-03-24 17:21:13'),
(1164, 194, 91, '2.00', '3000.000', '21.00', NULL, '2023-03-24 17:21:13', '2023-03-24 17:21:13'),
(1168, 129, 4, '1.00', '5370.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1169, 129, 98, '4.00', '4680.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1170, 129, 110, '46.00', '59800.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1171, 129, 47, '4.00', '21200.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1172, 129, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1173, 129, 4, '3.00', '16110.000', '21.00', NULL, '2023-03-24 23:55:40', '2023-03-24 23:55:40'),
(1174, 147, 17, '38.00', '66500.000', '21.00', NULL, '2023-03-27 15:55:44', '2023-03-27 15:55:44'),
(1175, 147, 91, '4.00', '4400.000', '21.00', NULL, '2023-03-27 15:55:44', '2023-03-27 15:55:44'),
(1176, 185, 50, '2.00', '9100.000', '21.00', NULL, '2023-03-27 17:41:15', '2023-03-27 17:41:15'),
(1177, 185, 50, '5.50', '25025.000', '21.00', NULL, '2023-03-27 17:41:15', '2023-03-27 17:41:15'),
(1178, 197, 40, '1700.00', '833000.000', '21.00', NULL, '2023-03-27 22:09:15', '2023-03-27 22:09:15'),
(1180, 198, 116, '36.00', '73800.000', '21.00', NULL, '2023-03-28 02:06:58', '2023-03-28 02:06:58'),
(1181, 199, 217, '50.00', '60500.000', '21.00', NULL, '2023-03-28 18:03:21', '2023-03-28 18:03:21'),
(1182, 200, 128, '73.00', '1095000.000', '21.00', NULL, '2023-03-28 22:32:37', '2023-03-28 22:32:37'),
(1185, 201, 129, '73.00', '963600.000', '21.00', NULL, '2023-03-29 15:32:14', '2023-03-29 15:32:14'),
(1186, 202, 57, '1.00', '4860.000', '21.00', NULL, '2023-03-29 17:19:00', '2023-03-29 17:19:00'),
(1187, 202, 91, '0.50', '750.000', '21.00', NULL, '2023-03-29 17:19:00', '2023-03-29 17:19:00'),
(1194, 67, 50, '4.00', '16800.000', '21.00', NULL, '2023-03-30 16:25:16', '2023-03-30 16:25:16'),
(1195, 67, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-30 16:25:16', '2023-03-30 16:25:16'),
(1196, 67, 4, '1.00', '5180.000', '21.00', NULL, '2023-03-30 16:25:16', '2023-03-30 16:25:16'),
(1198, 195, 47, '1.00', '5300.000', '21.00', NULL, '2023-03-30 16:46:19', '2023-03-30 16:46:19'),
(1199, 193, 113, '32.00', '65600.000', '21.00', NULL, '2023-03-30 17:02:22', '2023-03-30 17:02:22'),
(1202, 77, 108, '36.00', '57600.000', '21.00', NULL, '2023-03-30 17:40:51', '2023-03-30 17:40:51'),
(1203, 77, 92, '32.00', '38400.000', '21.00', NULL, '2023-03-30 17:40:51', '2023-03-30 17:40:51'),
(1208, 83, 4, '3.00', '15540.000', '21.00', NULL, '2023-03-30 17:47:45', '2023-03-30 17:47:45'),
(1209, 83, 50, '11.00', '50050.000', '21.00', NULL, '2023-03-30 17:47:45', '2023-03-30 17:47:45'),
(1210, 83, 91, '1.00', '1100.000', '21.00', NULL, '2023-03-30 17:47:45', '2023-03-30 17:47:45'),
(1211, 83, 185, '2.00', '5200.000', '21.00', NULL, '2023-03-30 17:47:45', '2023-03-30 17:47:45'),
(1214, 136, 40, '30.00', '14700.000', '21.00', NULL, '2023-03-30 18:05:54', '2023-03-30 18:05:54'),
(1215, 136, 41, '60.00', '45600.000', '21.00', NULL, '2023-03-30 18:05:54', '2023-03-30 18:05:54'),
(1216, 145, 54, '2.00', '9720.000', '21.00', NULL, '2023-03-30 18:09:15', '2023-03-30 18:09:15'),
(1221, 203, 91, '2.50', '3750.000', '21.00', NULL, '2023-04-01 15:41:52', '2023-04-01 15:41:52'),
(1222, 203, 147, '22.00', '40700.000', '21.00', NULL, '2023-04-01 15:41:52', '2023-04-01 15:41:52'),
(1223, 204, 153, '4.00', '18600.000', '21.00', NULL, '2023-04-01 15:51:46', '2023-04-01 15:51:46'),
(1224, 180, 147, '54.00', '99900.000', '21.00', NULL, '2023-04-01 17:57:50', '2023-04-01 17:57:50'),
(1226, 207, 41, '200.00', '152000.000', '21.00', NULL, '2023-04-03 22:28:13', '2023-04-03 22:28:13'),
(1228, 208, 40, '80.00', '39200.000', '21.00', NULL, '2023-04-03 23:10:35', '2023-04-03 23:10:35'),
(1229, 209, 29, '10.00', '17500.000', '21.00', NULL, '2023-04-04 01:13:48', '2023-04-04 01:13:48'),
(1230, 209, 218, '4.00', '11600.000', '21.00', NULL, '2023-04-04 01:13:49', '2023-04-04 01:13:49'),
(1231, 206, 161, '2.88', '10368.000', '21.00', NULL, '2023-04-04 15:36:27', '2023-04-04 15:36:27'),
(1232, 210, 219, '54.00', '162000.000', '21.00', NULL, '2023-04-04 15:53:09', '2023-04-04 15:53:09'),
(1233, 210, 220, '54.00', '54000.000', '21.00', NULL, '2023-04-04 15:53:09', '2023-04-04 15:53:09'),
(1234, 210, 221, '54.00', '32400.000', '21.00', NULL, '2023-04-04 15:53:09', '2023-04-04 15:53:09'),
(1235, 211, 189, '4.00', '10400.000', '21.00', NULL, '2023-04-04 15:57:34', '2023-04-04 15:57:34'),
(1236, 211, 200, '6.00', '7140.000', '21.00', NULL, '2023-04-04 15:57:34', '2023-04-04 15:57:34'),
(1237, 211, 190, '10.00', '6000.000', '21.00', NULL, '2023-04-04 15:57:34', '2023-04-04 15:57:34'),
(1238, 211, 4, '2.00', '10740.000', '21.00', NULL, '2023-04-04 15:57:34', '2023-04-04 15:57:34'),
(1239, 212, 110, '36.00', '48600.000', '21.00', NULL, '2023-04-04 16:41:42', '2023-04-04 16:41:42'),
(1240, 212, 111, '4.00', '5400.000', '21.00', NULL, '2023-04-04 16:41:42', '2023-04-04 16:41:42'),
(1241, 212, 93, '2.00', '8340.000', '21.00', NULL, '2023-04-04 16:41:42', '2023-04-04 16:41:42'),
(1242, 212, 4, '2.00', '10740.000', '21.00', NULL, '2023-04-04 16:41:42', '2023-04-04 16:41:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin Sistema', 'Administrator Sistema', '2022-01-09 01:12:38', '2023-01-06 19:11:07'),
(2, 'gerente', 'Gerente', '2022-01-09 01:12:38', '2022-09-19 17:42:37'),
(3, 'Administracion', 'Administracion Persia', '2023-01-06 19:12:10', '2023-01-06 19:12:10'),
(4, 'Ventas', 'Ventas Persia', '2023-01-10 15:15:06', '2023-01-10 15:15:06'),
(5, 'Ventas_con_productos', 'Ventas_con_productos', '2023-02-08 16:15:03', '2023-02-08 16:15:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`id`, `rubro`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'PISOS', 'Elaboración Propia', '2022-02-08 00:25:00', '2023-01-31 21:42:35'),
(2, 'REVESTIMENTOS', 'Elaboración Propia', '2022-02-08 00:26:00', '2023-01-09 17:58:21'),
(3, 'MUEBLE', 'Elaboración Propia', '2022-02-08 00:26:00', '2023-01-09 17:59:14'),
(4, 'REVENTA', 'Productos Reventa', '2022-02-08 00:26:00', '2023-01-31 21:42:57'),
(5, 'MATERIA PRIMA', 'Materia Prima', '2022-02-08 00:27:00', '2023-01-09 17:57:49'),
(6, 'OBRAS', 'Obras', '2022-11-30 00:09:00', '2023-01-09 17:57:13'),
(7, 'PLACA ANTIHUMEDAD', 'Productos Reventa', '2023-01-09 17:54:24', '2023-01-09 17:54:24'),
(8, 'BANCO', 'Elaboración Propia', '2023-02-10 16:49:47', '2023-02-10 16:49:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Sistema de Administracion', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Sistema de Administracion de Persia', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/September2022/B8gzJwNWlMuHNqwm8L6H.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/January2023/HBxWvFtph0jkVNcD1FQ3.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Sistema Persia', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Sistema Admninstracion Persia', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/January2023/CfZvyl0Pn8PrvGv2LaIh.PNG', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubros`
--

CREATE TABLE `subrubros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rubro_id` bigint(20) UNSIGNED NOT NULL,
  `descripcion_subrubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subrubros`
--

INSERT INTO `subrubros` (`id`, `rubro_id`, `descripcion_subrubro`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pisos-Adoquines', '2022-02-08 00:27:31', '2022-02-08 00:27:31'),
(2, 1, 'Pisos-Lajas', '2022-02-08 00:27:42', '2022-02-08 00:27:42'),
(3, 1, 'Pisos-Baldosas', '2022-02-08 00:27:52', '2022-02-08 00:27:52'),
(4, 3, 'Muebles a medida', '2022-02-08 00:28:19', '2022-02-08 00:28:19'),
(5, 2, 'Revestimientos-Simil Madera', '2022-02-08 00:28:00', '2022-02-08 00:29:54'),
(6, 2, 'Revestimientos-Simil Piedra', '2022-02-08 00:29:00', '2022-02-08 00:29:34'),
(7, 2, 'Esquineros', '2022-02-08 00:30:08', '2022-02-08 00:30:08'),
(8, 5, 'Materia prima pisos y revestimientos', '2022-02-08 01:11:59', '2022-02-08 01:11:59'),
(9, 5, 'Materia prima muebles', '2022-02-08 01:12:25', '2022-02-08 01:12:25'),
(10, 4, 'RV-Pinturas y revestimientos', '2022-02-08 01:13:13', '2022-02-08 01:13:13'),
(11, 4, 'RV-Adhesivos', '2022-02-08 01:13:28', '2022-02-08 01:13:28'),
(12, 4, 'RV-pinceles y rodillos', '2022-02-08 01:13:46', '2022-02-08 01:13:46'),
(13, 6, 'Mamposteria', '2022-11-30 00:10:50', '2022-11-30 00:10:50'),
(14, 6, 'Techos', '2022-11-30 00:11:03', '2022-11-30 00:11:03'),
(15, 6, 'Aberturas', '2022-11-30 00:11:15', '2022-11-30 00:11:15'),
(16, 6, 'Instalaciones Sanitarias', '2022-11-30 00:11:00', '2022-11-30 00:13:56'),
(17, 6, 'Instalaciones Eléctricas', '2022-11-30 00:12:07', '2022-11-30 00:12:07'),
(18, 6, 'Contrapiso', '2022-11-30 00:12:38', '2022-11-30 00:12:38'),
(19, 6, 'Revoque', '2022-11-30 00:12:55', '2022-11-30 00:12:55'),
(20, 6, 'Pintura', '2022-11-30 00:13:38', '2022-11-30 00:13:38'),
(21, 1, 'Simil Madera', '2023-01-10 17:21:39', '2023-01-10 17:21:39'),
(22, 1, 'atermico', '2023-01-31 21:42:00', '2023-02-01 17:49:05'),
(23, 4, 'PLACA ANTIHUMEDAD', '2023-02-06 18:38:05', '2023-02-06 18:38:05'),
(24, 8, 'banco', '2023-02-10 16:50:26', '2023-02-10 16:50:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_gastos`
--

CREATE TABLE `tipos_gastos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo1` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo2` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_gastos`
--

INSERT INTO `tipos_gastos` (`id`, `tipo1`, `tipo2`, `created_at`, `updated_at`) VALUES
(1, 'Gastos Fijos', 'Prestamos Bancos', '2022-02-08 00:41:14', '2022-02-08 00:41:14'),
(2, 'Gastos Fijos', 'Alquileres', '2022-02-08 00:41:29', '2022-02-08 00:41:29'),
(3, 'Gastos Fijos', 'Sueldos y Comisiones', '2022-02-08 00:41:42', '2022-02-08 00:41:42'),
(4, 'Gastos Fijos', 'Impuestos y Tasas', '2022-02-08 00:41:57', '2022-02-08 00:41:57'),
(5, 'Gastos Fijos', 'Servicios', '2022-02-08 00:41:00', '2022-02-08 00:42:36'),
(6, 'Gastos Variables', 'Inversión', '2022-02-08 00:43:12', '2022-02-08 00:43:12'),
(7, 'Gastos Variables', 'Gastos Varios', '2022-02-08 00:43:33', '2022-02-08 00:43:33'),
(8, 'Gastos Variables', 'Combustible Fletes', '2022-02-08 01:02:17', '2022-02-08 01:02:17'),
(9, 'Gastos Variables', 'Preparado de Moldes', '2022-02-08 01:02:43', '2022-02-08 01:02:43'),
(10, 'Gastos Variables', 'Preparado de Moldes', '2022-02-08 01:02:45', '2022-02-08 01:02:45'),
(11, 'Gastos Variables', 'Insumos de embalaje', '2022-02-08 01:03:04', '2022-02-08 01:03:04'),
(12, 'Gastos Variables', 'Insumos Piso', '2022-02-08 01:03:20', '2022-02-08 01:03:20'),
(13, 'Gastos Variables', 'Insumos Muebles', '2022-02-08 01:03:36', '2022-02-08 01:03:36'),
(14, 'Mercaderia  reventa', 'Pinturas', '2022-02-08 01:04:00', '2022-12-12 23:09:04'),
(15, 'Gastos Fijos', 'Marketing', '2023-01-11 16:30:00', '2023-01-28 00:34:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_presupuestos`
--

CREATE TABLE `tipos_presupuestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desc_tipo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porc_comision` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_presupuestos`
--

INSERT INTO `tipos_presupuestos` (`id`, `desc_tipo`, `porc_comision`, `created_at`, `updated_at`) VALUES
(1, 'Pisos', '1', '2023-02-21 02:14:32', '2023-02-21 02:14:32'),
(2, 'Productos', '1', '2023-02-21 02:14:59', '2023-02-21 02:14:59'),
(3, 'Obras', '1', '2023-02-21 02:15:25', '2023-02-21 02:15:25'),
(4, 'Muebles', '5', '2023-02-21 02:15:44', '2023-02-21 02:15:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-02-08 00:13:05', '2022-02-08 00:13:05'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-02-08 00:13:05', '2022-02-08 00:13:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/January2023/B0WIzSaKdUnEFJAAOnEm.PNG', NULL, '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S', 'gtljfWkKRyjaqtNPwOH2uoVTPBzXROltylsLtTUy2aWRpzQwCVTIaBtSyUc9', '{\"locale\":\"es\"}', '2022-01-09 01:12:38', '2023-01-05 01:52:19'),
(2, 2, 'Sonia', 'persiarevestimientos@gmail.com', 'users/January2023/TWAF9GFFPlgjAkMJ4gPW.PNG', NULL, '$2y$10$e7919r3ou3IM5Wj18XM7s.4NmcmTZlP43RTFAk/y6SywTiIs10CCS', NULL, '{\"locale\":\"es\"}', '2022-09-17 15:37:07', '2023-01-05 01:53:30'),
(3, 3, 'Administracion', 'admpersiahoracio@gmail.com', 'users/January2023/m5Q4g1afvKCzA8FTDz3B.PNG', NULL, '$2y$10$.ukVOleZm6LDCC8bjrhnIu5G8TW1y5rcio0jL6JNl3wgx7ikGelf2', 'hkkSyhwWSJj3Ys4PNl0WH483jNSzbCD3ZJENTLELDsnkXTeGQosWjZelBqSf', '{\"locale\":\"es\"}', '2023-01-06 19:38:53', '2023-01-10 15:10:26'),
(4, 4, 'Laura', 'persiarevestimientosmuebles@gmail.com', 'users/January2023/DV2YcZ8vdvtdFib9L0EI.png', NULL, '$2y$10$CWzBqK3ZRNJt4oFTndENoeEwDlGSHQIajRoCGez4W1KotO/7k9Equ', NULL, '{\"locale\":\"es\"}', '2023-01-10 15:21:29', '2023-01-10 15:28:34'),
(5, 4, 'Flavia', 'ventapersiaflavia@gmail.com', 'users/January2023/okDESpeOlTGZziiISZ0R.png', NULL, '$2y$10$dFTRgKuzC8ENLyyWws4jteZtWrnRUGfWlapUfuGkwRVOsXyxyzvty', 'ywCz4HFyfzrv2k162LXKPOkzzZPCAOtbwT3OgHiiNB5e7FnoS5INPOXmeKex', '{\"locale\":\"es\"}', '2023-01-10 15:23:41', '2023-01-30 16:44:39'),
(6, 4, 'Cesar', 'ventapersiacesar@gmail.com', 'users/January2023/YbrQkCNLCCU77tTemruH.PNG', NULL, '$2y$10$7BjGiybg8qWKRvPoTuxcMuZLmB90sj9KJnRKJWkR.70IXg.AGmjtK', 'aBCzGeIX9hRjxpz8noij1hGMIbpwAfjLARHdEv1KoGoVtBLkwlfmXxT9IwxC', '{\"locale\":\"es\"}', '2023-01-30 17:03:30', '2023-01-30 17:03:30'),
(7, 5, 'Sofia', 'ventapersiasofia@gmail.com', 'users/January2023/7uxfcQaKPzh0Q0E5IgKr.webp', NULL, '$2y$10$OFf/SnOjCCOMB8SPBcDLi.VGCoV1MUj23eHQvGRCQHUyJJfYsAbey', 'QodBTpjomvYxlZmY4rcGHQ8kNkBUFoNc1KVb8D244wghk6Sf3dJzQYlLnj4z', '{\"locale\":\"es\"}', '2023-01-31 21:41:36', '2023-02-08 16:17:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 2),
(3, 3),
(4, 4),
(6, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bases`
--
ALTER TABLE `bases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajas_diarias`
--
ALTER TABLE `cajas_diarias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_id_localidad_foreign` (`id_localidad`);

--
-- Indices de la tabla `cuentas_bancos`
--
ALTER TABLE `cuentas_bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `detalles_facturas_compras`
--
ALTER TABLE `detalles_facturas_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalles_facturas_compras_id_factura_compra_index` (`id_factura_compra`),
  ADD KEY `detalles_facturas_compras_id_producto_index` (`id_producto`);

--
-- Indices de la tabla `dosificaciones`
--
ALTER TABLE `dosificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturas_compras_id_tipo_gasto_foreign` (`id_tipo_gasto`),
  ADD KEY `facturas_compras_id_proveedor_foreign` (`id_proveedor`);

--
-- Indices de la tabla `facturas_ventas`
--
ALTER TABLE `facturas_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Factura_Venta_Clientes` (`id_cliente`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `formaspago`
--
ALTER TABLE `formaspago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moldes`
--
ALTER TABLE `moldes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mov_financieros`
--
ALTER TABLE `mov_financieros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mov_financieros_id_cuenta_bancaria_foreign` (`id_cuenta_bancaria`),
  ADD KEY `mov_financieros_id_caja_foreign` (`id_caja`),
  ADD KEY `mov_financieros_id_factura_compra_foreign` (`id_factura_compra`),
  ADD KEY `mov_financieros_id_nota_pedido_foreign` (`id_nota_pedido`);

--
-- Indices de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Nota_Pedido_Clientes` (`id_cliente`),
  ADD KEY `nota_pedidos_id_vendedor_foreign` (`id_vendedor`);

--
-- Indices de la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordenes_fabricacion_id_producto_foreign` (`id_producto`),
  ADD KEY `ordenes_fabricacion_id_renglon_pedido_foreign` (`id_pedido`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Productos_Rubro` (`rubro_id`),
  ADD KEY `FK_Productos_SubRubro` (`subrubro_id`),
  ADD KEY `FK_Productos_Moldes` (`id_molde`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `renglones_notapedidos`
--
ALTER TABLE `renglones_notapedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Renglones_NotaPedido_Nota_Pedido` (`id_pedido`),
  ADD KEY `FK_Renglones_NotaPedido_Productos` (`id_producto`),
  ADD KEY `FK_Renglones_NotaPedido_Factura_Venta` (`id_factura`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SubRubro_Rubro` (`rubro_id`);

--
-- Indices de la tabla `tipos_gastos`
--
ALTER TABLE `tipos_gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_presupuestos`
--
ALTER TABLE `tipos_presupuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bases`
--
ALTER TABLE `bases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas_diarias`
--
ALTER TABLE `cajas_diarias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancos`
--
ALTER TABLE `cuentas_bancos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `detalles_facturas_compras`
--
ALTER TABLE `detalles_facturas_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `dosificaciones`
--
ALTER TABLE `dosificaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `facturas_ventas`
--
ALTER TABLE `facturas_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formaspago`
--
ALTER TABLE `formaspago`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `moldes`
--
ALTER TABLE `moldes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mov_financieros`
--
ALTER TABLE `mov_financieros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT de la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `renglones_notapedidos`
--
ALTER TABLE `renglones_notapedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1243;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tipos_gastos`
--
ALTER TABLE `tipos_gastos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipos_presupuestos`
--
ALTER TABLE `tipos_presupuestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_id_localidad_foreign` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`);

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_facturas_compras`
--
ALTER TABLE `detalles_facturas_compras`
  ADD CONSTRAINT `detalles_facturas_compras_id_factura_compra_foreign` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturas_compras` (`id`),
  ADD CONSTRAINT `detalles_facturas_compras_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  ADD CONSTRAINT `facturas_compras_id_proveedor_foreign` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `facturas_compras_id_tipo_gasto_foreign` FOREIGN KEY (`id_tipo_gasto`) REFERENCES `tipos_gastos` (`id`);

--
-- Filtros para la tabla `facturas_ventas`
--
ALTER TABLE `facturas_ventas`
  ADD CONSTRAINT `facturas_ventas_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mov_financieros`
--
ALTER TABLE `mov_financieros`
  ADD CONSTRAINT `mov_financieros_id_caja_foreign` FOREIGN KEY (`id_caja`) REFERENCES `cajas_diarias` (`id`),
  ADD CONSTRAINT `mov_financieros_id_cuenta_bancaria_foreign` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `cuentas_bancos` (`id`),
  ADD CONSTRAINT `mov_financieros_id_factura_compra_foreign` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturas_compras` (`id`);

--
-- Filtros para la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  ADD CONSTRAINT `nota_pedidos_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `nota_pedidos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  ADD CONSTRAINT `ordenes_fabricacion_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_id_molde_foreign` FOREIGN KEY (`id_molde`) REFERENCES `moldes` (`id`),
  ADD CONSTRAINT `productos_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`),
  ADD CONSTRAINT `productos_subrubro_id_foreign` FOREIGN KEY (`subrubro_id`) REFERENCES `subrubros` (`id`);

--
-- Filtros para la tabla `subrubros`
--
ALTER TABLE `subrubros`
  ADD CONSTRAINT `subrubros_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
