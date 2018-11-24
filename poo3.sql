-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2018 a las 22:27:38
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `poo3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artista`
--

CREATE TABLE `artista` (
  `id_artista` int(10) NOT NULL,
  `nombres_artista` varchar(200) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `artista`
--

INSERT INTO `artista` (`id_artista`, `nombres_artista`, `fecha_nacimiento`) VALUES
(1, 'Adam Levine', '1979-03-18'),
(2, 'Imagine Dragrons', '2012-02-14'),
(3, 'Vance Joy\r\n', '1987-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `id_cancion` int(10) NOT NULL,
  `nombres_cancion` varchar(200) NOT NULL,
  `id_artista` int(10) DEFAULT NULL,
  `id_genero` int(10) DEFAULT NULL,
  `id_disquera` int(10) DEFAULT NULL,
  `precio_venta` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`id_cancion`, `nombres_cancion`, `id_artista`, `id_genero`, `id_disquera`, `precio_venta`, `precio_compra`) VALUES
(1, 'Lost Starts', 1, 1, 1, 0, 0),
(2, 'Natural', 2, 2, 11, 0, 0),
(3, 'Whatever It Takes', 2, 3, 11, 0, 0),
(4, 'Believer', 2, 3, 11, 0, 0),
(5, 'Walking the Wire', 2, 1, 11, 0, 0),
(6, 'Thunder ', 2, 6, 11, 0, 0),
(7, 'Riptide', 3, 7, 12, 0, 0),
(8, 'Georgia', 3, 7, 12, 0, 0),
(9, 'yo no se', 3, 2, 6, 32000, 16000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL,
  `nombres_cliente` varchar(200) DEFAULT NULL,
  `cedula` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombres_cliente`, `cedula`) VALUES
(1, 'Pedro Gomez', 1112684225),
(2, 'Carolina Jaramillo', 1112684335),
(3, 'Yeisson Steven', 1112999909);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disquera`
--

CREATE TABLE `disquera` (
  `id_disquera` int(10) NOT NULL,
  `nombres_disquera` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `disquera`
--

INSERT INTO `disquera` (`id_disquera`, `nombres_disquera`) VALUES
(1, 'Motown'),
(2, 'Stax Records'),
(3, 'Universal Music Group'),
(4, 'Atlantic Records'),
(5, 'Epic Records'),
(6, 'RCA Records'),
(7, 'Chess Records'),
(8, 'Def Jam Recordings'),
(9, 'Columbia Records'),
(10, 'Interscope Records'),
(11, 'KIDinaKORNER'),
(12, 'Liberation Music\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `valor_factura` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `fecha`, `id_cliente`, `valor_factura`) VALUES
(1, '2018-11-22', 1, 1000),
(2, '2018-10-22', 1, 1),
(4, '2018-10-24', 3, 96000),
(6, '2018-10-24', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(10) NOT NULL,
  `nombres_genero` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombres_genero`) VALUES
(1, 'Pop'),
(2, 'Pop rock'),
(3, 'Folk rock'),
(4, 'Neo Sol'),
(5, 'Soft rock'),
(6, 'Electropop'),
(7, 'Indie Folk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_cancion`
--

CREATE TABLE `inventario_cancion` (
  `id_inventario_cancion` int(10) NOT NULL,
  `id_cancion` int(10) NOT NULL,
  `id_tienda` int(10) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `id_factura` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario_cancion`
--

INSERT INTO `inventario_cancion` (`id_inventario_cancion`, `id_cancion`, `id_tienda`, `cantidad`, `id_factura`) VALUES
(1, 1, 1, 1, 1),
(3, 3, 1, 3, 1),
(4, 4, 1, 4, 1),
(6, 6, 1, 6, 1),
(7, 8, 1, 0, 1),
(8, 1, 2, 2, 2),
(9, 9, 2, 5, 2),
(12, 9, 2, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(2) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` int(10) NOT NULL,
  `nombre_tienda` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `nombre_tienda`) VALUES
(1, 'La música de toño'),
(2, 'flacox tienda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `id_permiso` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombres`, `user`, `pass`, `id_permiso`) VALUES
(1, 'Cristian Marin', 'marin', '123', 1),
(2, 'Yeisson Castro', 'yeisson', '123', 1),
(3, 'Steven Gonzales', 'steven', '123', 1),
(4, 'Benito Camelas', 'vendedor', '123', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tienda`
--

CREATE TABLE `usuario_tienda` (
  `id_usuario_tienda` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_tienda` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_tienda`
--

INSERT INTO `usuario_tienda` (`id_usuario_tienda`, `id_usuario`, `id_tienda`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`id_cancion`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_disquera` (`id_disquera`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `disquera`
--
ALTER TABLE `disquera`
  ADD PRIMARY KEY (`id_disquera`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `inventario_cancion`
--
ALTER TABLE `inventario_cancion`
  ADD PRIMARY KEY (`id_inventario_cancion`),
  ADD KEY `id_cancion` (`id_cancion`),
  ADD KEY `id_tienda` (`id_tienda`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_tienda`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `usuario_tienda`
--
ALTER TABLE `usuario_tienda`
  ADD PRIMARY KEY (`id_usuario_tienda`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tienda` (`id_tienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artista`
--
ALTER TABLE `artista`
  MODIFY `id_artista` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `id_cancion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `disquera`
--
ALTER TABLE `disquera`
  MODIFY `id_disquera` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `inventario_cancion`
--
ALTER TABLE `inventario_cancion`
  MODIFY `id_inventario_cancion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id_tienda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario_tienda`
--
ALTER TABLE `usuario_tienda`
  MODIFY `id_usuario_tienda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD CONSTRAINT `cancion_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  ADD CONSTRAINT `cancion_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `cancion_ibfk_3` FOREIGN KEY (`id_disquera`) REFERENCES `disquera` (`id_disquera`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `inventario_cancion`
--
ALTER TABLE `inventario_cancion`
  ADD CONSTRAINT `inventario_cancion_ibfk_1` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`),
  ADD CONSTRAINT `inventario_cancion_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`),
  ADD CONSTRAINT `inventario_cancion_ibfk_3` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`);

--
-- Filtros para la tabla `usuario_tienda`
--
ALTER TABLE `usuario_tienda`
  ADD CONSTRAINT `usuario_tienda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `usuario_tienda_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
