-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2022 a las 13:32:01
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
  `descripcion_pasos` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idRecetaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`idPasos`, `descripcion_pasos`, `idRecetaFK`) VALUES
(1, '-Colocar la sartén a fuego medio\r\n', 1),
(2, 'Colocar el aceite en la sartén', 1),
(3, 'Romper el huevo y colocarlo en la sartén', 1),
(4, 'Una vez que ven que los bordes del huevo están doraditos, lo retiran del aceite con muchísimo cuidado y lo depositan sobre un plato', 1),
(6, 'Pelar y cortar la papa en cubos de 1cm x 1cm aproximadamente. Pelar y cortar la zanahoria en cubos de la mitad del tamaño que la papa (en este caso sería 0.5 x 0.5cm) Para que la ensalada rusa quede genial, es importante que al cocinar todo junto, no quede la zanahoria cruda, ni se pase la papa. Con estas medidas van a estar genial.', 2),
(7, 'Llevar las papas y las zanahorias cortadas a una olla amplia con mucha agua (así como sale de la canilla). Agregar el laurel y la sal gruesa y llevar al fuego hasta que la papa esté cocida. Para medir esto pueden pinchar una papita con un cuchillo, si la papa sin desarmarse se cae del cuchillo, sacála nomás!\r\n', 2),
(8, 'Si usan arvejas congeladas, las agregan a la olla y dejar un minuto más o menos. Si usan arvejas de lata las agregan cuando la papa y la zanahoria ya están escurridas.\r\n', 2),
(9, 'Retirar del fuego y escurrir. Dejar enfriar unos minutos y cuando todavía está caliente, agregar la mayonesa. Revolver todo para que se integre, salpimentar y continuar integrando.', 2),
(10, 'Servir', 2),
(11, 'Moler las galletitas con un pisapapas en un bol hasta que queden casi como polvo.', 3),
(12, 'Mezclar con las galletas el dulce de leche, quedará una masa uniforme pero rústica.', 3),
(13, 'Formar con la masa bolitas y pasarlas por coco rallado, colocar en una fuente.', 3),
(14, 'Poner el excedente de coco sobre las bolitas y refrigerar 15 minutos. ¡Listo! Ya tenés tus trufas de dulce de leche.', 3),
(15, 'Empezamos esta receta de muslo de pollo al pimentón poniendo al fuego una cazuela amplia con un poco de aceite de oliva.', 4),
(16, 'Debemos pochar la cebolla a fuego suave, así que la añadimos picada con un poco de sal y dejamos que se sofría.', 4),
(17, 'A continuación, añadimos el diente de ajo machacado y mezclamos todo muy bien.', 4),
(18, 'Colocamos los muslos de pollo sobre la cebolla y dejamos que cojan color por ambos lados.', 4),
(19, 'Cuando estén bien dorados, añadimos la cucharada de pimentón picante para que se cocine con el calor directo.', 4),
(20, 'Una vez el pimentón suelte todo el sabor, que suelen ser un par de minutos, añadimos el caldo de pollo y la salsa de tomate frito.', 4),
(21, 'Salpimentamos el muslo de pollo al pimentón al gusto y tapamos. Cocinamos durante unos treinta minutos a fuego medio-alto.', 4),
(22, 'Una vez la carne esté cocinada, servimos.', 4),
(23, 'Lo primero que tenemos que hacer es calentar el disco en leña, o carbón. Lo que tengas. El disco debe estar bien caliente.', 5),
(24, 'Una vez que esté caliente (tengan cuidado y usen trapos secos para tocar el disco por favor se los pido) agregar un chorro de aceite desde afuera del disco hacia adentro.', 5),
(25, 'Dorar las piezas de pollo, aproximadamente 5 minutos de cada lado. Sacarlas y reservarlas a un costado. Tiren el aceite que les quedó de más en el disco.', 5),
(26, 'Pelar y cortar chiquito la cebolla y los dientes de ajo. La zanahoria en rodajas al igual que el puerro y la cebolla de verdeo. Poner las verduras en el disco y saltear por 5 minutos.', 5),
(27, 'Agregar el vino blanco y la pimienta y lo dejamos reducir.', 5),
(28, 'Cuando evaporó el alcohol (te vas a dar cuenta porque no larga olor a alcohol etílico) le agregamos una taza del caldo y remuevan. Sumamos el pollo que teníamos a un costado y cocinamos unos 10 minutos más o hasta que las zanahorias estén medianamente tiernas.', 5),
(29, 'Cuando estén a media cocción le agregamos las papas peladas y cortadas en rodajas de 1 cm de espesor, el choclo cortado en tercios y agregamos el caldo que faltaba  y la crema. Tapamos y dejamos cocinar unos 15 o 20 minutos más.', 5),
(30, 'Condimentamos el pollo al disco con el ají, el pimentón, el orégano y la sal 5 minutos antes de que termine la cocción.', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `idReceta` int(11) NOT NULL,
  `nombre_receta` varchar(45) NOT NULL,
  `descripcion_receta` varchar(500) NOT NULL,
  `imagen_receta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`idReceta`, `nombre_receta`, `descripcion_receta`, `imagen_receta`) VALUES
(1, 'HUEVO FRITO', 'El huevo frito es una forma muy rápida y bastante tradicional de hacer una fritura de un huevo. Su preparación apenas dura unos segundos y suele emplearse huevo de gallina. El huevo se introduce en aceite o grasa animal caliente.', 'huevofrito.jpg'),
(2, 'ENSALADA RUSA', 'La ensalada rusa o ensaladilla rusa, también conocida originariamente como ensalada Olivier, es una ensalada típica de diversos países de Europa, Asia y América.', 'ensaladarusa.jpg'),
(3, 'TRUFAS DE DULCE DE LECHE', 'Las trufas de dulce de leche son una receta casi para niños y llegan de la mano del estilista más cool del país. Un programa divertido con la complicidad de quienes se conocen hace ya tiempo. Bon profit!', 'trufa.jpg'),
(4, 'MUSLOS DE POLLO AL PIMENTON', 'Lo mejor de esta receta de muslo de pollo al pimentón es que podemos hacerla tanto picante como no. Una receta muy rica.', 'pollopimenton.jpg'),
(5, 'POLLO AL DISCO', 'Pollo al disco es un plato argentino abundante que consiste en pollo y varias verduras cocinadas como un guiso en una sartén profunda descubierta a fuego abierto.', 'pollodisco.jpg');

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
