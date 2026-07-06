-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/07/2026 às 00:33
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atendelab`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `tipo_atendimento_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_atendimento` date NOT NULL,
  `descricao` text NOT NULL,
  `observacao` text NOT NULL,
  `status` enum('aberto','em_andamento','concluido') NOT NULL DEFAULT 'aberto',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `observacao_final` text DEFAULT NULL,
  `horario_atendimento` time NOT NULL DEFAULT '00:00:00',
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `pessoa_id`, `tipo_atendimento_id`, `usuario_id`, `data_atendimento`, `descricao`, `observacao`, `status`, `criado_em`, `observacao_final`, `horario_atendimento`, `atualizado_em`) VALUES
(1, 1, 1, 1, '2025-06-10', 'Aluno com problema no acesso ao sistema', 'Requer acompanhamento', 'aberto', '2026-06-11 23:09:04', NULL, '09:00:00', '2026-07-02 19:06:06'),
(2, 2, 2, 1, '2025-06-10', 'Dúvida sobre grade curricular', '', 'concluido', '2026-06-11 23:09:04', 'Yes', '10:30:00', '2026-07-06 21:55:52'),
(3, 1, 1, 7, '3324-02-12', 'Ajuste na rede', '', 'em_andamento', '2026-07-02 18:27:54', 'Preciso de auxilio', '12:23:00', '2026-07-06 21:56:04'),
(4, 3, 1, 7, '2015-02-11', 'Ajuda com PC', '', 'aberto', '2026-07-06 22:00:52', NULL, '09:09:00', '2026-07-06 22:00:52'),
(5, 3, 2, 7, '2000-01-01', 'Testes', '', 'aberto', '2026-07-06 22:22:11', NULL, '10:10:00', '2026-07-06 22:22:11'),
(6, 3, 1, 7, '2026-03-12', 'Testesss', '', 'aberto', '2026-07-06 22:23:34', NULL, '12:21:00', '2026-07-06 22:23:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `curso` varchar(100) NOT NULL,
  `periodo` varchar(100) NOT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `observacoes` text DEFAULT NULL,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `documento`, `telefone`, `email`, `curso`, `periodo`, `status`, `criado_em`, `observacoes`, `atualizado_em`) VALUES
(1, 'João Silva', '12345678901', '47999990001', 'joaozinho@email.com', 'Sistemas de Informação', '6', 'inativo', '2026-06-11 23:08:48', '', '2026-07-06 22:00:05'),
(2, 'Maria Souza', '98765432100', '47999990002', 'marimar@email.com', 'Administração', '7', 'ativo', '2026-06-11 23:08:48', '', '2026-07-06 22:00:08'),
(3, 'Cristiano Ronaldo', '104.839.948-33', '(47) 9 9908-0923', 'cr7thebest@email.com', 'Odontologia', '8', 'ativo', '2026-07-06 21:57:23', '', '2026-07-06 21:57:23'),
(4, 'LeoMeSSI', '039.902.390-29', '(93) 0 2932-9320', 'lionel@email.com', 'Culinaria', '9', 'ativo', '2026-07-06 21:59:55', 'Estranho', '2026-07-06 21:59:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_atendimentos`
--

CREATE TABLE `tipos_atendimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_atendimentos`
--

INSERT INTO `tipos_atendimentos` (`id`, `nome`, `descricao`, `status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Suporte Técnico', 'Atendimento relacionado a problemas técnicos', 'ativo', '2026-06-11 23:08:37', '2026-06-18 18:57:53'),
(2, 'Orientação Acadêmica', 'Atendimento para dúvidas acadêmicas', 'ativo', '2026-06-11 23:08:37', '2026-07-02 17:45:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('admin','atendente') DEFAULT 'atendente',
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `perfil`, `status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Administrador', 'admin@atendelab.com', '$2y$10$J9P2kU2BAMZ3TZcuxTsW4e1D/lka8EocYHzvyoOZmCNcWDQz3RuVC', 'admin', 'ativo', '2026-06-11 21:57:17', '2026-06-18 18:57:53'),
(5, 'Administrador', 'admin2@atendelab.com', '$2y$10$rZ6kfQkGuDTKZjYz49jQautnmYFuZyLSeM.NxIuJMpJFpbBLaSmYW', 'admin', 'ativo', '2026-06-11 22:39:57', '2026-06-18 18:57:53'),
(6, 'Jurandir', 'leleco@email.com', '$2y$10$vaEREZJrubrN4kTqjQ/M0O6/p7KQRCNPul1/U5npnnXFumise6x8K', 'atendente', 'ativo', '2026-06-11 23:13:29', '2026-06-18 18:57:53'),
(7, 'admin3', 'admin3@atendelab.com', '$2y$10$PmaCAyGB76r35y6IKFkgv.7WYQH0JDZijmIOpRFfNOcL2NIF23D/e', 'admin', 'ativo', '2026-06-18 18:00:51', '2026-06-18 18:57:53');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PESSOA_ID` (`pessoa_id`),
  ADD KEY `FK_TIPO_ATENDIMENTO` (`tipo_atendimento_id`),
  ADD KEY `FK_USUARIO_ID` (`usuario_id`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Índices de tabela `tipos_atendimentos`
--
ALTER TABLE `tipos_atendimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipos_atendimentos`
--
ALTER TABLE `tipos_atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `FK_PESSOA_ID` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`),
  ADD CONSTRAINT `FK_TIPO_ATENDIMENTO` FOREIGN KEY (`tipo_atendimento_id`) REFERENCES `tipos_atendimentos` (`id`),
  ADD CONSTRAINT `FK_USUARIO_ID` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
