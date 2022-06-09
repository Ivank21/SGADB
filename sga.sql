-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2022 a las 12:18:54
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `idAuditoria` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `proceso` varchar(50) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `ruc` varchar(50) NOT NULL,
  `idTipoCliente` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `limiteCredito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `ruc`, `idTipoCliente`, `idPersona`, `idMoneda`, `limiteCredito`) VALUES
(1, '131321332', 1, 1, 1, 3000000),
(2, '98756651-1', 1, 2, 1, 3000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `idCotizacion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idMoneda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctacobrar`
--

CREATE TABLE `ctacobrar` (
  `idCtaCobrar` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `idVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `nombre`) VALUES
(1, 'Concepción'),
(2, 'San Pedro'),
(3, 'Cordillera'),
(4, 'Guairá'),
(5, 'Caaguazú'),
(6, 'Caazapá'),
(7, 'Itapúa'),
(8, 'Misiones'),
(9, 'Paraguarí'),
(10, 'Alto Paraná'),
(11, 'Central'),
(12, 'Ñeembucú'),
(13, 'Amambay'),
(14, 'Canindeyú'),
(15, 'Presidente Hayes'),
(16, 'Boquerón'),
(17, 'Alto Paraguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

CREATE TABLE `deposito` (
  `idDeposito` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deposito`
--

INSERT INTO `deposito` (`idDeposito`, `idSucursal`, `nombre`) VALUES
(1, 1, 'Central'),
(2, 2, 'Central 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleprecio`
--

CREATE TABLE `detalleprecio` (
  `idPrecioDetalle` int(11) NOT NULL,
  `idPrecio` int(11) NOT NULL,
  `codBara` varchar(75) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `codBara` varchar(75) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `descuento` double NOT NULL,
  `bonificacion` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `idDevolucion` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `motivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `puesto` varchar(75) NOT NULL,
  `salario` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaSalida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `idPersona`, `puesto`, `salario`, `FechaIngreso`, `FechaSalida`) VALUES
(1, 1, 'Jefe', 0, '0000-00-00', NULL),
(2, 2, 'Cajero', 3000000, '2022-05-16', NULL),
(3, 3, 'Deposito', 3000000, '2022-05-01', NULL),
(4, 4, 'a', 4165165, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `nroFactura` varchar(50) NOT NULL,
  `fechaFactura` date NOT NULL,
  `timbrado` varchar(50) NOT NULL,
  `vencimiento` date NOT NULL,
  `serie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idLocalidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`idLocalidad`, `nombre`, `idDepartamento`) VALUES
(1, 'Itape', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `idMenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `idMoneda` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`idMoneda`, `nombre`) VALUES
(1, 'Guarani'),
(2, 'Dólar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosclientes`
--

CREATE TABLE `pedidosclientes` (
  `idPedidoCliente` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `codBara` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idPermiso` int(11) NOT NULL,
  `permiso` varchar(50) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `idLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `nombre`, `apellido`, `cedula`, `email`, `telefono`, `direccion`, `idLocalidad`) VALUES
(1, 'Juan', 'Perez', '123488', 'jperez@gmail.com', '0987654321', 'Avenida San Juan', 1),
(2, 'Maria', 'Garcia', '987654', 'mgarcia@gmail.com', '0987563256', 'Avenida San Marcos', 1),
(3, 'Marcos', 'Gonzales', '256347', 'mgonzales@gmail.com', '0983652369', 'Avenida San Martin', 1),
(4, 'Carlos', 'Gomez', '465236', 'carlosgomez@gmail.com', '0987136525', 'Avda San Juan', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazos`
--

CREATE TABLE `plazos` (
  `idPlazo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

CREATE TABLE `precios` (
  `idPrecio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `aprobado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productodetalle`
--

CREATE TABLE `productodetalle` (
  `codBarra` varchar(75) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `medida` varchar(50) NOT NULL,
  `peso` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `stockMinimo` int(11) NOT NULL,
  `stockActual` int(11) NOT NULL,
  `ultimaCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Encargado de Deposito'),
(3, 'Cajero'),
(4, 'Gestor de pedidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `idSucursal` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`idSucursal`, `nombre`, `idLocalidad`) VALUES
(1, 'Sucursal 1', 1),
(2, 'Sucursal 2', 1),
(4, 'Sucursal 3', 1),
(5, 'Sucursal 4', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `nombre`) VALUES
(1, 'Tipo 1'),
(2, 'Tipo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `idTipoDoc` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `activo` varchar(2) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contrasena`, `activo`, `idRol`, `idEmpleado`) VALUES
(1, 'Jperez', 'e1dc99ba9abbe6e07f288e', 'A', 1, 1),
(2, 'MariaGarcia', 'e1dc99ba9abbe6e07f288e', 'A', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `numeroFactura` varchar(50) NOT NULL,
  `fechaProceso` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `montoTotal` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idPlazo` int(11) NOT NULL,
  `idTipoDoc` int(11) NOT NULL,
  `idPedidoCliente` int(11) NOT NULL,
  `idDeposito` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `pagoInicial` int(11) NOT NULL,
  `idPrecio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`idAuditoria`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idPersona` (`idPersona`),
  ADD KEY `idMoneda` (`idMoneda`),
  ADD KEY `idTipoCliente` (`idTipoCliente`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`idCotizacion`),
  ADD KEY `idMoneda` (`idMoneda`);

--
-- Indices de la tabla `ctacobrar`
--
ALTER TABLE `ctacobrar`
  ADD PRIMARY KEY (`idCtaCobrar`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indices de la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`idDeposito`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `detalleprecio`
--
ALTER TABLE `detalleprecio`
  ADD PRIMARY KEY (`idPrecioDetalle`),
  ADD KEY `idPrecio` (`idPrecio`,`codBara`),
  ADD KEY `codBara` (`codBara`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `idVenta` (`idVenta`,`codBara`),
  ADD KEY `codBara` (`codBara`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`nroFactura`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idLocalidad`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`idMoneda`);

--
-- Indices de la tabla `pedidosclientes`
--
ALTER TABLE `pedidosclientes`
  ADD PRIMARY KEY (`idPedidoCliente`),
  ADD KEY `idProductoDetalle` (`codBara`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idPermiso`),
  ADD KEY `idRol` (`idRol`,`idMenu`),
  ADD KEY `idMenu` (`idMenu`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `idLocalidad` (`idLocalidad`);

--
-- Indices de la tabla `plazos`
--
ALTER TABLE `plazos`
  ADD PRIMARY KEY (`idPlazo`);

--
-- Indices de la tabla `precios`
--
ALTER TABLE `precios`
  ADD PRIMARY KEY (`idPrecio`),
  ADD KEY `idMoneda` (`idMoneda`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `productodetalle`
--
ALTER TABLE `productodetalle`
  ADD PRIMARY KEY (`codBarra`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idSucursal`),
  ADD KEY `idLocalidad` (`idLocalidad`);

--
-- Indices de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`idTipoDoc`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `idRol` (`idRol`,`idEmpleado`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idCliente` (`idCliente`,`idMoneda`,`idPlazo`,`idTipoDoc`,`idPedidoCliente`,`idDeposito`),
  ADD KEY `idMoneda` (`idMoneda`),
  ADD KEY `idPedidoCliente` (`idPedidoCliente`),
  ADD KEY `idDeposito` (`idDeposito`),
  ADD KEY `idTipoDoc` (`idTipoDoc`),
  ADD KEY `idPlazo` (`idPlazo`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `numeroFactura` (`numeroFactura`),
  ADD KEY `idPrecio` (`idPrecio`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`idMoneda`) REFERENCES `monedas` (`idMoneda`),
  ADD CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`idTipoCliente`) REFERENCES `tipocliente` (`idTipoCliente`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`idMoneda`) REFERENCES `monedas` (`idMoneda`);

--
-- Filtros para la tabla `ctacobrar`
--
ALTER TABLE `ctacobrar`
  ADD CONSTRAINT `ctacobrar_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`);

--
-- Filtros para la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`);

--
-- Filtros para la tabla `detalleprecio`
--
ALTER TABLE `detalleprecio`
  ADD CONSTRAINT `detalleprecio_ibfk_1` FOREIGN KEY (`idPrecio`) REFERENCES `precios` (`idPrecio`),
  ADD CONSTRAINT `detalleprecio_ibfk_2` FOREIGN KEY (`codBara`) REFERENCES `productodetalle` (`codBarra`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`codBara`) REFERENCES `productodetalle` (`codBarra`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`);

--
-- Filtros para la tabla `pedidosclientes`
--
ALTER TABLE `pedidosclientes`
  ADD CONSTRAINT `pedidosclientes_ibfk_1` FOREIGN KEY (`codBara`) REFERENCES `productodetalle` (`codBarra`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`);

--
-- Filtros para la tabla `precios`
--
ALTER TABLE `precios`
  ADD CONSTRAINT `precios_ibfk_1` FOREIGN KEY (`idMoneda`) REFERENCES `monedas` (`idMoneda`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `productodetalle`
--
ALTER TABLE `productodetalle`
  ADD CONSTRAINT `productodetalle_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idMoneda`) REFERENCES `monedas` (`idMoneda`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idPedidoCliente`) REFERENCES `pedidosclientes` (`idPedidoCliente`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idDeposito`) REFERENCES `deposito` (`idDeposito`),
  ADD CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `ventas_ibfk_5` FOREIGN KEY (`idTipoDoc`) REFERENCES `tipodoc` (`idTipoDoc`),
  ADD CONSTRAINT `ventas_ibfk_6` FOREIGN KEY (`idPlazo`) REFERENCES `plazos` (`idPlazo`),
  ADD CONSTRAINT `ventas_ibfk_7` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ventas_ibfk_8` FOREIGN KEY (`numeroFactura`) REFERENCES `facturas` (`nroFactura`),
  ADD CONSTRAINT `ventas_ibfk_9` FOREIGN KEY (`idPrecio`) REFERENCES `precios` (`idPrecio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
