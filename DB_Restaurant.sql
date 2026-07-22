-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 22-07-2026 a las 11:19:29
-- Versión del servidor: 10.11.13-MariaDB-ubu2204
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `G1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergens`
--

CREATE TABLE `alergens` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alergens`
--

INSERT INTO `alergens` (`id`, `nom`) VALUES
(6, 'Bantha'),
(5, 'Ewok'),
(8, 'Jawa'),
(4, 'Kyber'),
(1, 'Midiclorians'),
(10, 'Mynock'),
(7, 'Porg'),
(3, 'Sarlacc'),
(9, 'Tauntaun'),
(2, 'Wookiee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda_proveiment`
--

CREATE TABLE `comanda_proveiment` (
  `id` int(11) NOT NULL,
  `proveidor_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantitat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comanda_proveiment`
--

INSERT INTO `comanda_proveiment` (`id`, `proveidor_id`, `ingredient_id`, `quantitat`) VALUES
(15, 1, 7, 25),
(16, 1, 7, 50),
(17, 2, 4, 15),
(18, 3, 2, 100),
(19, 3, 2, 150),
(20, 4, 8, 40),
(21, 5, 3, 80),
(22, 5, 10, 5),
(23, 6, 9, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes`
--

CREATE TABLE `comandes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assignada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comandes`
--

INSERT INTO `comandes` (`id`, `user_id`, `assignada`) VALUES
(1, 3, 1),
(2, 8, 0),
(3, 1, 1),
(4, 3, 0),
(5, 9, 1),
(6, 2, 1),
(7, 6, 0),
(8, 2, 0),
(9, 10, 1),
(10, 5, 1),
(11, 8, 1),
(12, 4, 0),
(13, 7, 1),
(14, 1, 0),
(15, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes_plats`
--

CREATE TABLE `comandes_plats` (
  `comanda_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comandes_plats`
--

INSERT INTO `comandes_plats` (`comanda_id`, `plat_id`, `quantitat`) VALUES
(1, 1, 2),
(1, 4, 3),
(1, 9, 1),
(2, 5, 3),
(3, 3, 2),
(3, 7, 1),
(4, 2, 3),
(4, 6, 1),
(5, 8, 4),
(5, 10, 1),
(6, 4, 1),
(6, 10, 2),
(7, 1, 1),
(7, 9, 3),
(8, 3, 2),
(8, 8, 4),
(9, 5, 1),
(9, 9, 2),
(10, 2, 1),
(10, 7, 3),
(10, 10, 1),
(11, 1, 1),
(12, 4, 3),
(13, 8, 2),
(14, 10, 1),
(15, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentaris`
--

CREATE TABLE `comentaris` (
  `plat_id` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL,
  `comentari` varchar(200) DEFAULT NULL,
  `nota` float NOT NULL
) ;

--
-- Volcado de datos para la tabla `comentaris`
--

INSERT INTO `comentaris` (`plat_id`, `comanda_id`, `comentari`, `nota`) VALUES
(1, 1, 'La sopa de Mustafar cremava molt, però el gust a espècies era increïble.', 4.5),
(1, 7, 'Sopa molt picant, gairebé insuportable si no estàs acostumat a la lava.', 3),
(1, 11, 'M\'ha encantat la sopa de Mustafar, ideal per als amants del picant.', 4.7),
(2, 4, 'Una amanida d\'Endor molt fresca, ideal per obrir boca.', 4),
(2, 10, 'Senzilla, verda i fresca com els boscos d\'Endor.', 4.2),
(3, 3, 'Els bastonets de formatge Lightsaber tenien un arrebossat molt cruixent.', 4.5),
(3, 8, 'Als nens els han encantat els bastonets de formatge que brillen.', 4.8),
(3, 15, 'Els bastonets lightsaber són la millor opció per començar el sopar.', 5),
(4, 1, 'Les costelles de Bantha estaven molt tendres i ben cuites.', 4.8),
(4, 6, 'La carn de Bantha és excel·lent, repetirem segur.', 5),
(4, 12, 'Costelles de Bantha perfectes de sal i de cocció.', 4.9),
(5, 2, 'L\'hamburguesa de Dewback és una autèntica bogeria de gran.', 4.2),
(5, 9, 'La salsa de l\'hamburguesa Dewback és secreta però boníssima.', 4.6),
(6, 4, 'El pollastre de Porg estava una mica sec per la meva preferència.', 3.2),
(7, 3, 'La pasta Mon Calamari amb tinta és de les millors que he tastat mai.', 4.9),
(7, 10, 'La pasta Mon Calamari és un plat molt recomanable.', 4.7),
(8, 5, 'El gofre de l\'Estrella de la Mort és espectacular per als més llaminers.', 4.7),
(8, 8, 'Un gofre molt original i amb una presentació de 10.', 4.5),
(8, 13, 'El gofre estava una mica fred, potser l\'han deixat massa estona al taulell.', 3),
(9, 1, 'La llet blava de postres estava ben freda, boníssima!', 5),
(9, 7, 'El gelat de llet blava ha salvat la nit després de la sopa tan picant!', 4.9),
(9, 9, 'Clàssic gelat de Tatooine que mai falla.', 4.5),
(10, 5, 'La mousse de carbonita del Solo tenia el punt de dolç perfecte.', 4.8),
(10, 6, 'Mousse de xocolata molt bona, tot i que s\'ha desfet una mica ràpid.', 3.8),
(10, 10, 'El disseny de la carbonita congelada està super ben aconseguit.', 5),
(10, 14, 'Està ben aconseguit, però m\'esperava una porció una mica més gran.', 3.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `calories` float NOT NULL,
  `final` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredients`
--

INSERT INTO `ingredients` (`id`, `nom`, `calories`, `final`) VALUES
(1, 'Rancor-ribs', 850, 1),
(2, 'Blue-milk', 120, 0),
(3, 'Portions-rey', 340, 1),
(4, 'Nuna-legs', 450, 1),
(5, 'Meiloorun-fruit', 85, 1),
(6, 'Hubba-gourd', 190, 0),
(7, 'Spiced-caf', 65, 1),
(8, 'Endor-mushroom', 40, 0),
(9, 'Glow-blue-moss', 15, 0),
(10, 'Gorg-meat', 210, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredient_alergen`
--

CREATE TABLE `ingredient_alergen` (
  `ingredient_id` int(11) NOT NULL,
  `alergen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredient_alergen`
--

INSERT INTO `ingredient_alergen` (`ingredient_id`, `alergen_id`) VALUES
(3, 1),
(2, 2),
(1, 3),
(5, 4),
(8, 5),
(2, 6),
(4, 7),
(6, 8),
(10, 9),
(9, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plats`
--

CREATE TABLE `plats` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `imatge` varchar(400) DEFAULT NULL,
  `categoria` varchar(20) NOT NULL,
  `preu` float NOT NULL,
  `calificacio` float DEFAULT NULL,
  `unitats_disponibles` int(11) NOT NULL
) ;

--
-- Volcado de datos para la tabla `plats`
--

INSERT INTO `plats` (`id`, `nom`, `imatge`, `categoria`, `preu`, `calificacio`, `unitats_disponibles`) VALUES
(1, 'Sopa de Lava de Mustafar', 'https://glassandservice.com/plato-negro-lava-caja-2-uds.html', 'Entrant', 8.5, 4.5, 20),
(2, 'Amanida de Fulles d Endor', 'https://www.enbotella.com/es/blog/el-restaurante-mas-caro-del-mundo.html?srsltid=AfmBOop2TJlSdKCEKJlxx1HNejacROu2XZ7T4i91XpeB5M_yPyl_PYiD', 'Entrant', 7.2, 4.2, 15),
(3, 'Bastonets de Formatge Lightsaber', 'https://cocinasanayfacil-ruqui.blogspot.com/2016/02/bastoncitos-de-pan-con-semillas.html', 'Entrant', 6.9, 4.8, 30),
(4, 'Costelles de Bantha a la Brasa', 'https://cooking.elmundo.es/recetas/receta-costillas-cerdo-horno.html', 'Principal', 18.9, 4.9, 12),
(5, 'Hamburguesa de Dewback', 'https://cookidoo.es/recipes/recipe/es-ES/r735814', 'Principal', 14.5, 4.3, 25),
(6, 'Pollastre rostit de Porg', 'https://cookpad.com/es/recetas/14920372', 'Principal', 16, 4.1, 10),
(7, 'Pasta de Tinta de Calamar Mon Calamari', 'https://www.justspices.es/recetas/pasta-negra-con-pesto-de-aceitunas-1.html', 'Principal', 15.3, 4.6, 18),
(8, 'Gofres de la Estrella de la Mort', 'https://www.excelenciasgourmet.com/es/gofre-sus-versiones-mas-locas-y-populares', 'Postres', 6.5, 4.7, 22),
(9, 'Gelat de Llet Blava de Tatooine', 'https://planesenmadrid.es/la-pecera-el-helado-mas-original-de-madrid/', 'Postres', 5, 4.4, 40),
(10, 'Mousse de Xocolata de Carbonita Solo', 'https://cookidoo.es/recipes/recipe/es-ES/r55122', 'Postres', 7.5, 4.9, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plats_ingredients`
--

CREATE TABLE `plats_ingredients` (
  `plat_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantitat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plats_ingredients`
--

INSERT INTO `plats_ingredients` (`plat_id`, `ingredient_id`, `quantitat`) VALUES
(1, 8, 1.5),
(1, 9, 0.5),
(2, 5, 1),
(2, 8, 2),
(3, 3, 3),
(3, 9, 0.2),
(4, 1, 1),
(4, 7, 0.3),
(5, 3, 0.5),
(5, 10, 1.2),
(6, 4, 2),
(6, 6, 1.5),
(7, 3, 1.5),
(7, 9, 0.8),
(8, 3, 1),
(8, 5, 0.8),
(9, 2, 2.5),
(10, 7, 0.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id`, `nom`) VALUES
(1, 'Subministraments Galàctics Kessel S.L.'),
(2, 'Distribuïdora Corelliana d\'Aliments'),
(3, 'Importacions Tatooine C.A.'),
(4, 'Cultius Orgànics de Naboo'),
(5, 'Logística Imperial de Subministraments'),
(6, 'Mercat Negre de Coruscant');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors_ingredients`
--

CREATE TABLE `proveidors_ingredients` (
  `proveidor_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveidors_ingredients`
--

INSERT INTO `proveidors_ingredients` (`proveidor_id`, `ingredient_id`, `cost`) VALUES
(1, 7, 4.5),
(1, 9, 12),
(2, 1, 18.5),
(2, 4, 7.2),
(3, 2, 1.8),
(3, 6, 3.5),
(4, 5, 4),
(4, 8, 2.9),
(5, 3, 1.2),
(5, 10, 9.5),
(6, 1, 28),
(6, 9, 19.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treballadors`
--

CREATE TABLE `treballadors` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `treballadors`
--

INSERT INTO `treballadors` (`id`, `nom`, `cognom`) VALUES
(1, 'Cassian', 'Andor'),
(2, 'Galen', 'Erso'),
(3, 'Bodhi', 'Rook'),
(4, 'Wedge', 'Antilles'),
(5, 'Poe', 'Dameron'),
(6, 'Aitor', 'Menta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treballadors_comandes`
--

CREATE TABLE `treballadors_comandes` (
  `treballador_id` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `treballadors_comandes`
--

INSERT INTO `treballadors_comandes` (`treballador_id`, `comanda_id`) VALUES
(1, 1),
(1, 3),
(2, 5),
(2, 6),
(3, 9),
(3, 10),
(4, 11),
(4, 13),
(5, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognom` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nom`, `cognom`, `email`, `telefon`) VALUES
(1, 'Luke', 'Skywalker', 'luke.skywalker@rebellion.org', 600111222),
(2, 'Leia', 'Organa', 'leia.organa@senate.gov', 600333444),
(3, 'Han', 'Solo', 'han.solo@millennium.com', 600555666),
(4, 'Obi-Wan', 'Kenobi', 'obiwan.kenobi@jedi.order', 600777888),
(5, 'Anakin', 'Skywalker', 'anakin.skywalker@empire.gov', 600999000),
(6, 'Padmé', 'Amidala', 'padme.amidala@naboo.gov', 601123456),
(7, 'Mace', 'Windu', 'mace.windu@jedi.order', 601789012),
(8, 'Lando', 'Calrissian', 'lando.c@cloudcity.org', 601345678),
(9, 'Qui-Gon', 'Jinn', 'quigon.jinn@jedi.order', 601901234),
(10, 'Rey', 'Skywalker', 'rey.skywalker@resistance.net', 602111222);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_alergens`
--

CREATE TABLE `users_alergens` (
  `user_id` int(11) NOT NULL,
  `alergen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_alergens`
--

INSERT INTO `users_alergens` (`user_id`, `alergen_id`) VALUES
(1, 6),
(2, 5),
(3, 2),
(4, 3),
(5, 1),
(6, 4),
(7, 8),
(8, 10),
(9, 9),
(10, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergens`
--
ALTER TABLE `alergens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indices de la tabla `comanda_proveiment`
--
ALTER TABLE `comanda_proveiment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredient_proveidor` (`proveidor_id`,`ingredient_id`);

--
-- Indices de la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `comandes_plats`
--
ALTER TABLE `comandes_plats`
  ADD PRIMARY KEY (`comanda_id`,`plat_id`),
  ADD KEY `fk_plat2` (`plat_id`);

--
-- Indices de la tabla `comentaris`
--
ALTER TABLE `comentaris`
  ADD PRIMARY KEY (`plat_id`,`comanda_id`),
  ADD KEY `fk_comanda3` (`comanda_id`);

--
-- Indices de la tabla `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indices de la tabla `ingredient_alergen`
--
ALTER TABLE `ingredient_alergen`
  ADD PRIMARY KEY (`alergen_id`,`ingredient_id`),
  ADD KEY `fk_ingredients3` (`ingredient_id`);

--
-- Indices de la tabla `plats`
--
ALTER TABLE `plats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indices de la tabla `plats_ingredients`
--
ALTER TABLE `plats_ingredients`
  ADD PRIMARY KEY (`plat_id`,`ingredient_id`),
  ADD KEY `fk_ingredient` (`ingredient_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveidors_ingredients`
--
ALTER TABLE `proveidors_ingredients`
  ADD PRIMARY KEY (`proveidor_id`,`ingredient_id`),
  ADD KEY `fk_ingredients` (`ingredient_id`);

--
-- Indices de la tabla `treballadors`
--
ALTER TABLE `treballadors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `treballadors_comandes`
--
ALTER TABLE `treballadors_comandes`
  ADD PRIMARY KEY (`treballador_id`,`comanda_id`),
  ADD KEY `fk_comanda2` (`comanda_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `users_alergens`
--
ALTER TABLE `users_alergens`
  ADD PRIMARY KEY (`user_id`,`alergen_id`),
  ADD KEY `fk_alergens` (`alergen_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergens`
--
ALTER TABLE `alergens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comanda_proveiment`
--
ALTER TABLE `comanda_proveiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `comandes`
--
ALTER TABLE `comandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `plats`
--
ALTER TABLE `plats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `treballadors`
--
ALTER TABLE `treballadors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comanda_proveiment`
--
ALTER TABLE `comanda_proveiment`
  ADD CONSTRAINT `fk_ingredient_proveidor` FOREIGN KEY (`proveidor_id`,`ingredient_id`) REFERENCES `proveidors_ingredients` (`proveidor_id`, `ingredient_id`);

--
-- Filtros para la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `comandes_plats`
--
ALTER TABLE `comandes_plats`
  ADD CONSTRAINT `fk_comanda` FOREIGN KEY (`comanda_id`) REFERENCES `comandes` (`id`),
  ADD CONSTRAINT `fk_plat2` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`);

--
-- Filtros para la tabla `comentaris`
--
ALTER TABLE `comentaris`
  ADD CONSTRAINT `fk_comanda3` FOREIGN KEY (`comanda_id`) REFERENCES `comandes` (`id`),
  ADD CONSTRAINT `fk_plat3` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`);

--
-- Filtros para la tabla `ingredient_alergen`
--
ALTER TABLE `ingredient_alergen`
  ADD CONSTRAINT `fk_alergen` FOREIGN KEY (`alergen_id`) REFERENCES `alergens` (`id`),
  ADD CONSTRAINT `fk_ingredients3` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Filtros para la tabla `plats_ingredients`
--
ALTER TABLE `plats_ingredients`
  ADD CONSTRAINT `fk_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `fk_plat` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`);

--
-- Filtros para la tabla `proveidors_ingredients`
--
ALTER TABLE `proveidors_ingredients`
  ADD CONSTRAINT `fk_ingredients` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `fk_proveidor` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id`);

--
-- Filtros para la tabla `treballadors_comandes`
--
ALTER TABLE `treballadors_comandes`
  ADD CONSTRAINT `fk_comanda2` FOREIGN KEY (`comanda_id`) REFERENCES `comandes` (`id`),
  ADD CONSTRAINT `fk_treballador` FOREIGN KEY (`treballador_id`) REFERENCES `treballadors` (`id`);

--
-- Filtros para la tabla `users_alergens`
--
ALTER TABLE `users_alergens`
  ADD CONSTRAINT `fk_alergens` FOREIGN KEY (`alergen_id`) REFERENCES `alergens` (`id`),
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
