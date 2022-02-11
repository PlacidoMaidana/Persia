-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-01-2022 a las 16:17:43
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

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
-- Estructura de tabla para la tabla `caja_diaria`
--

CREATE TABLE `caja_diaria` (
  `id` int(11) NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `inicio_efectivo` decimal(19,2) DEFAULT NULL,
  `inicio_cheque` decimal(19,2) DEFAULT NULL,
  `inicio_tarjetas` decimal(19,2) DEFAULT NULL,
  `Inicio_otros` decimal(19,2) DEFAULT NULL,
  `cerrado` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_operador` int(11) DEFAULT NULL,
  `total_efectivo` decimal(11,2) DEFAULT NULL,
  `total_cheque` decimal(11,2) DEFAULT NULL,
  `total_tarjetas` decimal(11,2) DEFAULT NULL,
  `total_otros` decimal(11,2) DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Estructura de tabla para la tabla `chequesterceros`
--

CREATE TABLE `chequesterceros` (
  `id` int(11) NOT NULL,
  `tipo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cuenta_banco` int(11) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `nro_cheque` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banco` varchar(49) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal` varchar(49) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `importe` decimal(9,2) DEFAULT NULL,
  `id_transf` int(11) DEFAULT NULL,
  `id_pago` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otros_datos` varchar(79) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_emision` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_localidad` int(11) DEFAULT NULL,
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

INSERT INTO `clientes` (`id`, `nombre`, `cuit`, `fecha_alta`, `direccion`, `cp`, `tel`, `id_localidad`, `e_mail`, `observaciones`, `cond_iva`, `registro_fce`, `created_at`, `updated_at`) VALUES
(1, 'Pablo', '20257328075', '1986-02-26 00:00:00', 'SEITORQ', '3500', '3725546928', 1, 'ladfal@alksdfa.com', '<p>fgsdfgsdfgs</p>', 'CF', 'si', '2022-01-12 00:01:18', '2022-01-12 00:01:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobranzas`
--

CREATE TABLE `cobranzas` (
  `id` int(11) NOT NULL,
  `id_recibo` int(11) NOT NULL,
  `pto_vta` smallint(6) NOT NULL,
  `nro_recibo` int(11) NOT NULL,
  `nro_caja` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `monto` decimal(11,2) DEFAULT NULL,
  `modalidad_pago` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cheque` int(11) NOT NULL,
  `fecha_vto` datetime DEFAULT NULL,
  `id_transbancaria` int(11) DEFAULT NULL,
  `nro_cta` int(11) NOT NULL,
  `concepto_retencion` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_retencion` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_retencion` datetime DEFAULT NULL,
  `jurisdiccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_banco`
--

CREATE TABLE `cuentas_banco` (
  `id` int(11) NOT NULL,
  `banco` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_cta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cuenta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cbu` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
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
(61, 13, 'cp', 'text', 'Cp', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 13, 'tel', 'text', 'Tel', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 13, 'id_localidad', 'number', 'Id Localidad', 0, 1, 1, 1, 1, 1, '{}', 8),
(64, 13, 'e_mail', 'text', 'E Mail', 0, 1, 1, 1, 1, 1, '{}', 9),
(65, 13, 'observaciones', 'rich_text_box', 'Observaciones', 0, 1, 1, 1, 1, 1, 'null', 10),
(66, 13, 'cond_iva', 'select_dropdown', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{\"default\":\"RI\",\"options\":{\"RI\":\"Responsable inscripto\",\"MO\":\"Monotributo\",\"CF\":\"Consumidor Final\",\"NR\":\"No responsable\",\"Exe\":\"Exento\"}}', 11),
(67, 13, 'registro_fce', 'text', 'Registro Fce', 0, 1, 1, 1, 1, 1, '{}', 12),
(68, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(69, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(85, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(86, 16, 'sucursal', 'text', 'Sucursal', 1, 1, 1, 1, 1, 1, '{}', 2),
(87, 16, 'nro_pedido', 'text', 'Nro Pedido', 1, 1, 1, 1, 1, 1, '{}', 3),
(88, 16, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{}', 4),
(89, 16, 'id_cliente', 'text', 'Id Cliente', 0, 1, 1, 1, 1, 1, '{}', 5),
(90, 16, 'cond_venta', 'text', 'Cond Venta', 0, 1, 1, 1, 1, 1, '{}', 6),
(91, 16, 'totalgravado', 'text', 'Totalgravado', 0, 1, 1, 1, 1, 1, '{}', 7),
(92, 16, 'total', 'text', 'Total', 0, 1, 1, 1, 1, 1, '{}', 8),
(93, 16, 'monto_iva', 'text', 'Monto Iva', 0, 1, 1, 1, 1, 1, '{}', 9),
(94, 16, 'id_vendedor', 'text', 'Id Vendedor', 0, 1, 1, 1, 1, 1, '{}', 10),
(95, 16, 'aprobado', 'text', 'Aprobado', 0, 1, 1, 1, 1, 1, '{}', 11),
(96, 16, 'id_factura', 'text', 'Id Factura', 0, 1, 1, 1, 1, 1, '{}', 12),
(97, 16, 'despachado', 'text', 'Despachado', 0, 1, 1, 1, 1, 1, '{}', 13),
(98, 16, 'observaciones', 'text', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 14),
(99, 16, 'id_orden_fabricacion', 'text', 'Id Orden Fabricacion', 0, 1, 1, 1, 1, 1, '{}', 15),
(100, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 16),
(101, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 17),
(102, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 18),
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
(115, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(116, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(117, 17, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 15),
(118, 16, 'nota_pedido_belongsto_empleado_relationship', 'relationship', 'empleados', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Empleado\",\"table\":\"empleados\",\"type\":\"belongsTo\",\"column\":\"id_vendedor\",\"key\":\"id\",\"label\":\"apellidoynombre\",\"pivot_table\":\"caja_diaria\",\"pivot\":\"0\",\"taggable\":\"0\"}', 19),
(119, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(120, 18, 'provincia', 'text', 'Provincia', 1, 1, 1, 1, 1, 1, '{}', 2),
(121, 18, 'localidad', 'text', 'Localidad', 1, 1, 1, 1, 1, 1, '{}', 3),
(122, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(123, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(124, 19, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 19, 'razonsocial', 'text', 'Razonsocial', 0, 1, 1, 1, 1, 1, '{}', 2),
(126, 19, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 3),
(127, 19, 'actividad_principal', 'text', 'Actividad Principal', 0, 1, 1, 1, 1, 1, '{}', 4),
(128, 19, 'nombre_comercial', 'text', 'Nombre Comercial', 0, 1, 1, 1, 1, 1, '{}', 5),
(129, 19, 'id_localidad', 'number', 'Id Localidad', 0, 0, 0, 1, 1, 1, '{}', 6),
(130, 19, 'web', 'text', 'Web', 0, 1, 1, 1, 1, 1, '{}', 7),
(131, 19, 'teefono', 'text', 'Teefono', 0, 1, 1, 1, 1, 1, '{}', 8),
(132, 19, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{}', 9),
(133, 19, 'cuit', 'text', 'Cuit', 0, 1, 1, 1, 1, 1, '{}', 10),
(134, 19, 'cond_iva', 'text', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{}', 11),
(135, 19, 'agente_percepcion_iva', 'text', 'Agente Percepcion Iva', 0, 1, 1, 1, 1, 1, '{}', 12),
(136, 19, 'porcentaje_percep_iva', 'text', 'Porcentaje Percep Iva', 0, 1, 1, 1, 1, 1, '{}', 13),
(137, 19, 'agente_percep_dgr', 'text', 'Agente Percep Dgr', 0, 1, 1, 1, 1, 1, '{}', 14),
(138, 19, 'porcentaje_percep_dgr', 'text', 'Porcentaje Percep Dgr', 0, 1, 1, 1, 1, 1, '{}', 15),
(139, 19, 'nombre_contacto', 'text', 'Nombre Contacto', 0, 1, 1, 1, 1, 1, '{}', 16),
(140, 19, 'telefono_contacto', 'text', 'Telefono Contacto', 0, 1, 1, 1, 1, 1, '{}', 17),
(141, 19, 'observaciones', 'text', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 18),
(142, 19, 'proveedore_belongsto_localidade_relationship', 'relationship', 'Localidad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Localidad\",\"table\":\"localidades\",\"type\":\"belongsTo\",\"column\":\"id_localidad\",\"key\":\"id\",\"label\":\"localidad\",\"pivot_table\":\"caja_diaria\",\"pivot\":\"0\",\"taggable\":\"0\"}', 19),
(143, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 19),
(144, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 20);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(13, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Models\\Cliente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-11 23:35:14', '2022-01-12 00:00:04'),
(16, 'nota_pedidos', 'nota-pedidos', 'Nota Pedido', 'Nota Pedidos', NULL, 'App\\Models\\nota_pedido', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:34:43', '2022-01-13 02:02:27'),
(17, 'empleados', 'empleados', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-13 01:40:47', '2022-01-13 01:48:03'),
(18, 'localidades', 'localidades', 'Localidad', 'Localidades', NULL, 'App\\Models\\Localidad', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-18 16:09:15', '2022-01-18 16:15:12'),
(19, 'proveedores', 'proveedores', 'Proveedore', 'Proveedores', NULL, 'App\\Models\\Proveedor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-18 16:10:42', '2022-01-18 16:20:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura_compra`
--

CREATE TABLE `detalle_factura_compra` (
  `id` int(11) NOT NULL,
  `id_factura_compra` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `cantidad` decimal(12,2) DEFAULT NULL,
  `precio_c` decimal(15,8) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_linea` decimal(12,3) DEFAULT NULL,
  `unidad` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden_fabricacion`
--

CREATE TABLE `detalle_orden_fabricacion` (
  `id` int(11) NOT NULL,
  `id_orden_fabricacion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `apellidoynombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuil` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `categoria` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `estadocivil` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domicilio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefonos` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(249) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `apellidoynombre`, `cuil`, `dni`, `fecha_ingreso`, `categoria`, `estado`, `fecha_nacimiento`, `estadocivil`, `domicilio`, `telefonos`, `observaciones`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pedro Fuentes', '4343434', '55555555555555555', '2005-02-02 00:00:00', '1', '1', '2002-03-14 00:00:00', '1', 'lejos 33', '44444', 'ninguna', '2022-01-13 01:56:00', '2022-01-13 01:56:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `razon_social` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_comercial` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_mail` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localidad` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad_principal` int(11) DEFAULT NULL,
  `cuit` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cond_iva` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vto_iva` datetime DEFAULT NULL,
  `agente_percepcion_iva` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agente_percep_dgr` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inicio_act` datetime DEFAULT NULL,
  `lineas_factura` tinyint(4) DEFAULT NULL,
  `logo` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe_max_fce` decimal(13,2) DEFAULT NULL,
  `cbu` decimal(22,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_compra`
--

CREATE TABLE `factura_compra` (
  `id` int(11) NOT NULL,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_gasto` int(11) DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `subtotal` decimal(13,3) DEFAULT NULL,
  `exento` decimal(9,3) DEFAULT NULL,
  `iva_10_5` decimal(11,3) DEFAULT NULL,
  `iva_21` decimal(11,3) DEFAULT NULL,
  `iva_27` decimal(9,3) DEFAULT NULL,
  `iva` decimal(19,3) DEFAULT NULL,
  `porc_percepciones_iibb` decimal(7,3) DEFAULT NULL,
  `monto_perc_iibb` decimal(19,3) DEFAULT NULL,
  `porcentaje_per_iva` decimal(5,3) DEFAULT NULL,
  `monto_percepcion_iva` decimal(13,3) DEFAULT NULL,
  `monto_percep_ganancias` decimal(9,3) DEFAULT NULL,
  `otros_impuestos` decimal(13,3) DEFAULT NULL,
  `total_impuestos` decimal(13,3) DEFAULT NULL,
  `total_factura` decimal(19,3) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `remito_pto_vta` smallint(6) DEFAULT NULL,
  `remito_nro` int(11) DEFAULT NULL,
  `id_jurisdiccion` smallint(6) DEFAULT NULL,
  `tipo_factura_ref` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pto_venta_ref` int(11) DEFAULT NULL,
  `nro_factura_ref` int(11) DEFAULT NULL,
  `tipo_debito` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codusuario` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_venta`
--

CREATE TABLE `factura_venta` (
  `id` int(11) NOT NULL,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cond_venta` varchar(33) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `porc_dto` decimal(5,2) DEFAULT NULL,
  `cae` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto_iva21` decimal(19,2) DEFAULT NULL,
  `monto_iva10` decimal(19,2) DEFAULT NULL,
  `tipo_factura_ref` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pto_venta_ref` int(11) DEFAULT NULL,
  `nro_factura_ref` int(11) DEFAULT NULL,
  `tipo_debito` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalGravado` decimal(12,2) DEFAULT NULL,
  `marca` tinyint(4) DEFAULT NULL,
  `fce` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_comprobante_afip` tinyint(4) DEFAULT NULL
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
-- Estructura de tabla para la tabla `formulas`
--

CREATE TABLE `formulas` (
  `id` int(11) NOT NULL,
  `descripcion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_procedimiento` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residual` decimal(9,2) DEFAULT NULL,
  `cant_moldes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jurisdicciones`
--

CREATE TABLE `jurisdicciones` (
  `id` int(11) NOT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id`, `provincia`, `localidad`, `created_at`, `updated_at`) VALUES
(1, 'Corrientes', 'Bella Vista', '2022-01-18 16:12:17', '2022-01-18 16:12:17'),
(2, 'Chaco', 'Resistencia', '2022-01-18 16:12:28', '2022-01-18 16:12:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matprima`
--

CREATE TABLE `matprima` (
  `id` int(11) NOT NULL,
  `cod_proveedor` int(11) NOT NULL,
  `cod_matprima` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rubro` int(11) NOT NULL,
  `id_subrubro` int(11) NOT NULL,
  `volumen` decimal(5,1) DEFAULT NULL,
  `unidad` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidad_bulto` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` decimal(9,2) DEFAULT NULL,
  `preciounit` decimal(15,8) DEFAULT NULL,
  `preciounit_dolar` decimal(12,5) DEFAULT NULL,
  `porc_iva` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-01-09 01:12:38', '2022-01-09 01:12:38', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2022-01-09 01:12:38', '2022-01-09 01:12:38', 'voyager.pages.index', NULL),
(17, 1, 'Clientes', '', '_self', NULL, NULL, NULL, 15, '2022-01-11 23:35:14', '2022-01-11 23:35:14', 'voyager.clientes.index', NULL),
(19, 1, 'Nota Pedidos', '', '_self', NULL, NULL, NULL, 16, '2022-01-13 01:34:43', '2022-01-13 01:34:43', 'voyager.nota-pedidos.index', NULL),
(20, 1, 'Empleados', '', '_self', NULL, NULL, NULL, 17, '2022-01-13 01:40:47', '2022-01-13 01:40:47', 'voyager.empleados.index', NULL),
(21, 1, 'Localidades', '', '_self', NULL, NULL, NULL, 18, '2022-01-18 16:09:15', '2022-01-18 16:09:15', 'voyager.localidades.index', NULL),
(22, 1, 'Proveedores', '', '_self', NULL, NULL, NULL, 19, '2022-01-18 16:10:42', '2022-01-18 16:10:42', 'voyager.proveedores.index', NULL);

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
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2022_01_10_230234_create_caja_diaria_table', 3),
(30, '2022_01_10_230235_create_chequesterceros_table', 3),
(31, '2022_01_10_230236_create_clientes_table', 3),
(32, '2022_01_10_230237_create_cobranzas_table', 3),
(33, '2022_01_10_230238_create_cuentas_banco_table', 3),
(34, '2022_01_10_230239_create_detalle_factura_compra_table', 3),
(35, '2022_01_10_230240_create_detalle_orden_fabricacion_table', 3),
(36, '2022_01_10_230241_create_empresa_table', 3),
(37, '2022_01_10_230242_create_factura_compra_table', 3),
(38, '2022_01_10_230243_create_factura_venta_table', 3),
(39, '2022_01_10_230244_create_formulas_table', 3),
(40, '2022_01_10_230245_create_jurisdicciones_table', 3),
(41, '2022_01_10_230246_create_localidad_table', 3),
(42, '2022_01_10_230247_create_matprima_table', 3),
(43, '2022_01_10_230248_create_movimientos_fondos_table', 3),
(44, '2022_01_10_230249_create_nota_pedido_table', 3),
(45, '2022_01_10_230250_create_ordenes_fabricacion_table', 3),
(46, '2022_01_10_230251_create_ordenes_pago_table', 3),
(47, '2022_01_10_230252_create_pagos_proveedores_table', 3),
(48, '2022_01_10_230253_create_personal_table', 3),
(49, '2022_01_10_230254_create_productos_table', 3),
(50, '2022_01_10_230255_create_proveedores_table', 3),
(51, '2022_01_10_230256_create_recibos_cobranzas_table', 3),
(52, '2022_01_10_230257_create_renglones_notapedido_table', 3),
(53, '2022_01_10_230258_create_rubro_table', 3),
(54, '2022_01_10_230259_create_rubromp_table', 3),
(55, '2022_01_10_230300_create_subrubro_table', 3),
(56, '2022_01_10_230301_create_subrubromp_table', 3),
(57, '2022_01_10_230302_create_tipos_gastos_table', 3),
(58, '2022_01_10_230303_create_transfbancarias_table', 3),
(59, '2022_01_10_230304_create_usos_destino_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_fondos`
--

CREATE TABLE `movimientos_fondos` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_caja_origen` int(11) NOT NULL,
  `id_usuario_origen` tinyint(4) DEFAULT NULL,
  `id_caja_destino` int(11) DEFAULT NULL,
  `id_usuario_destino` tinyint(4) DEFAULT NULL,
  `importe` decimal(11,2) DEFAULT NULL,
  `modalidad_pago` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cheque` int(11) DEFAULT NULL,
  `concepto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_pedidos`
--

CREATE TABLE `nota_pedidos` (
  `id` int(11) NOT NULL,
  `sucursal` smallint(6) NOT NULL,
  `nro_pedido` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `cond_venta` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalgravado` decimal(12,2) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `monto_iva` decimal(9,2) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `aprobado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `despachado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_orden_fabricacion` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nota_pedidos`
--

INSERT INTO `nota_pedidos` (`id`, `sucursal`, `nro_pedido`, `fecha`, `id_cliente`, `cond_venta`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `aprobado`, `id_factura`, `despachado`, `observaciones`, `id_orden_fabricacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2003-01-29 00:00:00', 1, '1', '20000.00', '2000.00', '21.00', 1, '1', 1, '1', '21232132', 1, '2022-01-13 02:03:36', '2022-01-13 02:03:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_fabricacion`
--

CREATE TABLE `ordenes_fabricacion` (
  `id` int(11) NOT NULL,
  `fecha_orden` datetime DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_entrada_proceso` datetime DEFAULT NULL,
  `fecha_salida_proceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_pago`
--

CREATE TABLE `ordenes_pago` (
  `id` int(11) NOT NULL,
  `pto_vta` smallint(6) NOT NULL,
  `nro_op` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `concepto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_proveedores`
--

CREATE TABLE `pagos_proveedores` (
  `id` int(11) NOT NULL,
  `id_op` int(11) NOT NULL,
  `id_transbancaria` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `monto` decimal(19,2) DEFAULT NULL,
  `modalidad_pago` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cheque` int(11) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `id_cta` int(11) DEFAULT NULL,
  `observaciones` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concepto_retencion` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_retencion` datetime DEFAULT NULL,
  `nro_retencion` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurisdiccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(76, 'browse_localidades', 'localidades', '2022-01-18 16:09:15', '2022-01-18 16:09:15'),
(77, 'read_localidades', 'localidades', '2022-01-18 16:09:15', '2022-01-18 16:09:15'),
(78, 'edit_localidades', 'localidades', '2022-01-18 16:09:15', '2022-01-18 16:09:15'),
(79, 'add_localidades', 'localidades', '2022-01-18 16:09:15', '2022-01-18 16:09:15'),
(80, 'delete_localidades', 'localidades', '2022-01-18 16:09:15', '2022-01-18 16:09:15'),
(81, 'browse_proveedores', 'proveedores', '2022-01-18 16:10:42', '2022-01-18 16:10:42'),
(82, 'read_proveedores', 'proveedores', '2022-01-18 16:10:42', '2022-01-18 16:10:42'),
(83, 'edit_proveedores', 'proveedores', '2022-01-18 16:10:42', '2022-01-18 16:10:42'),
(84, 'add_proveedores', 'proveedores', '2022-01-18 16:10:42', '2022-01-18 16:10:42'),
(85, 'delete_proveedores', 'proveedores', '2022-01-18 16:10:42', '2022-01-18 16:10:42');

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
(2, 1),
(3, 1),
(4, 1),
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
(17, 1),
(18, 1),
(19, 1),
(20, 1),
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
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1);

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
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `cod_producto` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rubro` int(11) NOT NULL,
  `id_subrubro` int(11) NOT NULL,
  `preciovta` decimal(19,3) DEFAULT NULL,
  `preciocosto` decimal(19,3) DEFAULT NULL,
  `tasa_iva` decimal(5,2) DEFAULT NULL,
  `unidad` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` decimal(7,2) DEFAULT NULL,
  `porcgcia` decimal(5,2) DEFAULT NULL,
  `activo` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_formula` int(11) DEFAULT NULL,
  `id_materiaprima_reventa` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `razonsocial` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad_principal` int(11) DEFAULT NULL,
  `nombre_comercial` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_localidad` int(11) DEFAULT NULL,
  `web` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teefono` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` char(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cond_iva` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agente_percepcion_iva` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentaje_percep_iva` decimal(7,2) DEFAULT NULL,
  `agente_percep_dgr` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentaje_percep_dgr` decimal(7,2) DEFAULT NULL,
  `nombre_contacto` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_contacto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` char(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `razonsocial`, `direccion`, `actividad_principal`, `nombre_comercial`, `id_localidad`, `web`, `teefono`, `mail`, `cuit`, `cond_iva`, `agente_percepcion_iva`, `porcentaje_percep_iva`, `agente_percep_dgr`, `porcentaje_percep_dgr`, `nombre_contacto`, `telefono_contacto`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 'SANTIANO y VICTOR S.R.L.', 'Av 25 de MAYO 1799', NULL, 'SANTIANO y VICTOR S.R.L.', 1, NULL, NULL, NULL, '30-71472882-9', 'RI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-18 16:13:18', '2022-01-18 16:13:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos_cobranzas`
--

CREATE TABLE `recibos_cobranzas` (
  `id` int(11) NOT NULL,
  `pto_vta` smallint(6) NOT NULL,
  `nro_recibo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `id_operador` tinyint(4) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renglones_notapedido`
--

CREATE TABLE `renglones_notapedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(19,2) DEFAULT NULL,
  `total_linea` decimal(19,3) DEFAULT NULL,
  `porc_dto` decimal(5,2) DEFAULT NULL,
  `iva` decimal(5,2) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'user', 'Normal User', '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE `rubro` (
  `id` int(11) NOT NULL,
  `rubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubromp`
--

CREATE TABLE `rubromp` (
  `id` int(11) NOT NULL,
  `rubro_mp` char(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubro`
--

CREATE TABLE `subrubro` (
  `id` int(11) NOT NULL,
  `id_rubro` int(11) NOT NULL,
  `descripcion_subrubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubromp`
--

CREATE TABLE `subrubromp` (
  `id` int(11) NOT NULL,
  `id_rubromp` int(11) NOT NULL,
  `descrip_subrubromp` char(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_gastos`
--

CREATE TABLE `tipos_gastos` (
  `id` int(11) NOT NULL,
  `tipo1` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo2` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfbancarias`
--

CREATE TABLE `transfbancarias` (
  `id` int(11) NOT NULL,
  `fecha` int(11) DEFAULT NULL,
  `modalidad_pago` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe` decimal(11,2) DEFAULT NULL,
  `tipo_mov` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_movimiento` int(11) DEFAULT NULL,
  `concepto` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cta` int(11) NOT NULL,
  `nro_caja` int(11) NOT NULL,
  `tipo` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaprob_dep_acred` int(11) DEFAULT NULL,
  `fechareal_dep_acred` int(11) DEFAULT NULL,
  `conciliado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vencimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-01-09 01:12:38', '2022-01-09 01:12:38'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-01-09 01:12:39', '2022-01-09 01:12:39'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-01-09 01:12:39', '2022-01-09 01:12:39');

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
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S', 'iz3Yykg1go5YqcuBMDlCzRoSlv0WwUQyRtkGH4Ap4HNnjNynawoHzR3ZcqTZ', NULL, '2022-01-09 01:12:38', '2022-01-09 01:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usos_destino`
--

CREATE TABLE `usos_destino` (
  `id` int(11) NOT NULL,
  `id_formula` int(11) NOT NULL,
  `id_matprima` int(11) NOT NULL,
  `cant_unid_produc` decimal(12,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja_diaria`
--
ALTER TABLE `caja_diaria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `chequesterceros`
--
ALTER TABLE `chequesterceros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ChequesTerceros_Caja_Diaria` (`id_caja`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Clientes_localidad` (`id_localidad`);

--
-- Indices de la tabla `cobranzas`
--
ALTER TABLE `cobranzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Cobranzas_Recibos_cobranzas` (`id_recibo`),
  ADD KEY `FK_Cobranzas_Caja_Diaria` (`nro_caja`),
  ADD KEY `FK_Cobranzas_ChequesTerceros` (`nro_cheque`),
  ADD KEY `FK_Cobranzas_TransfBancarias` (`id_transbancaria`),
  ADD KEY `FK_Cobranzas_Cuentas_banco` (`nro_cta`),
  ADD KEY `FK_Cobranzas_jurisdicciones` (`jurisdiccion`);

--
-- Indices de la tabla `cuentas_banco`
--
ALTER TABLE `cuentas_banco`
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
-- Indices de la tabla `detalle_factura_compra`
--
ALTER TABLE `detalle_factura_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Detalle_Factura_Compra_Factura_Compra` (`id_factura_compra`),
  ADD KEY `FK_Detalle_Factura_Compra_MatPrima` (`id_articulo`);

--
-- Indices de la tabla `detalle_orden_fabricacion`
--
ALTER TABLE `detalle_orden_fabricacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Detalle_Orden_Fabricacion_Ordenes_Fabricacion` (`id_orden_fabricacion`),
  ADD KEY `FK_Detalle_Orden_Fabricacion_Productos` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Factura_Compra_Proveedores` (`id_proveedor`),
  ADD KEY `FK_Factura_Compra_Tipos_Gastos` (`id_tipo_gasto`);

--
-- Indices de la tabla `factura_venta`
--
ALTER TABLE `factura_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Factura_Venta_Clientes` (`id_cliente`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `formulas`
--
ALTER TABLE `formulas`
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
-- Indices de la tabla `matprima`
--
ALTER TABLE `matprima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_MatPrima_Rubromp` (`id_rubro`),
  ADD KEY `FK_MatPrima_SubRubroMP` (`id_subrubro`);

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
-- Indices de la tabla `movimientos_fondos`
--
ALTER TABLE `movimientos_fondos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Movimientos_Fondos_Caja_Diaria1` (`id_caja_origen`),
  ADD KEY `FK_Movimientos_Fondos_Caja_Diaria` (`id_caja_destino`);

--
-- Indices de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Nota_Pedido_Clientes` (`id_cliente`),
  ADD KEY `FK_Nota_Pedido_Ordenes_Fabricacion` (`id_orden_fabricacion`);

--
-- Indices de la tabla `ordenes_fabricacion`
--
ALTER TABLE `ordenes_fabricacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_pago`
--
ALTER TABLE `ordenes_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `pagos_proveedores`
--
ALTER TABLE `pagos_proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Pagos_Proveedores_Ordenes_Pago` (`id_op`),
  ADD KEY `FK_Pagos_Proveedores_TransfBancarias` (`id_transbancaria`),
  ADD KEY `FK_Pagos_Proveedores_ChequesTerceros` (`id_cheque`),
  ADD KEY `FK_Pagos_Proveedores_Cuentas_banco` (`id_cta`),
  ADD KEY `FK_Pagos_Proveedores_jurisdicciones` (`jurisdiccion`);

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
  ADD KEY `FK_Productos_Rubro` (`id_rubro`),
  ADD KEY `FK_Productos_SubRubro` (`id_subrubro`),
  ADD KEY `FK_Productos_Formulas` (`id_formula`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recibos_cobranzas`
--
ALTER TABLE `recibos_cobranzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Recibos_cobranzas_Clientes` (`id_cliente`);

--
-- Indices de la tabla `renglones_notapedido`
--
ALTER TABLE `renglones_notapedido`
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
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rubromp`
--
ALTER TABLE `rubromp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `subrubro`
--
ALTER TABLE `subrubro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SubRubro_Rubro` (`id_rubro`);

--
-- Indices de la tabla `subrubromp`
--
ALTER TABLE `subrubromp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SubRubroMP_SubRubroMP` (`id_rubromp`);

--
-- Indices de la tabla `tipos_gastos`
--
ALTER TABLE `tipos_gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transfbancarias`
--
ALTER TABLE `transfbancarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TransfBancarias_Cuentas_banco` (`nro_cta`);

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
-- Indices de la tabla `usos_destino`
--
ALTER TABLE `usos_destino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Usos_Destino_Formulas` (`id_formula`),
  ADD KEY `FK_Usos_Destino_MatPrima` (`id_matprima`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `nota_pedidos`
--
ALTER TABLE `nota_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

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
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
