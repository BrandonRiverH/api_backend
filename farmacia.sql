-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2026 a las 01:17:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `creado_en` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id_laboratorio`, `nombre`, `creado_en`) VALUES
(1, 'Bayer', '2000-01-01'),
(2, 'Pfizer', '1998-06-10'),
(3, 'Laboratorio Alfa', '2000-01-01'),
(4, 'Laboratorio Beta', '2001-02-02'),
(5, 'Laboratorio Gamma', '2002-03-03'),
(6, 'Laboratorio Delta', '2003-04-04'),
(7, 'Laboratorio Epsilon', '2004-05-05'),
(8, 'Laboratorio Zeta', '2005-06-06'),
(9, 'Laboratorio Eta', '2006-07-07'),
(10, 'Laboratorio Theta', '2007-08-08'),
(11, 'Laboratorio Iota', '2008-09-09'),
(12, 'Laboratorio Kappa', '2009-10-10'),
(13, 'Laboratorio Lambda', '2010-01-11'),
(14, 'Laboratorio Mu', '2011-02-12'),
(15, 'Laboratorio Nu', '2012-03-13'),
(16, 'Laboratorio Xi', '2013-04-14'),
(17, 'Laboratorio Omicron', '2014-05-15'),
(18, 'Laboratorio Pi', '2015-06-16'),
(19, 'Laboratorio Rho', '2016-07-17'),
(20, 'Laboratorio Sigma', '2017-08-18'),
(21, 'Laboratorio Tau', '2018-09-19'),
(22, 'Laboratorio Omega', '2019-10-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentaciones`
--

CREATE TABLE `presentaciones` (
  `id_presentacion` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentaciones`
--

INSERT INTO `presentaciones` (`id_presentacion`, `nombre`) VALUES
(1, 'Caja'),
(2, 'Frasco'),
(3, 'Caja'),
(4, 'Frasco'),
(5, 'Blister'),
(6, 'Botella'),
(7, 'Ampolleta'),
(8, 'Tubo'),
(9, 'Sobre'),
(10, 'Paquete'),
(11, 'Envase Plastico'),
(12, 'Envase Vidrio'),
(13, 'Bolsa'),
(14, 'Kit'),
(15, 'Caja Grande'),
(16, 'Caja Chica'),
(17, 'Frasco 100ml'),
(18, 'Frasco 250ml'),
(19, 'Frasco 500ml'),
(20, 'Caja 10 tabletas'),
(21, 'Caja 20 tabletas'),
(22, 'Caja 30 tabletas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_produccion` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `id_laboratorio` int(11) DEFAULT NULL,
  `id_tipo_producto` int(11) DEFAULT NULL,
  `id_presentacion` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `lote`, `nombre`, `fecha_produccion`, `fecha_caducidad`, `costo`, `precio_venta`, `stock`, `stock_minimo`, `activo`, `id_laboratorio`, `id_tipo_producto`, `id_presentacion`, `id_proveedor`) VALUES
