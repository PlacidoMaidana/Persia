-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para persia
CREATE DATABASE IF NOT EXISTS `persia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `persia`;

-- Volcando estructura para tabla persia.bases
CREATE TABLE IF NOT EXISTS `bases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `desc_base` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.bases: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `bases` DISABLE KEYS */;
/*!40000 ALTER TABLE `bases` ENABLE KEYS */;

-- Volcando estructura para tabla persia.cajas_diarias
CREATE TABLE IF NOT EXISTS `cajas_diarias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime DEFAULT NULL,
  `inicio_efectivo` decimal(19,2) DEFAULT NULL,
  `cerrado` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_operador` int(11) DEFAULT NULL,
  `total_efectivo` decimal(11,2) DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.cajas_diarias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cajas_diarias` DISABLE KEYS */;
INSERT INTO `cajas_diarias` (`id`, `fecha_apertura`, `inicio_efectivo`, `cerrado`, `id_operador`, `total_efectivo`, `observaciones`, `created_at`, `updated_at`) VALUES
	(1, '2022-09-08 11:26:49', 0.00, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `cajas_diarias` ENABLE KEYS */;

-- Volcando estructura para tabla persia.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(2, NULL, 1, 'Category 2', 'category-2', '2022-01-08 22:12:38', '2022-01-08 22:12:38');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla persia.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_localidad` bigint(20) unsigned NOT NULL,
  `e_mail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cond_iva` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_fce` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_id_localidad_foreign` (`id_localidad`),
  CONSTRAINT `clientes_id_localidad_foreign` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.clientes: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `cuit`, `fecha_alta`, `direccion`, `tel`, `id_localidad`, `e_mail`, `observaciones`, `cond_iva`, `registro_fce`, `created_at`, `updated_at`) VALUES
	(1, 'Juan Perez', '30-71472882-9', NULL, NULL, NULL, 1, NULL, NULL, 'MO', NULL, '2022-02-07 21:24:00', '2022-02-07 21:25:17'),
	(2, 'Juana Garcia', '32-25546879-0', NULL, NULL, NULL, 2, NULL, NULL, 'RI', NULL, '2022-02-07 21:25:00', '2022-09-26 20:00:21'),
	(3, 'Rosina Sandoval', '32-25546879-0', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-02-12 14:40:54', '2022-02-12 14:40:54'),
	(4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-09-08 21:28:09', '2022-09-08 21:28:09'),
	(5, 'Alba', '27-21367249-0', '2022-09-08 00:00:00', 'Barrio UTA Mz 35 C 12', NULL, 3, NULL, NULL, 'RI', NULL, '2022-09-08 21:29:00', '2022-09-08 21:30:14'),
	(6, 'Roberto Salas', '32-25546879-0', '2022-09-08 00:00:00', 'Av. Maipú 673', NULL, 1, NULL, NULL, NULL, NULL, '2022-09-08 21:34:00', '2022-09-08 21:34:00'),
	(7, 'Lucas Salas', '30-71472882-9', '2022-09-09 00:00:00', 'Av. Maipú 673', NULL, 3, NULL, NULL, NULL, NULL, '2022-09-09 13:36:21', '2022-09-09 13:36:21');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla persia.cuentas_bancos
CREATE TABLE IF NOT EXISTS `cuentas_bancos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `banco` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_cta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cuenta` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cbu` char(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.cuentas_bancos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentas_bancos` DISABLE KEYS */;
INSERT INTO `cuentas_bancos` (`id`, `banco`, `sucursal`, `tipo_cta`, `nro_cuenta`, `cbu`, `created_at`, `updated_at`) VALUES
	(1, 'Nuevo Banco del Chaco', 'Resistencia', 'Caja de ahorro', '2222222', '22222222', '2022-10-19 12:06:29', '2022-10-19 12:06:29');
/*!40000 ALTER TABLE `cuentas_bancos` ENABLE KEYS */;

-- Volcando estructura para tabla persia.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.data_rows: ~247 rows (aproximadamente)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 0, 0, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
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
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
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
	(65, 13, 'observaciones', 'rich_text_box', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 10),
	(66, 13, 'cond_iva', 'select_dropdown', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{"default":"RI","options":{"RI":"Responsable inscripto","MO":"Monotributo","CF":"Consumidor Final","NR":"No responsable","Exe":"Exento"}}', 11),
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
	(98, 16, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{"display":{"height":"3"}}', 19),
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
	(118, 16, 'nota_pedido_belongsto_empleado_relationship', 'relationship', 'Vendedor 1', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Empleado","table":"empleados","type":"belongsTo","column":"id_vendedor","key":"id","label":"apellidoynombre","pivot_table":"bases","pivot":"0","taggable":"0"}', 16),
	(119, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(120, 18, 'rubro', 'text', 'Rubro', 0, 1, 1, 1, 1, 1, '{}', 2),
	(121, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(122, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(123, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(124, 19, 'rubro_id', 'text', 'Rubro Id', 1, 0, 0, 1, 1, 1, '{}', 2),
	(125, 19, 'descripcion_subrubro', 'text', 'Descripcion Subrubro', 0, 1, 1, 1, 1, 1, '{}', 4),
	(126, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(127, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(128, 19, 'subrubro_belongsto_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Rubro","table":"rubros","type":"belongsTo","column":"rubro_id","key":"id","label":"rubro","pivot_table":"caja_diaria","pivot":"0","taggable":"0"}', 3),
	(129, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(131, 20, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 2),
	(132, 20, 'rubro_id', 'text', 'Rubro Id', 1, 0, 0, 1, 1, 1, '{}', 4),
	(133, 20, 'subrubro_id', 'text', 'Subrubro Id', 1, 0, 0, 1, 1, 1, '{}', 6),
	(134, 20, 'preciovta', 'text', 'Preciovta', 0, 1, 1, 1, 1, 1, '{}', 8),
	(136, 20, 'tasa_iva', 'number', 'Tasa Iva', 0, 1, 1, 1, 1, 1, '{}', 9),
	(137, 20, 'unidad', 'select_dropdown', 'Unidad', 0, 0, 1, 1, 1, 1, '{"default":"m2","options":{"kg":"kg","grs":"gr","m2":"m2","Paquete":"Paquete"}}', 10),
	(140, 20, 'activo', 'select_dropdown', 'Activo', 0, 1, 1, 1, 1, 1, '{"default":"SI","options":{"SI":"SI","NO":"NO"}}', 3),
	(143, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 18),
	(144, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
	(145, 20, 'producto_hasone_rubro_relationship', 'relationship', 'rubros', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Rubro","table":"rubros","type":"belongsTo","column":"rubro_id","key":"id","label":"rubro","pivot_table":"bases","pivot":"0","taggable":"0"}', 5),
	(146, 20, 'producto_belongsto_subrubro_relationship', 'relationship', 'subrubros', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Subrubro","table":"subrubros","type":"belongsTo","column":"subrubro_id","key":"id","label":"descripcion_subrubro","pivot_table":"bases","pivot":"0","taggable":"0"}', 7),
	(147, 16, 'nota_pedido_belongsto_cliente_relationship', 'relationship', 'cliente', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Cliente","table":"clientes","type":"belongsTo","column":"id_cliente","key":"id","label":"nombre","pivot_table":"bases","pivot":"0","taggable":"0"}', 4),
	(148, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(149, 23, 'provincia', 'text', 'Provincia', 1, 1, 1, 1, 1, 1, '{}', 2),
	(150, 23, 'localidad', 'text', 'Localidad', 1, 1, 1, 1, 1, 1, '{}', 3),
	(151, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(152, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(153, 13, 'cliente_belongsto_localidade_relationship', 'relationship', 'localidades', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Localidad","table":"localidades","type":"belongsTo","column":"id_localidad","key":"id","label":"localidad","pivot_table":"bases_listones","pivot":"0","taggable":"0"}', 8),
	(154, 20, 'id_molde', 'text', 'Id Molde', 0, 1, 1, 1, 1, 1, '{}', 11),
	(155, 20, 'manual_procedimiento', 'text_area', 'Manual Procedimiento', 0, 0, 0, 1, 1, 1, '{}', 15),
	(158, 20, 'unidades_mt2', 'text', 'Unidades Mt2', 0, 1, 1, 1, 1, 1, '{}', 13),
	(159, 20, 'paquetes_mt2', 'text', 'Paquetes Mt2', 0, 1, 1, 1, 1, 1, '{}', 14),
	(160, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(161, 24, 'tipo1', 'text', 'Tipo1', 0, 1, 1, 1, 1, 1, '{}', 2),
	(162, 24, 'tipo2', 'text', 'Tipo2', 0, 1, 1, 1, 1, 1, '{}', 3),
	(163, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(164, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(165, 16, 'descuento', 'text', 'Descuento', 0, 1, 1, 1, 1, 1, '{}', 12),
	(166, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(167, 25, 'razonsocial', 'text', 'Razonsocial', 0, 1, 1, 1, 1, 1, '{}', 2),
	(168, 25, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{}', 3),
	(169, 25, 'nombre_comercial', 'text', 'Nombre Comercial', 0, 1, 1, 1, 1, 1, '{}', 4),
	(170, 25, 'web', 'text', 'Web', 0, 1, 1, 1, 1, 1, '{}', 5),
	(171, 25, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 6),
	(172, 25, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{}', 7),
	(173, 25, 'cuit', 'text', 'Cuit', 0, 1, 1, 1, 1, 1, '{}', 8),
	(174, 25, 'cond_iva', 'select_dropdown', 'Cond Iva', 0, 1, 1, 1, 1, 1, '{"default":"RI","options":{"RI":"Responsable inscripto","MO":"Monotributo","CF":"Consumidor Final","NR":"No responsable","Exe":"Exento"}}', 9),
	(175, 25, 'nombre_contacto', 'text', 'Nombre Contacto', 0, 1, 1, 1, 1, 1, '{}', 10),
	(176, 25, 'telefono_contacto', 'text', 'Telefono Contacto', 0, 1, 1, 1, 1, 1, '{}', 11),
	(177, 25, 'observaciones', 'rich_text_box', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 12),
	(178, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 13),
	(179, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
	(180, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(181, 26, 'tipo_factura', 'select_dropdown', 'Tipo Factura', 1, 1, 1, 1, 1, 1, '{"default":"A","options":{"A":"A","B":"B","C":"C","INT":"INT","NCI":"NCI","NDI":"NDI","NCA":"NCA","NCB":"NCB","NCC":"NCC","NDA":"NDA","NDB":"NDB","NDC":"NDC"}}', 3),
	(182, 26, 'pto_venta', 'number', 'Pto Venta', 1, 1, 1, 1, 1, 1, '{}', 4),
	(183, 26, 'nro_factura', 'number', 'Nro Factura', 1, 1, 1, 1, 1, 1, '{}', 5),
	(184, 26, 'id_proveedor', 'text', 'Id Proveedor', 1, 1, 1, 1, 1, 1, '{}', 7),
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
	(208, 26, 'facturas_compra_belongsto_proveedore_relationship', 'relationship', 'Proveedor', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Proveedor","table":"proveedores","type":"belongsTo","column":"id_proveedor","key":"id","label":"razonsocial","pivot_table":"bases","pivot":"0","taggable":"0"}', 8),
	(209, 26, 'facturas_compra_belongsto_tipos_gasto_relationship', 'relationship', 'Tipo gasto', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Tipo_gasto","table":"tipos_gastos","type":"belongsTo","column":"id_tipo_gasto","key":"id","label":"tipo2","pivot_table":"bases","pivot":"0","taggable":"0"}', 10),
	(210, 26, 'facturas_compra_belongsto_jurisdiccione_relationship', 'relationship', 'Jurisdiccion', 0, 0, 0, 0, 0, 0, '{"model":"App\\\\Models\\\\Jurisdiccion","table":"jurisdicciones","type":"belongsTo","column":"id_jurisdiccion","key":"id","label":"provincia","pivot_table":"bases","pivot":"0","taggable":"0"}', 24),
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
	(228, 31, 'modalidad_pago', 'select_dropdown', 'Modalidad Pago', 0, 1, 1, 1, 1, 1, '{"default":"Efectivo","options":{"Efectivo":"Efectivo","Cheque":"Cheque","Transferencia":"Transferencia","Retenciones":"Retenciones"}}', 10),
	(229, 31, 'nro_cheque', 'text', 'Nro Cheque', 0, 0, 1, 1, 1, 1, '{}', 13),
	(230, 31, 'fecha_vto', 'text', 'Fecha Vto', 0, 0, 0, 0, 0, 0, '{}', 14),
	(231, 31, 'id_cuenta_bancaria', 'text', 'Id Cuenta Bancaria', 0, 0, 0, 1, 1, 1, '{}', 11),
	(232, 31, 'detalle', 'text', 'Detalle', 0, 1, 1, 1, 1, 1, '{}', 22),
	(233, 31, 'id_jurisdiccion', 'text', 'Id Jurisdiccion', 0, 0, 0, 0, 0, 0, '{}', 5),
	(234, 31, 'tipo_retencion', 'select_dropdown', 'Tipo Retencion', 0, 0, 0, 1, 1, 1, '{"default":"RENTAS","options":{"RENTAS":"RENTAS","GANANCIAS":"GANANCIAS","SUSS":"SUSS","iVA":"IVA"}}', 15),
	(235, 31, 'tipo_movimiento', 'select_dropdown', 'Tipo Movimiento', 0, 1, 1, 1, 1, 1, '{"default":"Gastos\\/Egresos","options":{"Gastos\\/Egresos":"Gastos\\/Egresos","Cobranza\\/Ingresos":"Cobranza\\/Ingresos","Extracciones":"Extracciones","Deposito bancario":"Deposito bancario","Movimiento entre Usuarios":"Movimiento entre Usuarios","Movimiento entre Bancos":"Movimiento entre Bancos"}}', 2),
	(236, 31, 'importe_egreso', 'text', 'Importe Egreso', 0, 1, 1, 1, 1, 1, '{}', 24),
	(237, 31, 'importe_ingreso', 'text', 'Importe Ingreso', 0, 1, 1, 1, 1, 1, '{}', 23),
	(238, 31, 'id_usuario', 'text', 'Id Usuario', 0, 0, 0, 1, 1, 1, '{}', 26),
	(239, 31, 'id_caja', 'text', 'Id Caja', 0, 1, 1, 1, 1, 1, '{}', 25),
	(240, 31, 'conciliado', 'text', 'Conciliado', 0, 0, 0, 0, 0, 0, '{}', 16),
	(241, 31, 'fecha_real_dep_acred', 'text', 'Fecha Real Dep Acred', 0, 0, 0, 0, 0, 0, '{}', 17),
	(242, 31, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 18),
	(243, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
	(244, 18, 'categoria', 'select_dropdown', 'Categoria', 0, 1, 1, 1, 1, 1, '{"default":"Productos Reventa","options":{"Productos Reventa":"Productos Reventa","Materia Prima":"Materia Prima","Elaboraci\\u00f3n Propia":"Elaboraci\\u00f3n Propia"}}', 3),
	(245, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(246, 36, 'fecha_orden', 'date', 'Fecha Orden', 0, 1, 1, 1, 1, 1, '{}', 3),
	(247, 36, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, '{}', 7),
	(248, 36, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{"default":"Pendiente","options":{"Pendiente":"Pendiente","En Proceso":"En Proceso","Terminado":"Terminado","Empaquetado y controlado":"Empaquetado y controlado","Entregado":"Entregado"}}', 8),
	(249, 36, 'fecha_entrada_proceso', 'date', 'Fecha Entrada Proceso', 0, 1, 1, 1, 1, 1, '{}', 9),
	(250, 36, 'fecha_salida_proceso', 'date', 'Fecha Salida Proceso', 0, 1, 1, 1, 1, 1, '{}', 10),
	(251, 36, 'id_producto', 'text', 'Id Producto', 0, 0, 0, 1, 1, 1, '{}', 4),
	(252, 36, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 6),
	(254, 36, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 11),
	(255, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
	(256, 16, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{"default":"Pendiente Aprobacion","options":{"Rechazado":"Rechazado","Pendiente Aprobacion":"Pendiente Aprobacion","Pendiente Entrega":"Pendiente Entrega","Entregado":"Entregado"}}', 10),
	(257, 36, 'ordenes_fabricacion_belongsto_producto_relationship', 'relationship', 'productos', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Producto","table":"productos","type":"belongsTo","column":"id_producto","key":"id","label":"descripcion","pivot_table":"bases","pivot":"0","taggable":"0"}', 5),
	(260, 20, 'precio_compra', 'text', 'Precio Compra', 0, 1, 1, 1, 1, 1, '{}', 16),
	(261, 20, 'unidad_compra', 'text', 'Unidad Compra', 0, 1, 1, 1, 1, 1, '{}', 17),
	(266, 20, 'id_base', 'text', 'Id Base', 0, 1, 1, 1, 1, 1, '{}', 12),
	(267, 44, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(268, 44, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 2),
	(269, 44, 'cant_moldes', 'number', 'Cant Moldes', 0, 1, 1, 1, 1, 1, '{}', 3),
	(270, 44, 'mt2_por_molde', 'number', 'Mt2 Por Molde', 0, 1, 1, 1, 1, 1, '{}', 4),
	(271, 44, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(272, 44, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(273, 20, 'producto_belongsto_molde_relationship', 'relationship', 'moldes', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Molde","table":"moldes","type":"belongsTo","column":"id_molde","key":"id","label":"descripcion","pivot_table":"bases","pivot":"0","taggable":"0"}', 20),
	(274, 26, 'forma_pago', 'select_dropdown', 'Forma Pago', 0, 1, 1, 1, 1, 1, '{"default":"Contado","options":{"Contado":"Contado","Cta Cte":"Cta Cte"}}', 25),
	(275, 26, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{"default":"Pendiente","options":{"Cancelado":"Cancelado","Pendiente":"Pendiente"}}', 26),
	(276, 16, 'estado_pago', 'select_dropdown', 'Estado Pago', 0, 1, 1, 1, 1, 1, '{"default":"Pendiente","options":{"Pendiente":"Pendiente","Cancelado":"Cancelado"}}', 11),
	(277, 16, 'id_vendedor_2', 'text', 'Id Vendedor 2', 0, 0, 0, 0, 0, 1, '{}', 17),
	(278, 16, 'tipo_presupuesto', 'select_dropdown', 'Tipo Presupuesto', 0, 1, 1, 1, 1, 1, '{"default":"Productos","options":{"Productos":"Productos","Muebles":"Muebles","Obras":"Obras"}}', 2),
	(279, 16, 'nota_pedido_belongsto_empleado_relationship_1', 'relationship', 'Vendedor 2', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Empleado","table":"empleados","type":"belongsTo","column":"id_vendedor_2","key":"id","label":"apellidoynombre","pivot_table":"bases","pivot":"0","taggable":"0"}', 18),
	(280, 31, 'mov_financiero_belongsto_empleado_relationship', 'relationship', 'Operador', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Empleado","table":"empleados","type":"belongsTo","column":"id_usuario","key":"id","label":"apellidoynombre","pivot_table":"bases","pivot":"0","taggable":"0"}', 27),
	(281, 36, 'id_pedido', 'text', 'Id Pedido', 0, 1, 1, 1, 1, 1, '{}', 3),
	(282, 46, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(283, 46, 'Forma_pago_Muebles', 'text_area', 'Forma Pago Muebles', 0, 1, 1, 1, 1, 1, '{}', 2),
	(284, 46, 'Forma_pago_Obras', 'text_area', 'Forma Pago Obras', 0, 1, 1, 1, 1, 1, '{}', 3),
	(285, 46, 'Forma_pago_Productos', 'text_area', 'Forma Pago Productos', 0, 1, 1, 1, 1, 1, '{}', 4),
	(286, 46, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(287, 46, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(288, 31, 'id_tipo_gasto', 'text', 'Id Tipo Gasto', 0, 0, 0, 1, 1, 1, '{}', 20),
	(289, 31, 'mov_financiero_belongsto_tipos_gasto_relationship', 'relationship', 'Tipo gasto', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\tipo_gasto","table":"tipos_gastos","type":"belongsTo","column":"id_tipo_gasto","key":"id","label":"tipo2","pivot_table":"bases","pivot":"0","taggable":"0"}', 21),
	(290, 31, 'mov_financiero_belongsto_cuentas_banco_relationship', 'relationship', 'Cuenta banco', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Cuentas_Banco","table":"cuentas_bancos","type":"belongsTo","column":"id_cuenta_bancaria","key":"id","label":"banco","pivot_table":"bases","pivot":"0","taggable":"0"}', 12),
	(291, 48, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(292, 48, 'banco', 'text', 'Banco', 0, 1, 1, 1, 1, 1, '{}', 2),
	(293, 48, 'sucursal', 'text', 'Sucursal', 0, 1, 1, 1, 1, 1, '{}', 3),
	(294, 48, 'tipo_cta', 'text', 'Tipo Cta', 0, 1, 1, 1, 1, 1, '{}', 4),
	(295, 48, 'nro_cuenta', 'text', 'Nro Cuenta', 0, 1, 1, 1, 1, 1, '{}', 5),
	(296, 48, 'cbu', 'text', 'Cbu', 0, 1, 1, 1, 1, 1, '{}', 6),
	(297, 48, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(298, 48, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Volcando estructura para tabla persia.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.data_types: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2022-01-08 22:12:38', '2022-02-18 14:26:30'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(13, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Models\\Cliente', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-11 20:35:14', '2022-02-11 21:13:19'),
	(16, 'nota_pedidos', 'nota-pedidos', 'Nota Pedido', 'Nota Pedidos', NULL, 'App\\Models\\nota_pedido', NULL, 'App\\Http\\Controllers\\Voyager\\PedidosController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-12 22:34:43', '2022-09-20 13:40:09'),
	(17, 'empleados', 'empleados', 'Empleado', 'Empleados', NULL, 'App\\Models\\Empleado', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-12 22:40:47', '2022-02-09 23:15:28'),
	(18, 'rubros', 'rubros', 'Rubro', 'Rubros', NULL, 'App\\Models\\Rubro', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-15 21:04:32', '2022-05-06 13:23:49'),
	(19, 'subrubros', 'subrubros', 'Subrubro', 'Subrubros', NULL, 'App\\Models\\Subrubro', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-15 21:05:02', '2022-01-18 12:39:51'),
	(20, 'productos', 'productos', 'Producto', 'Productos', NULL, 'App\\Models\\Producto', NULL, 'App\\Http\\Controllers\\Voyager\\ProductosController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-01-18 11:30:46', '2022-09-20 13:34:40'),
	(23, 'localidades', 'localidades', 'Localidade', 'Localidades', NULL, 'App\\Models\\Localidad', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(24, 'tipos_gastos', 'tipos-gastos', 'Tipos Gasto', 'Tipos Gastos', NULL, 'App\\Models\\Tipo_gasto', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-07 21:36:04', '2022-02-16 15:08:45'),
	(25, 'proveedores', 'proveedores', 'Proveedore', 'Proveedores', NULL, 'App\\Models\\Proveedor', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-11 21:13:49', '2022-02-11 21:14:56'),
	(26, 'facturas_compras', 'facturas-compras', 'Facturas Compra', 'Facturas Compras', NULL, 'App\\Models\\Factura_Compra', NULL, 'App\\Http\\Controllers\\Voyager\\facturas_comprasController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-11 21:17:00', '2022-10-18 21:56:47'),
	(30, 'jurisdicciones', 'jurisdicciones', 'Jurisdiccion', 'Jurisdicciones', NULL, 'App\\Models\\Jurisdiccion', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-11 21:45:00', '2022-09-09 23:15:32'),
	(31, 'mov_financieros', 'movimientos_financieros', 'Mov Financiero', 'Mov Financieros', NULL, 'App\\Models\\MovFinanciero', NULL, 'App\\Http\\Controllers\\Voyager\\MovFinancieroController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-16 22:14:52', '2022-11-04 19:57:12'),
	(36, 'ordenes_fabricacion', 'ordenes_fabricacion', 'Ordenes Fabricacion', 'Ordenes Fabricacion', NULL, 'App\\Models\\OrdenesFabricacion', NULL, 'App\\Http\\Controllers\\Voyager\\OrdenesFabricController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-05-30 20:47:34', '2022-09-23 14:55:09'),
	(44, 'moldes', 'moldes', 'Molde', 'Moldes', NULL, 'App\\Models\\Molde', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(46, 'formaspago', 'formaspago', 'Formaspago', 'Formaspagos', NULL, 'App\\Models\\Formaspago', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-09-09 23:27:30', '2022-09-09 23:28:19'),
	(48, 'cuentas_bancos', 'cuentas-bancos', 'Cuentas Banco', 'Cuentas Bancos', NULL, 'App\\Models\\Cuentas_Banco', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2022-10-19 12:05:46', '2022-10-19 12:05:46');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Volcando estructura para tabla persia.detalles_facturas_compras
CREATE TABLE IF NOT EXISTS `detalles_facturas_compras` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_factura_compra` bigint(20) unsigned NOT NULL,
  `id_producto` bigint(20) unsigned NOT NULL,
  `cantidad` decimal(12,2) DEFAULT NULL,
  `precio_c` decimal(15,8) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_linea` decimal(12,3) DEFAULT NULL,
  `unidad` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalles_facturas_compras_id_factura_compra_index` (`id_factura_compra`),
  KEY `detalles_facturas_compras_id_producto_index` (`id_producto`),
  CONSTRAINT `detalles_facturas_compras_id_factura_compra_foreign` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturas_compras` (`id`),
  CONSTRAINT `detalles_facturas_compras_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.detalles_facturas_compras: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `detalles_facturas_compras` DISABLE KEYS */;
INSERT INTO `detalles_facturas_compras` (`id`, `id_factura_compra`, `id_producto`, `cantidad`, `precio_c`, `descuento`, `total_linea`, `unidad`, `created_at`, `updated_at`) VALUES
	(4, 2, 1, 2.00, NULL, NULL, 2400.000, NULL, '2022-02-16 14:17:27', '2022-02-16 14:17:27');
/*!40000 ALTER TABLE `detalles_facturas_compras` ENABLE KEYS */;

-- Volcando estructura para tabla persia.dosificaciones
CREATE TABLE IF NOT EXISTS `dosificaciones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) unsigned DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_insumo_producto` bigint(20) unsigned DEFAULT NULL,
  `cant_unid_produc` decimal(12,5) DEFAULT NULL,
  `unidad_consumo_produccion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `base_liston` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.dosificaciones: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `dosificaciones` DISABLE KEYS */;
INSERT INTO `dosificaciones` (`id`, `id_producto`, `color`, `id_insumo_producto`, `cant_unid_produc`, `unidad_consumo_produccion`, `created_at`, `updated_at`, `base_liston`) VALUES
	(11, 1, 'azul claro', 9, 10.00000, 'kg', '2022-08-09 19:59:11', '2022-08-09 19:59:11', NULL),
	(12, 1, 'azul claro', 7, 1.00000, 'kg', '2022-08-09 19:59:11', '2022-08-09 19:59:11', NULL),
	(45, 17, 'Rojo', 6, 1.00000, 'gr', '2022-09-27 14:07:40', '2022-09-27 14:07:40', 'Base'),
	(46, 17, '', 7, 1.00000, 'balde', '2022-09-27 14:07:40', '2022-09-27 14:07:40', 'Base'),
	(51, 3, 'beige', 7, 2.00000, 'kg', '2022-11-09 11:58:24', '2022-11-09 11:58:24', 'Base'),
	(52, 3, 'beige', 9, 10.00000, 'gr', '2022-11-09 11:58:24', '2022-11-09 11:58:24', 'Liston');
/*!40000 ALTER TABLE `dosificaciones` ENABLE KEYS */;

-- Volcando estructura para tabla persia.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.empleados: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`id`, `apellidoynombre`, `cuil`, `dni`, `fecha_ingreso`, `categoria`, `estado`, `fecha_nacimiento`, `estadocivil`, `domicilio`, `telefonos`, `observaciones`, `created_at`, `updated_at`) VALUES
	(1, 'Pedro Fuentes', '23-43524214-9', '43524214', '2022-08-24 00:00:00', 'Operario Fabrica', 'Activo', '1980-11-25 00:00:00', 'soltero', 'por ahi 2222', '3625425852', NULL, '2022-02-09 23:13:00', '2022-09-27 12:40:00'),
	(2, 'Laura', NULL, NULL, NULL, 'Vendedora', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-09 23:13:00', '2022-02-09 23:13:00'),
	(3, 'Ivana', NULL, NULL, NULL, 'Vendedora', 'Alta', NULL, 'casado', NULL, NULL, NULL, '2022-02-09 23:14:00', '2022-02-09 23:14:00');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;

-- Volcando estructura para tabla persia.empresas
CREATE TABLE IF NOT EXISTS `empresas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.empresas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;

-- Volcando estructura para tabla persia.facturas_compras
CREATE TABLE IF NOT EXISTS `facturas_compras` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_proveedor` bigint(20) unsigned NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_gasto` bigint(20) unsigned DEFAULT NULL,
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
  `total_factura` decimal(19,3) DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `remito_pto_vta` smallint(6) DEFAULT NULL,
  `remito_nro` int(11) DEFAULT NULL,
  `id_jurisdiccion` bigint(20) unsigned DEFAULT NULL,
  `nro_factura_ref` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forma_pago` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_pago` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_compras_id_tipo_gasto_foreign` (`id_tipo_gasto`),
  KEY `facturas_compras_id_jurisdiccion_foreign` (`id_jurisdiccion`),
  KEY `facturas_compras_id_proveedor_foreign` (`id_proveedor`),
  CONSTRAINT `facturas_compras_id_jurisdiccion_foreign` FOREIGN KEY (`id_jurisdiccion`) REFERENCES `jurisdicciones` (`id`),
  CONSTRAINT `facturas_compras_id_proveedor_foreign` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `facturas_compras_id_tipo_gasto_foreign` FOREIGN KEY (`id_tipo_gasto`) REFERENCES `tipos_gastos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.facturas_compras: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas_compras` DISABLE KEYS */;
INSERT INTO `facturas_compras` (`id`, `tipo_factura`, `pto_venta`, `nro_factura`, `id_proveedor`, `fecha`, `observaciones`, `id_tipo_gasto`, `fecha_carga`, `subtotal`, `exento`, `iva_10_5`, `iva_21`, `iva_27`, `iva`, `monto_perc_iibb`, `monto_percepcion_iva`, `monto_percep_ganancias`, `otros_impuestos`, `total_impuestos`, `total_factura`, `fecha_vencimiento`, `remito_pto_vta`, `remito_nro`, `id_jurisdiccion`, `nro_factura_ref`, `created_at`, `updated_at`, `forma_pago`, `estado_pago`) VALUES
	(2, 'A', 1, 111, 1, '2022-02-11 00:00:00', NULL, 12, '2022-02-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-02-11 21:34:00', '2022-02-16 14:17:27', NULL, NULL),
	(4, 'A', 1, 222, 1, '2022-02-15 00:00:00', 'ninguna', 3, '2022-02-15 00:00:00', NULL, NULL, NULL, 21.000, NULL, 21.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-02-15 12:47:50', '2022-02-15 12:47:50', NULL, NULL),
	(5, 'A', 1, 333, 2, '2022-02-15 00:00:00', NULL, 5, '2022-02-15 00:00:00', 1000.000, NULL, NULL, 210.000, NULL, 210.000, NULL, NULL, NULL, NULL, NULL, 1121.000, NULL, NULL, NULL, 2, NULL, '2022-02-15 15:05:40', '2022-02-15 15:05:40', NULL, NULL),
	(7, 'A', 1, 444, 2, '2022-02-15 00:00:00', 'ninguna', NULL, '2022-02-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, '2022-02-15 15:22:00', '2022-10-18 21:28:04', 'Contado', 'Pendiente');
/*!40000 ALTER TABLE `facturas_compras` ENABLE KEYS */;

-- Volcando estructura para tabla persia.facturas_ventas
CREATE TABLE IF NOT EXISTS `facturas_ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_factura` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pto_venta` int(11) NOT NULL,
  `nro_factura` int(11) NOT NULL,
  `id_cliente` bigint(20) unsigned DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Factura_Venta_Clientes` (`id_cliente`),
  CONSTRAINT `facturas_ventas_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.facturas_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla persia.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla persia.formaspago
CREATE TABLE IF NOT EXISTS `formaspago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Forma_pago_Muebles` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Forma_pago_Obras` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Forma_pago_Productos` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.formaspago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `formaspago` DISABLE KEYS */;
INSERT INTO `formaspago` (`id`, `Forma_pago_Muebles`, `Forma_pago_Obras`, `Forma_pago_Productos`, `created_at`, `updated_at`) VALUES
	(1, 'muebles', 'forma pago Obras - aceptamos todas las tarjetas', '• NO INCLUYE FLETE  •El pago puede ser por transferencia bancaria o efectivo.    •El pago con cheque diferido puede ser 0-15 -30-60 –tiene recargo (30 días 3% y 60 días 5%).    •El pago con tarjetas-maestro-Mastercard-visa y cabal-Tienen un 20% de recargo.    •El pago con tarjeta Pymes Nación tiene un recargo del 2%    •Formas de pago con tarjeta Tuya, en 6 cuotas, 7 %. En 12 cuotas 17 % de recargo.', NULL, NULL);
/*!40000 ALTER TABLE `formaspago` ENABLE KEYS */;

-- Volcando estructura para tabla persia.jurisdicciones
CREATE TABLE IF NOT EXISTS `jurisdicciones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `provincia` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.jurisdicciones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `jurisdicciones` DISABLE KEYS */;
INSERT INTO `jurisdicciones` (`id`, `codigo`, `provincia`, `created_at`, `updated_at`) VALUES
	(1, 903, 'Chaco', '2022-02-11 18:45:00', '2022-02-11 21:45:57'),
	(2, 901, 'Capital Federal', '2022-02-11 21:46:15', '2022-02-11 21:46:15'),
	(3, 907, 'Corrientes', '2022-02-11 21:46:26', '2022-02-11 21:46:26');
/*!40000 ALTER TABLE `jurisdicciones` ENABLE KEYS */;

-- Volcando estructura para tabla persia.localidades
CREATE TABLE IF NOT EXISTS `localidades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `provincia` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.localidades: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` (`id`, `provincia`, `localidad`, `created_at`, `updated_at`) VALUES
	(1, 'Corrientes', 'Bella Vista', '2022-02-07 21:21:07', '2022-02-07 21:21:07'),
	(2, 'Corrientes', 'Corrientes', '2022-02-07 21:21:21', '2022-02-07 21:21:21'),
	(3, 'Chaco', 'Resistencia', '2022-02-07 21:21:29', '2022-02-07 21:21:29'),
	(4, 'Chaco', 'Saenz Peña', '2022-02-07 21:21:42', '2022-02-07 21:21:42');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;

-- Volcando estructura para tabla persia.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.menus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2022-01-08 22:12:38', '2022-01-08 22:12:38');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla persia.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.menu_items: ~41 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-01-08 22:12:38', '2022-01-08 22:12:38', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 2, '2022-01-08 22:12:38', '2022-03-15 13:02:36', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 34, 1, '2022-01-08 22:12:38', '2022-03-15 13:11:59', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', 34, 2, '2022-01-08 22:12:38', '2022-05-30 20:17:48', 'voyager.roles.index', 'null'),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2022-01-08 22:12:38', '2022-03-15 13:11:39', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-01-08 22:12:38', '2022-03-15 13:02:36', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-01-08 22:12:38', '2022-03-15 13:02:36', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-01-08 22:12:38', '2022-03-15 13:02:36', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-01-08 22:12:38', '2022-03-15 13:11:45', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2022-01-08 22:12:38', '2022-03-15 13:11:39', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2022-01-08 22:12:38', '2022-03-15 13:11:39', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 3, '2022-01-08 22:12:38', '2022-03-15 13:11:39', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 4, '2022-01-08 22:12:38', '2022-03-15 13:11:39', 'voyager.pages.index', NULL),
	(17, 1, 'Clientes', '', '_self', NULL, '#000000', 31, 1, '2022-01-11 20:35:14', '2022-03-15 13:22:04', 'voyager.clientes.index', 'null'),
	(19, 1, 'Nota Pedidos', '', '_self', NULL, '#000000', 31, 2, '2022-01-12 22:34:43', '2022-03-15 13:21:47', 'voyager.nota-pedidos.index', 'null'),
	(20, 1, 'Empleados', '', '_self', NULL, NULL, 33, 1, '2022-01-12 22:40:47', '2022-03-15 13:10:02', 'voyager.empleados.index', NULL),
	(21, 1, 'Rubros', '', '_self', NULL, NULL, 33, 2, '2022-01-15 21:04:32', '2022-03-15 13:10:05', 'voyager.rubros.index', NULL),
	(22, 1, 'Subrubros', '', '_self', NULL, NULL, 33, 3, '2022-01-15 21:05:02', '2022-03-15 13:10:08', 'voyager.subrubros.index', NULL),
	(23, 1, 'Productos', '', '_self', NULL, '#000000', 33, 5, '2022-01-18 11:30:46', '2022-08-10 22:25:30', 'voyager.productos.index', 'null'),
	(24, 1, 'Localidades', '', '_self', NULL, NULL, 33, 6, '2022-02-07 21:20:36', '2022-08-10 22:25:30', 'voyager.localidades.index', NULL),
	(25, 1, 'Tipos Gastos', '', '_self', NULL, NULL, 32, 2, '2022-02-07 21:36:04', '2022-03-15 13:09:46', 'voyager.tipos-gastos.index', NULL),
	(26, 1, 'Proveedores', '', '_self', NULL, NULL, 32, 1, '2022-02-11 21:13:49', '2022-03-15 13:09:41', 'voyager.proveedores.index', NULL),
	(27, 1, 'Facturas Compras', '', '_self', NULL, '#000000', 32, 3, '2022-02-11 21:17:00', '2022-04-18 13:21:26', 'voyager.facturas-compras.index', 'null'),
	(28, 1, 'Jurisdicciones', '', '_self', NULL, NULL, 33, 8, '2022-02-11 21:45:00', '2022-09-09 23:13:49', 'voyager.jurisdicciones.index', NULL),
	(29, 1, 'Mov Financieros', '', '_self', NULL, '#000000', 36, 1, '2022-02-16 22:14:52', '2022-10-25 14:31:38', 'voyager.movimientos_financieros.index', 'null'),
	(30, 1, 'Iva Compras', '/IVAcompras', '_self', NULL, '#000000', 35, 1, '2022-03-15 13:04:14', '2022-03-25 15:08:18', NULL, ''),
	(31, 1, 'VENTAS', '', '_self', NULL, '#000000', NULL, 9, '2022-03-15 13:08:00', '2022-08-10 22:25:30', NULL, ''),
	(32, 1, 'COMPRAS', '', '_self', NULL, '#000000', NULL, 10, '2022-03-15 13:08:27', '2022-09-09 23:13:49', NULL, ''),
	(33, 1, 'TABLAS BASICAS', '', '_self', NULL, '#000000', NULL, 8, '2022-03-15 13:08:56', '2022-04-13 20:20:38', NULL, ''),
	(34, 1, 'PERMISOS', '', '_self', NULL, '#000000', NULL, 13, '2022-03-15 13:09:06', '2022-09-09 23:13:49', NULL, ''),
	(35, 1, 'INFORMES', '', '_self', NULL, '#000000', NULL, 14, '2022-03-15 13:10:53', '2022-09-09 23:13:49', NULL, ''),
	(36, 1, 'TESORERIA', '', '_self', NULL, '#000000', NULL, 11, '2022-03-15 13:11:31', '2022-09-09 23:13:49', NULL, ''),
	(37, 1, 'IVA Ventas', '/IVAventas', '_self', NULL, '#000000', 35, 2, '2022-03-15 22:10:07', '2022-03-17 18:04:36', NULL, ''),
	(39, 1, 'Informe de Ventas', '/Informeventas', '_self', NULL, '#000000', 35, 4, '2022-03-25 15:57:20', '2022-03-28 22:38:32', NULL, ''),
	(40, 1, 'Informes de Movimientos Financieros', '/Informetesoreria', '_self', NULL, '#000000', 35, 5, '2022-03-25 22:40:53', '2022-03-28 22:38:28', NULL, ''),
	(41, 1, 'Informe Compras', '/Informecompras', '_self', NULL, '#000000', 35, 3, '2022-03-28 22:27:30', '2022-03-28 22:38:32', NULL, ''),
	(42, 1, 'Productos', '/informe_productos', '_self', NULL, '#000000', 35, 6, '2022-04-04 19:59:12', '2022-04-19 14:39:41', NULL, ''),
	(43, 1, 'PRODUCCION', '', '_self', NULL, '#000000', NULL, 12, '2022-05-30 13:16:17', '2022-09-09 23:13:49', NULL, ''),
	(44, 1, 'Ordenes de Fabricacion', '', '_self', NULL, '#000000', 43, 1, '2022-05-30 20:17:32', '2022-06-01 15:05:22', 'voyager.ordenes_fabricacion.index', 'null'),
	(46, 1, 'Moldes', '', '_self', NULL, NULL, 33, 4, '2022-08-10 19:52:51', '2022-08-10 22:25:30', 'voyager.moldes.index', NULL),
	(48, 1, 'Formaspagos', '', '_self', NULL, NULL, NULL, 15, '2022-09-09 23:27:30', '2022-09-09 23:27:30', 'voyager.formaspago.index', NULL),
	(49, 1, 'Cuentas Bancos', '', '_self', NULL, NULL, NULL, 16, '2022-10-19 12:05:46', '2022-10-19 12:05:46', 'voyager.cuentas-bancos.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Volcando estructura para tabla persia.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.migrations: ~51 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla persia.moldes
CREATE TABLE IF NOT EXISTS `moldes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cant_moldes` int(11) DEFAULT NULL,
  `mt2_por_molde` decimal(12,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.moldes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `moldes` DISABLE KEYS */;
INSERT INTO `moldes` (`id`, `descripcion`, `cant_moldes`, `mt2_por_molde`, `created_at`, `updated_at`) VALUES
	(1, 'Moldes para pisos tipo adoquines', 1, 1.000, '2022-02-12 18:13:06', '2022-08-11 13:58:37'),
	(2, 'Moldes para placas de revestimiento', 1, 1.000, '2022-08-11 21:59:51', '2022-08-22 14:44:32');
/*!40000 ALTER TABLE `moldes` ENABLE KEYS */;

-- Volcando estructura para tabla persia.mov_financieros
CREATE TABLE IF NOT EXISTS `mov_financieros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `pto_vta` int(11) DEFAULT NULL,
  `nro_recibo` int(11) DEFAULT NULL,
  `nro_op` int(11) DEFAULT NULL,
  `id_nota_pedido` bigint(20) unsigned DEFAULT NULL,
  `id_factura_compra` bigint(20) unsigned DEFAULT NULL,
  `modalidad_pago` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_cheque` int(11) DEFAULT NULL,
  `fecha_vto` datetime DEFAULT NULL,
  `id_cuenta_bancaria` bigint(20) unsigned DEFAULT NULL,
  `detalle` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jurisdiccion` bigint(20) unsigned DEFAULT NULL,
  `tipo_retencion` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_movimiento` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importe_egreso` decimal(11,2) DEFAULT NULL,
  `importe_ingreso` decimal(11,2) DEFAULT NULL,
  `id_usuario` tinyint(4) DEFAULT NULL,
  `id_caja` bigint(20) unsigned DEFAULT NULL,
  `conciliado` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_real_dep_acred` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_tipo_gasto` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mov_financieros_id_cuenta_bancaria_foreign` (`id_cuenta_bancaria`),
  KEY `mov_financieros_id_jurisdiccion_foreign` (`id_jurisdiccion`),
  KEY `mov_financieros_id_caja_foreign` (`id_caja`),
  KEY `mov_financieros_id_factura_compra_foreign` (`id_factura_compra`),
  KEY `mov_financieros_id_nota_pedido_foreign` (`id_nota_pedido`),
  CONSTRAINT `mov_financieros_id_caja_foreign` FOREIGN KEY (`id_caja`) REFERENCES `cajas_diarias` (`id`),
  CONSTRAINT `mov_financieros_id_cuenta_bancaria_foreign` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `cuentas_bancos` (`id`),
  CONSTRAINT `mov_financieros_id_factura_compra_foreign` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturas_compras` (`id`),
  CONSTRAINT `mov_financieros_id_jurisdiccion_foreign` FOREIGN KEY (`id_jurisdiccion`) REFERENCES `jurisdicciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.mov_financieros: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `mov_financieros` DISABLE KEYS */;
INSERT INTO `mov_financieros` (`id`, `fecha`, `pto_vta`, `nro_recibo`, `nro_op`, `id_nota_pedido`, `id_factura_compra`, `modalidad_pago`, `nro_cheque`, `fecha_vto`, `id_cuenta_bancaria`, `detalle`, `id_jurisdiccion`, `tipo_retencion`, `tipo_movimiento`, `importe_egreso`, `importe_ingreso`, `id_usuario`, `id_caja`, `conciliado`, `fecha_real_dep_acred`, `created_at`, `updated_at`, `id_tipo_gasto`) VALUES
	(1, '2022-09-08 00:00:00', 0, 0, 1, 3, NULL, 'Efectivo', NULL, NULL, 1, 'Alquiler fabrica', NULL, 'RENTAS', 'Cobranza/Ingresos', NULL, 0.00, 2, NULL, NULL, NULL, '2022-03-18 12:31:15', '2022-11-04 23:00:03', NULL),
	(2, '2022-09-08 00:00:00', 1, 111, NULL, 3, NULL, 'Efectivo', NULL, NULL, 1, 'Cobranza Anticipo', NULL, NULL, 'Cobranza/Ingresos', 50000.00, 0.00, 2, NULL, NULL, NULL, '2022-03-18 12:31:15', '2022-10-19 12:06:50', 0),
	(3, '2022-09-08 00:00:00', 1, 111, NULL, 4, NULL, 'Efectivo', NULL, NULL, 1, 'Cobranza Saldo', NULL, NULL, 'Cobranza/Ingresos', 55000.00, 0.00, 2, NULL, NULL, NULL, '2022-03-18 12:31:15', '2022-10-19 12:06:50', 0),
	(4, '2022-09-08 00:00:00', 0, 0, NULL, 3, NULL, 'Efectivo', NULL, NULL, 1, 'para disponible en caja', NULL, 'RENTAS', 'Extracciones', 100000.00, 100000.00, 2, NULL, NULL, NULL, '2022-03-18 12:31:15', '2022-11-04 20:25:57', NULL),
	(5, '2022-11-02 00:00:00', NULL, NULL, NULL, NULL, NULL, 'Cheque', 9999, NULL, 1, 'Alquiler fabrica', NULL, NULL, 'Gastos/Egresos', 25000.00, NULL, 2, NULL, NULL, NULL, '2022-11-02 23:41:28', '2022-11-02 23:41:28', 3),
	(7, '2022-11-04 00:00:00', NULL, NULL, NULL, 0, NULL, 'Efectivo', 9999, NULL, NULL, 'Alquiler fabrica', NULL, 'RENTAS', 'Gastos/Egresos', 25000.00, NULL, 1, NULL, NULL, NULL, '2022-11-03 00:06:01', '2022-11-04 22:59:33', 1),
	(8, '2022-11-02 00:00:00', NULL, NULL, NULL, NULL, NULL, 'Cheque', 121212, NULL, NULL, 'Alquiler fabrica', NULL, NULL, 'Gastos/Egresos', 25000.00, NULL, 1, 1, NULL, NULL, '2022-11-03 00:08:22', '2022-11-03 00:08:22', 1),
	(9, '2022-11-02 00:00:00', NULL, NULL, NULL, NULL, NULL, 'Efectivo', 9999, NULL, NULL, 'Cobranza Clientes', NULL, 'RENTAS', 'Extracciones', 150000.00, 150000.00, 1, NULL, NULL, NULL, '2022-11-03 00:43:24', '2022-11-04 22:57:31', NULL),
	(10, '2022-11-02 00:00:00', NULL, NULL, NULL, 4, NULL, 'Cheque', 9999, NULL, NULL, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 25000.00, NULL, 1, 1, NULL, NULL, '2022-11-03 01:00:38', '2022-11-03 01:00:38', 1),
	(11, '2022-11-03 00:00:00', NULL, NULL, NULL, 3, NULL, 'Cheque', 9999, NULL, NULL, 'Nenecha', NULL, NULL, 'Cobranza/Ingresos', 25000.00, NULL, 1, 1, NULL, NULL, '2022-11-03 01:02:35', '2022-11-03 01:02:35', 1),
	(12, '2022-11-03 00:00:00', NULL, NULL, NULL, 4, NULL, 'Efectivo', 9999, NULL, 1, 'La historia sin final', NULL, NULL, 'Cobranza/Ingresos', 25000.00, NULL, 1, 1, NULL, NULL, '2022-11-03 01:10:50', '2022-11-03 01:10:50', 1),
	(13, '2022-11-03 00:00:00', NULL, NULL, NULL, 3, NULL, 'Efectivo', 9999, NULL, 1, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 555555.00, NULL, 1, 1, NULL, NULL, '2022-11-03 14:04:41', '2022-11-03 14:04:41', 1),
	(14, '2022-11-26 00:00:00', NULL, NULL, NULL, 3, NULL, 'Cheque', 9999, NULL, 1, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 7777.00, NULL, 1, 1, NULL, NULL, '2022-11-03 14:10:12', '2022-11-03 14:10:12', 1),
	(15, '2022-11-26 00:00:00', NULL, NULL, NULL, 3, NULL, 'Cheque', 9999, NULL, 1, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 7777.00, NULL, 1, 1, NULL, NULL, '2022-11-03 14:10:28', '2022-11-03 14:10:28', 1),
	(16, NULL, NULL, NULL, NULL, 3, NULL, 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, 'Cobranza/Ingresos', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-03 14:10:36', '2022-11-03 14:10:36', NULL),
	(17, '2022-11-30 00:00:00', NULL, NULL, NULL, 3, NULL, 'Cheque', 9999, NULL, 1, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 9999.00, NULL, 1, 1, NULL, NULL, '2022-11-03 14:16:25', '2022-11-03 14:16:25', 1),
	(18, '2022-11-30 00:00:00', NULL, NULL, NULL, 3, NULL, 'Cheque', 9999, NULL, 1, 'Patito', NULL, NULL, 'Cobranza/Ingresos', 9999.00, NULL, 1, 1, NULL, NULL, '2022-11-03 14:16:39', '2022-11-03 14:16:39', 1),
	(19, '2022-11-10 00:00:00', NULL, NULL, NULL, 3, NULL, 'Efectivo', 9999, NULL, 1, NULL, NULL, NULL, 'Cobranza/Ingresos', 9999.00, NULL, 1, NULL, NULL, NULL, '2022-11-03 14:18:09', '2022-11-03 14:18:09', 1),
	(20, '2022-11-10 00:00:00', NULL, NULL, NULL, 3, NULL, 'Efectivo', 9999, NULL, 1, 'Cobranza Clientes', NULL, 'RENTAS', 'Cobranza/Ingresos', NULL, 7777.00, 1, NULL, NULL, NULL, '2022-11-03 14:21:33', '2022-11-04 20:24:41', NULL),
	(30, '2022-11-04 00:00:00', 10, 111, NULL, 4, NULL, 'Efectivo', NULL, NULL, NULL, NULL, NULL, 'RENTAS', 'Cobranza/Ingresos', NULL, 15000.00, NULL, NULL, NULL, NULL, '2022-11-04 23:09:06', '2022-11-04 23:09:06', NULL);
/*!40000 ALTER TABLE `mov_financieros` ENABLE KEYS */;

-- Volcando estructura para tabla persia.nota_pedidos
CREATE TABLE IF NOT EXISTS `nota_pedidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `id_cliente` bigint(20) unsigned DEFAULT NULL,
  `totalgravado` decimal(12,2) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `monto_iva` decimal(9,2) NOT NULL DEFAULT 0.00,
  `id_vendedor` bigint(20) unsigned DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `descuento` decimal(13,2) DEFAULT NULL,
  `observaciones` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_pago` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_vendedor_2` bigint(20) DEFAULT NULL,
  `tipo_presupuesto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Nota_Pedido_Clientes` (`id_cliente`),
  KEY `FK_vendedor` (`id_vendedor`),
  CONSTRAINT `nota_pedidos_id_cliente_foreign` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `nota_pedidos_id_vendedor_foreign` FOREIGN KEY (`id_vendedor`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.nota_pedidos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_pedidos` DISABLE KEYS */;
INSERT INTO `nota_pedidos` (`id`, `fecha`, `id_cliente`, `totalgravado`, `total`, `monto_iva`, `id_vendedor`, `id_factura`, `descuento`, `observaciones`, `created_at`, `updated_at`, `estado`, `estado_pago`, `id_vendedor_2`, `tipo_presupuesto`) VALUES
	(3, '2022-02-13 00:00:00', 2, 1500.00, 1500.00, 0.00, 1, NULL, 20.00, NULL, '2022-02-12 18:42:34', '2022-09-08 21:40:59', 'Rechazado', 'Pendiente', NULL, 'Productos'),
	(4, '2022-02-16 00:00:00', 1, 29500.00, 29500.00, 0.00, 1, NULL, 20.00, '1\r\n2\r\n3\r\n4\r\n5', '2022-02-27 14:38:50', '2022-09-08 15:45:40', 'Pendiente Aprobacion', 'Pendiente', NULL, 'Productos'),
	(6, '2022-02-16 00:00:00', 2, 0.00, 0.00, 0.00, 1, NULL, 2000.00, NULL, '2022-09-08 14:09:13', '2022-09-08 14:09:13', 'Pendiente Aprobacion', NULL, NULL, NULL),
	(7, '2022-11-03 00:00:00', 1, 200.00, 200.00, 0.00, 1, NULL, NULL, NULL, '2022-11-03 13:51:37', '2022-11-03 13:51:37', 'Pendiente Aprobacion', 'Pendiente', NULL, 'Productos');
/*!40000 ALTER TABLE `nota_pedidos` ENABLE KEYS */;

-- Volcando estructura para tabla persia.ordenes_fabricacion
CREATE TABLE IF NOT EXISTS `ordenes_fabricacion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_orden` datetime DEFAULT NULL,
  `observaciones` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_entrada_proceso` datetime DEFAULT NULL,
  `fecha_salida_proceso` datetime DEFAULT NULL,
  `id_producto` bigint(20) unsigned DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `id_pedido` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordenes_fabricacion_id_producto_foreign` (`id_producto`),
  KEY `ordenes_fabricacion_id_renglon_pedido_foreign` (`id_pedido`),
  CONSTRAINT `ordenes_fabricacion_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.ordenes_fabricacion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ordenes_fabricacion` DISABLE KEYS */;
INSERT INTO `ordenes_fabricacion` (`id`, `fecha_orden`, `observaciones`, `estado`, `fecha_entrada_proceso`, `fecha_salida_proceso`, `id_producto`, `cantidad`, `id_pedido`, `created_at`, `updated_at`) VALUES
	(2, '2022-10-30 00:00:00', NULL, 'Pendiente', NULL, NULL, 3, 10.00, 4, NULL, '2022-10-05 23:18:11'),
	(3, NULL, NULL, 'Entregado', NULL, NULL, 4, 20.00, 4, '2022-06-01 19:56:00', '2022-06-01 19:56:55'),
	(4, '2022-09-09 19:30:27', NULL, 'Pendiente', NULL, NULL, 1, 3.00, 3, NULL, NULL),
	(5, '2022-09-09 19:30:27', NULL, 'Pendiente', NULL, NULL, 5, 3.00, 3, NULL, NULL),
	(6, '2022-09-09 19:30:27', NULL, 'Pendiente', NULL, NULL, 3, 10.00, 3, NULL, NULL);
/*!40000 ALTER TABLE `ordenes_fabricacion` ENABLE KEYS */;

-- Volcando estructura para tabla persia.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.pages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-01-08 22:12:38', '2022-01-08 22:12:38');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Volcando estructura para tabla persia.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla persia.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.permissions: ~115 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(2, 'browse_bread', NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(3, 'browse_database', NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(4, 'browse_media', NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(5, 'browse_compass', NULL, '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(6, 'browse_menus', 'menus', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(7, 'read_menus', 'menus', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(8, 'edit_menus', 'menus', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(9, 'add_menus', 'menus', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(10, 'delete_menus', 'menus', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(11, 'browse_roles', 'roles', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(12, 'read_roles', 'roles', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(13, 'edit_roles', 'roles', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(14, 'add_roles', 'roles', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(15, 'delete_roles', 'roles', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(16, 'browse_users', 'users', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(17, 'read_users', 'users', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(18, 'edit_users', 'users', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(19, 'add_users', 'users', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(20, 'delete_users', 'users', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(21, 'browse_settings', 'settings', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(22, 'read_settings', 'settings', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(23, 'edit_settings', 'settings', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(24, 'add_settings', 'settings', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(25, 'delete_settings', 'settings', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(26, 'browse_categories', 'categories', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(27, 'read_categories', 'categories', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(28, 'edit_categories', 'categories', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(29, 'add_categories', 'categories', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(30, 'delete_categories', 'categories', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(31, 'browse_posts', 'posts', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(32, 'read_posts', 'posts', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(33, 'edit_posts', 'posts', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(34, 'add_posts', 'posts', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(35, 'delete_posts', 'posts', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(36, 'browse_pages', 'pages', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(37, 'read_pages', 'pages', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(38, 'edit_pages', 'pages', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(39, 'add_pages', 'pages', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(40, 'delete_pages', 'pages', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(56, 'browse_clientes', 'clientes', '2022-01-11 20:35:14', '2022-01-11 20:35:14'),
	(57, 'read_clientes', 'clientes', '2022-01-11 20:35:14', '2022-01-11 20:35:14'),
	(58, 'edit_clientes', 'clientes', '2022-01-11 20:35:14', '2022-01-11 20:35:14'),
	(59, 'add_clientes', 'clientes', '2022-01-11 20:35:14', '2022-01-11 20:35:14'),
	(60, 'delete_clientes', 'clientes', '2022-01-11 20:35:14', '2022-01-11 20:35:14'),
	(66, 'browse_nota_pedidos', 'nota_pedidos', '2022-01-12 22:34:43', '2022-01-12 22:34:43'),
	(67, 'read_nota_pedidos', 'nota_pedidos', '2022-01-12 22:34:43', '2022-01-12 22:34:43'),
	(68, 'edit_nota_pedidos', 'nota_pedidos', '2022-01-12 22:34:43', '2022-01-12 22:34:43'),
	(69, 'add_nota_pedidos', 'nota_pedidos', '2022-01-12 22:34:43', '2022-01-12 22:34:43'),
	(70, 'delete_nota_pedidos', 'nota_pedidos', '2022-01-12 22:34:43', '2022-01-12 22:34:43'),
	(71, 'browse_empleados', 'empleados', '2022-01-12 22:40:47', '2022-01-12 22:40:47'),
	(72, 'read_empleados', 'empleados', '2022-01-12 22:40:47', '2022-01-12 22:40:47'),
	(73, 'edit_empleados', 'empleados', '2022-01-12 22:40:47', '2022-01-12 22:40:47'),
	(74, 'add_empleados', 'empleados', '2022-01-12 22:40:47', '2022-01-12 22:40:47'),
	(75, 'delete_empleados', 'empleados', '2022-01-12 22:40:47', '2022-01-12 22:40:47'),
	(76, 'browse_rubros', 'rubros', '2022-01-15 21:04:32', '2022-01-15 21:04:32'),
	(77, 'read_rubros', 'rubros', '2022-01-15 21:04:32', '2022-01-15 21:04:32'),
	(78, 'edit_rubros', 'rubros', '2022-01-15 21:04:32', '2022-01-15 21:04:32'),
	(79, 'add_rubros', 'rubros', '2022-01-15 21:04:32', '2022-01-15 21:04:32'),
	(80, 'delete_rubros', 'rubros', '2022-01-15 21:04:32', '2022-01-15 21:04:32'),
	(81, 'browse_subrubros', 'subrubros', '2022-01-15 21:05:02', '2022-01-15 21:05:02'),
	(82, 'read_subrubros', 'subrubros', '2022-01-15 21:05:02', '2022-01-15 21:05:02'),
	(83, 'edit_subrubros', 'subrubros', '2022-01-15 21:05:02', '2022-01-15 21:05:02'),
	(84, 'add_subrubros', 'subrubros', '2022-01-15 21:05:02', '2022-01-15 21:05:02'),
	(85, 'delete_subrubros', 'subrubros', '2022-01-15 21:05:02', '2022-01-15 21:05:02'),
	(86, 'browse_productos', 'productos', '2022-01-18 11:30:46', '2022-01-18 11:30:46'),
	(87, 'read_productos', 'productos', '2022-01-18 11:30:46', '2022-01-18 11:30:46'),
	(88, 'edit_productos', 'productos', '2022-01-18 11:30:46', '2022-01-18 11:30:46'),
	(89, 'add_productos', 'productos', '2022-01-18 11:30:46', '2022-01-18 11:30:46'),
	(90, 'delete_productos', 'productos', '2022-01-18 11:30:46', '2022-01-18 11:30:46'),
	(91, 'browse_localidades', 'localidades', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(92, 'read_localidades', 'localidades', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(93, 'edit_localidades', 'localidades', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(94, 'add_localidades', 'localidades', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(95, 'delete_localidades', 'localidades', '2022-02-07 21:20:36', '2022-02-07 21:20:36'),
	(96, 'browse_tipos_gastos', 'tipos_gastos', '2022-02-07 21:36:04', '2022-02-07 21:36:04'),
	(97, 'read_tipos_gastos', 'tipos_gastos', '2022-02-07 21:36:04', '2022-02-07 21:36:04'),
	(98, 'edit_tipos_gastos', 'tipos_gastos', '2022-02-07 21:36:04', '2022-02-07 21:36:04'),
	(99, 'add_tipos_gastos', 'tipos_gastos', '2022-02-07 21:36:04', '2022-02-07 21:36:04'),
	(100, 'delete_tipos_gastos', 'tipos_gastos', '2022-02-07 21:36:04', '2022-02-07 21:36:04'),
	(101, 'browse_proveedores', 'proveedores', '2022-02-11 21:13:49', '2022-02-11 21:13:49'),
	(102, 'read_proveedores', 'proveedores', '2022-02-11 21:13:49', '2022-02-11 21:13:49'),
	(103, 'edit_proveedores', 'proveedores', '2022-02-11 21:13:49', '2022-02-11 21:13:49'),
	(104, 'add_proveedores', 'proveedores', '2022-02-11 21:13:49', '2022-02-11 21:13:49'),
	(105, 'delete_proveedores', 'proveedores', '2022-02-11 21:13:49', '2022-02-11 21:13:49'),
	(106, 'browse_facturas_compras', 'facturas_compras', '2022-02-11 21:17:00', '2022-02-11 21:17:00'),
	(107, 'read_facturas_compras', 'facturas_compras', '2022-02-11 21:17:00', '2022-02-11 21:17:00'),
	(108, 'edit_facturas_compras', 'facturas_compras', '2022-02-11 21:17:00', '2022-02-11 21:17:00'),
	(109, 'add_facturas_compras', 'facturas_compras', '2022-02-11 21:17:00', '2022-02-11 21:17:00'),
	(110, 'delete_facturas_compras', 'facturas_compras', '2022-02-11 21:17:00', '2022-02-11 21:17:00'),
	(111, 'browse_jurisdicciones', 'jurisdicciones', '2022-02-11 21:45:00', '2022-02-11 21:45:00'),
	(112, 'read_jurisdicciones', 'jurisdicciones', '2022-02-11 21:45:00', '2022-02-11 21:45:00'),
	(113, 'edit_jurisdicciones', 'jurisdicciones', '2022-02-11 21:45:00', '2022-02-11 21:45:00'),
	(114, 'add_jurisdicciones', 'jurisdicciones', '2022-02-11 21:45:00', '2022-02-11 21:45:00'),
	(115, 'delete_jurisdicciones', 'jurisdicciones', '2022-02-11 21:45:00', '2022-02-11 21:45:00'),
	(116, 'browse_mov_financieros', 'mov_financieros', '2022-02-16 22:14:52', '2022-02-16 22:14:52'),
	(117, 'read_mov_financieros', 'mov_financieros', '2022-02-16 22:14:52', '2022-02-16 22:14:52'),
	(118, 'edit_mov_financieros', 'mov_financieros', '2022-02-16 22:14:52', '2022-02-16 22:14:52'),
	(119, 'add_mov_financieros', 'mov_financieros', '2022-02-16 22:14:52', '2022-02-16 22:14:52'),
	(120, 'delete_mov_financieros', 'mov_financieros', '2022-02-16 22:14:52', '2022-02-16 22:14:52'),
	(121, 'browse_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 20:47:34', '2022-05-30 20:47:34'),
	(122, 'read_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 20:47:34', '2022-05-30 20:47:34'),
	(123, 'edit_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 20:47:34', '2022-05-30 20:47:34'),
	(124, 'add_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 20:47:34', '2022-05-30 20:47:34'),
	(125, 'delete_ordenes_fabricacion', 'ordenes_fabricacion', '2022-05-30 20:47:34', '2022-05-30 20:47:34'),
	(126, 'browse_moldes', 'moldes', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(127, 'read_moldes', 'moldes', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(128, 'edit_moldes', 'moldes', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(129, 'add_moldes', 'moldes', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(130, 'delete_moldes', 'moldes', '2022-08-10 19:52:51', '2022-08-10 19:52:51'),
	(136, 'browse_formaspago', 'formaspago', '2022-09-09 23:27:30', '2022-09-09 23:27:30'),
	(137, 'read_formaspago', 'formaspago', '2022-09-09 23:27:30', '2022-09-09 23:27:30'),
	(138, 'edit_formaspago', 'formaspago', '2022-09-09 23:27:30', '2022-09-09 23:27:30'),
	(139, 'add_formaspago', 'formaspago', '2022-09-09 23:27:30', '2022-09-09 23:27:30'),
	(140, 'delete_formaspago', 'formaspago', '2022-09-09 23:27:30', '2022-09-09 23:27:30'),
	(141, 'browse_cuentas_bancos', 'cuentas_bancos', '2022-10-19 12:05:46', '2022-10-19 12:05:46'),
	(142, 'read_cuentas_bancos', 'cuentas_bancos', '2022-10-19 12:05:46', '2022-10-19 12:05:46'),
	(143, 'edit_cuentas_bancos', 'cuentas_bancos', '2022-10-19 12:05:46', '2022-10-19 12:05:46'),
	(144, 'add_cuentas_bancos', 'cuentas_bancos', '2022-10-19 12:05:46', '2022-10-19 12:05:46'),
	(145, 'delete_cuentas_bancos', 'cuentas_bancos', '2022-10-19 12:05:46', '2022-10-19 12:05:46');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla persia.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.permission_role: ~202 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla persia.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla persia.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.posts: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-02-07 21:13:05', '2022-02-07 21:13:05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla persia.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rubro_id` bigint(20) unsigned NOT NULL,
  `subrubro_id` bigint(20) unsigned NOT NULL,
  `preciovta` decimal(19,3) DEFAULT NULL,
  `tasa_iva` decimal(5,2) DEFAULT NULL,
  `unidad` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_compra` decimal(10,0) DEFAULT NULL,
  `unidad_compra` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_molde` bigint(20) unsigned DEFAULT NULL,
  `id_base` int(11) DEFAULT NULL,
  `manual_procedimiento` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidades_mt2` int(11) DEFAULT NULL,
  `paquetes_mt2` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Productos_Rubro` (`rubro_id`),
  KEY `FK_Productos_SubRubro` (`subrubro_id`),
  KEY `FK_Productos_Moldes` (`id_molde`),
  CONSTRAINT `productos_id_molde_foreign` FOREIGN KEY (`id_molde`) REFERENCES `moldes` (`id`),
  CONSTRAINT `productos_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`),
  CONSTRAINT `productos_subrubro_id_foreign` FOREIGN KEY (`subrubro_id`) REFERENCES `subrubros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.productos: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `descripcion`, `rubro_id`, `subrubro_id`, `preciovta`, `tasa_iva`, `unidad`, `precio_compra`, `unidad_compra`, `activo`, `id_molde`, `id_base`, `manual_procedimiento`, `unidades_mt2`, `paquetes_mt2`, `created_at`, `updated_at`) VALUES
	(1, 'Piedra Ekos', 2, 6, 1200.000, 21.00, 'm2', NULL, NULL, 'SI', 1, 0, NULL, 10, 1, NULL, '2022-08-05 13:18:22'),
	(2, 'Ferrite rojo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 21:54:17'),
	(3, 'Recto Grande', 1, 3, 10.000, 21.00, 'm2', NULL, NULL, 'SI', 1, 1, 'manual', NULL, 1, NULL, '2022-11-09 11:58:24'),
	(4, 'Pegamento Klaukol', 4, 11, 200.000, NULL, 'm2', 800, 'Mt3', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-08 21:34:22'),
	(5, 'Revestimiento para paredes Blanco Mate', 4, 10, NULL, 21.00, 'm2', NULL, '1', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-27 13:49:48'),
	(6, 'Arena', 5, 8, NULL, NULL, NULL, NULL, 'mt3', 'SI', NULL, 0, NULL, NULL, NULL, NULL, '2022-08-04 13:26:18'),
	(7, 'Piedra', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 19:48:13', '2022-08-03 19:48:13'),
	(8, 'Ferrite amarillo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 19:48:42', '2022-08-03 19:48:42'),
	(9, 'cemento', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 0, NULL, NULL, NULL, '2022-08-03 19:49:05', '2022-08-03 19:49:05'),
	(10, 'Ferrite rojo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 22:47:01'),
	(11, 'cemento blanco', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 22:50:40'),
	(12, 'cemento calcareo', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-05 22:52:51', '2022-08-05 22:52:51'),
	(13, 'xxxxxxx', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-05 23:03:16', '2022-08-05 23:03:16'),
	(14, 'www', 5, 8, NULL, NULL, NULL, NULL, NULL, 'SI', NULL, 1, NULL, NULL, NULL, '2022-08-05 23:04:25', '2022-08-05 23:04:25'),
	(15, 'Muebles de Cocina', 3, 4, NULL, NULL, 'm2', NULL, NULL, 'SI', NULL, NULL, NULL, NULL, NULL, '2022-08-11 13:27:00', '2022-08-11 13:27:00'),
	(17, 'Laja Española', 1, 2, 1250.000, NULL, 'm2', NULL, NULL, 'SI', 1, 1, NULL, 6, 1, NULL, '2022-08-30 13:18:29');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla persia.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.proveedores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`id`, `razonsocial`, `direccion`, `nombre_comercial`, `web`, `telefono`, `mail`, `cuit`, `cond_iva`, `nombre_contacto`, `telefono_contacto`, `observaciones`, `created_at`, `updated_at`) VALUES
	(1, 'SANTIANO y VICTOR S.R.L.', 'Av 25 de MAYO 1799', 'SANTIANO y VICTOR S.R.L.', NULL, NULL, NULL, '30-71472882-9', 'RI', NULL, NULL, NULL, '2022-02-11 21:15:00', '2022-03-15 15:14:35'),
	(2, 'Hierros Lider', 'Ruta NAcional 11 Km 1025', NULL, NULL, NULL, NULL, '32-25546879-0', 'RI', NULL, NULL, NULL, '2022-02-11 21:15:00', '2022-03-15 15:14:05');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para tabla persia.renglones_notapedidos
CREATE TABLE IF NOT EXISTS `renglones_notapedidos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` bigint(20) unsigned NOT NULL,
  `id_producto` bigint(20) unsigned NOT NULL,
  `cantidad` decimal(19,2) DEFAULT NULL,
  `total_linea` decimal(19,3) DEFAULT NULL,
  `iva` decimal(5,2) DEFAULT NULL,
  `id_factura` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Renglones_NotaPedido_Nota_Pedido` (`id_pedido`),
  KEY `FK_Renglones_NotaPedido_Productos` (`id_producto`),
  KEY `FK_Renglones_NotaPedido_Factura_Venta` (`id_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.renglones_notapedidos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `renglones_notapedidos` DISABLE KEYS */;
INSERT INTO `renglones_notapedidos` (`id`, `id_pedido`, `id_producto`, `cantidad`, `total_linea`, `iva`, `id_factura`, `created_at`, `updated_at`) VALUES
	(35, 4, 1, 3.00, 3600.000, 21.00, NULL, '2022-09-08 15:45:40', '2022-09-08 15:45:40'),
	(36, 4, 5, 3.00, 900.000, 21.00, NULL, '2022-09-08 15:45:40', '2022-09-08 15:45:40'),
	(37, 4, 3, 10.00, 25000.000, 21.00, NULL, '2022-09-08 15:45:40', '2022-09-08 15:45:40'),
	(38, 3, 2, 5.00, 1500.000, 21.00, NULL, '2022-09-08 21:40:59', '2022-09-08 21:40:59'),
	(39, 7, 2, 2.00, 200.000, 21.00, NULL, '2022-11-03 13:51:37', '2022-11-03 13:51:37');
/*!40000 ALTER TABLE `renglones_notapedidos` ENABLE KEYS */;

-- Volcando estructura para tabla persia.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2022-01-08 22:12:38', '2022-01-08 22:12:38'),
	(2, 'gerente', 'Gerente', '2022-01-08 22:12:38', '2022-09-19 14:42:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla persia.rubros
CREATE TABLE IF NOT EXISTS `rubros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.rubros: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` (`id`, `rubro`, `categoria`, `created_at`, `updated_at`) VALUES
	(1, 'Pisos', 'Elaboración Propia', '2022-02-07 21:25:00', '2022-05-06 13:24:54'),
	(2, 'Revestimientos', 'Elaboración Propia', '2022-02-07 21:26:00', '2022-05-06 13:24:32'),
	(3, 'Muebles', 'Elaboración Propia', '2022-02-07 21:26:00', '2022-05-06 13:24:19'),
	(4, 'Productos Reventa', 'Productos Reventa', '2022-02-07 21:26:00', '2022-05-06 13:24:45'),
	(5, 'Materia Prima', 'Materia Prima', '2022-02-07 21:27:00', '2022-05-06 13:24:12');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;

-- Volcando estructura para tabla persia.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.settings: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Volcando estructura para tabla persia.subrubros
CREATE TABLE IF NOT EXISTS `subrubros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rubro_id` bigint(20) unsigned NOT NULL,
  `descripcion_subrubro` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SubRubro_Rubro` (`rubro_id`),
  CONSTRAINT `subrubros_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.subrubros: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `subrubros` DISABLE KEYS */;
INSERT INTO `subrubros` (`id`, `rubro_id`, `descripcion_subrubro`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Pisos-Adoquines', '2022-02-07 21:27:31', '2022-02-07 21:27:31'),
	(2, 1, 'Pisos-Lajas', '2022-02-07 21:27:42', '2022-02-07 21:27:42'),
	(3, 1, 'Pisos-Baldosas', '2022-02-07 21:27:52', '2022-02-07 21:27:52'),
	(4, 3, 'Muebles a medida', '2022-02-07 21:28:19', '2022-02-07 21:28:19'),
	(5, 2, 'Revestimientos-Simil Madera', '2022-02-07 21:28:00', '2022-02-07 21:29:54'),
	(6, 2, 'Revestimientos-Simil Piedra', '2022-02-07 21:29:00', '2022-02-07 21:29:34'),
	(7, 2, 'Esquineros', '2022-02-07 21:30:08', '2022-02-07 21:30:08'),
	(8, 5, 'Materia prima pisos y revestimientos', '2022-02-07 22:11:59', '2022-02-07 22:11:59'),
	(9, 5, 'Materia prima muebles', '2022-02-07 22:12:25', '2022-02-07 22:12:25'),
	(10, 4, 'RV-Pinturas y revestimientos', '2022-02-07 22:13:13', '2022-02-07 22:13:13'),
	(11, 4, 'RV-Adhesivos', '2022-02-07 22:13:28', '2022-02-07 22:13:28'),
	(12, 4, 'RV-pinceles y rodillos', '2022-02-07 22:13:46', '2022-02-07 22:13:46');
/*!40000 ALTER TABLE `subrubros` ENABLE KEYS */;

-- Volcando estructura para tabla persia.tipos_gastos
CREATE TABLE IF NOT EXISTS `tipos_gastos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo1` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo2` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.tipos_gastos: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_gastos` DISABLE KEYS */;
INSERT INTO `tipos_gastos` (`id`, `tipo1`, `tipo2`, `created_at`, `updated_at`) VALUES
	(1, 'Gastos Fijos', 'Prestamos Bancos', '2022-02-07 21:41:14', '2022-02-07 21:41:14'),
	(2, 'Gastos Fijos', 'Alquileres', '2022-02-07 21:41:29', '2022-02-07 21:41:29'),
	(3, 'Gastos Fijos', 'Sueldos y Comisiones', '2022-02-07 21:41:42', '2022-02-07 21:41:42'),
	(4, 'Gastos Fijos', 'Impuestos y Tasas', '2022-02-07 21:41:57', '2022-02-07 21:41:57'),
	(5, 'Gastos Fijos', 'Servicios', '2022-02-07 21:41:00', '2022-02-07 21:42:36'),
	(6, 'Gastos Variables', 'Inversión', '2022-02-07 21:43:12', '2022-02-07 21:43:12'),
	(7, 'Gastos Variables', 'Gastos Varios', '2022-02-07 21:43:33', '2022-02-07 21:43:33'),
	(8, 'Gastos Variables', 'Combustible Fletes', '2022-02-07 22:02:17', '2022-02-07 22:02:17'),
	(9, 'Gastos Variables', 'Preparado de Moldes', '2022-02-07 22:02:43', '2022-02-07 22:02:43'),
	(10, 'Gastos Variables', 'Preparado de Moldes', '2022-02-07 22:02:45', '2022-02-07 22:02:45'),
	(11, 'Gastos Variables', 'Insumos de embalaje', '2022-02-07 22:03:04', '2022-02-07 22:03:04'),
	(12, 'Gastos Variables', 'Insumos Piso', '2022-02-07 22:03:20', '2022-02-07 22:03:20'),
	(13, 'Gastos Variables', 'Insumos Muebles', '2022-02-07 22:03:36', '2022-02-07 22:03:36'),
	(14, 'Gastos Variables', 'Mercaderia  reventa', '2022-02-07 22:04:00', '2022-02-07 22:04:00');
/*!40000 ALTER TABLE `tipos_gastos` ENABLE KEYS */;

-- Volcando estructura para tabla persia.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.translations: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-02-07 21:13:05', '2022-02-07 21:13:05'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-02-07 21:13:05', '2022-02-07 21:13:05');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla persia.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users\\September2022\\f1BNJCmkVg9wYVjsxtQc.PNG', NULL, '$2y$10$MjGViZ46sSZdiIQYPdYLFOQxnU/9TqrUnLWEEZEOzSPqOAJVKTk3S', 'KvI4XdYYE33MhlfpNxDYo9s4inJnONpJztsWEHYVAWturPRZE2kA82HqBLWm', '{"locale":"es"}', '2022-01-08 22:12:38', '2022-09-27 12:32:11'),
	(2, 2, 'Sonia', 'persiarevestimientos@gmail.com', 'users\\September2022\\sn1ukfzojZeXMunt4nqY.PNG', NULL, '$2y$10$e7919r3ou3IM5Wj18XM7s.4NmcmTZlP43RTFAk/y6SywTiIs10CCS', NULL, '{"locale":"es"}', '2022-09-17 12:37:07', '2022-09-27 12:31:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla persia.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla persia.user_roles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
	(2, 2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;