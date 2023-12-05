SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Base de Datos: `sonorabike`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Creacion de tabla `compras`
CREATE TABLE `compras` (
  `id_compra` int(20) NOT NULL,
  `id_usuario` int(20) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Creacion de tabla `compra_producto`
CREATE TABLE `compra_producto` (
  `id_venta` int(20) NOT NULL,
  `cantidad_producto` int(20) NOT NULL,
  `subtotal_precio` float NOT NULL,
  `id_compra` int(20) NOT NULL,
  `id_producto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Creacion de tabla `direccion`
CREATE TABLE `direccion` (
  `id_direccion` int(20) NOT NULL,
  `calle` varchar(80) NOT NULL,
  `colonia` varchar(80) NOT NULL,
  `ciudad` varchar(80) NOT NULL,
  `estado` varchar(80) NOT NULL,
  `pais` varchar(80) NOT NULL,
  `codigo_postal` int(20) NOT NULL,
  `numero_casa` varchar(40) NOT NULL,
  `id_usuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Creacion de tabla `productos`
CREATE TABLE `productos` (
  `id_producto` int(20) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `img_producto` varchar(80) NOT NULL,
  `precio` float NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `stock` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Creacion de tabla `usuarios`
CREATE TABLE `usuarios` (
  `id_usuario` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `tipo` enum('usuario','administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Insercion de datos para la tabla `direccion`
INSERT INTO `direccion` (`id_direccion`, `calle`, `colonia`, `ciudad`, `estado`, `pais`, `codigo_postal`, `numero_casa`, `id_usuario`) VALUES
(1, 'Palmas', 'Bonita', 'Obregon', 'Sonora', 'Mexico', 85033, '101', 3);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Insercion de datos para la tabla `productos`
INSERT INTO `productos` (`id_producto`, `nombre`, `img_producto`, `precio`, `tipo`, `stock`) VALUES
(1, 'Bicicleta de Ruta Scott Addict RC 15', 'assets/images/img1.jpg', 12000, 'Ruta', 100),
(2, 'Bicicleta de Ruta Scott 960', 'assets/images/img2.jpg', 16000, 'Ruta', 100),
(3, 'Bicicleta de Montaña Scott Ransom 910', 'assets/images/img3.jpg', 15000, 'Montana', 100),
(4, 'Jersey Solar', 'assets/images/img4.jpg', 750, 'Accesorio', 150),
(5, 'Combo Luces', 'assets/images/img5.jpg', 900, 'Accesorio', 50),
(6, 'Casco Negro Supra', 'assets/images/img6.jpg', 1200, 'Accesorio', 100),
(7, 'Chain Lube', 'assets/images/img7.jpg', 1200, 'Accesorio', 300);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Insercion de datos para la tabla `usuarios`
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `pass`, `correo`, `telefono`, `tipo`) VALUES
(1, 'Brandon', '12345', 'brandon.figueroa233295@potros.itson.edu.mx', '6441234567', 'administrador'),
(2, 'Manuel', '12345', 'manuel.flores233301@potros.itson.edu.mx', '6447654321', 'administrador'),
(3, 'Usuario', '12345', 'usuario12345@gmail.com', '6449999999', 'usuario');
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indices de la tabla `compras`
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indices de la tabla `compra_producto`
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id_venta`);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indices de la tabla `direccion`
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD UNIQUE KEY `idusuario` (`id_usuario`);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indices de la tabla `productos`
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indices de la tabla `usuarios`
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);
-- --------------------------------------------------------

-- --------------------------------------------------------
-- AUTO_INCREMENT de la tabla `compras`
ALTER TABLE `compras`
  MODIFY `id_compra` int(20) NOT NULL AUTO_INCREMENT;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- AUTO_INCREMENT de la tabla `compra_producto`
ALTER TABLE `compra_producto`
  MODIFY `id_venta` int(20) NOT NULL AUTO_INCREMENT;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- AUTO_INCREMENT de la tabla `direccion`
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- AUTO_INCREMENT de la tabla `productos`
ALTER TABLE `productos`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
-- --------------------------------------------------------

-- --------------------------------------------------------
-- AUTO_INCREMENT de la tabla `usuarios`
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
