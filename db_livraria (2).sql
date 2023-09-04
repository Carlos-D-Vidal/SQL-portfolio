-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jul-2023 às 02:47
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
-- Banco de dados: `db_livraria`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_AUTOR` (IN `varID` INT(11))   BEGIN
DELETE FROM autores
WHERE idAutor = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CATEGORIA` (IN `varID` INT(11))   BEGIN
DELETE FROM categorias
WHERE idCategoria = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_EDITORA` (IN `varID` INT(11))   BEGIN
DELETE FROM editoras
WHERE idEditora = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_LIVRO` (IN `varID` INT(11))   BEGIN
DELETE FROM livros
WHERE idLivro = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_LOGIN` (IN `varID` INT(10))   BEGIN
DELETE FROM contatos
WHERE ID = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_AUTOR` (IN `varAutor` VARCHAR(150))   BEGIN                    
INSERT INTO autores (autor) VALUES
(varAutor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_CATEGORIA` (IN `varCategoria` VARCHAR(150))   BEGIN                    
INSERT INTO categorias (categoria) VALUES
(varCategoria);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_EDITORA` (IN `varEditora` VARCHAR(150))   BEGIN                    
INSERT INTO editoras (editora) VALUES
(varEditora);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LIVRO` (IN `varTitulo` VARCHAR(150), IN `varCategoria` INT(11), IN `varAutor` INT(11), IN `varEditora` INT(11), IN `varPreco` FLOAT(10,2), IN `varData` DATE)   BEGIN                    
INSERT INTO livros (titulo,categoria,autor,editora,preco,dataPublicacao) VALUES
(varTitulo,varCategoria,varAutor,varEditora,varPreco,varData);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LOGIN` (IN `varNome` VARCHAR(150), IN `varEmail` VARCHAR(150), IN `varUsuario` VARCHAR(10), IN `varSenha` VARCHAR(8))   BEGIN
                               
INSERT INTO contatos (NOME, EMAIL, SENHA, USUARIO) VALUES
(varNome, varEmail, varSenha, varUsuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_AUTORES` ()   BEGIN
SELECT idAutor, autor FROM autores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_CATEGORIAS` ()   BEGIN
SELECT idCategoria, categoria FROM categorias;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_EDITORAS` ()   BEGIN
SELECT idEditora, editora FROM editoras;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_LIVROS` ()   BEGIN
SELECT A.idLivro,A.titulo,B.categoria,C.autor,D.editora,A.preco,CONCAT (SUBSTRING(A.dataPublicacao,9,2), "/",SUBSTRING(A.datapublicacao,6,2), "/", SUBSTRING(A.datapublicacao,1,4)) AS datapublicacao FROM livros A, categorias B, autores C, editoras D WHERE A.categoria = B.idCategoria AND A.autor = C.idAutor AND A.editora = D.idEditora;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_LOGIN` (IN `varPesq` VARCHAR(150))   BEGIN
SELECT ID, NOME, USUARIO, EMAIL, SENHA FROM contatos
WHERE NOME LIKE CONCAT ('%', varPesq, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_LOGIN_ALL` ()   BEGIN
SELECT ID, USUARIO, NOME, EMAIL, SENHA FROM contatos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LIST_PRECO` ()   BEGIN
SELECT idLivro,titulo,preco FROM livros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCURAR_AUTOR` (IN `varPesq` VARCHAR(150))   BEGIN
SELECT idAutor,autor FROM autores
WHERE autor LIKE CONCAT ('%', varPesq, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCURAR_CATEGORIA` (IN `varPesq` VARCHAR(150))   BEGIN
SELECT categoria FROM categorias
WHERE categoria LIKE CONCAT ('%', varPesq, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCURAR_EDITORA` (IN `varPesq` VARCHAR(150))   BEGIN
SELECT editora FROM editoras
WHERE editora LIKE CONCAT ('%', varPesq, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCURAR_LIVRO` (IN `varPesq` VARCHAR(150))   BEGIN
SELECT A.idLivro,A.titulo,B.categoria,C.autor,D.editora,A.preco,CONCAT (SUBSTRING(A.dataPublicacao,9,2), "/",SUBSTRING(A.datapublicacao,6,2), "/", SUBSTRING(A.datapublicacao,1,4)) AS datapublicacao FROM livros A, categorias B, autores C, editoras D WHERE A.categoria = B.idCategoria AND A.autor = C.idAutor AND A.editora = D.idEditora AND A.titulo LIKE CONCAT ('%', varPesq, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_LOGIN` (IN `varUSUARIO` VARCHAR(10))   BEGIN
	SELECT ID,USUARIO,NOME,EMAIL,SENHA FROM contatos
    WHERE USUARIO = varUSUARIO;    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_AUTOR` (IN `varID` INT(11), IN `varAutor` VARCHAR(150))   BEGIN
UPDATE autores
SET autor = varAutor
WHERE idAutor = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_CATEGORIA` (IN `varID` INT(11), IN `varCategoria` VARCHAR(150))   BEGIN
UPDATE categorias
SET categoria = varCategoria
WHERE idCategoria = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_EDITORA` (IN `varID` INT(11), IN `varEditora` VARCHAR(150))   BEGIN
UPDATE editoras
SET editora = varEditora
WHERE idEditora = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_LIVRO` (IN `varID` INT(11), IN `varTitulo` VARCHAR(150), IN `varCategoria` INT(11), IN `varAutor` INT(11), IN `varEditora` INT(11), IN `varPreco` FLOAT(10,2), IN `varData` DATE)   BEGIN
UPDATE livros
SET titulo = varTitulo, categoria = varCategoria, autor = varAutor, editora = varEditora, preco = varPreco, dataPublicacao = varData
WHERE idLivro = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_LOGIN` (IN `varNome` VARCHAR(150), IN `varEmail` VARCHAR(150), IN `varUsuario` VARCHAR(10), IN `varSenha` VARCHAR(8))   BEGIN
UPDATE contatos
SET NOME = varNome, EMAIL = varEmail, USUARIO = varUsuario, SENHA = varSenha
WHERE USUARIO = varUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_LOGIN_ID` (IN `VarID` INT(10), IN `varNome` VARCHAR(150), IN `varEmail` VARCHAR(150), IN `varUsuario` VARCHAR(10), IN `varSenha` VARCHAR(8))   BEGIN
UPDATE contatos
SET NOME = varNome, EMAIL = varEmail, USUARIO = varUsuario, SENHA = varSenha
WHERE ID = varID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PRECO` (IN `varID` INT(11), IN `varPreco` FLOAT(10,2))   BEGIN
UPDATE livros
SET preco = varPreco
WHERE idLivro = varID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `autores`
--

CREATE TABLE `autores` (
  `idAutor` int(11) NOT NULL,
  `autor` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `autores`
--

INSERT INTO `autores` (`idAutor`, `autor`) VALUES
(1, 'HP. Lovecraft'),
(3, 'JK. Rowling');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `categoria`) VALUES
(1, 'Terror'),
(2, 'Ficção');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `ID` int(10) NOT NULL,
  `Nome` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `USUARIO` varchar(10) NOT NULL,
  `SENHA` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`ID`, `Nome`, `Email`, `USUARIO`, `SENHA`) VALUES
(1, 'Sofia', 'Sofia@gmail.com', 'Sofia', '123'),
(2, 'Carlos', 'Carlos@gmail.com', 'Carlos', '12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `editoras`
--

CREATE TABLE `editoras` (
  `idEditora` int(11) NOT NULL,
  `editora` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `editoras`
--

INSERT INTO `editoras` (`idEditora`, `editora`) VALUES
(1, 'Necronomicon'),
(2, 'Rocco');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `idLivro` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `categoria` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  `editora` int(11) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `dataPublicacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`idLivro`, `titulo`, `categoria`, `autor`, `editora`, `preco`, `dataPublicacao`) VALUES
(1, 'A sombra de innsmouth', 1, 1, 1, 35.50, '1936-04-01');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`idAutor`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices para tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `editoras`
--
ALTER TABLE `editoras`
  ADD PRIMARY KEY (`idEditora`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`idLivro`),
  ADD KEY `fk_categoria` (`categoria`),
  ADD KEY `fk_autor` (`autor`),
  ADD KEY `fk_editora` (`editora`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `editoras`
--
ALTER TABLE `editoras`
  MODIFY `idEditora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `idLivro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `fk_autor` FOREIGN KEY (`autor`) REFERENCES `autores` (`idAutor`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`idcategoria`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_editora` FOREIGN KEY (`editora`) REFERENCES `editoras` (`idEditora`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
