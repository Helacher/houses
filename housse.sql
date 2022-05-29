-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 jan. 2022 à 20:39
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `housse`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`id`, `name`, `email`, `tel`, `lastname`, `image`) VALUES
(3, 'Chaima', 'chaima@gmail.com', '96727727', 'Barka', '61db2e386a96f980269623.jpg'),
(4, 'HELA', 'hela@gmail.com', '98765456', 'CHERNI', '61db2e5e6a8c9802449882.jpg'),
(5, 'Ali', 'alihadj@gmail.com', '98765456', 'Hadj Hassan', '61db2e8e78136957364907.jpg'),
(6, 'Manel', 'manel@gmail.com', '987655678', 'Hkimi', '61db2eba9a45a012864218.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'hela cherni', 'hela@gmail.com', 'House1', ' i wanna buy house'),
(2, 'mimi', 'hela@gmail.com', 'House1', 'i wanna buy house 1'),
(3, 'mimi', 'aymen@gmail.com', 'House1', 'kjbjhlgcfxdchjbjhvgfubgh'),
(4, 'mimi', 'hela.cherni@sesame.com.tn', 'House1', 'mjhdbhboufvtfylhj'),
(5, 'mimi', 'hela@gmail.com', 'House1', 'kjknxjbfd:akjbhb ljhb igigviygcftvrfiduhsabocygvfati'),
(6, 'jiji', 'manel@gmail.com', 'house3', 'jhbhbtfbn'),
(7, 'hela cherni', 'hela.cherni@sesame.com.tn', 'house3', ',nb hgc ufghggfufdtgbngbityc'),
(8, 'mimi', 'hela.cherni@sesame.com.tn', 'house3', ':kjbhvgfjhn'),
(9, 'hela cherni', 'manel@gmail.com', 'House1', 'kjkhtjvdtrdftiygh'),
(10, 'cherni', 'hela.cherni@sesame.com.tn', 'house3', 'hbhjvbyf');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220103173738', '2022-01-03 18:37:50', 41),
('DoctrineMigrations\\Version20220103174849', '2022-01-03 18:49:00', 32),
('DoctrineMigrations\\Version20220108205012', '2022-01-08 21:50:21', 679),
('DoctrineMigrations\\Version20220108205247', '2022-01-08 21:52:51', 33),
('DoctrineMigrations\\Version20220108213347', '2022-01-08 22:33:58', 44),
('DoctrineMigrations\\Version20220108213518', '2022-01-08 22:35:22', 74),
('DoctrineMigrations\\Version20220108214422', '2022-01-08 22:44:29', 107),
('DoctrineMigrations\\Version20220109091313', '2022-01-09 10:14:11', 454),
('DoctrineMigrations\\Version20220110085827', '2022-01-10 09:58:46', 205);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `rooms` int(11) NOT NULL,
  `floors` int(11) NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `title`, `price`, `rooms`, `floors`, `adress`, `city`, `sold`, `image`, `agent_id`) VALUES
(15, 'HOUSE1', 1234567, 4, 2, '348 CITE ELMENZAH', 'ARIANA', 0, '61db2c61b9011719033835.jpg', NULL),
(16, 'HOUSE2', 987654, 6, 2, '567 CITE OLYMPIQUE', 'ARIANA', 0, '61db2ca54e401685705755.jpg', NULL),
(17, 'HOUSE 3', 89765, 4, 3, '567 CITE IDDIR', 'NABEUL', 0, '61db2cd008ecd813020322.jpg', NULL),
(19, 'HOUSE 5', 89765, 5, 3, '567 CITE IDDIR', 'NABEUL', 0, '61db2d78e7b8a935443161.jpg', NULL),
(20, 'HOUSE 6', 123.54, 8, 3, '234 CITE LA GARRE', 'ARIANA', 0, '61db2da69ebe8593671585.jpg', NULL),
(21, 'HOUSE 7', 12345, 1, 2, '365 CITE ELGHAZELA', 'ARIANA', 0, '61dbeba7c37f4908318466.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'hela@gmail.com', '[\"ROLE_USER\"]', '$2y$13$W/UXgFc5XW.jL5h2rz0DfOn50t9ng8OuweMvqzoGMBLODWfKzsqfC');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8BF21CDE3414710B` (`agent_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE3414710B` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
