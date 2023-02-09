-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2023 a las 20:43:52
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `persia`
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
  `order` int(11) NOT NULL DEFAULT 1,
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
(1, 'Juan Perez', '30-71472882-9', NULL, NULL, NULL, 1, NULL, NULL, 'MO', NULL, '2022-02-08 00:24:00', '2022-02-08 00:25:17'),
(2, 'Juana Garcia', '32-25546879-0', NULL, NULL, NULL, 2, NULL, NULL, 'RI', NULL, '2022-02-08 00:25:00', '2022-09-26 23:00:21'),
(3, 'Rosina Sandoval', '32-25546879-0', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-02-12 17:40:54', '2022-02-12 17:40:54'),
(4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-09-09 00:28:09', '2022-09-09 00:28:09'),
(5, 'Alba', '27-21367249-0', '2022-09-08 00:00:00', 'Barrio UTA Mz 35 C 12', NULL, 3, NULL, NULL, 'RI', NULL, '2022-09-09 00:29:00', '2022-09-09 00:30:14'),
(6, 'Roberto Salas', '32-25546879-0', '2022-09-08 00:00:00', 'Av. Maipú 673', NULL, 1, NULL, NULL, NULL, NULL, '2022-09-09 00:34:00', '2022-09-09 00:34:00'),
(7, 'Lucas Salas', '30-71472882-9', '2022-09-09 00:00:00', 'Av. Maipú 673', NULL, 3, NULL, NULL, NULL, NULL, '2022-09-09 16:36:21', '2022-09-09 16:36:21');

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
(1, 'Nuevo Banco del Chaco', 'Resistencia', 'Caja de ahorro', '2222222', '22222222', '2022-10-19 15:06:29', '2022-10-19 15:06:29');

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
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
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
(88, 16, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 3),
(89, 16, 'id_cliente', 'text', 'Id Cliente', 0, 0, 0, 1, 1, 1, '{}', 4),
(91, 16, 'totalgravado', 'text', 'Totalgravado', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 16, 'total', 'text', 'Total', 0, 0, 0, 0, 0, 0, '{}', 7),
(93, 16, 'monto_iva', 'text', 'Monto Iva', 1, 0, 0, 0, 0, 0, '{}', 8),
(94, 16, 'id_vendedor', 'text', 'Id Vendedor', 0, 0, 0, 1, 1, 1, '{}', 13),
(96, 16, 'id_factura', 'text', 'Id Factura', 0, 0, 0, 0, 0, 0, '{}', 9),
(98, 16, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{\"display\":{\"height\":\"5\"}}', 21),
(100, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(101, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
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
(118, 16, 'nota_pedido_belongsto_empleado_relationship', 'relationship', 'Vendedor 1', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
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
(137, 20, 'unidad', 'select_dropdown', 'Unidad', 0, 0, 1, 1, 1, 1, '{\"default\":\"m2\",\"options\":{\"kg\":\"kg\",\"grs\":\"gr\",\"m2\":\"m2\",\"Paquete\":\"Paquete\",\"Bolsa\":\"Bolsa\",\"Unidad\":\"Unidad\"}}', 10),
(140, 20, 'activo', 'select_dropdown', 'Activo', 0, 1, 1, 1, 1, 1, '{\"default\":\"SI\",\"options\":{\"SI\":\"SI\",\"NO\":\"NO\"}}', 3),
(143, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 18),
(144, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(145, 20, 'producto_hasone_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rubro\",\"table\":\"rubros\",\"type\":\"belongsTo\",\"column\":\"rubro_id\",\"key\":\"id\",\"label\":\"rubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(146, 20, 'producto_belongsto_subrubro_relationship', 'relationship', 'subrubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Subrubro\",\"table\":\"subrubros\",\"type\":\"belongsTo\",\"column\":\"subrubro_id\",\"key\":\"id\",\"label\":\"descripcion_subrubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
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
(165, 16, 'descuento', 'text', 'Recargo /Descuento (+/-)', 0, 1, 1, 1, 1, 1, '{}', 11),
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
(256, 16, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente Aprobacion\",\"options\":{\"Rechazado\":\"Rechazado\",\"Pendiente Aprobacion\":\"Pendiente Aprobacion\",\"Pendiente Entrega\":\"Aprobado-Pendiente Entrega\",\"Entregado\":\"Entregado\"}}', 10),
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
(277, 16, 'id_vendedor_2', 'text', 'Id Vendedor 2', 0, 0, 0, 1, 1, 1, '{}', 19),
(278, 16, 'tipo_presupuesto', 'select_dropdown', 'Tipo Presupuesto', 0, 1, 1, 1, 1, 1, '{\"default\":\"Productos\",\"options\":{\"Productos\":\"Productos\",\"Muebles\":\"Muebles\",\"Obras\":\"Obras\"}}', 2),
(279, 16, 'nota_pedido_belongsto_empleado_relationship_1', 'relationship', 'Vendedor 2', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor_2\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
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
(299, 16, 'nro_remito', 'text', 'Nro Remito', 0, 0, 1, 1, 0, 1, '{}', 17),
(300, 16, 'fecha_entrega', 'date', 'Fecha Entrega', 0, 1, 1, 1, 1, 1, '{}', 18),
(303, 26, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Cancelada\",\"options\":{\"Cancelada\":\"Cancelada\",\"Pendiente\":\"Pendiente\"}}', 16),
(304, 16, 'modalidad_venta', 'select_dropdown', 'Modalidad Venta', 0, 1, 1, 1, 1, 1, '{\"default\":\"Otros\",\"options\":{\"Contado\":\"Contado\",\"Otros\":\"Otros\"}}', 20),
(305, 16, 'nota_pedido_belongsto_cliente_relationship', 'relationship', 'cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"id_cliente\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(306, 16, 'Anexo_Presupuesto', 'rich_text_box', 'Anexo Presupuesto', 0, 0, 1, 1, 1, 1, '{}', 22);

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
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(13, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Models\\Cliente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-11 23:35:14', '2023-01-09 14:28:54'),
(16, 'nota_pedidos', 'nota-pedidos', 'Nota Pedido', 'Nota Pedidos', NULL, 'App\\Models\\nota_pedido', NULL, 'App\\Http\\Controllers\\Voyager\\PedidosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:34:43', '2023-01-30 20:30:10'),
(17, 'empleados', 'empleados', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:40:47', '2022-02-10 02:15:28'),
(18, 'rubros', 'rubros', 'Rubro', 'Rubros', NULL, 'App\\Models\\Rubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:04:32', '2022-11-30 00:08:28'),
(19, 'subrubros', 'subrubros', 'Subrubro', 'Subrubros', NULL, 'App\\Models\\Subrubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:05:02', '2022-01-18 15:39:51'),
(20, 'productos', 'productos', 'Producto', 'Productos', NULL, 'App\\Models\\Producto', NULL, 'App\\Http\\Controllers\\Voyager\\ProductosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-18 14:30:46', '2023-01-10 23:08:07'),
(23, 'localidades', 'localidades', 'Localidade', 'Localidades', NULL, 'App\\Models\\Localidad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(24, 'tipos_gastos', 'tipos-gastos', 'Tipos Gasto', 'Tipos Gastos', NULL, 'App\\Models\\Tipo_gasto', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-08 00:36:04', '2022-02-16 18:08:45'),
(25, 'proveedores', 'proveedores', 'Proveedor', 'Proveedores', NULL, 'App\\Models\\Proveedor', NULL, 'App\\Http\\Controllers\\Voyager\\ProveedoresController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:13:49', '2023-01-05 00:50:32'),
(26, 'facturas_compras', 'facturas-compras', 'Facturas Compra', 'Facturas Compras', NULL, 'App\\Models\\Factura_Compra', NULL, 'App\\Http\\Controllers\\Voyager\\facturas_comprasController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:17:00', '2023-01-04 15:49:59'),
(31, 'mov_financieros', 'movimientos_financieros', 'Mov Financiero', 'Mov Financieros', NULL, 'App\\Models\\MovFinanciero', NULL, 'App\\Http\\Controllers\\Voyager\\MovFinancieroController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-17 01:14:52', '2023-01-09 14:24:09'),
(36, 'ordenes_fabricacion', 'ordenes_fabricacion', 'Ordenes Fabricacion', 'Ordenes Fabricacion', NULL, 'App\\Models\\OrdenesFabricacion', NULL, 'App\\Http\\Controllers\\Voyager\\OrdenesFabricController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-30 23:47:34', '2022-09-23 17:55:09'),
(44, 'moldes', 'moldes', 'Molde', 'Moldes', NULL, 'App\\Models\\Molde', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-08-10 22:52:51', '2022-08-10 22:52:51'),
(46, 'formaspago', 'formaspago', 'Formaspago', 'Formaspagos', NULL, 'App\\Models\\Formaspago', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-09-10 02:27:30', '2022-09-10 02:28:19'),
(48, 'cuentas_bancos', 'cuentas-bancos', 'Cuentas Banco', 'Cuentas Bancos', NULL, 'App\\Models\\Cuentas_Banco', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-10-19 15:05:46', '2022-10-19 15:05:46');

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
(45, 17, 'Rojo', 6, '1.00000', 'gr', '2022-09-27 17:07:40', '2022-09-27 17:07:40', 'Base'),
(46, 17, '', 7, '1.00000', 'balde', '2022-09-27 17:07:40', '2022-09-27 17:07:40', 'Base'),
(56, 24, 'beige', 6, '2.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(57, 24, 'beige', 7, '3.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(58, 24, 'beige', 2, '4.00000', 'kg', '2022-11-30 00:48:11', '2022-11-30 00:48:11', 'Base'),
(59, 25, 'gris', 6, '10.00000', 'kg', '2022-11-30 00:57:07', '2022-11-30 00:57:07', 'Base'),
(60, 25, 'gris', 7, '5.00000', 'kg', '2022-11-30 00:57:07', '2022-11-30 00:57:07', 'Base'),
(86, 3, 'beige', 7, '2.00000', 'kg', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Base'),
(87, 3, 'beige', 2, '2.00000', 'gr', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Base'),
(88, 3, NULL, 9, '15.00000', 'kg', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Base'),
(89, 3, 'gris', 9, '1.00000', 'vaso', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Liston 1'),
(90, 3, 'gris', 9, '1.00000', 'vaso', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Liston 2'),
(91, 3, 'gris', 8, '1.00000', 'vaso', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Liston 2'),
(92, 3, NULL, 10, '12.00000', 'vaso', '2022-12-31 00:01:13', '2022-12-31 00:01:13', 'Liston 1');

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
(1, 'Pedro Fuentes', '23-43524214-9', '43524214', '2022-08-24 00:00:00', 'Operario Fabrica', 'Activo', '1980-11-25 00:00:00', 'soltero', 'por ahi 2222', '3625425852', NULL, '2022-02-10 02:13:00', '2022-09-27 15:40:00'),
(2, 'Laura', NULL, NULL, NULL, 'Vendedora', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-10 02:13:00', '2022-02-10 02:13:00'),
(3, 'Ivana', NULL, NULL, NULL, 'Vendedora', 'Alta', NULL, 'casado', NULL, NULL, NULL, '2022-02-10 02:14:00', '2022-02-10 02:14:00');

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
(24, 'A', 1, 1, 29, '2023-01-10 00:00:00', NULL, 1, '2023-01-10 19:27:52', '1111.000', NULL, NULL, '1111.000', '2023-01-10 22:27:52', '2023-01-10 22:30:33', 'Cancelada'),
(25, 'A', 1, 1, 28, '2023-01-10 00:00:00', NULL, 9, '2023-01-10 19:31:45', '20000.000', '5000.000', NULL, '25000.000', '2023-01-10 22:31:45', '2023-01-10 22:31:45', 'Cancelada'),
(26, 'INT', 1, 1, 23, '2023-01-10 00:00:00', NULL, 5, '2023-01-10 19:32:29', NULL, NULL, NULL, '9999.000', '2023-01-10 22:32:29', '2023-01-10 22:32:29', 'Cancelada');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, 'Corrientes', 'Bella Vista', '2022-02-08 00:21:07', '2022-02-08 00:21:07'),
(2, 'Corrientes', 'Corrientes', '2022-02-08 00:21:21', '2022-02-08 00:21:21'),
(3, 'Chaco', 'Resistencia', '2022-02-08 00:21:29', '2022-02-08 00:21:29'),
(4, 'Chaco', 'Saenz Peña', '2022-02-08 00:21:42', '2022-02-08 00:21:42');

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
(1, 'admin', '2022-01-09 01:12:38', '2022-01-09 01:12:38');

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
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 2, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 34, 1, '2022-01-09 01:12:38', '2022-03-15 16:11:59', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', 34, 2, '2022-01-09 01:12:38', '2022-05-30 23:17:48', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2022-01-09 01:12:38', '2022-03-15 16:11:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-01-09 01:12:38', '2022-03-15 16:02:36', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-01-09 01:12:38', '2022-03-15 16:11:45', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 5, '2022-01-09 01:12:38', '2023-01-06 14:57:19', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 3, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 4, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.pages.index', NULL),
(17, 1, 'Clientes', '', '_self', NULL, '#000000', 31, 1, '2022-01-11 23:35:14', '2022-03-15 16:22:04', 'voyager.clientes.index', 'null'),
(19, 1, 'Nota Pedidos', '', '_self', NULL, '#000000', 31, 2, '2022-01-13 01:34:43', '2022-03-15 16:21:47', 'voyager.nota-pedidos.index', 'null'),
(20, 1, 'Empleados', '', '_self', NULL, NULL, 33, 1, '2022-01-13 01:40:47', '2022-03-15 16:10:02', 'voyager.empleados.index', NULL),
(21, 1, 'Rubros', '', '_self', NULL, NULL, 33, 2, '2022-01-16 00:04:32', '2022-03-15 16:10:05', 'voyager.rubros.index', NULL),
(22, 1, 'Subrubros', '', '_self', NULL, NULL, 33, 3, '2022-01-16 00:05:02', '2022-03-15 16:10:08', 'voyager.subrubros.index', NULL),
(23, 1, 'Productos', '', '_self', NULL, '#000000', 33, 5, '2022-01-18 14:30:46', '2022-08-11 01:25:30', 'voyager.productos.index', 'null'),
(24, 1, 'Localidades', '', '_self', NULL, NULL, 33, 6, '2022-02-08 00:20:36', '2022-08-11 01:25:30', 'voyager.localidades.index', NULL),
(25, 1, 'Tipos Gastos', '', '_self', NULL, NULL, 33, 7, '2022-02-08 00:36:04', '2022-12-15 03:46:53', 'voyager.tipos-gastos.index', NULL),
(26, 1, 'Proveedores', '', '_self', NULL, '#000000', 32, 1, '2022-02-12 00:13:49', '2022-12-15 03:48:30', 'voyager.proveedores.index', 'null'),
(27, 1, 'Facturas Compras', '', '_self', NULL, '#000000', 32, 2, '2022-02-12 00:17:00', '2022-12-15 03:46:53', 'voyager.facturas-compras.index', 'null'),
(30, 1, 'Iva Compras', '/IVAcompras', '_self', NULL, '#000000', 35, 1, '2022-03-15 16:04:14', '2022-03-25 18:08:18', NULL, ''),
(31, 1, 'VENTAS', '', '_self', NULL, '#000000', NULL, 9, '2022-03-15 16:08:00', '2023-01-06 14:57:14', NULL, ''),
(32, 1, 'COMPRAS', '', '_self', NULL, '#000000', NULL, 10, '2022-03-15 16:08:27', '2023-01-06 14:57:14', NULL, ''),
(33, 1, 'TABLAS BASICAS', '', '_self', NULL, '#000000', NULL, 8, '2022-03-15 16:08:56', '2023-01-06 14:57:14', NULL, ''),
(34, 1, 'PERMISOS', '', '_self', NULL, '#000000', NULL, 7, '2022-03-15 16:09:06', '2023-01-06 14:57:14', NULL, ''),
(35, 1, 'INFORMES', '', '_self', NULL, '#000000', NULL, 13, '2022-03-15 16:10:53', '2023-01-06 14:57:14', NULL, ''),
(36, 1, 'TESORERIA', '', '_self', NULL, '#000000', NULL, 11, '2022-03-15 16:11:31', '2023-01-06 14:57:14', NULL, ''),
(37, 1, 'IVA Ventas', '/IVAventas', '_self', NULL, '#000000', 35, 2, '2022-03-16 01:10:07', '2022-03-17 21:04:36', NULL, ''),
(39, 1, 'Informe de Ventas', '/Informeventas', '_self', NULL, '#000000', 35, 4, '2022-03-25 18:57:20', '2022-03-29 01:38:32', NULL, ''),
(40, 1, 'Informes de Movimientos Financieros', '/Informetesoreria', '_self', NULL, '#000000', 35, 5, '2022-03-26 01:40:53', '2022-12-15 03:46:53', NULL, ''),
(41, 1, 'Informe Compras', '/Informecompras', '_self', NULL, '#000000', 35, 3, '2022-03-29 01:27:30', '2022-03-29 01:38:32', NULL, ''),
(42, 1, 'Productos', '/informe_productos', '_self', NULL, '#000000', 35, 7, '2022-04-04 22:59:12', '2022-12-15 03:48:17', NULL, ''),
(43, 1, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 12, '2022-05-30 16:16:17', '2023-01-06 14:57:14', NULL, ''),
(44, 1, 'Ordenes de Fabricacion', '', '_self', NULL, '#000000', 43, 1, '2022-05-30 23:17:32', '2022-06-01 18:05:22', 'voyager.ordenes_fabricacion.index', 'null'),
(46, 1, 'Moldes', '', '_self', NULL, NULL, 33, 4, '2022-08-10 22:52:51', '2022-08-11 01:25:30', 'voyager.moldes.index', NULL),
(48, 1, 'Formaspagos', '', '_self', NULL, NULL, 33, 9, '2022-09-10 02:27:30', '2023-01-06 14:54:42', 'voyager.formaspago.index', NULL),
(49, 1, 'Cuentas Bancos', '', '_self', NULL, NULL, 33, 8, '2022-10-19 15:05:46', '2023-01-06 14:54:42', 'voyager.cuentas-bancos.index', NULL),
(50, 1, 'Remitos', '/Remitos', '_self', NULL, '#000000', 43, 2, '2022-11-11 14:59:51', '2022-11-17 16:25:27', NULL, ''),
(51, 1, 'Informe de producción', '/Informeproduccion', '_self', NULL, '#000000', 35, 6, '2022-12-13 16:17:29', '2022-12-15 03:48:17', NULL, ''),
(52, 1, 'Movimientos financieros', '', '_self', NULL, '#000000', 36, 1, '2022-12-15 03:53:05', '2022-12-15 03:55:39', 'voyager.movimientos_financieros.index', 'null'),
(53, 1, 'Flujo Financiero', '/informe_flujofinanciero', '_self', NULL, '#000000', 35, 8, '2022-12-17 01:54:05', '2023-01-06 14:54:32', NULL, '');

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
(1, 'Moldes para pisos tipo adoquines', 1, '1.000', '2022-02-12 21:13:06', '2022-08-11 16:58:37'),
(2, 'Moldes para placas de revestimiento', 1, '1.000', '2022-08-12 00:59:51', '2022-08-22 17:44:32');

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
(53, '2022-10-16 00:00:00', NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, 1, NULL, '2022-12-09 17:35:20', '2022-12-09 17:35:20'),
(54, '2022-03-10 00:00:00', NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'zz', 'Gastos/Egresos', '10000.00', NULL, 1, NULL, '2022-12-09 17:46:30', '2022-12-30 17:55:15'),
(55, '2022-06-10 00:00:00', NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '15000.00', NULL, 1, NULL, '2022-12-09 17:49:42', '2022-12-09 17:49:42'),
(58, '2022-12-12 00:00:00', NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'ppp', 'Gastos/Egresos', '20000.00', NULL, 1, NULL, '2022-12-12 22:32:25', '2022-12-12 22:32:25'),
(72, '2022-12-27 00:00:00', NULL, NULL, 4, NULL, 'Efectivo', NULL, NULL, 'salda deuda ...', 'Cobranza/Ingresos', NULL, '637.80', 1, NULL, '2022-12-28 00:29:17', '2023-01-05 16:03:11'),
(73, '2022-12-27 00:00:00', 1, 3, 18, NULL, 'Efectivo', NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '108.90', 1, NULL, '2022-12-28 00:50:48', '2022-12-30 18:11:32'),
(77, '2022-12-27 00:00:00', 1, 1, 19, NULL, 'Efectivo', NULL, NULL, '1111222', 'Cobranza/Ingresos', NULL, '1113.00', 1, NULL, '2022-12-28 02:33:31', '2023-01-05 16:01:52'),
(78, '2022-12-30 00:00:00', 1, 2, 19, NULL, 'Efectivo', NULL, NULL, 'vvwww', 'Cobranza/Ingresos', NULL, '2000.00', 1, NULL, '2022-12-30 17:53:49', '2023-01-05 15:47:18'),
(79, '2022-12-30 00:00:00', NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'xxx', 'Gastos/Egresos', '5000.00', NULL, 1, NULL, '2022-12-30 17:56:42', '2022-12-30 17:56:42'),
(98, '2023-01-05 00:00:00', 1, 4, 19, NULL, 'Efectivo', NULL, NULL, 'nueva', 'Cobranza/Ingresos', NULL, '5000.00', NULL, NULL, '2023-01-05 15:48:24', '2023-01-05 15:48:24'),
(101, '2023-01-05 00:00:00', 1, 5, 19, NULL, 'Efectivo', NULL, NULL, 'asasda', 'Cobranza/Ingresos', NULL, '1000.00', 1, NULL, '2023-01-05 16:59:47', '2023-01-05 16:59:47'),
(105, '2023-01-05 00:00:00', 5, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'cinco mil quinientos', 'Gastos/Egresos', '5500.00', NULL, NULL, NULL, '2023-01-05 17:16:38', '2023-01-05 17:16:38'),
(106, '2023-01-05 00:00:00', 5, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'cinco mil quinientos', 'Gastos/Egresos', '5500.00', NULL, NULL, NULL, '2023-01-05 17:22:46', '2023-01-05 17:22:46'),
(107, '2023-01-05 00:00:00', 10, NULL, 0, NULL, 'Efectivo', NULL, NULL, '4400', 'Gastos/Egresos', '4400.00', NULL, NULL, NULL, '2023-01-05 17:23:52', '2023-01-05 17:23:52'),
(108, '2023-01-05 00:00:00', 10, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '3300.00', NULL, NULL, NULL, '2023-01-05 17:26:02', '2023-01-05 17:26:02'),
(109, '2023-01-05 00:00:00', 22, NULL, 0, NULL, 'Efectivo', NULL, NULL, '2200', 'Gastos/Egresos', '2200.00', NULL, NULL, NULL, '2023-01-05 17:31:53', '2023-01-05 17:31:53'),
(117, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '12000.00', NULL, NULL, NULL, '2023-01-10 18:33:56', '2023-01-10 18:33:56'),
(119, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', NULL, NULL, 1, NULL, '2023-01-10 20:50:54', '2023-01-10 20:50:54'),
(120, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, NULL, NULL, '2023-01-10 20:51:19', '2023-01-10 20:51:19'),
(121, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10111.00', NULL, 1, NULL, '2023-01-10 22:23:39', '2023-01-10 22:23:39'),
(122, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '10111.00', NULL, 1, NULL, '2023-01-10 22:23:52', '2023-01-10 22:23:52'),
(123, '2023-01-10 00:00:00', 1, NULL, 0, 24, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '1111.00', NULL, 1, NULL, '2023-01-10 22:27:52', '2023-01-10 22:30:33'),
(124, '2023-01-10 00:00:00', 1, NULL, 0, 25, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '25000.00', NULL, 1, NULL, '2023-01-10 22:31:45', '2023-01-10 22:31:45'),
(125, '2023-01-10 00:00:00', 1, NULL, 0, 26, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '9999.00', NULL, 1, NULL, '2023-01-10 22:32:29', '2023-01-10 22:32:29'),
(126, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'Gastos/Egresos', '200.00', NULL, 1, NULL, '2023-01-10 22:33:08', '2023-01-10 22:33:08'),
(127, '2023-01-10 00:00:00', 1, NULL, 0, NULL, 'Efectivo', NULL, NULL, 'rrrr', 'Gastos/Egresos', '200.00', NULL, 1, NULL, '2023-01-10 22:33:39', '2023-01-10 22:33:39');

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
  `monto_iva` decimal(9,2) NOT NULL DEFAULT 0.00,
  `id_vendedor` bigint(20) UNSIGNED DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `descuento` decimal(13,2) DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modalidad_venta` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_vendedor_2` bigint(20) DEFAULT NULL,
  `tipo_presupuesto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_remito` bigint(20) DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `Anexo_Presupuesto` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='if nro_remito=0\r\n Ult_remito =  select max(nro_remito) from nota_pedidos\r\n nro_remito=+1\r\n';

--
-- Volcado de datos para la tabla `nota_pedidos`
--

INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `modalidad_venta`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`, `Anexo_Presupuesto`) VALUES
(3, '2022-02-13 00:00:00', 2, '1500.00', '1500.00', '0.00', 1, NULL, '20.00', NULL, '2022-02-12 21:42:34', '2022-09-09 00:40:59', 'Rechazado', 'Pendiente', NULL, 'Productos', NULL, NULL, NULL),
(4, '2022-02-16 00:00:00', 1, '2200.00', '2637.80', '457.80', 1, NULL, '-20.00', 'Descripción del Mueble :\r\nMueble 1: Alacena\r\nMATERALES: Estructura Color BLANCO en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico.\r\nMueble 2: Bajo Mesada \r\nMATERALES: Estructura Color BLANCA en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\nMueble 3: Isla \r\nMATERALES: Estructura interna Color BLANCA en MDF de 18 mm. Estructura Frente a la vista Color BALTICO O TERRARUM en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\n///\r\nDescripción del Mueble :\r\nMueble 1: Alacena\r\nMATERALES: Estructura Color BLANCO en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico.\r\nMueble 2: Bajo Mesada \r\nMATERALES: Estructura Color BLANCA en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\nMueble 3: Isla \r\nMATERALES: Estructura interna Color BLANCA en MDF de 18 mm. Estructura Frente a la vista Color BALTICO O TERRARUM en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.', '2022-02-27 17:38:50', '2022-12-28 00:24:37', 'Entregado', 'Pendiente', NULL, 'Productos', 1, '2022-12-27 00:00:00', NULL),
(18, '2022-12-08 00:00:00', 5, '100.00', '108.90', '18.90', 1, NULL, '-10.00', NULL, '2022-12-07 15:27:57', '2022-12-28 00:40:25', 'Entregado', 'Pendiente', NULL, 'Productos', 2, '2022-12-27 00:00:00', NULL),
(19, '2022-12-27 00:00:00', 1, '13110.00', '111041.70', '19271.70', 1, NULL, '600.00', NULL, '2022-12-28 00:55:28', '2023-01-12 17:04:04', 'Pendiente Entrega', 'Otros', NULL, 'Productos', NULL, NULL, NULL),
(21, '2022-12-29 00:00:00', NULL, NULL, NULL, '0.00', 1, NULL, NULL, NULL, '2022-12-29 17:13:18', '2022-12-29 17:13:18', 'Pendiente Aprobacion', 'Pendiente', NULL, 'Productos', NULL, NULL, NULL),
(22, '2023-01-11 00:00:00', 3, '12100.00', '14520.00', '3049.20', 2, NULL, '20.00', NULL, '2023-01-11 17:02:29', '2023-01-30 20:28:09', 'Pendiente Aprobacion', 'Contado', 2, 'Productos', NULL, '2023-01-11 00:00:00', NULL),
(23, '2023-01-11 00:00:00', 3, '30500.00', '40595.50', '7045.50', 2, NULL, '10.00', NULL, '2023-01-11 23:03:42', '2023-01-12 17:39:05', 'Pendiente Aprobacion', 'Otros', 3, 'Productos', NULL, NULL, NULL),
(24, '2023-01-11 00:00:00', 6, '0.00', '0.00', '0.00', 2, NULL, NULL, NULL, '2023-01-11 23:14:55', '2023-01-11 23:14:55', 'Pendiente Aprobacion', 'Otros', 2, 'Productos', NULL, NULL, NULL),
(25, '2023-01-11 00:00:00', 6, '30100.00', '40063.10', '6953.10', 2, NULL, '10.00', NULL, '2023-01-11 23:15:38', '2023-01-12 17:43:43', 'Pendiente Aprobacion', 'Otros', 2, 'Productos', NULL, NULL, NULL),
(26, '2023-01-12 00:00:00', 7, '8000.00', '8800.00', '1848.00', 1, NULL, '10.00', NULL, '2023-01-12 17:42:01', '2023-01-12 17:47:35', 'Pendiente Aprobacion', 'Contado', NULL, 'Productos', NULL, NULL, NULL),
(27, '2023-01-12 00:00:00', 5, '8000.00', '7200.00', '1512.00', 2, NULL, '-10.00', 'xxxx', '2023-01-12 17:49:02', '2023-01-12 18:11:26', 'Pendiente Entrega', 'Contado', 2, 'Productos', NULL, NULL, NULL);
INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `modalidad_venta`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`, `Anexo_Presupuesto`) VALUES
(30, '2023-01-12 00:00:00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '2023-01-13 01:59:21', '2023-01-13 01:59:21', 'Pendiente Aprobacion', 'Otros', NULL, 'Productos', NULL, NULL, '<p><img src=\"data:image/png;base64,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\" alt=\"\" />fasdfjlasdjflkasdfa</p>');
INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `modalidad_venta`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`, `Anexo_Presupuesto`) VALUES
(31, '2023-01-12 00:00:00', NULL, NULL, NULL, '0.00', 2, NULL, NULL, NULL, '2023-01-13 02:00:34', '2023-01-13 02:00:34', 'Pendiente Aprobacion', 'Otros', 2, 'Productos', NULL, NULL, '<p><img src=\"data:image/png;base64,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\" alt=\"\" /></p>\r\n<p>asdfasdfasdf</p>');
INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `modalidad_venta`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`, `Anexo_Presupuesto`) VALUES
(32, '2023-01-12 00:00:00', 6, '100.00', '121.00', '21.00', 2, NULL, NULL, NULL, '2023-01-13 02:01:15', '2023-01-13 02:01:15', 'Pendiente Aprobacion', 'Otros', 2, 'Productos', NULL, NULL, '<p><img src=\"data:image/png;base64,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\" alt=\"\" /></p>');

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
(62, '2022-12-27 00:00:00', NULL, 'Entregado', NULL, NULL, 1, '3.00', 4, NULL, '2022-12-28 00:39:02'),
(63, '2022-12-27 00:00:00', NULL, 'Entregado', NULL, NULL, 3, '10.00', 4, NULL, '2022-12-28 00:39:33'),
(65, '2022-12-27 00:00:00', NULL, 'Entregado', NULL, NULL, 3, '10.00', 18, NULL, '2022-12-28 00:51:58'),
(66, '2022-12-28 00:00:00', NULL, 'En Proceso', NULL, NULL, 3, '11.00', 19, NULL, '2022-12-30 02:45:08'),
(67, '2022-12-28 12:17:17', NULL, 'Pendiente', NULL, NULL, 1, '10.00', 19, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(145, 'delete_cuentas_bancos', 'cuentas_bancos', '2022-10-19 15:05:46', '2022-10-19 15:05:46');

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
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
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
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
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
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
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
(117, 1),
(117, 2),
(117, 3),
(118, 1),
(118, 2),
(118, 3),
(119, 1),
(119, 2),
(119, 3),
(120, 1),
(120, 2),
(120, 3),
(121, 1),
(121, 2),
(122, 1),
(122, 2),
(123, 1),
(123, 2),
(124, 1),
(124, 2),
(125, 1),
(125, 2),
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
(145, 2);

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
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
(1, 'Piedra Ekos', 2, 6, '1200.000', '21.00', 'm2', NULL, NULL, 'SI', 1, 0, NULL, '10.00', '1.00', NULL, '2022-08-05 16:18:22'),
(2, 'Ferrite rojo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 00:54:17'),
(3, 'Recto Grande', 1, 3, '10.000', '21.00', 'm2', NULL, NULL, 'SI', 1, 1, 'manual', NULL, '1.00', NULL, '2022-11-09 14:58:24'),
(4, 'Pegamento Klaukol', 4, 11, '200.000', NULL, 'm2', '800.00', 'Mt3', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 00:34:22'),
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
(15, 'Muebles de Cocina', 3, 4, NULL, NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-08-11 16:27:00', '2022-08-11 16:27:00'),
(17, 'Laja Española', 1, 2, '1250.000', NULL, 'm2', NULL, NULL, 'SI', 1, 1, NULL, '6.00', '1.00', NULL, '2022-08-30 16:18:29'),
(18, 'piso granitico blanco marfil', 1, 2, '100.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-10 00:07:46', '2022-11-10 00:07:46'),
(19, 'piso granitico blanco marfil', 1, 2, '100.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-10 00:08:28', '2022-11-10 00:08:28'),
(20, 'Mampostería de 15\"', 6, 13, '3000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 02:44:09'),
(21, 'Mampostería de 15\"', 5, 13, '3000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-30 00:18:03', '2022-11-30 00:18:03'),
(22, 'Mamposteria de 15\"', 6, 13, '8000.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-11-30 00:33:04', '2022-11-30 00:33:04'),
(24, 'Pisos Kebracho', 1, 3, '1200.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, '0.50', NULL, '2022-11-30 00:48:11'),
(25, 'Pisos rustico adoquin circular', 1, 1, '1200.000', NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 00:57:07');

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
(22, 'Alba Maidana', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 01:47:20', '2023-01-05 01:47:20'),
(23, 'Alba Maidana', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 01:51:14', '2023-01-05 01:51:14'),
(24, 'Margarita', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 01:51:51', '2023-01-05 01:51:51'),
(25, 'Orlando', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 01:52:33', '2023-01-05 01:52:33'),
(26, 'pato Maidana', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 02:01:43', '2023-01-05 02:01:43'),
(27, 'Joaquin Maidana', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 02:02:11', '2023-01-05 02:02:11'),
(28, 'Lucas', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-05 02:03:28', '2023-01-05 02:03:28'),
(29, 'Luciana', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-10 17:59:14', '2023-01-10 17:59:14'),
(30, 'LA SEGUNDA SEGUROS', NULL, 'LA SEGUNDA', NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-10 20:50:22', '2023-01-10 20:50:22'),
(31, 'yo', NULL, NULL, NULL, NULL, NULL, NULL, 'RI', NULL, NULL, NULL, '2023-01-10 22:43:14', '2023-01-10 22:43:14');

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
(237, 3, 1, '10.00', '100.000', '21.00', NULL, '2022-12-27 01:06:26', '2022-12-27 01:06:26'),
(238, 3, 2, '2.00', '2400.000', '21.00', NULL, '2022-12-27 01:06:26', '2022-12-27 01:06:26'),
(239, 3, 3, '10.00', '12000.000', '21.00', NULL, '2022-12-27 01:06:26', '2022-12-27 01:06:26'),
(242, 3, 4, '3.00', '2400.000', '21.00', NULL, '2022-12-27 01:06:26', '2022-12-27 01:06:26'),
(248, 4, 1, '3.00', '1000.000', '21.00', NULL, '2022-12-28 00:24:37', '2022-12-28 00:24:37'),
(249, 4, 3, '10.00', '1000.000', '21.00', NULL, '2022-12-28 00:24:37', '2022-12-28 00:24:37'),
(250, 4, 4, '1.00', '200.000', '21.00', NULL, '2022-12-28 00:24:37', '2022-12-28 00:24:37'),
(251, 18, 3, '10.00', '100.000', '21.00', NULL, '2022-12-28 00:40:25', '2022-12-28 00:40:25'),
(261, 21, 9, '10.00', '1000.000', '21.00', NULL, '2022-12-29 17:13:18', '2022-12-29 17:13:18'),
(363, 19, 3, '11.00', '110.000', '21.00', NULL, '2023-01-12 17:04:04', '2023-01-12 17:04:04'),
(364, 19, 1, '10.00', '12000.000', '21.00', NULL, '2023-01-12 17:04:04', '2023-01-12 17:04:04'),
(365, 19, 5, '10.00', '1000.000', '21.00', NULL, '2023-01-12 17:04:04', '2023-01-12 17:04:04'),
(377, 23, 3, '50.00', '500.000', '21.00', NULL, '2023-01-12 17:39:05', '2023-01-12 17:39:05'),
(378, 23, 20, '10.00', '30000.000', '21.00', NULL, '2023-01-12 17:39:05', '2023-01-12 17:39:05'),
(383, 25, 3, '10.00', '100.000', '21.00', NULL, '2023-01-12 17:43:43', '2023-01-12 17:43:43'),
(384, 25, 20, '10.00', '30000.000', '21.00', NULL, '2023-01-12 17:43:43', '2023-01-12 17:43:43'),
(386, 26, 22, '1.00', '8000.000', '21.00', NULL, '2023-01-12 17:47:35', '2023-01-12 17:47:35'),
(397, 27, 22, '1.00', '8000.000', '21.00', NULL, '2023-01-12 18:11:26', '2023-01-12 18:11:26'),
(406, 32, 3, '10.00', '100.000', '21.00', NULL, '2023-01-13 02:01:15', '2023-01-13 02:01:15'),
(407, 22, 3, '10.00', '100.000', '21.00', NULL, '2023-01-30 20:28:09', '2023-01-30 20:28:09'),
(408, 22, 1, '10.00', '12000.000', '21.00', NULL, '2023-01-30 20:28:09', '2023-01-30 20:28:09');

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
(1, 'admin Sistema', 'Administracion Persia', '2022-01-09 01:12:38', '2023-01-09 15:25:07'),
(2, 'gerente', 'Gerente', '2022-01-09 01:12:38', '2022-09-19 17:42:37'),
(3, 'Administracion', 'Administracion Persia', '2023-01-09 15:26:52', '2023-01-09 15:26:52');

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
(1, 'Pisos', 'Elaboración Propia', '2022-02-08 00:25:00', '2022-05-06 16:24:54'),
(2, 'Revestimientos', 'Elaboración Propia', '2022-02-08 00:26:00', '2022-05-06 16:24:32'),
(3, 'Muebles', 'Elaboración Propia', '2022-02-08 00:26:00', '2022-05-06 16:24:19'),
(4, 'Productos Reventa', 'Productos Reventa', '2022-02-08 00:26:00', '2022-05-06 16:24:45'),
(5, 'Materia Prima', 'Materia Prima', '2022-02-08 00:27:00', '2022-05-06 16:24:12'),
(6, 'Obras', 'Obras', '2022-11-30 00:09:49', '2022-11-30 00:09:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
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
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\September2022\\zSFdNHiz1jmaKZsWh4tN.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Sistema Persia', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Sistema Admninstracion Persia', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\September2022\\g2ycPGph6ARcKNK3B4gw.PNG', '', 'image', 4, 'Admin'),
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
(20, 6, 'Pintura', '2022-11-30 00:13:38', '2022-11-30 00:13:38');

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
(14, 'Mercaderia  reventa', 'Pinturas', '2022-02-08 01:04:00', '2022-12-12 23:09:04');

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
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\September2022\\f1BNJCmkVg9wYVjsxtQc.PNG', NULL, '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S', '8powA5fKXZImJuRRXuPQYbrc54uA6VvNIVQjX44bYVVqpMZaCy4PdKtoNUOB', '{\"locale\":\"es\"}', '2022-01-09 01:12:38', '2022-09-27 15:32:11'),
(2, 2, 'Sonia', 'persiarevestimientos@gmail.com', 'users\\September2022\\sn1ukfzojZeXMunt4nqY.PNG', NULL, '$2y$10$e7919r3ou3IM5Wj18XM7s.4NmcmTZlP43RTFAk/y6SywTiIs10CCS', NULL, '{\"locale\":\"es\"}', '2022-09-17 15:37:07', '2022-09-27 15:31:34'),
(3, 1, 'Administracion', 'administracionpersia@gmail.com', 'users/default.png', NULL, '$2y$10$mDQMNVo/f/8dx0qNdvpV0Opka.X1fpZh.hXAnVVRBP071KzYqF9q6', NULL, '{\"locale\":\"es\"}', '2023-01-09 15:27:57', '2023-01-09 15:27:57');

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
(3, 1);

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
  ADD KEY `FK_vendedor` (`id_vendedor`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancos`
--
ALTER TABLE `cuentas_bancos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `detalles_facturas_compras`
--
ALTER TABLE `detalles_facturas_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `dosificaciones`
--
ALTER TABLE `dosificaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `renglones_notapedidos`
--
ALTER TABLE `renglones_notapedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipos_gastos`
--
ALTER TABLE `tipos_gastos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
