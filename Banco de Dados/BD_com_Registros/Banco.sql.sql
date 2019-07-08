-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05-Abr-2018 às 05:49
-- Versão do servidor: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `salariobase` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`codigo`, `nome`, `descricao`, `salariobase`) VALUES
(1, 'Garçon', 'Atendimento ao Publico', 937.34),
(2, 'Gerente', 'Gerente Admistrativo, sua função e gerir a empresa como um todo.', 2569.35),
(3, 'Caixa', 'receber dos garçons, os valor pagos pelos clientes', 1283.59),
(4, 'Cozinheiro', 'atuar no preparo dos alimentos.', 1769.21),
(5, 'Estagiário', 'atendimento ao publico', 937.34);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comanda`
--

CREATE TABLE `comanda` (
  `codigo` int(11) NOT NULL,
  `datacompra` datetime DEFAULT NULL,
  `formapagamento` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `codigofuncionario` int(11) DEFAULT NULL,
  `codigopizza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comanda`
--

INSERT INTO `comanda` (`codigo`, `datacompra`, `formapagamento`, `status`, `codigofuncionario`, `codigopizza`) VALUES
(1, '2018-04-03 00:00:00', 'À vista', 'Paga', 2, 1),
(2, '2018-04-03 00:00:00', 'Débito', 'A pagar', 4, 2),
(3, '2018-04-03 00:00:00', 'Crédito', 'Cancelado', 3, 3),
(4, '2018-04-03 00:00:00', 'Cheque', 'Paga', 1, 5),
(5, '2018-04-03 00:00:00', 'Crédito', 'A pagar', 5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) NOT NULL,
  `dataadmissao` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  `codigocargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `cpf`, `dataadmissao`, `status`, `codigocargo`) VALUES
(1, 'Lucas Paixão', '000.000.000/01', '2016-04-03 00:00:00', 'Ativo', 4),
(2, 'Joanderson Martins', '000.000.000/02', '2016-04-03 00:00:00', 'Ativo', 1),
(3, 'Débora de Melo', '000.000.000/03', '2016-04-03 00:00:00', 'Ativo', 3),
(4, 'Louze Paixão', '000.000.000/04', '2016-04-02 00:00:00', 'Ativo', 2),
(5, 'Joria Alves', '000.000.000/05', '2018-04-01 00:00:00', 'Ativo', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `joandersonmartins`
--

CREATE TABLE `joandersonmartins` (
  `codigo` int(11) NOT NULL,
  `primeironome` varchar(45) NOT NULL,
  `ultimonome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `joandersonmartins`
--

INSERT INTO `joandersonmartins` (`codigo`, `primeironome`, `ultimonome`) VALUES
(1, 'Joanderson', 'Martins'),
(2, 'Débora', 'Martins'),
(3, 'Louse', 'Martins'),
(4, 'Johab', 'Martins'),
(5, 'Joria', 'Martins');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza`
--

CREATE TABLE `pizza` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `ingredientes` varchar(100) NOT NULL,
  `valor` float NOT NULL,
  `status` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pizza`
--

INSERT INTO `pizza` (`codigo`, `nome`, `ingredientes`, `valor`, `status`, `tipo`) VALUES
(1, 'romeu e julieta', 'goiabada , queijo mussarela, catupiry', 19.9, 'Disponivel', 'Doce'),
(2, 'calabresa', 'calabresa, queijo mussarela, ceboila', 21.9, 'Disponivel', 'Salgada'),
(3, 'tomate seco', 'tomate seco, oregano, mussarela', 16.9, 'Disponivel', 'Vegetariana'),
(4, '4 queijos', 'mussarela, reino,parmesão,prato', 29.9, 'Indisponivel', 'Salgada'),
(5, 'banana', 'banana, canela,mel', 18.9, 'Disponivel', 'Fit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigopizza_fk` (`codigopizza`),
  ADD KEY `codigofuncionario_fk` (`codigofuncionario`) USING BTREE;

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigocargo_fk` (`codigocargo`) USING BTREE;

--
-- Indexes for table `joandersonmartins`
--
ALTER TABLE `joandersonmartins`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comanda`
--
ALTER TABLE `comanda`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `joandersonmartins`
--
ALTER TABLE `joandersonmartins`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `codigofuncionario_fk` FOREIGN KEY (`codigofuncionario`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `codigopizza_fk` FOREIGN KEY (`codigopizza`) REFERENCES `pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `codigocargo_fk` FOREIGN KEY (`codigocargo`) REFERENCES `cargo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
