-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Set-2020 às 03:10
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pagos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `apellido` varchar(300) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `nivel` int(11) NOT NULL,
  `pw` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre`, `apellido`, `correo`, `nivel`, `pw`) VALUES
(1, 'Administrador', 'Administrador', 'steelsonnymcs@gmail.com', 1, '1234');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `name_empresa` varchar(300) NOT NULL,
  `tel_empresa` varchar(300) NOT NULL,
  `rif_empresa` varchar(300) NOT NULL,
  `dir_empresa` varchar(300) NOT NULL,
  `id_admin_id_empresa` int(11) NOT NULL,
  `logo_empresa` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `name_empresa`, `tel_empresa`, `rif_empresa`, `dir_empresa`, `id_admin_id_empresa`, `logo_empresa`) VALUES
(1, 'HeavyDeveloper', '0276-3480995', 'j-21545412-0', 'centro calle 12', 1, 'logoc3.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresos`
--

CREATE TABLE `ingresos` (
  `id_ingreso` int(11) NOT NULL,
  `id_service_id_ingreso` int(11) NOT NULL,
  `ent_lt_id_litragem` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `name_fornecedor` varchar(100) NOT NULL,
  `cantida_movimiento` int(11) NOT NULL,
  `motivo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ingresos`
--

INSERT INTO `ingresos` (`id_ingreso`, `id_service_id_ingreso`, `ent_lt_id_litragem`, `fecha_ingreso`, `name_fornecedor`, `cantida_movimiento`, `motivo`) VALUES
(77, 149, 1, '2020-09-13 21:05:00', 'Rafael', 10, 'Faltante'),
(78, 147, 37, '2020-09-13 22:04:00', 'Rafael', 10, 'venta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `litragem`
--

CREATE TABLE `litragem` (
  `id_litragem` int(11) NOT NULL,
  `name_litragem` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `litragem`
--

INSERT INTO `litragem` (`id_litragem`, `name_litragem`) VALUES
(31, '1 L'),
(29, '1 L PET'),
(30, '1 L Vidro'),
(32, '1.25 Lts'),
(34, '1.5 Lts'),
(33, '1.5 Lts PET'),
(36, '1.75 Lts'),
(35, '1.75 Lts PET'),
(38, '2 Lts'),
(37, '2 Lts PET'),
(4, '200 mL'),
(1, '200 mL PET'),
(2, '200 mL Vidro'),
(7, '220 mL'),
(5, '220 mL PET '),
(6, '220 mL Vidro'),
(10, '237 ML'),
(8, '237 ML PET'),
(9, '237 mL Vidro'),
(13, '250 mL'),
(11, '250 mL PET'),
(12, '250 mL Vidro'),
(16, '269 mL '),
(14, '290 mL PET'),
(15, '290 mL Vidro'),
(17, '300 mL'),
(20, '350 mL'),
(19, '350 mL Lata'),
(18, '350 mL PET'),
(21, '400 mL'),
(22, '500 mL PET'),
(23, '500 mL Vidro'),
(24, '550 mL'),
(26, '600 mL'),
(25, '600 mL PET'),
(27, '700 mL'),
(28, '900 mL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `payments`
--

CREATE TABLE `payments` (
  `id_payments` int(11) NOT NULL COMMENT 'id de tabla de pagos ',
  `state_payment` varchar(300) NOT NULL COMMENT 'estado del pago si vensido o n proceso y pagado ',
  `date_payment` datetime NOT NULL COMMENT 'fecha de pago ',
  `id_user_id_payments` int(11) NOT NULL COMMENT 'relacion con el usuario que pago o que se esta procesando ',
  `id_accounts_id_payments` int(11) NOT NULL COMMENT 'relacion con bancos',
  `date_pago` datetime NOT NULL COMMENT 'fecha de registro de pago'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(500) NOT NULL,
  `telefono_proveedor` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_proveedor`, `telefono_proveedor`, `correo`) VALUES
(1, 'no a aplica', '0426-1454751', 'popotas@popotas.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `salida`
--

CREATE TABLE `salida` (
  `id_salida` int(11) NOT NULL,
  `id_service_id_salida` int(11) NOT NULL,
  `sai_lt_id_litragem` int(11) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `id_user_id_salida` int(11) NOT NULL COMMENT 'id de usuarios en caso de que haya sido una venta ',
  `cantida_salida` int(11) NOT NULL,
  `motivo_salida` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `salida`
--

INSERT INTO `salida` (`id_salida`, `id_service_id_salida`, `sai_lt_id_litragem`, `fecha_salida`, `id_user_id_salida`, `cantida_salida`, `motivo_salida`) VALUES
(6, 149, 1, '2020-09-14 03:09:31', 8, 50, ''),
(7, 149, 1, '2020-09-13 22:56:00', 8, 50, 'venta'),
(8, 149, 1, '2020-09-13 22:56:00', 8, 50, 'mas ventas'),
(9, 148, 33, '2020-09-13 23:31:00', 8, 20, 'venta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `name_service` varchar(300) NOT NULL COMMENT 'nombre del servicio',
  `price_service` varchar(300) NOT NULL COMMENT 'precio del servicio',
  `date_ven_service` datetime NOT NULL COMMENT 'fecha de vencimiento del servicio',
  `info_service` varchar(500) NOT NULL COMMENT 'informacion adicional del servicio',
  `cantida` int(11) NOT NULL COMMENT 'cantida de productos',
  `date_registro_pro` datetime NOT NULL COMMENT 'fecha de registro del producto ',
  `tipo_producto_id_litragem` int(11) NOT NULL COMMENT 'tipo de producto  si es servicio o producto',
  `imagen` varchar(1000) NOT NULL COMMENT 'imagen principal del producto',
  `costo` float NOT NULL COMMENT 'costo del producto o servicio',
  `state_service` int(11) NOT NULL COMMENT 'estado del servicio si es producto o entrada de  dinero'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `service`
--

INSERT INTO `service` (`id_service`, `name_service`, `price_service`, `date_ven_service`, `info_service`, `cantida`, `date_registro_pro`, `tipo_producto_id_litragem`, `imagen`, `costo`, `state_service`) VALUES
(147, 'Cola', '10', '0000-00-00 00:00:00', 'Mais Sabor', 90, '2020-09-13 20:09:14', 37, 'img-no.jpg', 10, 0),
(148, 'Cola', '10', '0000-00-00 00:00:00', 'Mais Sabor', -8, '2020-09-13 21:09:00', 33, 'producto_1a.jpgCola', 0, 0),
(149, 'Guarana ', '10', '0000-00-00 00:00:00', 'Antartica', -40, '2020-09-14 01:09:00', 1, 'producto_516-5161573_refrigerante-fanta-guaran-200ml-hd-png-download.pngGuarana', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(300) NOT NULL,
  `last_name_user` varchar(300) NOT NULL,
  `mail_user` varchar(300) NOT NULL,
  `phone_user` int(11) NOT NULL,
  `ci_user` varchar(300) NOT NULL,
  `pw_user` varchar(300) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `id_admin_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `last_name_user`, `mail_user`, `phone_user`, `ci_user`, `pw_user`, `direccion`, `id_admin_id_user`) VALUES
(8, 'yon', 'cacadsd', 'y@y.com', 424762061, '23134135', '123456', 'calle 12 carrera 9-10', 1),
(9, 'ansony', 'martinez', 'steelsonnymcs@gmail.com', 2147483647, '70931048273', 'steel2712', 'Rua das Fronteiras,', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `id_admin_id_empresa` (`id_admin_id_empresa`);

--
-- Índices para tabela `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD UNIQUE KEY `fecha_ingreso` (`fecha_ingreso`),
  ADD KEY `id_proveedor_id_ingreso` (`name_fornecedor`),
  ADD KEY `id_service_id_ingreso` (`id_service_id_ingreso`),
  ADD KEY `ent_lt_id_litragem` (`ent_lt_id_litragem`);

--
-- Índices para tabela `litragem`
--
ALTER TABLE `litragem`
  ADD PRIMARY KEY (`id_litragem`),
  ADD KEY `name_litragem` (`name_litragem`);
ALTER TABLE `litragem` ADD FULLTEXT KEY `name_litragem_2` (`name_litragem`);

--
-- Índices para tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payments`),
  ADD KEY `id_user_id_payments` (`id_user_id_payments`);

--
-- Índices para tabela `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Índices para tabela `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `id_user_id_salida` (`id_user_id_salida`),
  ADD KEY `id_service_id_salida` (`id_service_id_salida`),
  ADD KEY `sai_lt_id_litragem` (`sai_lt_id_litragem`);

--
-- Índices para tabela `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `name_service_2` (`name_service`),
  ADD KEY `tipo_producto_id_litragem` (`tipo_producto_id_litragem`);
ALTER TABLE `service` ADD FULLTEXT KEY `name_service` (`name_service`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_admin_id_user` (`id_admin_id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payments` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de tabla de pagos ', AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de tabela `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `salida`
--
ALTER TABLE `salida`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_admin_id_empresa`) REFERENCES `administrador` (`id_administrador`);

--
-- Limitadores para a tabela `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`id_service_id_ingreso`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `ingresos_ibfk_4` FOREIGN KEY (`ent_lt_id_litragem`) REFERENCES `litragem` (`id_litragem`);

--
-- Limitadores para a tabela `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`id_service_id_salida`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`id_user_id_salida`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `salida_ibfk_3` FOREIGN KEY (`sai_lt_id_litragem`) REFERENCES `litragem` (`id_litragem`);

--
-- Limitadores para a tabela `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `sfl_litra1` FOREIGN KEY (`tipo_producto_id_litragem`) REFERENCES `litragem` (`id_litragem`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
