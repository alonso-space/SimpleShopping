-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2026 a las 14:45:59
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
-- Base de datos: `db-ventas`
--
CREATE DATABASE IF NOT EXISTS `db-ventas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db-ventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `nombre_cat` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre_cat`, `descripcion`) VALUES
(1, 'Vinos', 'Vinos de todo tipo'),
(2, 'Bebidas', 'Bebidas sin alcohol'),
(3, 'Conservas', 'Pesados y mariscos'),
(4, 'Lacteos', 'Derivados de productos lacteos'),
(5, 'Embutidos', 'Embutidos de todo tipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido1` varchar(40) NOT NULL,
  `apellido2` varchar(40) NOT NULL,
  `run` varchar(20) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `password` varchar(120) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `role` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `apellido1`, `apellido2`, `run`, `correo`, `password`, `edad`, `fecha_nacimiento`, `role`) VALUES
(1, 'Esteban', 'Bustos', 'Toledo', '18456325-2', 'esteban@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 26, '1998-04-10', 'user'),
(2, 'Natalia', 'Luengo', 'Salinas', '18456321-2', 'natalia_l@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 20, '2003-05-23', 'admin'),
(3, 'José', 'Romero', 'Urrutia', '18456987-3', 'jose@outlook.com.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 20, '2000-06-10', ''),
(4, 'Roberto', 'Molina', 'Valenzuela', '19256324-k', 'roberto@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 30, '1993-03-26', ''),
(5, 'Alan', 'Beltrán', 'Martinez', '16258745-2', 'alanj@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 35, '1998-07-15', ''),
(6, 'Bere', 'González', 'Naranjo', '16254789-2', 'bereg@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 38, '1985-10-30', ''),
(7, 'Alejandro', 'Campos', 'Hernandez', '15745854-6', 'alejandroc@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 45, '1978-01-12', ''),
(8, 'Diego', 'Cedillo', 'Berumen', '16287365-2', 'diegoc@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 31, '1992-12-30', ''),
(9, 'Aurora', 'Escalante', 'Palafox', '16875412-3', 'aurorae@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 28, '1995-05-23', ''),
(10, 'Joselin', 'Estrada', 'Barra', '15742369-1', 'joseline@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 25, '1998-08-09', ''),
(11, 'Francisco', 'Estrada', 'Gómez', '17563214-4', 'franciscoe@outlook.com.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 43, '1978-05-23', ''),
(12, 'Daniel', 'Rosas', 'Farias', '14563587-4-2', 'danielr@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 42, '1981-07-09', ''),
(13, 'Andres', 'Fierro', 'Robles', '18125478-3', 'andresf@outlook.com.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 56, '1967-07-01', ''),
(14, 'Ignacio', 'Sanpeter', 'Gómez', '9254124-1', 'ignaios@outlook.com.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 65, '1958-03-27', ''),
(15, 'Javier', 'Grial', 'Castañeda', '', 'natalia@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/J5tvW3OTh6RY9pKimT3A$js+eLpuottBv6LLFAoKZTZEjnukfIlDBR4ADctFXdBk', 55, '1968-12-27', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `iva` int(11) NOT NULL,
  `total_pagar` int(11) NOT NULL,
  `total_descuento` int(11) NOT NULL,
  `tipo_pago` varchar(30) NOT NULL,
  `num_serie` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`compra_id`, `cliente_id`, `fecha_compra`, `iva`, `total_pagar`, `total_descuento`, `tipo_pago`, `num_serie`) VALUES
(1, 1, '2023-01-05 03:00:00', 11400, 60000, 0, 'efectivo', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE `detalles_compras` (
  `detalle_compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`detalle_compra_id`, `producto_id`, `compra_id`, `cantidad`, `precio`, `descuento`) VALUES
(1, 12, 1, 2, 2560, 0),
(2, 22, 1, 2, 16850, 0),
(3, 25, 1, 1, 720, 0),
(4, 33, 1, 3, 6980, 480);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre_prod` varchar(60) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `cantidad_prod` int(11) DEFAULT NULL,
  `stock_minimo` int(11) NOT NULL,
  `imagen` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `categoria_id`, `nombre_prod`, `precio_compra`, `precio_venta`, `codigo`, `fecha_vencimiento`, `cantidad_prod`, `stock_minimo`, `imagen`) VALUES
(1, 1, 'Vino Casa Silva Quinta Generacion Ensamblaje', 19990, 23990, 1000, '2060-06-20', 100, 10, 'casasilva.jpg'),
(2, 1, 'Vino Miguel Torres Gran Reserva Carmenere 750 cc', 10590, 13692, 1001, '2060-12-20', 80, 5, 'migueltorres.jpg'),
(3, 1, 'Vino Orgánico Las Mulas Reserva Carmenere 13.5° botella 750 ', 12590, 14692, 1002, '2061-11-23', 75, 6, 'lasmulas.jpg'),
(4, 1, 'Vino Carmenere botella 750 cc', 8790, 1260, 1003, '2063-05-10', 62, 4, 'carmenere.jpg'),
(5, 1, 'Vino Adobe Orgánico Carmenere 750 cc', 6490, 9860, 1004, '2060-06-30', 55, 3, 'adobe.jpg'),
(6, 1, 'Concha Y Toro Vino Casillero Del Diablo Cabernet Sauvignon 7', 5690, 7890, 1005, '2030-10-09', 96, 4, 'conchaytoro2.jpg'),
(7, 1, 'Toro De Piedra Vino Carmenere Toro de Piedra Gran Reserva 14', 10600, 2560, 1006, '2028-10-18', 123, 10, 'conchaytoro3.jpg'),
(8, 1, 'Carmen Vino Insigne Chardonnay 750 cc 1 un', 2750, 3680, 1007, '2032-05-11', 123, 6, 'carmen.jpg'),
(9, 2, 'Bebida sin azúcar 1.5 Lc', 1500, 1990, 2000, '2027-06-16', 45, 5, 'fanta1.jpg'),
(10, 2, 'Bebida ginger ale zero 1.5 L', 1200, 1560, 2001, '2027-08-26', 50, 3, 'gingere1.jpg'),
(11, 2, 'Bebida Coca-Cola sin azúcar 3 L', 2990, 3290, 2002, '2027-11-08', 40, 7, 'coca-cola1.jpg'),
(12, 2, 'Bebida ginger ale light 1.5 L', 1910, 2560, 2003, '2027-03-14', 30, 5, 'ginger2.jpg'),
(13, 2, 'Kem Bebida Kem 1.5 L 1 un', 1910, 2220, 2004, '2027-02-26', 35, 5, 'limon-soda2.jpg'),
(14, 2, 'Coca-Cola Bebida Coca Coca sin azúcar 591 ml 1 un', 1010, 1210, 2004, '2027-05-05', 35, 5, 'cocacola1.jpg'),
(15, 3, 'Jurel al natural lata 300 g drenado san jorge', 1850, 2060, 1009, '2027-05-25', 40, 5, 'jurel1.jpg'),
(16, 3, 'Cuisine & Co Jurel al natural 300 g drenado', 1500, 1890, 1009, '2027-05-19', 48, 6, 'jurel2.jpg'),
(17, 3, 'Cuisine & CoAtún lomitos en agua 220 g drenado', 2600, 2890, 1010, '2027-02-09', 78, 6, 'atun1.jpg'),
(18, 3, 'Robinson CrusoeAtún lomitos ahumados 104 g drenado', 1720, 2060, 1011, '2027-11-23', 85, 5, 'atun2.jpg'),
(19, 3, 'Van Camps Atún lomitos en agua 104 g drenado', 1800, 2050, 1012, '2027-02-19', 42, 6, 'atun3.jpg'),
(20, 3, 'Robinson Crusoe Surtido de mariscos 200 g drenado', 3180, 3410, 1013, '2027-03-24', 55, 7, 'marisco1.jpg'),
(21, 3, 'Robinson Crusoe Choritos lata 200 g drenado', 3870, 3990, 1014, '2027-06-02', 65, 7, 'marisco2.jpg'),
(22, 3, 'Robinson Crusoe Machas al natural 425 g', 15990, 16850, 1015, '2027-03-23', 67, 2, 'marisco3.jpg'),
(23, 4, 'Rumay Mantequilla con sal 200 g', 2220, 2460, 1016, '2027-04-20', 57, 8, 'mantequilla1.jpg'),
(24, 4, 'Cuisine & Co Leche descremada 1 L', 930, 1210, 1017, '2027-04-13', 58, 5, 'leche1.jpg'),
(25, 4, 'Soprole Protein+Yoghurt proteína vainilla 155 g', 600, 720, 1018, '2027-07-18', 65, 5, 'yogurt1.jpg'),
(26, 4, 'Colun Mantequilla 200 g', 3090, 3260, 1019, '2027-04-06', 93, 5, 'mantequilla3.jpg'),
(27, 4, 'Colun Mantequilla con sal 250 g', 2790, 2980, 1020, '2027-05-20', 76, 2, 'mantequilla4.jpg'),
(28, 5, 'La Preferida Jamón cocido de pavo granel 100 g', 1940, 2250, 1021, '2027-09-07', 96, 2, 'jamon1.jpg'),
(29, 5, 'Receta Del AbueloJamón pierna artesanal corte pluma 125 g 1 ', 2190, 2360, 1022, '2027-08-25', 69, 4, 'jamon2.jpg'),
(30, 5, 'PF Salame italiano PF granel 100 g', 1460, 1690, 1023, '2027-10-22', 89, 6, 'salame1.jpg'),
(31, 5, 'Cuisine & CoJamón Serrano Reserva 100 g1 un', 2990, 3190, 1024, '2027-12-17', 89, 6, 'salame2.jpg'),
(32, 5, 'Llanquihue Salchicha tradicional 10 un. 1 un', 5990, 6980, 1025, '2027-09-23', 68, 5, 'salachicha1.jpg'),
(33, 5, 'Sopraval Pechuga de Pavo asada granel 100 g', 1630, 1830, 1026, '2027-10-08', 53, 3, 'pechiga-asada1.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`),
  ADD UNIQUE KEY `CATEGORIAS_PK` (`categoria_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `CLIENTES_PK` (`cliente_id`),
  ADD UNIQUE KEY `run` (`run`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compra_id`),
  ADD UNIQUE KEY `VENTAS_PK` (`compra_id`),
  ADD KEY `CLIENTE_VENTA_FK` (`cliente_id`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD PRIMARY KEY (`detalle_compra_id`),
  ADD UNIQUE KEY `DETALLES_VENTAS_PK` (`detalle_compra_id`),
  ADD KEY `PRODUCTO_DETALLE_VENTA_FK` (`producto_id`),
  ADD KEY `RELATIONSHIP_2_FK` (`compra_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD UNIQUE KEY `PRODUCTOS_PK` (`producto_id`),
  ADD KEY `CATEGORIA_PRODUCTO_FK` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `compra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  MODIFY `detalle_compra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_VENTAS_CLIENTE_V_CLIENTES` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`);

--
-- Filtros para la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD CONSTRAINT `FK_DETALLES_PRODUCTO__PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  ADD CONSTRAINT `FK_DETALLES_RELATIONS_VENTAS` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`compra_id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_PRODUCTO_CATEGORIA_CATEGORI` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
