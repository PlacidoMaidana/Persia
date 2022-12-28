-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-12-2022 a las 13:54:19
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
(88, 16, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 5),
(89, 16, 'id_cliente', 'text', 'Id Cliente', 0, 0, 0, 1, 1, 1, '{}', 3),
(91, 16, 'totalgravado', 'text', 'Totalgravado', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 16, 'total', 'text', 'Total', 0, 0, 0, 0, 0, 0, '{}', 7),
(93, 16, 'monto_iva', 'text', 'Monto Iva', 1, 0, 0, 0, 0, 0, '{}', 8),
(94, 16, 'id_vendedor', 'text', 'Id Vendedor', 0, 0, 0, 0, 0, 1, '{}', 14),
(96, 16, 'id_factura', 'text', 'Id Factura', 0, 0, 0, 0, 0, 0, '{}', 9),
(98, 16, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{\"display\":{\"height\":\"5\"}}', 19),
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
(137, 20, 'unidad', 'select_dropdown', 'Unidad', 0, 0, 1, 1, 1, 1, '{\"default\":\"m2\",\"options\":{\"kg\":\"kg\",\"grs\":\"gr\",\"m2\":\"m2\",\"Paquete\":\"Paquete\"}}', 10),
(140, 20, 'activo', 'select_dropdown', 'Activo', 0, 1, 1, 1, 1, 1, '{\"default\":\"SI\",\"options\":{\"SI\":\"SI\",\"NO\":\"NO\"}}', 3),
(143, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 18),
(144, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(145, 20, 'producto_hasone_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rubro\",\"table\":\"rubros\",\"type\":\"belongsTo\",\"column\":\"rubro_id\",\"key\":\"id\",\"label\":\"rubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(146, 20, 'producto_belongsto_subrubro_relationship', 'relationship', 'subrubros', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Subrubro\",\"table\":\"subrubros\",\"type\":\"belongsTo\",\"column\":\"subrubro_id\",\"key\":\"id\",\"label\":\"descripcion_subrubro\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(147, 16, 'nota_pedido_belongsto_cliente_relationship', 'relationship', 'cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"id_cliente\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(148, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(149, 23, 'provincia', 'text', 'Provincia', 1, 1, 1, 1, 1, 1, '{}', 2),
(150, 23, 'localidad', 'text', 'Localidad', 1, 1, 1, 1, 1, 1, '{}', 3),
(151, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(152, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(153, 13, 'cliente_belongsto_localidade_relationship', 'relationship', 'localidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Localidad\",\"table\":\"localidades\",\"type\":\"belongsTo\",\"column\":\"id_localidad\",\"key\":\"id\",\"label\":\"localidad\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
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
(167, 25, 'razonsocial', 'text', 'Razonsocial', 0, 1, 1, 1, 1, 1, '{}', 2),
(168, 25, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 3),
(169, 25, 'nombre_comercial', 'text', 'Nombre Comercial', 0, 1, 1, 1, 1, 1, '{}', 4),
(170, 25, 'web', 'text', 'Web', 0, 1, 1, 1, 1, 1, '{}', 5),
(171, 25, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 6),
(172, 25, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{}', 7),
(173, 25, 'cuit', 'text', 'Cuit', 0, 1, 1, 1, 1, 1, '{}', 8),
(174, 25, 'cond_iva', 'select_dropdown', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{\"default\":\"RI\",\"options\":{\"RI\":\"Responsable inscripto\",\"MO\":\"Monotributo\",\"CF\":\"Consumidor Final\",\"NR\":\"No responsable\",\"Exe\":\"Exento\"}}', 9),
(175, 25, 'nombre_contacto', 'text', 'Nombre Contacto', 0, 1, 1, 1, 1, 1, '{}', 10),
(176, 25, 'telefono_contacto', 'text', 'Telefono Contacto', 0, 1, 1, 1, 1, 1, '{}', 11),
(177, 25, 'observaciones', 'rich_text_box', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 12),
(178, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 13),
(179, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(180, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(181, 26, 'tipo_factura', 'select_dropdown', 'Tipo Factura', 1, 1, 1, 1, 1, 1, '{\"default\":\"A\",\"options\":{\"A\":\"A\",\"B\":\"B\",\"C\":\"C\",\"INT\":\"INT\",\"NCI\":\"NCI\",\"NDI\":\"NDI\",\"NCA\":\"NCA\",\"NCB\":\"NCB\",\"NCC\":\"NCC\",\"NDA\":\"NDA\",\"NDB\":\"NDB\",\"NDC\":\"NDC\"}}', 3),
(182, 26, 'pto_venta', 'number', 'Pto Venta', 1, 1, 1, 1, 1, 1, '{}', 4),
(183, 26, 'nro_factura', 'number', 'Nro Factura', 1, 1, 1, 1, 1, 1, '{}', 5),
(184, 26, 'id_proveedor', 'text', 'Id Proveedor', 1, 0, 0, 1, 1, 1, '{}', 7),
(185, 26, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 2),
(186, 26, 'observaciones', 'text_area', 'Observaciones', 0, 0, 0, 1, 1, 1, '{}', 31),
(187, 26, 'id_tipo_gasto', 'text', 'Id Tipo Gasto', 0, 0, 0, 1, 1, 1, '{}', 9),
(188, 26, 'fecha_carga', 'date', 'Fecha Carga', 0, 1, 1, 1, 1, 1, '{}', 6),
(189, 26, 'subtotal', 'number', 'Subtotal', 0, 1, 1, 1, 1, 1, '{}', 11),
(190, 26, 'exento', 'number', 'Exento', 0, 0, 0, 0, 0, 0, '{}', 12),
(191, 26, 'iva_10_5', 'number', 'Iva 10 5', 0, 0, 1, 1, 1, 1, '{}', 13),
(192, 26, 'iva_21', 'number', 'Iva 21', 0, 0, 1, 1, 1, 1, '{}', 14),
(193, 26, 'iva_27', 'number', 'Iva 27', 0, 0, 1, 1, 1, 1, '{}', 15),
(194, 26, 'iva', 'number', 'Iva', 0, 0, 0, 0, 0, 0, '{}', 16),
(195, 26, 'monto_perc_iibb', 'number', 'Monto Perc Iibb', 0, 0, 0, 0, 0, 0, '{}', 17),
(196, 26, 'monto_percepcion_iva', 'number', 'Monto Percepcion Iva', 0, 0, 0, 0, 0, 0, '{}', 18),
(197, 26, 'monto_percep_ganancias', 'number', 'Monto Percep Ganancias', 0, 0, 0, 0, 0, 0, '{}', 19),
(198, 26, 'otros_impuestos', 'number', 'Otros Impuestos', 0, 0, 0, 0, 0, 0, '{}', 20),
(199, 26, 'total_impuestos', 'number', 'Total Impuestos', 0, 0, 0, 0, 0, 0, '{}', 21),
(200, 26, 'total_factura', 'number', 'Total Factura', 0, 1, 1, 1, 1, 1, '{}', 22),
(201, 26, 'fecha_vencimiento', 'date', 'Fecha Vencimiento', 0, 0, 0, 0, 0, 0, '{}', 27),
(202, 26, 'remito_pto_vta', 'text', 'Remito Pto Vta', 0, 0, 0, 0, 0, 0, '{}', 28),
(203, 26, 'remito_nro', 'text', 'Remito Nro', 0, 0, 0, 0, 0, 0, '{}', 29),
(204, 26, 'id_jurisdiccion', 'text', 'Id Jurisdiccion', 0, 0, 0, 0, 0, 0, '{}', 23),
(205, 26, 'nro_factura_ref', 'text', 'Nro Factura Ref', 0, 0, 0, 0, 0, 0, '{}', 30),
(206, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 32),
(207, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 33),
(208, 26, 'facturas_compra_belongsto_proveedore_relationship', 'relationship', 'Proveedor', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Proveedor\",\"table\":\"proveedores\",\"type\":\"belongsTo\",\"column\":\"id_proveedor\",\"key\":\"id\",\"label\":\"razonsocial\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(209, 26, 'facturas_compra_belongsto_tipos_gasto_relationship', 'relationship', 'Tipo gasto', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Tipo_gasto\",\"table\":\"tipos_gastos\",\"type\":\"belongsTo\",\"column\":\"id_tipo_gasto\",\"key\":\"id\",\"label\":\"tipo2\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(210, 26, 'facturas_compra_belongsto_jurisdiccione_relationship', 'relationship', 'Jurisdiccion', 0, 0, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Jurisdiccion\",\"table\":\"jurisdicciones\",\"type\":\"belongsTo\",\"column\":\"id_jurisdiccion\",\"key\":\"id\",\"label\":\"provincia\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 24),
(215, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(216, 30, 'codigo', 'text', 'Codigo', 1, 1, 1, 1, 1, 1, '{}', 2),
(217, 30, 'provincia', 'text', 'Provincia', 0, 1, 1, 1, 1, 1, '{}', 3),
(218, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(219, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(220, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(221, 31, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(222, 31, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 6),
(223, 31, 'pto_vta', 'text', 'Pto Vta', 0, 0, 0, 1, 1, 1, '{}', 7),
(224, 31, 'nro_recibo', 'text', 'Nro Recibo', 0, 0, 0, 1, 1, 1, '{}', 8),
(225, 31, 'nro_op', 'text', 'Nro Op', 0, 0, 0, 0, 0, 0, '{}', 9),
(226, 31, 'id_nota_pedido', 'text', 'Id Nota Pedido', 0, 0, 0, 1, 1, 0, '{}', 3),
(227, 31, 'id_factura_compra', 'text', 'Id Factura Compra', 0, 0, 0, 0, 0, 0, '{}', 4),
(228, 31, 'modalidad_pago', 'select_dropdown', 'Modalidad Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Efectivo\",\"options\":{\"Efectivo\":\"Efectivo\",\"Cheque\":\"Cheque\",\"Transferencia\":\"Transferencia\",\"Retenciones\":\"Retenciones\"}}', 10),
(229, 31, 'nro_cheque', 'text', 'Nro Cheque', 0, 0, 1, 1, 1, 1, '{}', 13),
(230, 31, 'fecha_vto', 'text', 'Fecha Vto', 0, 0, 0, 0, 0, 0, '{}', 14),
(231, 31, 'id_cuenta_bancaria', 'text', 'Id Cuenta Bancaria', 0, 0, 0, 1, 1, 1, '{}', 11),
(232, 31, 'detalle', 'text_area', 'Detalle', 0, 1, 1, 1, 1, 1, '{}', 29),
(233, 31, 'id_jurisdiccion', 'text', 'Id Jurisdiccion', 0, 0, 0, 0, 0, 0, '{}', 5),
(234, 31, 'tipo_retencion', 'select_dropdown', 'Tipo Retencion', 0, 0, 0, 0, 0, 0, '{\"default\":\"RENTAS\",\"options\":{\"RENTAS\":\"RENTAS\",\"GANANCIAS\":\"GANANCIAS\",\"SUSS\":\"SUSS\",\"iVA\":\"IVA\"}}', 15),
(235, 31, 'tipo_movimiento', 'select_dropdown', 'Tipo Movimiento', 0, 1, 1, 1, 1, 1, '{\"default\":\"Gastos\\/Egresos\",\"options\":{\"Gastos\\/Egresos\":\"Gastos\\/Egresos\",\"Cobranza\\/Ingresos\":\"Cobranza\\/Ingresos\",\"Extracciones\":\"Extracciones\",\"Deposito bancario\":\"Deposito bancario\",\"Movimiento entre Usuarios\":\"Movimiento entre Usuarios\",\"Movimiento entre Bancos\":\"Movimiento entre Bancos\"}}', 2),
(236, 31, 'importe_egreso', 'text', 'Importe Egreso', 0, 1, 1, 1, 1, 1, '{}', 23),
(237, 31, 'importe_ingreso', 'text', 'Importe Ingreso', 0, 1, 1, 1, 1, 1, '{}', 22),
(238, 31, 'id_usuario', 'text', 'Id Usuario', 0, 0, 0, 0, 0, 0, '{}', 27),
(239, 31, 'id_caja', 'text', 'Id Caja', 0, 1, 1, 1, 1, 1, '{}', 26),
(240, 31, 'conciliado', 'text', 'Conciliado', 0, 0, 0, 0, 0, 0, '{}', 16),
(241, 31, 'fecha_real_dep_acred', 'text', 'Fecha Real Dep Acred', 0, 0, 0, 0, 0, 0, '{}', 17),
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
(256, 16, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente Aprobacion\",\"options\":{\"Rechazado\":\"Rechazado\",\"Pendiente Aprobacion\":\"Pendiente Aprobacion\",\"Pendiente Entrega\":\"Pendiente Entrega\",\"Entregado\":\"Entregado\"}}', 10),
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
(274, 26, 'forma_pago', 'select_dropdown', 'Forma Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Contado\",\"options\":{\"Contado\":\"Contado\",\"Cta Cte\":\"Cta Cte\"}}', 25),
(275, 26, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente\",\"options\":{\"Cancelado\":\"Cancelado\",\"Pendiente\":\"Pendiente\"}}', 26),
(276, 16, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{\"default\":\"Pendiente\",\"options\":{\"Pendiente\":\"Pendiente\",\"Cancelado\":\"Cancelado\"}}', 11),
(277, 16, 'id_vendedor_2', 'text', 'Id Vendedor 2', 0, 0, 0, 0, 0, 1, '{}', 17),
(278, 16, 'tipo_presupuesto', 'select_dropdown', 'Tipo Presupuesto', 0, 1, 1, 1, 1, 1, '{\"default\":\"Productos\",\"options\":{\"Productos\":\"Productos\",\"Muebles\":\"Muebles\",\"Obras\":\"Obras\"}}', 2),
(279, 16, 'nota_pedido_belongsto_empleado_relationship_1', 'relationship', 'Vendedor 2', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor_2\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 18),
(280, 31, 'mov_financiero_belongsto_empleado_relationship', 'relationship', 'Operador', 0, 1, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_usuario\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 24),
(281, 36, 'id_pedido', 'text', 'Id Pedido', 0, 1, 1, 1, 1, 1, '{}', 3),
(282, 46, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(283, 46, 'Forma_pago_Muebles', 'text_area', 'Forma Pago Muebles', 0, 1, 1, 1, 1, 1, '{}', 2),
(284, 46, 'Forma_pago_Obras', 'text_area', 'Forma Pago Obras', 0, 1, 1, 1, 1, 1, '{}', 3),
(285, 46, 'Forma_pago_Productos', 'text_area', 'Forma Pago Productos', 0, 1, 1, 1, 1, 1, '{}', 4),
(286, 46, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(287, 46, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(288, 31, 'id_tipo_gasto', 'text', 'Id Tipo Gasto', 0, 0, 0, 1, 1, 1, '{}', 20),
(289, 31, 'mov_financiero_belongsto_tipos_gasto_relationship', 'relationship', 'Tipo gasto', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\tipo_gasto\",\"table\":\"tipos_gastos\",\"type\":\"belongsTo\",\"column\":\"id_tipo_gasto\",\"key\":\"id\",\"label\":\"tipo2\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 21),
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
(300, 16, 'fecha_entrega', 'text', 'Fecha Entrega', 0, 1, 1, 1, 1, 1, '{}', 18),
(301, 31, 'mov_financiero_belongsto_proveedore_relationship', 'relationship', 'proveedores', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Proveedor\",\"table\":\"proveedores\",\"type\":\"belongsTo\",\"column\":\"id_proveedor\",\"key\":\"id\",\"label\":\"razonsocial\",\"pivot_table\":\"bases\",\"pivot\":\"0\",\"taggable\":\"0\"}', 28),
(302, 31, 'id_proveedor', 'text', 'Id Proveedor', 0, 0, 0, 1, 1, 1, '{}', 25);

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
(13, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Models\\Cliente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-11 23:35:14', '2022-11-10 02:04:30'),
(16, 'nota_pedidos', 'nota-pedidos', 'Nota Pedido', 'Nota Pedidos', NULL, 'App\\Models\\nota_pedido', NULL, 'App\\Http\\Controllers\\Voyager\\PedidosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:34:43', '2022-12-13 00:42:25'),
(17, 'empleados', 'empleados', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:40:47', '2022-02-10 02:15:28'),
(18, 'rubros', 'rubros', 'Rubro', 'Rubros', NULL, 'App\\Models\\Rubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:04:32', '2022-11-30 00:08:28'),
(19, 'subrubros', 'subrubros', 'Subrubro', 'Subrubros', NULL, 'App\\Models\\Subrubro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-16 00:05:02', '2022-01-18 15:39:51'),
(20, 'productos', 'productos', 'Producto', 'Productos', NULL, 'App\\Models\\Producto', NULL, 'App\\Http\\Controllers\\Voyager\\ProductosController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-18 14:30:46', '2022-09-20 16:34:40'),
(23, 'localidades', 'localidades', 'Localidade', 'Localidades', NULL, 'App\\Models\\Localidad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-02-08 00:20:36', '2022-02-08 00:20:36'),
(24, 'tipos_gastos', 'tipos-gastos', 'Tipos Gasto', 'Tipos Gastos', NULL, 'App\\Models\\Tipo_gasto', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-08 00:36:04', '2022-02-16 18:08:45'),
(25, 'proveedores', 'proveedores', 'Proveedore', 'Proveedores', NULL, 'App\\Models\\Proveedor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:13:49', '2022-02-12 00:14:56'),
(26, 'facturas_compras', 'facturas-compras', 'Facturas Compra', 'Facturas Compras', NULL, 'App\\Models\\Factura_Compra', NULL, 'App\\Http\\Controllers\\Voyager\\facturas_comprasController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:17:00', '2022-12-12 22:36:57'),
(30, 'jurisdicciones', 'jurisdicciones', 'Jurisdiccion', 'Jurisdicciones', NULL, 'App\\Models\\Jurisdiccion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-12 00:45:00', '2022-09-10 02:15:32'),
(31, 'mov_financieros', 'movimientos_financieros', 'Mov Financiero', 'Mov Financieros', NULL, 'App\\Models\\MovFinanciero', NULL, 'App\\Http\\Controllers\\Voyager\\MovFinancieroController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-17 01:14:52', '2022-12-12 22:53:17'),
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

--
-- Volcado de datos para la tabla `detalles_facturas_compras`
--

INSERT INTO `detalles_facturas_compras` (`id`, `id_factura_compra`, `id_producto`, `cantidad`, `precio_c`, `descuento`, `total_linea`, `unidad`, `created_at`, `updated_at`) VALUES
(4, 2, 1, '2.00', NULL, NULL, '2400.000', NULL, '2022-02-16 17:17:27', '2022-02-16 17:17:27');

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
(61, 3, 'beige', 7, '2.00000', 'kg', '2022-12-28 02:43:46', '2022-12-28 02:43:46', 'Base'),
(62, 3, 'beige', 9, '10.00000', 'gr', '2022-12-28 02:43:46', '2022-12-28 02:43:46', 'Liston'),
(63, 3, 'beige', 2, '2.00000', 'gr', '2022-12-28 02:43:46', '2022-12-28 02:43:46', 'Base');

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
  `exento` decimal(9,3) DEFAULT NULL,
  `iva_10_5` decimal(11,3) DEFAULT NULL,
  `iva_21` decimal(11,3) DEFAULT NULL,
  `iva_27` decimal(9,3) DEFAULT NULL,
  `iva` decimal(19,3) DEFAULT NULL,
  `monto_perc_iibb` decimal(19,3) DEFAULT NULL,
  `monto_percepcion_iva` decimal(13,3) DEFAULT NULL,
  `monto_percep_ganancias` decimal(9,3) DEFAULT NULL,
  `otros_impuestos` decimal(13,3) DEFAULT NULL,
  `total_impuestos` decimal(13,3) DEFAULT NULL,
  `total_factura` decimal(19,3) NOT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `remito_pto_vta` smallint(6) DEFAULT NULL,
  `remito_nro` int(11) DEFAULT NULL,
  `id_jurisdiccion` bigint(20) UNSIGNED DEFAULT NULL,
  `nro_factura_ref` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forma_pago` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_pago` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facturas_compras`
--

INSERT INTO `facturas_compras` (`id`, `tipo_factura`, `pto_venta`, `nro_factura`, `id_proveedor`, `fecha`, `observaciones`, `id_tipo_gasto`, `fecha_carga`, `subtotal`, `exento`, `iva_10_5`, `iva_21`, `iva_27`, `iva`, `monto_perc_iibb`, `monto_percepcion_iva`, `monto_percep_ganancias`, `otros_impuestos`, `total_impuestos`, `total_factura`, `fecha_vencimiento`, `remito_pto_vta`, `remito_nro`, `id_jurisdiccion`, `nro_factura_ref`, `created_at`, `updated_at`, `forma_pago`, `estado_pago`) VALUES
(2, 'A', 1, 111, 1, '2022-02-11 00:00:00', NULL, 12, '2022-02-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', NULL, NULL, NULL, 1, NULL, '2022-02-12 00:34:00', '2022-02-16 17:17:27', '', ''),
(4, 'A', 1, 222, 1, '2022-02-15 00:00:00', 'ninguna', 3, '2022-02-15 00:00:00', NULL, NULL, NULL, '21.000', NULL, '21.000', NULL, NULL, NULL, NULL, NULL, '30000.000', NULL, NULL, NULL, 1, NULL, '2022-02-15 15:47:50', '2022-12-07 22:18:37', 'Contado', 'Pendiente'),
(5, 'A', 1, 333, 2, '2022-02-15 00:00:00', NULL, 5, '2022-02-15 00:00:00', '1000.000', NULL, NULL, '210.000', NULL, '210.000', NULL, NULL, NULL, NULL, NULL, '1121.000', NULL, NULL, NULL, 2, NULL, '2022-02-15 18:05:40', '2022-02-15 18:05:40', '', ''),
(7, 'A', 1, 444, 2, '2022-02-15 00:00:00', 'ninguna', 1, '2022-02-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10000.000', NULL, NULL, NULL, NULL, NULL, '2022-02-15 18:22:00', '2022-12-07 22:18:15', 'Contado', 'Cancelado'),
(8, 'A', 1, 123, 2, '2022-12-07 00:00:00', NULL, 3, '2022-12-12 19:38:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15400.000', NULL, NULL, NULL, NULL, NULL, '2022-12-07 22:15:36', '2022-12-07 22:18:27', 'Contado', 'Cancelado'),
(9, 'C', 1, 123, 2, '2022-12-13 00:00:00', NULL, 8, '2022-12-12 00:00:00', NULL, NULL, NULL, '555.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', NULL, NULL, NULL, NULL, NULL, '2022-12-12 22:34:45', '2022-12-12 22:34:45', 'Contado', 'Pendiente');

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
-- Estructura de tabla para la tabla `jurisdicciones`
--

CREATE TABLE `jurisdicciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` int(11) NOT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jurisdicciones`
--

INSERT INTO `jurisdicciones` (`id`, `codigo`, `provincia`, `created_at`, `updated_at`) VALUES
(1, 903, 'Chaco', '2022-02-11 21:45:00', '2022-02-12 00:45:57'),
(2, 901, 'Capital Federal', '2022-02-12 00:46:15', '2022-02-12 00:46:15'),
(3, 907, 'Corrientes', '2022-02-12 00:46:26', '2022-02-12 00:46:26');

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
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2022-01-09 01:12:38', '2022-03-15 16:11:39', 'voyager.settings.index', NULL),
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
(28, 1, 'Jurisdicciones', '', '_self', NULL, NULL, 33, 8, '2022-02-12 00:45:00', '2022-11-11 14:58:49', 'voyager.jurisdicciones.index', NULL),
(30, 1, 'Iva Compras', '/IVAcompras', '_self', NULL, '#000000', 35, 1, '2022-03-15 16:04:14', '2022-03-25 18:08:18', NULL, ''),
(31, 1, 'VENTAS', '', '_self', NULL, '#000000', NULL, 9, '2022-03-15 16:08:00', '2022-11-11 14:59:26', NULL, ''),
(32, 1, 'COMPRAS', '', '_self', NULL, '#000000', NULL, 10, '2022-03-15 16:08:27', '2022-11-11 14:59:26', NULL, ''),
(33, 1, 'TABLAS BASICAS', '', '_self', NULL, '#000000', NULL, 8, '2022-03-15 16:08:56', '2022-04-13 23:20:38', NULL, ''),
(34, 1, 'PERMISOS', '', '_self', NULL, '#000000', NULL, 13, '2022-03-15 16:09:06', '2022-12-15 03:55:39', NULL, ''),
(35, 1, 'INFORMES', '', '_self', NULL, '#000000', NULL, 14, '2022-03-15 16:10:53', '2022-12-15 03:55:39', NULL, ''),
(36, 1, 'TESORERIA', '', '_self', NULL, '#000000', NULL, 11, '2022-03-15 16:11:31', '2022-11-11 14:59:26', NULL, ''),
(37, 1, 'IVA Ventas', '/IVAventas', '_self', NULL, '#000000', 35, 2, '2022-03-16 01:10:07', '2022-03-17 21:04:36', NULL, ''),
(39, 1, 'Informe de Ventas', '/Informeventas', '_self', NULL, '#000000', 35, 4, '2022-03-25 18:57:20', '2022-03-29 01:38:32', NULL, ''),
(40, 1, 'Informes de Movimientos Financieros', '/Informetesoreria', '_self', NULL, '#000000', 35, 5, '2022-03-26 01:40:53', '2022-12-15 03:46:53', NULL, ''),
(41, 1, 'Informe Compras', '/Informecompras', '_self', NULL, '#000000', 35, 3, '2022-03-29 01:27:30', '2022-03-29 01:38:32', NULL, ''),
(42, 1, 'Productos', '/informe_productos', '_self', NULL, '#000000', 35, 7, '2022-04-04 22:59:12', '2022-12-15 03:48:17', NULL, ''),
(43, 1, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 12, '2022-05-30 16:16:17', '2022-12-15 03:55:39', NULL, ''),
(44, 1, 'Ordenes de Fabricacion', '', '_self', NULL, '#000000', 43, 1, '2022-05-30 23:17:32', '2022-06-01 18:05:22', 'voyager.ordenes_fabricacion.index', 'null'),
(46, 1, 'Moldes', '', '_self', NULL, NULL, 33, 4, '2022-08-10 22:52:51', '2022-08-11 01:25:30', 'voyager.moldes.index', NULL),
(48, 1, 'Formaspagos', '', '_self', NULL, NULL, 33, 9, '2022-09-10 02:27:30', '2022-11-11 14:59:26', 'voyager.formaspago.index', NULL),
(49, 1, 'Cuentas Bancos', '', '_self', NULL, NULL, 35, 8, '2022-10-19 15:05:46', '2022-12-15 03:48:17', 'voyager.cuentas-bancos.index', NULL),
(50, 1, 'Remitos', '/Remitos', '_self', NULL, '#000000', 43, 2, '2022-11-11 14:59:51', '2022-11-17 16:25:27', NULL, ''),
(51, 1, 'Informe de producción', '/Informeproduccion', '_self', NULL, '#000000', 35, 6, '2022-12-13 16:17:29', '2022-12-15 03:48:17', NULL, ''),
(52, 1, 'Movimientos financieros', '', '_self', NULL, '#000000', 36, 1, '2022-12-15 03:53:05', '2022-12-15 03:55:39', 'voyager.movimientos_financieros.index', 'null'),
(53, 1, 'Flujo Financiero', '/informe_flujofinanciero', '_self', NULL, '#000000', 35, 9, '2022-12-17 01:54:05', '2022-12-17 01:54:14', NULL, '');

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
  `nro_op` int(11) DEFAULT NULL,
  `id_nota_pedido` bigint(20) UNSIGNED DEFAULT NULL,
  `id_factura_compra` bigint(20) UNSIGNED DEFAULT NULL,
  `modalidad_pago` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cheque` int(11) DEFAULT NULL,
  `fecha_vto` datetime DEFAULT NULL,
  `id_cuenta_bancaria` bigint(20) UNSIGNED DEFAULT NULL,
  `detalle` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jurisdiccion` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_retencion` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_movimiento` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe_egreso` decimal(11,2) DEFAULT NULL,
  `importe_ingreso` decimal(11,2) DEFAULT NULL,
  `id_usuario` tinyint(4) DEFAULT NULL,
  `id_caja` bigint(20) UNSIGNED DEFAULT NULL,
  `conciliado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_real_dep_acred` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_tipo_gasto` bigint(20) DEFAULT NULL,
  `id_proveedor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mov_financieros`
--

INSERT INTO `mov_financieros` (`id`, `fecha`, `pto_vta`, `nro_recibo`, `nro_op`, `id_nota_pedido`, `id_factura_compra`, `modalidad_pago`, `nro_cheque`, `fecha_vto`, `id_cuenta_bancaria`, `detalle`, `id_jurisdiccion`, `tipo_retencion`, `tipo_movimiento`, `importe_egreso`, `importe_ingreso`, `id_usuario`, `id_caja`, `conciliado`, `fecha_real_dep_acred`, `created_at`, `updated_at`, `id_tipo_gasto`, `id_proveedor`) VALUES
(53, '2022-10-16 00:00:00', NULL, NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, 1, NULL, NULL, NULL, '2022-12-09 17:35:20', '2022-12-09 17:35:20', 10, 2),
(54, '2022-03-10 00:00:00', NULL, NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'zz', NULL, NULL, 'Gastos/Egresos', '10000.00', NULL, 1, NULL, NULL, NULL, '2022-12-09 17:46:30', '2022-12-09 17:46:30', 4, 1),
(55, '2022-06-10 00:00:00', NULL, NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Gastos/Egresos', '15000.00', NULL, 1, NULL, NULL, NULL, '2022-12-09 17:49:42', '2022-12-09 17:49:42', 5, 2),
(57, '2022-02-16 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, 'uuu', NULL, NULL, 'Gastos/Egresos', '15000.00', NULL, 1, NULL, NULL, NULL, '2022-12-12 22:30:24', '2022-12-12 22:30:24', 3, 1),
(58, '2022-12-12 00:00:00', NULL, NULL, NULL, 0, NULL, 'Efectivo', NULL, NULL, NULL, 'ppp', NULL, NULL, 'Gastos/Egresos', '20000.00', NULL, 1, NULL, NULL, NULL, '2022-12-12 22:32:25', '2022-12-12 22:32:25', 1, 1),
(61, '2022-12-20 00:00:00', 10, 13, NULL, 4, NULL, 'Efectivo', NULL, NULL, NULL, '2000', NULL, NULL, 'Cobranza/Ingresos', NULL, '2000.00', NULL, NULL, NULL, NULL, '2022-12-20 18:33:43', '2022-12-28 00:32:45', NULL, 1),
(65, '2022-12-21 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, 'hgfdfhf', NULL, NULL, 'Gastos/Egresos', '36000.00', NULL, 1, NULL, NULL, NULL, '2022-12-27 02:54:05', '2022-12-27 02:54:05', 3, 1),
(66, '2022-12-27 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, 'dsdsgsdg', NULL, NULL, 'Gastos/Egresos', '24000.00', NULL, 1, NULL, NULL, NULL, '2022-12-27 02:56:39', '2022-12-27 02:56:39', 3, 1),
(67, '2022-12-02 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Gastos/Egresos', '534324.00', NULL, 1, NULL, NULL, NULL, '2022-12-27 02:58:00', '2022-12-27 02:58:00', 3, 1),
(68, '2022-12-02 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Gastos/Egresos', '345555.00', NULL, 1, NULL, NULL, NULL, '2022-12-27 03:08:14', '2022-12-27 03:08:14', 3, 1),
(69, '2022-12-22 00:00:00', NULL, NULL, NULL, 0, 4, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Gastos/Egresos', '12000.00', NULL, 1, NULL, NULL, NULL, '2022-12-27 03:09:43', '2022-12-27 03:09:43', 3, 1),
(72, '2022-12-27 00:00:00', NULL, NULL, NULL, 4, NULL, 'Efectivo', NULL, NULL, NULL, 'salda deuda', NULL, NULL, 'Cobranza/Ingresos', NULL, '637.80', 1, NULL, NULL, NULL, '2022-12-28 00:29:17', '2022-12-28 00:29:17', 0, 0),
(73, '2022-12-27 00:00:00', NULL, NULL, NULL, 18, NULL, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, '108.90', 1, NULL, NULL, NULL, '2022-12-28 00:50:48', '2022-12-28 00:50:48', 0, 0),
(77, '2022-12-27 00:00:00', NULL, NULL, NULL, 19, NULL, 'Efectivo', NULL, NULL, NULL, '1111', NULL, NULL, 'Cobranza/Ingresos', NULL, '1111.00', 1, NULL, NULL, NULL, '2022-12-28 02:33:31', '2022-12-28 02:33:31', 0, 0);

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
  `estado_pago` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_vendedor_2` bigint(20) DEFAULT NULL,
  `tipo_presupuesto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_remito` bigint(20) DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='if nro_remito=0\r\n Ult_remito =  select max(nro_remito) from nota_pedidos\r\n nro_remito=+1\r\n';

--
-- Volcado de datos para la tabla `nota_pedidos`
--

INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `estado_pago`, `id_vendedor_2`, `tipo_presupuesto`, `nro_remito`, `fecha_entrega`) VALUES
(3, '2022-02-13 00:00:00', 2, '1500.00', '1500.00', '0.00', 1, NULL, '20.00', NULL, '2022-02-12 21:42:34', '2022-09-09 00:40:59', 'Rechazado', 'Pendiente', NULL, 'Productos', NULL, NULL),
(4, '2022-02-16 00:00:00', 1, '2200.00', '2637.80', '457.80', 1, NULL, '-20.00', 'Descripción del Mueble :\r\nMueble 1: Alacena\r\nMATERALES: Estructura Color BLANCO en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico.\r\nMueble 2: Bajo Mesada \r\nMATERALES: Estructura Color BLANCA en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\nMueble 3: Isla \r\nMATERALES: Estructura interna Color BLANCA en MDF de 18 mm. Estructura Frente a la vista Color BALTICO O TERRARUM en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\n///\r\nDescripción del Mueble :\r\nMueble 1: Alacena\r\nMATERALES: Estructura Color BLANCO en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico.\r\nMueble 2: Bajo Mesada \r\nMATERALES: Estructura Color BLANCA en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.\r\nMueble 3: Isla \r\nMATERALES: Estructura interna Color BLANCA en MDF de 18 mm. Estructura Frente a la vista Color BALTICO O TERRARUM en MDF de 18 mm. Con puertas color : color BALTICO O TERRARUM en MDF de 18 mm, con manijones metálico, correderas telescópicas.', '2022-02-27 17:38:50', '2022-12-28 00:24:37', 'Entregado', 'Pendiente', NULL, 'Productos', 1, '2022-12-27 00:00:00'),
(18, '2022-12-08 00:00:00', 5, '100.00', '108.90', '18.90', 1, NULL, '-10.00', NULL, '2022-12-07 15:27:57', '2022-12-28 00:40:25', 'Entregado', 'Pendiente', NULL, 'Productos', 2, '2022-12-27 00:00:00'),
(19, '2022-12-27 00:00:00', 1, '13110.00', '15863.10', '2753.10', 1, NULL, NULL, NULL, '2022-12-28 00:55:28', '2022-12-28 00:56:48', 'Pendiente Aprobacion', 'Pendiente', NULL, 'Productos', NULL, NULL);

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
(65, '2022-12-27 00:00:00', NULL, 'Entregado', NULL, NULL, 3, '10.00', 18, NULL, '2022-12-28 00:51:58');

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
(111, 'browse_jurisdicciones', 'jurisdicciones', '2022-02-12 00:45:00', '2022-02-12 00:45:00'),
(112, 'read_jurisdicciones', 'jurisdicciones', '2022-02-12 00:45:00', '2022-02-12 00:45:00'),
(113, 'edit_jurisdicciones', 'jurisdicciones', '2022-02-12 00:45:00', '2022-02-12 00:45:00'),
(114, 'add_jurisdicciones', 'jurisdicciones', '2022-02-12 00:45:00', '2022-02-12 00:45:00'),
(115, 'delete_jurisdicciones', 'jurisdicciones', '2022-02-12 00:45:00', '2022-02-12 00:45:00'),
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
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(108, 1),
(108, 2),
(109, 1),
(109, 2),
(110, 1),
(110, 2),
(111, 1),
(111, 2),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(119, 1),
(119, 2),
(120, 1),
(120, 2),
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
(142, 1),
(143, 1),
(144, 1),
(145, 1);

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
(2, 'Hierros Lider', 'Ruta NAcional 11 Km 1025', NULL, NULL, NULL, NULL, '32-25546879-0', 'RI', NULL, NULL, NULL, '2022-02-12 00:15:00', '2022-03-15 18:14:05');

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
(255, 19, 1, '10.00', '12000.000', '21.00', NULL, '2022-12-28 00:56:48', '2022-12-28 00:56:48'),
(256, 19, 5, '10.00', '1000.000', '21.00', NULL, '2022-12-28 00:56:48', '2022-12-28 00:56:48'),
(257, 19, 3, '11.00', '110.000', '21.00', NULL, '2022-12-28 00:56:48', '2022-12-28 00:56:48');

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
(1, 'admin', 'Administrator', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 'gerente', 'Gerente', '2022-01-09 01:12:38', '2022-09-19 17:42:37');

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
(1, 1, 'Admin', 'admin@admin.com', 'users\\September2022\\f1BNJCmkVg9wYVjsxtQc.PNG', NULL, '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S', 'KvI4XdYYE33MhlfpNxDYo9s4inJnONpJztsWEHYVAWturPRZE2kA82HqBLWm', '{\"locale\":\"es\"}', '2022-01-09 01:12:38', '2022-09-27 15:32:11'),
(2, 2, 'Sonia', 'persiarevestimientos@gmail.com', 'users\\September2022\\sn1ukfzojZeXMunt4nqY.PNG', NULL, '$2y$10$e7919r3ou3IM5Wj18XM7s.4NmcmTZlP43RTFAk/y6SywTiIs10CCS', NULL, '{\"locale\":\"es\"}', '2022-09-17 15:37:07', '2022-09-27 15:31:34');

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
(2, 2);

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
  ADD KEY `facturas_compras_id_jurisdiccion_foreign` (`id_jurisdiccion`),
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
-- Indices de la tabla `jurisdicciones`
--
ALTER TABLE `jurisdicciones`
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
  ADD KEY `mov_financieros_id_jurisdiccion_foreign` (`id_jurisdiccion`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT de la tabla `jurisdicciones`
--
ALTER TABLE `jurisdicciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `renglones_notapedidos`
--
ALTER TABLE `renglones_notapedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `facturas_compras_id_jurisdiccion_foreign` FOREIGN KEY (`id_jurisdiccion`) REFERENCES `jurisdicciones` (`id`),
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
  ADD CONSTRAINT `mov_financieros_id_factura_compra_foreign` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturas_compras` (`id`),
  ADD CONSTRAINT `mov_financieros_id_jurisdiccion_foreign` FOREIGN KEY (`id_jurisdiccion`) REFERENCES `jurisdicciones` (`id`);

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
