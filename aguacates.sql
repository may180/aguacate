-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-03-2024 a las 22:49:47
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
-- Base de datos: `aguacates`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aguacate`
--

CREATE TABLE `aguacate` (
  `ID` int(11) NOT NULL,
  `municipio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aguacate`
--

INSERT INTO `aguacate` (`ID`, `municipio`) VALUES
(1, 'Samana'),
(2, 'Norcasia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `productoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`productoID`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginainformacion`
--

CREATE TABLE `paginainformacion` (
  `productoID` int(11) DEFAULT NULL,
  `datosContacto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paginainformacion`
--

INSERT INTO `paginainformacion` (`productoID`, `datosContacto`) VALUES
(1, 'Para consultas, llame al 123-456-7890'),
(2, 'Visítenos en www.tiendadehelados.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidadStock` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `nombre`, `descripcion`, `precio`, `cantidadStock`, `categoria`) VALUES
(1, 'Aguacate Premium', 'Aguacate de alta calidad', 2.99, 100, 'Aguacates'),
(2, 'Helado de Vainilla', 'Helado suave y cremoso', 4.99, 50, 'Helados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemainventario`
--

CREATE TABLE `sistemainventario` (
  `usuarioID` int(11) DEFAULT NULL,
  `transaccionID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistemainventario`
--

INSERT INTO `sistemainventario` (`usuarioID`, `transaccionID`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `ID` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `productoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`ID`, `tipo`, `fecha`, `hora`, `cantidad`, `motivo`, `productoID`) VALUES
(1, 'Entrada', '2024-03-11', '14:30:00', 100, 'Compra de productos', 1),
(2, 'Salida', '2024-03-12', '10:45:00', 20, 'Venta al cliente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nivelAcceso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `nombre`, `nivelAcceso`) VALUES
(1, 'Usuario1', 1),
(2, 'Usuario2', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `transaccionID` int(11) NOT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `metodoPago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`transaccionID`, `cliente`, `metodoPago`) VALUES
(1, 'Cliente1', 'Tarjeta de crédito'),
(2, 'Cliente2', 'Efectivo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aguacate`
--
ALTER TABLE `aguacate`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD KEY `productoID` (`productoID`);

--
-- Indices de la tabla `paginainformacion`
--
ALTER TABLE `paginainformacion`
  ADD KEY `productoID` (`productoID`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `sistemainventario`
--
ALTER TABLE `sistemainventario`
  ADD KEY `usuarioID` (`usuarioID`),
  ADD KEY `transaccionID` (`transaccionID`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `productoID` (`productoID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`transaccionID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aguacate`
--
ALTER TABLE `aguacate`
  ADD CONSTRAINT `aguacate_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `paginainformacion`
--
ALTER TABLE `paginainformacion`
  ADD CONSTRAINT `paginainformacion_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `sistemainventario`
--
ALTER TABLE `sistemainventario`
  ADD CONSTRAINT `sistemainventario_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `sistemainventario_ibfk_2` FOREIGN KEY (`transaccionID`) REFERENCES `transaccion` (`ID`);

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`transaccionID`) REFERENCES `transaccion` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
