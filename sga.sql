-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2022 a las 23:39:22
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
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `categoria`) VALUES
(1, 'Plomeria'),
(2, 'Electricidades'),
(3, 'Ferreteria'),
(4, 'Bulones');

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
(1, '123456-9', 1, 1, 1, 3000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `idColor` int(11) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`idColor`, `color`) VALUES
(1, 'Rojo'),
(2, 'AZUL'),
(4, 'Violeta'),
(5, 'Verde'),
(7, 'Amarillo'),
(8, 'Celeste');

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
  `departamento` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `departamento`) VALUES
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
(1, 1, 'Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleprecio`
--

CREATE TABLE `detalleprecio` (
  `idPrecioDetalle` int(11) NOT NULL,
  `idPrecio` int(11) NOT NULL,
  `codBarra` varchar(75) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `codBarra` varchar(75) NOT NULL,
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
-- Estructura de tabla para la tabla `diseño`
--

CREATE TABLE `diseño` (
  `idDiseño` int(11) NOT NULL,
  `diseño` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `diseño`
--

INSERT INTO `diseño` (`idDiseño`, `diseño`) VALUES
(1, 'pequeño'),
(2, 'grande');

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
(1, 1, 'Cajero', 3000000, '2022-10-30', '2022-11-26'),
(2, 2, 'Cajero', 1500000, '2022-10-13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `imagen` longtext DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `ruc` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombre`, `imagen`, `telefono`, `direccion`, `idLocalidad`, `ruc`) VALUES
(1, 'Prueba', '/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a\r\nHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy\r\nMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAHsAlgDASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iii\r\ngAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKK47xR40i04PZ6eVlu+jP1WM/wBT7VnUqxpx5pG1ChUrz5KauzS8QeJ7TRIMEiW6\r\nYfJCD19yewrx7XPGGtWetWurxXZE+WBT/lmV4+Xb6frUk80tzO800jSSOcszHJJrnfE33bb/AIF/\r\nSvHqYudSd1oj7PLcro0fdmuZvc9y8HeN9P8AFVrtUiG+QZltmPI919R/k11lfI9pd3FjdR3NrM8M\r\n8Z3I6HBBr3DwJ8TINb8vTdXZYNRPCSdEn+no3t37eld9DEqXuy3PKzbIpYe9WhrDt2/4B6PRRnPQ\r\n0tdp82FFFGKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA\r\nCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKa7rGhZyAoGSScACq99fW2nWz3N1KsUSjJJ/p6mvLPEni\r\ny41t2gh3Q2XZM8ye7f4Vz18RGitdztweBq4qVo7dzW8T+N2uA9lpTlI+j3CnlvZfQe/5VxB5pBS1\r\n4lWtKrK8j7DDYWnhocsEJWB4m+7bf8C/pW/WB4m+7bf8C/pUQ3O/D/xEc9Sg4pBS1sekereBfik9\r\np5WmeIJWeD7sV43JT0D+o/2vz9a9ljkSaNZI3V0YBlZTkEHvmvkSu28FfEO98MyJa3O+50snmMn5\r\novdP8P5V30MVb3ZnyubZAp3rYZWfVf5H0PS1S0zVLPWLCK9sZ1mt5BlWU/ofQ+1Xc16Cd1dHxkou\r\nLcZKzCiiimIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK\r\nKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo\r\nooAKKKKACiiigAooooAKyta16z0O1Mty2ZDkRxL95z7f41neJfFtvoqmCHbNekcR54X3b0+nevLr\r\n2+udRunubuUySv1J7ewHYVxYnFxp+7HVnr5flcsQ1OekfzLeta5ea5debcviNT+7iX7qD+p96y8U\r\n6ivFlOUneR9ZTpwpxUYKyEoooqSgrL8SaXfvpcGoraSmzV2UzY+UE4x+Hv0r0jwz4Je7CXmqxlIO\r\nqQHgv7n0Ht1rvWNiynT2ERQptMJAxt9MdPwrupYZWUqjtfY8nEZ1GhVSpLmtufJ2KWvUfHXwvksD\r\nLqWgxtJbfektRy0fuvqPbqPft5dU1KcqbtI+lweNo4unz0n8uwlFFFQdZveGPFmpeFr7z7N90Lke\r\ndbufkkH9D719B+GfFeneKNPFxZyYlUDzYWPzxn3Hp718v1c0vVb3Rb+O90+dobhDwy9x6Edx7V00\r\nMRKno9jxM0yanjFzw0n37+p9ZUVxPgn4g2XiiIW1wVttTUfNCTw/uh7/AE6iu2r1YTU1dHwNfD1M\r\nPN06is0FFFFUYhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF\r\nABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA\r\nFFFFABRRUU88VtA80zqkaDLMxwAKG7AlfREpOBk1wnijxssBey0tg8o4ecHKp9PU/oKyvE3jOXUC\r\n1ppxaK0OQ0nRpR7eg/nXHivLxONt7tP7z6PL8o2q118v8x7u0kjO7FnY5Zickn1ptFFeW2fRpWWg\r\ntFFWtP0661S7S2tIjJI3U9lHqT2FOMXJ2REpRgnKTskV445JpUiiRpJHOFVRkk16N4Y8GJp+y91J\r\nVkueqxHlYz7+p/lWnoPhmy8PW/nysslyV+eZuMD0X0H86ZqGrtcAxQErF3Pdv8BW9atRy+HtK2su\r\niPncVj6mKk6VDSPVlnUdY27obVhnu/p9Kwtzbt247s5z3z60E0lfG43MK2Lqc836LsTSoxpqyN3T\r\ntYD7YLojPQOe/wBa5Hx18M4dWEupaKixXxy0kPRJj6+zfoe/rWhWppurNbkRTEtF691/+tXu5Zna\r\naVDF7dH/AJkRVXDVPbYd2fbufN1xbzWlw9vcRNFNGdrxuMFT6EVFX0Z4t8D6b4utPtCMsN+F/dXK\r\nDqP7reo/lXges6Jf6BqD2OowGKVeQequPVT3Fe3UouOq1Xc+ty3NqWMjbaa3X+RnUtFJWJ62xJFL\r\nJBMk0UjRyIdyshwVPYg17N4F+KSXvlaZr0ix3OAsd0eFk9m9D79D7d/FaUVrSrSpO6ODH5dRxsOW\r\notej6o+vQwIyOlLXhHgX4mzaMY9O1l3m08cJNyXhHv6r+o/SvcLW6gvbZLi2lSWGQBkdDkMPUGvW\r\npVY1FdH57j8vrYKpy1Fp0fRk9FFFanCFFFc7rPjbQNAvhZ6lfeTOUD7fKZuDn0B9KUpKOrNKdKdV\r\n8tNNvyOiorjf+FpeEP8AoKN/4Dyf/E0f8LS8If8AQTb/AMB5P/iaj2sO6N/7Pxf/AD7l9zOyorjf\r\n+FpeEP8AoKN/4Dyf/E0f8LS8If8AQUb/AMB5P/iaPa0+6D6hi/8An3L7mdlRXG/8LS8If9BRv/Ae\r\nT/4mr2k+PPDut6gljp98ZblwSqeS65wMnkjFCqweiZMsFiYLmlTaXozpKKKK0OYKKKKACiiigAoo\r\n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', '0981321654', 'Avenida X', 65, '123456-7');

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
-- Estructura de tabla para la tabla `formapagos`
--

CREATE TABLE `formapagos` (
  `idFormaPago` int(11) NOT NULL,
  `formaPago` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formapagos`
--

INSERT INTO `formapagos` (`idFormaPago`, `formaPago`) VALUES
(1, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idLocalidad`, `localidad`, `idDepartamento`) VALUES
(1, 'Arroyito', 1),
(2, 'Azotey', 1),
(3, 'Belén', 1),
(4, 'Concepción', 1),
(5, 'Horqueta', 1),
(6, 'Loreto', 1),
(7, 'Paso Barreto', 1),
(8, 'San Alfredo', 1),
(9, 'San Carlos del Apa', 1),
(10, 'San Lázaro', 1),
(11, 'Sargento José Félix López', 1),
(12, 'Yby Yaú', 1),
(13, 'Paso Horqueta', 1),
(14, 'Itacuá', 1),
(15, 'Antequera', 2),
(16, 'Capiibary', 2),
(17, 'Choré', 2),
(18, 'General Elizardo Aquino', 2),
(19, 'General Isidoro Resquín', 2),
(20, 'Guayaibí', 2),
(21, 'Itacurubí del Rosario', 2),
(22, 'Liberación', 2),
(23, 'Lima', 2),
(24, 'Nueva Germania', 2),
(25, 'San Estanislao', 2),
(26, 'San Pablo', 2),
(27, 'San Pedro del Ycuamandyyú', 2),
(28, 'Santa Rosa del Aguaray', 2),
(29, 'San Vicente Pancholo', 2),
(30, 'Tacuatí', 2),
(31, 'Unión', 2),
(32, '25 de Diciembre', 2),
(33, 'Villa del Rosario', 2),
(34, 'Yataity del Norte', 2),
(35, 'Yrybucuá', 2),
(36, 'San José del Rosario', 2),
(37, 'Altos', 3),
(38, 'Arroyos y Esteros', 3),
(39, 'Atyrá', 3),
(40, 'Caacupé', 3),
(41, 'Caraguatay', 3),
(42, 'Emboscada', 3),
(43, 'Eusebio Ayala', 3),
(44, 'Isla Pucú', 3),
(45, 'Itacurubí de la Cordillera', 3),
(46, 'Juan de Mena', 3),
(47, 'Loma Grande', 3),
(48, 'Mbocayaty del Yhaguy', 3),
(49, 'Nueva Colombia', 3),
(50, 'Piribebuy', 3),
(51, 'Primero de Marzo', 3),
(52, 'San Bernardino', 3),
(53, 'San José Obrero', 3),
(54, 'Santa Elena', 3),
(55, 'Tobatí', 3),
(56, 'Valenzuela', 3),
(57, 'Borja', 4),
(58, 'Capitán Mauricio José Troche', 4),
(59, 'Coronel Martínez', 4),
(60, 'Doctor Bottrell', 4),
(61, 'Félix Pérez Cardozo', 4),
(62, 'General Eugenio A. Garay', 4),
(63, 'Independencia', 4),
(64, 'Itapé', 4),
(65, 'Iturbe', 4),
(66, 'José Fassardi', 4),
(67, 'Mbocayaty', 4),
(68, 'Natalicio Talavera', 4),
(69, 'Ñumí', 4),
(70, 'Paso Yobai', 4),
(71, 'San Salvador', 4),
(72, 'Tebicuary', 4),
(73, 'Villarrica', 4),
(74, 'Yataity', 4),
(75, 'Caaguazú', 5),
(76, 'Carayaó', 5),
(77, 'Coronel Oviedo', 5),
(78, 'Doctor Cecilio Báez', 5),
(79, 'Doctor Juan Eulogio Estigarribia', 5),
(80, 'Doctor Juan Manuel Frutos', 5),
(81, 'José Domingo Ocampos', 5),
(82, 'La Pastora', 5),
(83, 'Mariscal Francisco Solano López', 5),
(84, 'Nueva Londres', 5),
(85, 'Nueva Toledo', 5),
(86, 'Raúl Arsenio Oviedo', 5),
(87, 'Regimiento de Infantería Tres Corrales', 5),
(88, 'Repatriación', 5),
(89, 'San José de los Arroyos', 5),
(90, 'San Joaquín', 5),
(91, 'Santa Rosa del Mbutuy', 5),
(92, 'Simón Bolívar', 5),
(93, 'Tembiaporá', 5),
(94, 'Tres de Febrero', 5),
(95, 'Vaquería', 5),
(96, 'Yhú', 5),
(97, 'Abaí', 6),
(98, 'Buena Vista', 6),
(99, 'Caazapá', 6),
(100, 'Doctor Moisés S. Bertoni', 6),
(101, 'Fulgencio Yegros', 6),
(102, 'General Higinio Morínigo', 6),
(103, 'Maciel', 6),
(104, 'San Juan Nepomuceno', 6),
(105, 'Tavaí', 6),
(106, 'Tres de Mayo', 6),
(107, 'Yuty', 6),
(108, 'Alto Verá', 7),
(109, 'Bella Vista', 7),
(110, 'Cambyretá', 7),
(111, 'Capitán Meza', 7),
(112, 'Capitán Miranda', 7),
(113, 'Carlos Antonio López', 7),
(114, 'Carmen del Paraná', 7),
(115, 'Coronel José Félix Bogado', 7),
(116, 'Edelira', 7),
(117, 'Encarnación', 7),
(118, 'Fram', 7),
(119, 'General Artigas', 7),
(120, 'General Delgado', 7),
(121, 'Hohenau', 7),
(122, 'Itapúa Poty', 7),
(123, 'Jesús', 7),
(124, 'José Leandro Oviedo', 7),
(125, 'La Paz', 7),
(126, 'Mayor Julio Dionisio Otaño', 7),
(127, 'Natalio', 7),
(128, 'Nueva Alborada', 7),
(129, 'Obligado', 7),
(130, 'Pirapó', 7),
(131, 'San Cosme y Damián', 7),
(132, 'San Juan del Paraná', 7),
(133, 'San Pedro del Paraná', 7),
(134, 'San Rafael del Paraná', 7),
(135, 'Tomás Romero Pereira', 7),
(136, 'Trinidad', 7),
(137, 'Yatytay', 7),
(138, 'Ayolas', 8),
(139, 'San Ignacio', 8),
(140, 'San Juan Bautista', 8),
(141, 'San Miguel', 8),
(142, 'San Patricio', 8),
(143, 'Santa María', 8),
(144, 'Santa Rosa', 8),
(145, 'Santiago', 8),
(146, 'Villa Florida', 8),
(147, 'Yabebyry', 8),
(148, 'Acahay', 9),
(149, 'Caapucú', 9),
(150, 'Carapeguá', 9),
(151, 'Escobar', 9),
(152, 'General Bernardino Caballero', 9),
(153, 'La Colmena', 9),
(154, 'María Antonia', 9),
(155, 'Mbuyapey', 9),
(156, 'Paraguarí', 9),
(157, 'Pirayú', 9),
(158, 'Quiindy', 9),
(159, 'Quyquyhó', 9),
(160, 'San Roque González de Santa Cruz', 9),
(161, 'Sapucai', 9),
(162, 'Tebicuarymí', 9),
(163, 'Yaguarón', 9),
(164, 'Ybycuí', 9),
(165, 'Ybytymí', 9),
(166, 'Ciudad del Este', 10),
(167, 'Doctor Juan León Mallorquín', 10),
(168, 'Doctor Raúl Peña', 10),
(169, 'Domingo Martínez de Irala', 10),
(170, 'Hernandarias', 10),
(171, 'Iruña', 10),
(172, 'Itakyry', 10),
(173, 'Juan Emilio O\'Leary', 10),
(174, 'Los Cedrales', 10),
(175, 'Mbaracayú', 10),
(176, 'Minga Guazú', 10),
(177, 'Minga Porá', 10),
(178, 'Naranjal', 10),
(179, 'Ñacunday', 10),
(180, 'Presidente Franco', 10),
(181, 'San Alberto', 10),
(182, 'San Cristóbal', 10),
(183, 'Santa Fe del Paraná', 10),
(184, 'Santa Rita', 10),
(185, 'Santa Rosa del Monday', 10),
(186, 'Tavapy', 10),
(187, 'Yguazú', 10),
(188, 'Areguá', 11),
(189, 'Capiatá', 11),
(190, 'Fernando de la Mora', 11),
(191, 'Guarambaré', 11),
(192, 'Itá', 11),
(193, 'Itauguá', 11),
(194, 'Saldívar', 11),
(195, 'Lambaré', 11),
(196, 'Limpio', 11),
(197, 'Luque', 11),
(198, 'Mariano Roque Alonso', 11),
(199, 'Nueva Italia', 11),
(200, 'Ñemby', 11),
(201, 'San Antonio', 11),
(202, 'San Lorenzo', 11),
(203, 'Villa Elisa', 11),
(204, 'Villeta', 11),
(205, 'Ypacaraí', 11),
(206, 'Ypané', 11),
(207, 'Alberdi', 12),
(208, 'Cerrito', 12),
(209, 'Desmochados', 12),
(210, 'General José Eduvigis Díaz', 12),
(211, 'Guazú Cuá', 12),
(212, 'Humaitá', 12),
(213, 'Isla Umbú', 12),
(214, 'Laureles', 12),
(215, 'Mayor José de Jesús Martínez', 12),
(216, 'Paso de Patria', 12),
(217, 'Pilar', 12),
(218, 'San Juan Bautista del Ñeembucú', 12),
(219, 'Tacuaras', 12),
(220, 'Villa Franca', 12),
(221, 'Villa Oliva', 12),
(222, 'Villalbín', 12),
(223, 'Bella Vista', 13),
(224, 'Capitán Bado', 13),
(225, 'Cerro Corá', 13),
(226, 'Karapaí', 13),
(227, 'Pedro Juan Caballero', 13),
(228, 'Zanja Pytá', 13),
(229, 'Corpus Christi', 14),
(230, 'Curuguaty', 14),
(231, 'General Francisco Caballero Álvarez', 14),
(232, 'Itanará', 14),
(233, 'Katueté', 14),
(234, 'La Paloma del Espíritu Santo', 14),
(235, 'Laurel', 14),
(236, 'Maracaná', 14),
(237, 'Nueva Esperanza', 14),
(238, 'Puerto Adela', 14),
(239, 'Salto del Guairá', 14),
(240, 'Villa Ygatimí', 14),
(241, 'Yasy Cañy', 14),
(242, 'Yby Pytá', 14),
(243, 'Ybyrarobaná', 14),
(244, 'Ypejhú', 14),
(245, 'Benjamín Aceval', 15),
(246, 'José Falcón', 15),
(247, 'General José María Bruguez', 15),
(248, 'Nanawa', 15),
(249, 'Puerto Pinasco', 15),
(250, 'Teniente Primero Manuel Irala Fernández', 15),
(251, 'Teniente Esteban Martínez', 15),
(252, 'Villa Hayes', 15),
(253, 'Neuland', 16),
(254, 'Filadelfia', 16),
(255, 'Loma Plata', 16),
(256, 'Mariscal José Félix Estigarribia', 16),
(257, 'Bahía Negra', 17),
(258, 'Capitán Carmelo Peralta', 17),
(259, 'Fuerte Olimpo', 17),
(260, 'Puerto Casado', 17),
(261, 'Rpueba', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`) VALUES
(1, 'Bellota'),
(2, 'Tramontina');

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
  `nombre` varchar(45) NOT NULL,
  `simbolo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`idMoneda`, `nombre`, `simbolo`) VALUES
(1, 'Guarani', 'Gs.'),
(2, 'Dólar', '$');

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
(1, 'Juan', 'Perez', '4716123', 'juanperez@gmail.com', '0981321123', 'Avenida San Juan', 67),
(2, 'Jorge', 'Sanchez', '4712312', 'jorge@gmail.com', '0982147852', 'Avenida San Martin', 72),
(3, 'Liz', 'Garcia', '4321852', 'liz@gmail.com', '0982369852', 'Avenida San Martin', 77);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazos`
--

CREATE TABLE `plazos` (
  `idPlazo` int(11) NOT NULL,
  `plazo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plazos`
--

INSERT INTO `plazos` (`idPlazo`, `plazo`) VALUES
(1, '1 Mes');

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
  `idCategoria` int(11) NOT NULL,
  `StockMinimo` int(11) NOT NULL,
  `Impuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `idCategoria`, `StockMinimo`, `Impuesto`) VALUES
(1, 'Cable ', 2, 10, 11),
(2, 'Caño ', 1, 20, 11),
(3, 'Pasa Cable', 2, 8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productodetalle`
--

CREATE TABLE `productodetalle` (
  `idProductoDetalle` int(11) NOT NULL,
  `codBarra` varchar(75) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `medida` varchar(50) DEFAULT NULL,
  `peso` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
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
(1, 'Sucursal Central', 64),
(2, 'Sucursal 1', 59),
(3, 'Sucursal 3', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamaño`
--

CREATE TABLE `tamaño` (
  `idTamaño` int(11) NOT NULL,
  `tamaño` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tamaño`
--

INSERT INTO `tamaño` (`idTamaño`, `tamaño`) VALUES
(1, 'grande'),
(2, 'CHICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(11) NOT NULL,
  `tipo` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `tipo`) VALUES
(1, 'Tipo 1'),
(2, 'Tipo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomprobante`
--

CREATE TABLE `tipocomprobante` (
  `idTipoComprobante` int(11) NOT NULL,
  `comprobante` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocomprobante`
--

INSERT INTO `tipocomprobante` (`idTipoComprobante`, `comprobante`) VALUES
(1, 'Factura');

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
  `idEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contrasena`, `activo`, `idRol`, `idEmpleado`) VALUES
(1, 'user', 'e1dc99ba9abbe6e07f288e', 'A', 1, 1),
(2, 'JorgeX', '297f4b395254b49799da93', 'D', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `numeroFactura` varchar(50) NOT NULL,
  `fechaProceso` date NOT NULL,
  `condicion` varchar(75) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `montoTotal` int(11) NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `idPlazo` int(11) DEFAULT NULL,
  `idTipoComprobante` int(11) DEFAULT NULL,
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
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`idColor`);

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
  ADD KEY `idPrecio` (`idPrecio`,`codBarra`),
  ADD KEY `codBarra` (`codBarra`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`,`idVenta`),
  ADD KEY `idVenta` (`idVenta`,`codBarra`),
  ADD KEY `codBara` (`codBarra`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `diseño`
--
ALTER TABLE `diseño`
  ADD PRIMARY KEY (`idDiseño`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD KEY `idLocalidad` (`idLocalidad`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`nroFactura`);

--
-- Indices de la tabla `formapagos`
--
ALTER TABLE `formapagos`
  ADD PRIMARY KEY (`idFormaPago`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idLocalidad`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

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
  ADD PRIMARY KEY (`codBarra`) USING BTREE,
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
-- Indices de la tabla `tamaño`
--
ALTER TABLE `tamaño`
  ADD PRIMARY KEY (`idTamaño`);

--
-- Indices de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Indices de la tabla `tipocomprobante`
--
ALTER TABLE `tipocomprobante`
  ADD PRIMARY KEY (`idTipoComprobante`);

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
  ADD KEY `idMoneda` (`idMoneda`),
  ADD KEY `idDeposito` (`idDeposito`),
  ADD KEY `idTipoDoc` (`idTipoComprobante`),
  ADD KEY `idPlazo` (`idPlazo`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `numeroFactura` (`numeroFactura`),
  ADD KEY `idPrecio` (`idPrecio`),
  ADD KEY `idCliente` (`idCliente`);

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
  ADD CONSTRAINT `detalleprecio_ibfk_2` FOREIGN KEY (`codBarra`) REFERENCES `productodetalle` (`codBarra`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`codBarra`) REFERENCES `productodetalle` (`codBarra`),
  ADD CONSTRAINT `detalleventa_ibfk_3` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`);

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
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`);

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
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`);

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
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`);

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
  ADD CONSTRAINT `ventas_ibfk_10` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`idDeposito`) REFERENCES `deposito` (`idDeposito`),
  ADD CONSTRAINT `ventas_ibfk_5` FOREIGN KEY (`idTipoComprobante`) REFERENCES `tipocomprobante` (`idTipoComprobante`),
  ADD CONSTRAINT `ventas_ibfk_6` FOREIGN KEY (`idPlazo`) REFERENCES `plazos` (`idPlazo`),
  ADD CONSTRAINT `ventas_ibfk_7` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ventas_ibfk_9` FOREIGN KEY (`idPrecio`) REFERENCES `precios` (`idPrecio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
