-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2022 a las 20:19:40
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
  `cantidad` float NOT NULL,
  `medida` varchar(45) NOT NULL,
  `idRecetaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`idIngrediente`, `nombre_ingrediente`, `cantidad`, `medida`, `idRecetaFK`) VALUES
(0, 'Pata y muslos', 4, 'unidad', 4),
(1, 'Huevo', 1, 'unidad', 1),
(2, 'Aceite', 300, 'ml', 1),
(3, 'Papas', 6, 'unidad', 2),
(4, 'Zanahoria', 3, 'unidad', 2),
(5, 'Arvejas', 1, 'lata', 2),
(6, 'Vinagre', 1, 'cucharada', 2),
(7, 'Mayonesa', 1, 'taza', 2),
(8, 'Vainillas trituradas o galletas dulces molida', 200, 'gr', 3),
(9, 'Dulce de leche repostero', 100, 'gr', 3),
(10, 'Chocolate semiamargo derretido', 2, 'cucharada', 3),
(11, 'Chocolate semiamargo para bañarlas', 300, 'gr', 3),
(12, 'Pimentón', 1, 'cucharada', 4),
(13, 'Aceite de oliva', 1, 'cucharada', 4),
(14, 'Vino blanco', 50, 'cc', 4),
(15, 'Limon', 1, 'unidad', 4),
(16, 'Espinaca', 1, 'unidad', 4),
(17, 'Espinaca', 1, 'kg', 4),
(18, 'Ajo picados', 3, 'dientes', 4),
(19, 'Pieza de pollo', 2, 'kg', 5),
(20, 'Zanahoria', 5, 'unidad', 5),
(21, 'Papas', 2, 'kg', 5),
(22, 'Choclo', 5, 'unidad', 5),
(23, 'Cebolla blanca', 2, 'unidad', 5),
(24, 'Cebolla de verdeo', 2, 'unidad', 5),
(25, 'Puerro', 1, 'unidad', 5),
(26, 'Cabeza de ajo', 1, 'unidad', 5),
(27, 'Caldo', 3, 'taza', 5),
(28, 'Laurel', 2, 'hojas', 5),
(29, 'Vino blanco', 1, 'litro', 5),
(30, 'Crema de leche', 1, 'litro', 5),
(31, 'Galletas de vainilla', 24, 'unidad', 6),
(32, 'Crema mascarpone', 1, 'unidad', 6),
(33, 'Crema', 500, 'ml', 6),
(34, 'Yemas', 7, 'unidad', 6),
(35, 'Azúcar', 180, 'g', 6),
(36, 'Queso mascarpone', 450, 'g', 6),
(37, 'Sobre de gelatina', 1, 'unidad', 6),
(38, 'Azúcar', 250, 'g', 6),
(39, 'Café instantáneo', 4, 'cucharadas', 6),
(40, 'Agua', 180, 'ml', 6),
(41, 'Cognac', 1, 'copa', 6),
(42, 'Cocoa en polvo', 1, 'unidad', 6),
(43, 'Café en granos', 1, 'unidad', 6),
(44, 'Camarones grandes sin cáscara', 12, 'unidad', 7),
(45, 'Láminas de tocino', 12, 'unidad', 7),
(46, 'Paltas', 2, 'unidad', 7),
(47, 'Hojas de menta', 2, 'cucharadas', 7),
(48, 'Diente de ajo', 0.5, 'unidad', 7),
(49, 'Aceite de ajonjolí', 1, 'cucharada', 7),
(50, 'Hojas de perejil', 0.25, 'tazas', 7),
(51, 'Bistecs', 1, 'kg', 8),
(52, 'Barrita de mantquilla', 1, 'unidad', 8),
(53, 'Ciruelas sin semilla y cortadas en gajos', 8, 'unidad', 8),
(54, 'Piña', 4, 'rebanadas', 8),
(55, 'azúcar', 4, 'cucharadas', 8),
(56, 'Vino tinto', 2, 'tazas', 8),
(57, 'Sal y pimienta', 1, 'unidad', 8),
(58, 'Aceite vegetal', 1, 'unidad', 8),
(59, 'Chile de árbol en aceite', 1, 'cucharada', 9),
(60, 'Mostaza', 1, 'cucharada', 9),
(61, 'Miel', 3, 'cucharadas', 9),
(62, 'Aceite de oliva', 3, 'cucharadas', 9),
(63, 'Lonja de salmón ', 700, 'g', 9),
(64, 'Hojas de orégano', 0.5, 'tazas', 9),
(65, 'Papas', 2, 'unidad', 10),
(66, 'Atún', 2, 'latas', 10),
(67, 'Perejil picado', 4, 'cucharadas', 10),
(68, 'Cebolla picada', 1, 'unidad', 10),
(69, 'Mantequilla', 3, 'cucharadas', 10),
(70, 'Huevos', 2, 'unidad', 10),
(71, 'Harina', 1, 'taza', 10),
(72, 'Pan molido', 1, 'taza', 10),
(73, 'Aceite para freir', 1, 'unidad', 10),
(74, 'Mayonesa', 1, 'taza', 10),
(75, 'Alcaparras picadas', 2, 'cucharadas', 10),
(76, 'Cebolla morada picada', 2, 'cucharadas', 10),
(77, 'Perejil picado', 2, 'cucharadas', 10),
(78, 'Limón', 1, 'unidad', 10),
(79, 'Tostaditas', 15, 'unidad', 11),
(80, 'Pulpa de jaiba', 350, 'g', 11),
(81, 'Jitomates picados', 3, 'unidad', 11),
(82, 'Perejil picado', 0.5, 'taza', 11),
(83, 'Chiles serranos rebanados', 2, 'unidad', 11),
(84, 'Jugo de limón', 0.25, 'taza', 11),
(85, 'Ketchup', 3, 'cucharadas', 11),
(86, 'Mayonesa', 2, 'cucharadas', 11),
(87, 'Palta', 1, 'unidad', 11),
(88, 'Carne molida', 400, 'g', 12),
(89, 'Cebolla finamente picada', 1, 'taza', 12),
(90, 'Perejil picado', 0.5, 'taza', 12),
(91, 'Huevos', 2, 'unidad', 12),
(92, 'Pan molido', 0.5, 'taza', 12),
(93, 'Puré de jitomate', 1, 'l', 12),
(94, 'Paprika', 1, 'cucharada', 12),
(95, 'Orégano', 1, 'cucharada', 12),
(96, 'Laurel', 1, 'hoja', 12),
(97, 'Espagueti', 350, 'g', 12),
(98, 'Aceite de oliva', 6, 'cucharadas', 12),
(99, 'Parmesano rallado', 1, 'taza', 12),
(100, 'Papas', 4, 'unidad', 13),
(101, 'Leche', 2, 'tazas', 13),
(102, 'Mantequilla', 5, 'cucharadas', 13);

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
(30, 'Condimentamos el pollo al disco con el ají, el pimentón, el orégano y la sal 5 minutos antes de que termine la cocción.', 5),
(31, 'Bate la crema a punto de chantilly y refrigera. Aparte, bate las yemas a punto de nieve.', 6),
(32, 'Pon en un cazo el azúcar hasta formar un jarabe y mézclalo con las yemas batidas; continúa batiendo hasta que la preparación se enfríe y luego incorpora el queso mascarpone.', 6),
(33, 'Diluye la grenetina en un poco de agua y ponla 20 segundos en el microondas. Agrégalo a la mezcla anterior y mezcla con la crema batida.', 6),
(34, 'Para preparar el almíbar de café, hierve el agua con el azúcar, agrega el café y el cognac y deja enfriar un poco.\r\n', 6),
(35, 'Muele las galletas. Vacía en copas una base de galletas, báñalas con el almíbar de café y una capa de crema. Repite la misma operación y refrigera por lo menos tres horas. Para servir, decora con cocoa y los granos de café.\r\n', 6),
(36, 'Fríe el ajo en una sartén con aceite de ajonjolí, retira cuando comience a dorar y muele a pulsos con los aguacates y hojas de menta; salpimenta.\r\n', 7),
(37, 'Envuelve los camarones con una lámina de tocino cada uno, colócalos en una charola y hornea a 180 °C durante 25 minutos, salpimenta. Sirve con guacamole y decora con hojas de perejil.\r\n', 7),
(38, 'Sazona los bisteces con sal y pimienta y fríelos en una cacerola con aceite hasta que estén dorados (es para “séllalos” y que no se salgan sus jugos), retira y reserva.\r\n', 8),
(39, 'En una sartén con mantequilla caliente sofríe la piña, las ciruelas y el azúcar, cuando la piña comience a dorar, vierte el vino, baja el fuego y cocina 20 minutos o hasta que espese.\r\n', 8),
(40, 'Incorpora los bisteces y cocina hasta que estén cocidos; retira y sirve.\r\n', 8),
(41, 'Mezcla el chile de árbol con la mostaza, la miel y el aceite de oliva. Vierte la mezcla en una bolsa y marina el salmón en ella durante dos horas.\r\n', 9),
(42, 'Coloca el salmón en una charola con papel encerado, agrega las hojas de orégano sobre él. Hornea a 180oC durante 30 minutos.\r\n', 9),
(43, 'Ofrece caliente.\r\n', 9),
(44, 'Mezcla los ingredientes de la salsa, reserva.\r\n', 10),
(45, 'Sofríe la cebolla con la mantequilla, cuando comience a dorar agrega la papa, atún y perejil, integra y retira del fuego.\r\n', 10),
(46, 'Forma bolitas con la mezcla y empaniza pasando primero por la harina, luego el huevo batido y enseguida el pan molido. Fríe en aceite caliente por ambos lados. Acompaña con la salsa.\r\n', 10),
(47, 'Mezcla la jaiba con el jitomate, el perejil, el chile, el jugo de limón, la catsup y la sal; deja marinar 30 minutos en el refrigerador; retira el líquido y rectifica la sazón.\r\n', 11),
(48, 'Unta mayonesa en las tostadas, reparte la mezcla de jaiba y adorna con aguacate.\r\n', 11),
(49, 'Sirve al momento para evitar que se remojen.\r\n', 11),
(50, 'Mezcla la carne con la cebolla, el perejil, el pan molido y el huevo; salpimienta. Haz bolitas pequeñas y refrigéralas por una hora.\r\n', 12),
(51, 'Fríe las bolitas en una sartén grande a fuego alto con el aceite de oliva; cuando estén doradas agrega el puré de jitomate con la paprika, el orégano y el laurel, cuece a un hervor bajo durante 30 minutos.\r\n', 12),
(52, 'Cuece la pasta hasta que esté suave, drénala y mézclala con las albóndigas, salpimienta.\r\n', 12),
(53, 'Termina con el queso y sirve.\r\n', 12),
(54, 'Hornea las papas durante una hora y media o hasta que al insertar un cuchillo las sientas suaves.\r\n', 13),
(55, 'Calienta la leche con la mantequilla en una olla amplia.\r\n', 13),
(56, 'Parte las papas, pélalas, aplasta la pulpa y métela en la batidora. Añade poco a poco la leche y la mantequilla hasta integrar completamente, salpimienta y sirve.\r\n', 13);

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
(5, 'POLLO AL DISCO', 'Pollo al disco es un plato argentino abundante que consiste en pollo y varias verduras cocinadas como un guiso en una sartén profunda descubierta a fuego abierto.', 'pollodisco.jpg'),
(6, 'TIRAMISU EN COPAS', 'El postre italiano que no puedes dejar de probar es este tiramisu en copas. Te damos el paso a paso para que lo hagas en casa.', 'tiramisu.jpg'),
(7, 'CAMARONES ENVUELTOS EN TOCINO', 'Dale un toque especial a tus comidas preparando estos camarones envueltos en tocino. Sigue el paso a paso para prepararlos.', 'camaron.jpg'),
(8, 'BISTEC CON CIRUELA Y PIÑA', 'Una deliciosa combinación de sabores te está esperando: prueba este bistec con ciruela y piña. ¡Lo amarás y disfrutarás mucho prepararlo!', 'bistec.jpg'),
(9, 'FILETE DE SALMON BAÑANDO EN MIEL', 'El salmón nunca había sido tan delicioso y fácil de preparar. No te quedes sin probar este filete de salmón marinado en miel para disfrutarlo en Cuaresma.', 'salmonmiel.jpg'),
(10, 'CROQUETAS DE ATÚN CON PAPA', 'Lo mejor de esta receta de croquetas de atún con papa es lo rápido que es prepararlas. Ahorra tiempo y no olvides acompañarlas con la salsa tártara. Sigue el video para prepararlas fácilmente.', 'croquetas.jpg'),
(11, 'TOSTADAS DE JAIBA', 'La Cuaresma ya comenzó: empieza con broche de oro probando estas deliciosas tostadas de jaiba. ¡Te encantará su irresistible sabor!', 'jaiba.jpg'),
(12, 'ESPAGUETI CON ALBONDIGAS', 'Aprende a hacer este delicioso espagueti con albóndigas y salsa de tomate como una verdadera experta. Lo que tienes que hacer es seguir el paso a paso.', 'espagueti.jpg'),
(13, 'PURÉ DE PAPA', 'La receta de puré de papa es de esas guarniciones que a todo mundo le gusta y combina con todo, aprende a prepararlo muy fácil. Sigue el video para conocer el paso a paso.', 'purepapa.jpg');

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
(1, 'Santino', 'Vitale', 'santino.pavese@gmail.com', '1234'),
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
