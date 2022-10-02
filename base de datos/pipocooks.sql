-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2022 a las 00:43:12
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pipocooks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idIngrediente` int(11) NOT NULL,
  `nombre_ingrediente` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `medida` varchar(45) NOT NULL,
  `idRecetaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`idIngrediente`, `nombre_ingrediente`, `cantidad`, `medida`, `idRecetaFK`) VALUES
(0, 'pata y muslos', 4, 'unidad', 4),
(1, 'huevo', 1, 'unidad', 1),
(2, 'aceite', 300, 'ml', 1),
(3, 'Papas', 6, 'unidad', 2),
(4, 'Zanahoria', 3, 'unidad', 2),
(5, 'arvejas', 1, 'lata', 2),
(6, 'vinagre', 1, 'cucharada', 2),
(7, 'mayonesa', 1, 'taza', 2),
(8, 'vainillas trituradas o galletas dulces molida', 200, 'gr', 3),
(9, 'dulce de leche repostero', 100, 'gr', 3),
(10, 'chocolate semiamargo derretido', 2, 'cucharada', 3),
(11, 'chocolate semiamargo para bañarlas', 300, 'gr', 3),
(12, 'Pimentón', 1, 'cucharada', 4),
(13, 'Aceite de oliva', 1, 'cucharada', 4),
(14, 'vino blanco', 50, 'cc', 4),
(15, 'limon', 1, 'unidad', 4),
(16, 'espinacas', 1, 'unidad', 4),
(17, 'espinaca', 1, 'kg', 4),
(18, 'ajo picados', 3, 'dientes', 4),
(19, 'Pieza de pollo', 2, 'kg', 5),
(20, 'Zanahoria', 5, 'unidad', 5),
(21, 'Papas', 2, 'kg', 5),
(22, 'choclo', 5, 'unidad', 5),
(23, 'cebolla blanca', 2, 'unidad', 5),
(24, 'cebolla de verdeo', 2, 'unidad', 5),
(25, 'puerro', 1, 'unidad', 5),
(26, 'cabeza de ajo', 1, 'unidad', 5),
(27, 'caldo', 3, 'taza', 5),
(28, 'laurel', 2, 'hojas', 5),
(29, 'vino blanco', 1, 'litro', 5),
(30, 'crema de leche', 1, 'litro', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos`
--

CREATE TABLE `pasos` (
  `idPasos` int(11) NOT NULL,
  `descripcion_pasos` varchar(100) NOT NULL,
  `idRecetaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`idPasos`, `descripcion_pasos`, `idRecetaFK`) VALUES
(1, '-Colocar la sartén a fuego medio\r\n-Colocar el aceite en la sartén\r\n-Romper el huevo y colocarlo en l', 1),
(2, 'Pelar y cortar las papas y zanahorias en cubos .\r\n\r\nPoner a hervir con la cucharita de vinagre en el', 2),
(3, '1. Triturar las vainillas y mezclar con el dulce, coco, chocolate derretido y formar bolitas. LLevar', 3),
(4, '1. Condimentar las presas de pollo con bastante pimentón dulce frotando con las manos para que se im', 4),
(5, '1- Lo primero que tenemos que hacer es calentar el disco en leña, o carbón. Lo que tengas. El disco ', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `idReceta` int(11) NOT NULL,
  `nombre_receta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`idReceta`, `nombre_receta`) VALUES
(1, 'Huevo frito'),
(2, 'Ensalada rusa'),
(3, 'Trufas de dulce de leche'),
(4, 'Muslos de pollo al pimentón'),
(5, 'Pollo al disco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `apellido_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre_usuario`, `apellido_usuario`, `email_usuario`, `password`) VALUES
(1, 'Santino', 'Vitale', 'santino.pavese@gmail.com', '5694'),
(2, 'Enrique', 'Palomino', 'e.palomino@gmail.com', '9090'),
(3, 'Lucas', 'Ruiz', 'l.ruiz@gmail.com', '5050'),
(4, 'Lisa', 'Vitale', 'l.vitale@gmail.com', '4455');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idIngrediente`),
  ADD KEY `rel_ingrediente` (`idRecetaFK`);

--
-- Indices de la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD PRIMARY KEY (`idPasos`),
  ADD KEY `rel_pasos` (`idRecetaFK`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`idReceta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `rel_ingrediente` FOREIGN KEY (`idRecetaFK`) REFERENCES `recetas` (`idReceta`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD CONSTRAINT `rel_pasos` FOREIGN KEY (`idRecetaFK`) REFERENCES `recetas` (`idReceta`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
