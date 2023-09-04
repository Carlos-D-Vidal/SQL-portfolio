-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Ago-2023 às 23:39
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calculaMedia` (IN `Aluno` VARCHAR(30), IN `Disciplina` VARCHAR(30))   BEGIN

DECLARE somaNota INT;
DECLARE countNota INT;
DECLARE media DECIMAL (3,1);

SELECT SUM(A.nota), COUNT(A.nota) 
INTO somaNota, countNota 
FROM nota A, aluno B, disciplina C 
WHERE b.nomeAluno = Aluno AND C.disciplina = Disciplina AND A.idAluno = B.idAluno AND A.idDisciplina = C.idDisciplina;

IF countNota > 0 THEN
SET media = somaNota / countNota;
SELECT media, Aluno, Disciplina;
ELSE
SELECT 'nenhuma nota encontrada';
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertNota` (IN `Aluno` VARCHAR(30), IN `Disciplina` VARCHAR(30), IN `Nota` INT(11))   BEGIN

DECLARE idAlunoSP INT;
DECLARE idDisciplinaSP INT;
DECLARE verAluno INT;
DECLARE verDisciplina INT;

SELECT COUNT(A.nomeAluno) INTO verAluno FROM aluno A WHERE a.nomeAluno = Aluno;
SELECT COUNT(B.disciplina) INTO verDisciplina FROM disciplina B WHERE B.disciplina = Disciplina;

IF verAluno > 0 AND verDisciplina > 0 THEN
SELECT A.idAluno, B.idDisciplina INTO idAlunoSP, idDisciplinaSP 
FROM aluno A, disciplina B 
WHERE Aluno = A.nomeAluno AND Disciplina = B.disciplina;

INSERT INTO escola.nota VALUES(NULL, Nota, idAlunoSP,idDisciplinaSP);

ELSE
SELECT "Insira dados validos";
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `idAluno` int(11) NOT NULL,
  `nomeAluno` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`idAluno`, `nomeAluno`) VALUES
(1, 'Carlos'),
(2, 'Daniel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `disciplina` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `disciplina`) VALUES
(1, 'TI'),
(2, 'PHP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota`
--

CREATE TABLE `nota` (
  `idNota` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `idAluno` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `nota`
--

INSERT INTO `nota` (`idNota`, `nota`, `idAluno`, `idDisciplina`) VALUES
(1, 9, 1, 1),
(2, 8, 1, 1),
(3, 7, 1, 1),
(4, 10, 2, 2),
(6, 10, 1, 1),
(7, 7, 2, 2),
(8, 10, 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idAluno`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`);

--
-- Índices para tabela `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idNota`),
  ADD KEY `fk_idAluno` (`idAluno`),
  ADD KEY `fk_idDisciplina` (`idDisciplina`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `idAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
  MODIFY `idNota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_idAluno` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idDisciplina` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