(1, 'L001', 'Paracetamol', '2024-01-01', '2026-01-01', 10.00, 18.00, 100, 20, 1, 1, 1, 1, 1),
(2, 'L002', 'Amoxicilina', '2024-02-01', '2026-02-01', 15.00, 25.00, 50, 15, 1, 2, 2, 2, 2),
(3, 'L008', 'Naproxeno', '2024-01-01', '2026-01-01', 14.00, 22.00, 80, 20, 1, 1, 1, 1, 1),
(4, 'L009', 'Diclofenaco', '2024-01-02', '2026-01-02', 10.00, 18.00, 90, 20, 1, 1, 1, 1, 2),
(5, 'L010', 'Omeprazol', '2024-01-03', '2026-01-03', 9.00, 16.00, 100, 25, 1, 2, 1, 2, 3),
(6, 'L011', 'Loratadina', '2024-01-04', '2026-01-04', 7.00, 14.00, 120, 30, 1, 2, 1, 1, 4),
(7, 'L012', 'Azitromicina', '2024-01-05', '2026-01-05', 20.00, 35.00, 60, 15, 1, 1, 2, 2, 5),
(8, 'L013', 'Metformina', '2024-01-06', '2026-01-06', 11.00, 19.00, 110, 25, 1, 2, 2, 1, 6),
(9, 'L014', 'Insulina', '2024-01-07', '2026-01-07', 50.00, 80.00, 40, 10, 1, 1, 2, 2, 7),
(10, 'L015', 'Antiacido', '2024-01-08', '2026-01-08', 6.00, 12.00, 130, 30, 1, 2, 1, 1, 8),
(11, 'L016', 'Jarabe Tos', '2024-01-09', '2026-01-09', 18.00, 28.00, 70, 20, 1, 1, 2, 2, 9),
(12, 'L017', 'Parche Termico', '2024-01-10', '2026-01-10', 5.00, 10.00, 150, 40, 1, 2, 1, 1, 10),
(13, 'L018', 'Suero Oral', '2024-01-11', '2026-01-11', 4.00, 9.00, 200, 50, 1, 1, 1, 2, 11),
(14, 'L019', 'Antialergico', '2024-01-12', '2026-01-12', 13.00, 21.00, 85, 20, 1, 2, 1, 1, 12),
(15, 'L020', 'Vitamina D', '2024-01-13', '2026-01-13', 8.00, 15.00, 95, 20, 1, 1, 1, 2, 13),
(16, 'L021', 'Antiinflamatorio', '2024-01-14', '2026-01-14', 16.00, 26.00, 75, 20, 1, 2, 2, 1, 14),
(17, 'L022', 'Crema Antifungal', '2024-01-15', '2026-01-15', 12.00, 20.00, 65, 15, 1, 1, 2, 2, 15),
(18, 'L023', 'Jarabe Adulto', '2024-01-16', '2026-01-16', 17.00, 30.00, 55, 15, 1, 2, 2, 1, 16),
(19, 'L024', 'Pastillas Gripe', '2024-01-17', '2026-01-17', 9.00, 17.00, 105, 25, 1, 1, 1, 2, 17),
(20, 'L025', 'Alcohol 70%', '2024-01-18', '2026-01-18', 3.00, 8.00, 300, 60, 1, 2, 1, 1, 18),
(21, 'L026', 'Agua Oxigenada', '2024-01-19', '2026-01-19', 2.00, 6.00, 250, 50, 1, 1, 1, 2, 19),
(22, 'L027', 'Gasas Esteriles', '2024-01-20', '2026-01-20', 1.00, 5.00, 400, 100, 1, 2, 1, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `nombre_contacto` varchar(100) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion`, `telefono`, `correo`, `nombre_contacto`, `fecha_ingreso`, `activo`) VALUES
(1, 'Proveedor Norte', 'Av Central 123', '5550001111', 'norte@mail.com', 'Luis Torres', '2023-01-10', 1),
(2, 'Proveedor Sur', 'Calle Sur 456', '5550002222', 'sur@mail.com', 'Maria Ruiz', '2023-02-15', 1),
(3, 'Farma Norte', 'Av Uno 101', '5552000001', 'farma1@mail.com', 'Carlos Ruiz', '2023-01-01', 1),
(4, 'Farma Sur', 'Av Dos 102', '5552000002', 'farma2@mail.com', 'Ana Torres', '2023-01-02', 1),
(5, 'Medic Plus', 'Av Tres 103', '5552000003', 'farma3@mail.com', 'Luis Mora', '2023-01-03', 1),
(6, 'Salud Integral', 'Av Cuatro 104', '5552000004', 'farma4@mail.com', 'Maria Leon', '2023-01-04', 1),
(7, 'BioMed', 'Av Cinco 105', '5552000005', 'farma5@mail.com', 'Jorge Silva', '2023-01-05', 1),
(8, 'Laboratorio MX', 'Av Seis 106', '5552000006', 'farma6@mail.com', 'Laura Vega', '2023-01-06', 1),
(9, 'Distribuidora Vida', 'Av Siete 107', '5552000007', 'farma7@mail.com', 'Pedro Ramos', '2023-01-07', 1),
(10, 'Medic World', 'Av Ocho 108', '5552000008', 'farma8@mail.com', 'Sofia Diaz', '2023-01-08', 1),
(11, 'Farma Express', 'Av Nueve 109', '5552000009', 'farma9@mail.com', 'Miguel Cruz', '2023-01-09', 1),
(12, 'Global Pharma', 'Av Diez 110', '5552000010', 'farma10@mail.com', 'Diana Soto', '2023-01-10', 1),
(13, 'Distribuidora Central', 'Av Once 111', '5552000011', 'farma11@mail.com', 'Hugo Perez', '2023-01-11', 1),
(14, 'Farma Salud', 'Av Doce 112', '5552000012', 'farma12@mail.com', 'Valeria Campos', '2023-01-12', 1),
(15, 'Medical Supply', 'Av Trece 113', '5552000013', 'farma13@mail.com', 'Oscar Reyes', '2023-01-13', 1),
(16, 'FarmaCare', 'Av Catorce 114', '5552000014', 'farma14@mail.com', 'Natalia Mora', '2023-01-14', 1),
(17, 'Vida Sana', 'Av Quince 115', '5552000015', 'farma15@mail.com', 'Emilio Lopez', '2023-01-15', 1),
(18, 'PharmaTech', 'Av Dieciseis 116', '5552000016', 'farma16@mail.com', 'Andrea Flores', '2023-01-16', 1),
(19, 'Medic Line', 'Av Diecisiete 117', '5552000017', 'farma17@mail.com', 'Ricardo Ruiz', '2023-01-17', 1),
(20, 'Farma Total', 'Av Dieciocho 118', '5552000018', 'farma18@mail.com', 'Monica Rios', '2023-01-18', 1),
(21, 'Distribuidora Elite', 'Av Diecinueve 119', '5552000019', 'farma19@mail.com', 'Fernando Luna', '2023-01-19', 1),
(22, 'Salud Premium', 'Av Veinte 120', '5552000020', 'farma20@mail.com', 'Lucia Vega', '2023-01-20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Control total'),
(2, 'Vendedor', 'Realiza ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_productos`
--

CREATE TABLE `tipo_productos` (
  `id_tipo_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_productos`
--

INSERT INTO `tipo_productos` (`id_tipo_producto`, `nombre`) VALUES
(1, 'Analgesico'),
(2, 'Antibiotico'),
(3, 'Analgesico'),
(4, 'Antibiotico'),
(5, 'Antiinflamatorio'),
(6, 'Antialergico'),
(7, 'Antigripal'),
(8, 'Vitaminas'),
(9, 'Suplemento Alimenticio'),
(10, 'Antiseptico'),
(11, 'Antifungal'),
(12, 'Antiviral'),
(13, 'Jarabe'),
(14, 'Inyectable'),
(15, 'Crema'),
(16, 'Gel'),
(17, 'Tableta'),
(18, 'Capsula'),
(19, 'Solucion Oral'),
(20, 'Spray'),
(21, 'Parche'),
(22, 'Insulina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `clave_usuario` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `a_paterno` varchar(100) DEFAULT NULL,
  `a_materno` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `clave_usuario`, `nombre`, `a_paterno`, `a_materno`, `fecha_nacimiento`, `sexo`, `telefono`, `correo`, `contrasena`, `activo`, `id_rol`) VALUES
(1, 'admin01', 'Carlos', 'Lopez', 'Martinez', '1990-05-10', 'M', '5551112222', 'carlos@mail.com', '1234', 1, 1),
(2, 'vend01', 'Ana', 'Gomez', 'Perez', '1995-08-15', 'F', '5553334444', 'ana@mail.com', '1234', 1, 2),
(3, 'vend07', 'Pedro', 'Castro', 'Mendez', '1994-02-10', 'M', '5551000001', 'pedro1@mail.com', '1234', 1, 2),
(4, 'vend08', 'Laura', 'Jimenez', 'Santos', '1996-03-11', 'F', '5551000002', 'laura2@mail.com', '1234', 1, 2),
(5, 'vend09', 'Daniel', 'Ortega', 'Flores', '1993-04-12', 'M', '5551000003', 'daniel3@mail.com', '1234', 1, 2),
(6, 'vend10', 'Sofia', 'Navarro', 'Rios', '1997-05-13', 'F', '5551000004', 'sofia4@mail.com', '1234', 1, 2),
(7, 'vend11', 'Miguel', 'Salazar', 'Ruiz', '1992-06-14', 'M', '5551000005', 'miguel5@mail.com', '1234', 1, 2),
(8, 'vend12', 'Andrea', 'Morales', 'Luna', '1995-07-15', 'F', '5551000006', 'andrea6@mail.com', '1234', 1, 2),
(9, 'vend13', 'Fernando', 'Vargas', 'Reyes', '1991-08-16', 'M', '5551000007', 'fernando7@mail.com', '1234', 1, 2),
(10, 'vend14', 'Paola', 'Herrera', 'Cruz', '1998-09-17', 'F', '5551000008', 'paola8@mail.com', '1234', 1, 2),
(11, 'vend15', 'Alberto', 'Molina', 'Peña', '1990-10-18', 'M', '5551000009', 'alberto9@mail.com', '1234', 1, 2),
(12, 'vend16', 'Valeria', 'Aguilar', 'Lozano', '1999-11-19', 'F', '5551000010', 'valeria10@mail.com', '1234', 1, 2),
(13, 'vend17', 'Oscar', 'Campos', 'Delgado', '1993-12-20', 'M', '5551000011', 'oscar11@mail.com', '1234', 1, 2),
(14, 'vend18', 'Diana', 'Cortes', 'Mora', '1994-01-21', 'F', '5551000012', 'diana12@mail.com', '1234', 1, 2),
(15, 'vend19', 'Hugo', 'Paredes', 'Ibarra', '1992-02-22', 'M', '5551000013', 'hugo13@mail.com', '1234', 1, 2),
(16, 'vend20', 'Carla', 'Sanchez', 'Valdez', '1996-03-23', 'F', '5551000014', 'carla14@mail.com', '1234', 1, 2),
(17, 'vend21', 'Emilio', 'Guerrero', 'Vega', '1995-04-24', 'M', '5551000015', 'emilio15@mail.com', '1234', 1, 2),
(18, 'vend22', 'Natalia', 'Ramos', 'Cano', '1997-05-25', 'F', '5551000016', 'natalia16@mail.com', '1234', 1, 2),
(19, 'vend23', 'Ivan', 'Silva', 'Fuentes', '1991-06-26', 'M', '5551000017', 'ivan17@mail.com', '1234', 1, 2),
(20, 'vend24', 'Monica', 'Espinoza', 'Rangel', '1998-07-27', 'F', '5551000018', 'monica18@mail.com', '1234', 1, 2),
(21, 'vend25', 'Rafael', 'Miranda', 'Sosa', '1990-08-28', 'M', '5551000019', 'rafael19@mail.com', '1234', 1, 2),
(22, 'vend26', 'Lucia', 'Torres', 'Nieto', '1999-09-29', 'F', '5551000020', 'lucia20@mail.com', '1234', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha`, `total`, `id_usuario`) VALUES
(1, '2025-02-10', 180.00, 2),
(2, '2025-02-12', 250.00, 2),
(3, '2025-02-15', 200.00, 3),
(4, '2025-02-16', 350.00, 4),
(5, '2025-02-17', 150.00, 5),
(6, '2025-02-18', 420.00, 6),
(7, '2025-02-19', 310.00, 7),
(8, '2025-02-20', 280.00, 3),
(9, '2025-02-21', 500.00, 4),
(10, '2025-02-22', 190.00, 5),
(11, '2025-02-23', 600.00, 6),
(12, '2025-02-24', 220.00, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `id_venta_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_detalles`
--

INSERT INTO `venta_detalles` (`id_venta_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 10, 18.00, 180.00),
(2, 2, 2, 10, 25.00, 250.00),
(3, 3, 3, 10, 20.00, 200.00),
(4, 4, 4, 20, 15.00, 300.00),
(5, 5, 5, 10, 12.00, 120.00),
(6, 6, 6, 12, 35.00, 420.00),
(7, 7, 7, 10, 30.00, 300.00),
(8, 8, 1, 15, 18.00, 270.00),
(9, 9, 2, 20, 25.00, 500.00),
(10, 10, 3, 8, 20.00, 160.00),
(11, 11, 4, 40, 15.00, 600.00),
(12, 12, 5, 18, 12.00, 216.00);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_completa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_completa` (
`producto` varchar(100)
,`laboratorio` varchar(100)
,`tipo` varchar(100)
,`presentacion` varchar(100)
,`proveedor` varchar(100)
,`stock` int(11)
,`precio_venta` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_por_caducar`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_por_caducar` (
`nombre` varchar(100)
,`fecha_caducidad` date
,`stock` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_reporte_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_reporte_ventas` (
`id_venta` int(11)
,`fecha` date
,`usuario` varchar(201)
,`total` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_completa`
--
DROP TABLE IF EXISTS `vista_productos_completa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_completa`  AS SELECT `p`.`nombre` AS `producto`, `l`.`nombre` AS `laboratorio`, `tp`.`nombre` AS `tipo`, `pre`.`nombre` AS `presentacion`, `pr`.`nombre` AS `proveedor`, `p`.`stock` AS `stock`, `p`.`precio_venta` AS `precio_venta` FROM ((((`productos` `p` join `laboratorios` `l` on(`p`.`id_laboratorio` = `l`.`id_laboratorio`)) join `tipo_productos` `tp` on(`p`.`id_tipo_producto` = `tp`.`id_tipo_producto`)) join `presentaciones` `pre` on(`p`.`id_presentacion` = `pre`.`id_presentacion`)) join `proveedores` `pr` on(`p`.`id_proveedor` = `pr`.`id_proveedor`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_por_caducar`
--
DROP TABLE IF EXISTS `vista_productos_por_caducar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_por_caducar`  AS SELECT `productos`.`nombre` AS `nombre`, `productos`.`fecha_caducidad` AS `fecha_caducidad`, `productos`.`stock` AS `stock` FROM `productos` WHERE `productos`.`fecha_caducidad` <= curdate() + interval 6 month ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_reporte_ventas`
--
DROP TABLE IF EXISTS `vista_reporte_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_reporte_ventas`  AS SELECT `v`.`id_venta` AS `id_venta`, `v`.`fecha` AS `fecha`, concat(`u`.`nombre`,' ',`u`.`a_paterno`) AS `usuario`, `v`.`total` AS `total` FROM (`ventas` `v` join `usuarios` `u` on(`v`.`id_usuario` = `u`.`id_usuario`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `lote` (`lote`),
  ADD KEY `id_laboratorio` (`id_laboratorio`),
  ADD KEY `id_tipo_producto` (`id_tipo_producto`),
  ADD KEY `id_presentacion` (`id_presentacion`),
  ADD KEY `idx_producto_nombre` (`nombre`),
  ADD KEY `idx_producto_caducidad` (`fecha_caducidad`),
  ADD KEY `idx_producto_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `clave_usuario` (`clave_usuario`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `idx_usuario_nombre` (`nombre`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `idx_venta_fecha` (`fecha`);

--
-- Indices de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD PRIMARY KEY (`id_venta_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `presentaciones`
--
ALTER TABLE `presentaciones`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `id_venta_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorios` (`id_laboratorio`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_productos` (`id_tipo_producto`),
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_presentacion`) REFERENCES `presentaciones` (`id_presentacion`),
  ADD CONSTRAINT `productos_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD CONSTRAINT `venta_detalles_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `venta_detalles_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
