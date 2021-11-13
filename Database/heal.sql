-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 fév. 2021 à 03:03
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `heal`
--

-- --------------------------------------------------------

--
-- Structure de la table `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `actif` bit(1) NOT NULL,
  `id_centre_medical` int(11) DEFAULT NULL,
  `id_docteur` int(11) DEFAULT NULL,
  `id_specialite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `actif`, `id_centre_medical`, `id_docteur`, `id_specialite`) VALUES
(1, b'1', 1, 2, 2),
(2, b'0', 2, 2, 1),
(3, b'1', 1, 5, 1),
(4, b'0', 2, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `centre_docteur_specialite`
--

CREATE TABLE `centre_docteur_specialite` (
  `id_docteur` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `id_centre_medicale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `centre_docteur_specialite`
--

INSERT INTO `centre_docteur_specialite` (`id_docteur`, `id_specialite`, `id_centre_medicale`) VALUES
(2, 1, 2),
(5, 1, 1),
(2, 2, 1),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `centre_medical`
--

CREATE TABLE `centre_medical` (
  `id_centre_medicale` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `centre_medical`
--

INSERT INTO `centre_medical` (`id_centre_medicale`, `adresse`, `nom`, `telephone`) VALUES
(1, '14 Boulevard Jourdan, 75014', 'Institut Pasteur', '01 73 93 23 23'),
(2, 'Avenue Garibaldi, 93400  ', 'Cabinet Henry', ''),
(3, '3 Rue Thénard, 75005 Paris', 'Centre de santé Saint-Michel', '01 53 73 03 03'),
(4, 'Centre Accès Vision ', '81 Rue Michel Ange, 75016 Paris', '01 63 83 13 13'),
(5, '52 Avenue du Général Michel Bizot, 75012 Paris', 'Centre de Santé APAS', '01 47 07 77 77'),
(6, '80 Rue des Entrepreneurs, 75015 Paris', 'Groupe Ophtalys', '01 83 75 52 65');

-- --------------------------------------------------------

--
-- Structure de la table `docteur`
--

CREATE TABLE `docteur` (
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id_docteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `docteur`
--

INSERT INTO `docteur` (`adresse`, `nom`, `prenom`, `telephone`, `id_docteur`) VALUES
('1 Boulevard Jourdan', 'Dupont', 'Pierre', '0660254563', 2),
('1 Boulevard Jourdan', 'Martin', 'Alan', '0660254563', 5);

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `adresse` varchar(255) DEFAULT NULL,
  `anneeDeNaissance` int(11) NOT NULL,
  `compte_actif` bit(1) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id_patient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`adresse`, `anneeDeNaissance`, `compte_actif`, `nom`, `prenom`, `telephone`, `id_patient`) VALUES
('Paris 14', 1990, b'1', 'Dubois', 'Nicholas', '0660254563', 4);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id_rendez_vous` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_patient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`id_rendez_vous`, `date`, `status`, `id_agenda`, `id_patient`) VALUES
(1, '2021-02-16 08:00:00', 'disponible', 1, NULL),
(2, '2021-02-16 08:30:00', 'disponible', 1, NULL),
(3, '2021-02-16 09:00:00', 'indisponible', 1, NULL),
(4, '2021-02-16 09:30:00', 'disponible', 1, NULL),
(5, '2021-02-16 10:00:00', 'disponible', 1, NULL),
(6, '2021-02-16 10:30:00', 'disponible', 2, NULL),
(7, '2021-02-16 11:00:00', 'disponible', 2, NULL),
(8, '2021-02-17 08:00:00', 'disponible', 2, NULL),
(9, '2021-02-17 08:30:00', 'disponible', 2, NULL),
(10, '2021-02-17 08:00:00', 'disponible', 3, NULL),
(11, '2021-02-17 08:30:00', 'reservé', 3, 4),
(12, '2021-02-17 09:00:00', 'disponible', 3, NULL),
(13, '2021-02-17 09:30:00', 'indisponible', 3, NULL),
(14, '2021-02-17 10:00:00', 'indisponible', 3, NULL),
(15, '2021-02-17 10:30:00', 'indisponible', 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous_annulee`
--

CREATE TABLE `rendez_vous_annulee` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  `id_patient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id_specialite` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `libelle`) VALUES
(1, 'Généraliste'),
(2, 'Dermatologie'),
(3, 'Endocrinologie'),
(4, 'Cardiologie'),
(5, 'Gynécologie'),
(6, 'Néphrologie'),
(7, 'Ophtalmologie');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilsateur` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `type_utilisateur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilsateur`, `email`, `mot_de_passe`, `type_utilisateur`) VALUES
(1, 'admin@heal.com', 'admin', 'admin'),
(2, 'pierre_dupont@gmail.com', '123456', 'docteur'),
(4, 'nicholas@gmail.com', '123456789', 'patient'),
(5, 'alain@gmail.com', '123456', 'docteur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `FKkl5yi9x7v2et8xiubxjbog2os` (`id_centre_medical`),
  ADD KEY `FKl70jugths914207e0lw0pg19y` (`id_docteur`),
  ADD KEY `FK8m2g1q81dvymlyob8a0hnuhlt` (`id_specialite`);

--
-- Index pour la table `centre_docteur_specialite`
--
ALTER TABLE `centre_docteur_specialite`
  ADD PRIMARY KEY (`id_docteur`,`id_centre_medicale`),
  ADD KEY `FKi4covgfj6iafpgom868tlfd3k` (`id_specialite`),
  ADD KEY `FK9id5w7ib4jnwrhtm8jccf7e39` (`id_centre_medicale`);

--
-- Index pour la table `centre_medical`
--
ALTER TABLE `centre_medical`
  ADD PRIMARY KEY (`id_centre_medicale`);

--
-- Index pour la table `docteur`
--
ALTER TABLE `docteur`
  ADD PRIMARY KEY (`id_docteur`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id_rendez_vous`),
  ADD KEY `FKioq4v6x7u76hu4tqgb0tpx0m` (`id_agenda`),
  ADD KEY `FKdr5rw99v3d270m8ax89huphda` (`id_patient`);

--
-- Index pour la table `rendez_vous_annulee`
--
ALTER TABLE `rendez_vous_annulee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK795sm65tyf93cmworwn97e0jd` (`id_agenda`),
  ADD KEY `FKf9tctfq39hxkklfkog2escir5` (`id_patient`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id_specialite`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilsateur`),
  ADD UNIQUE KEY `UK_35ysk0sh9ruwixrld3nc0weut` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `centre_medical`
--
ALTER TABLE `centre_medical`
  MODIFY `id_centre_medicale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id_rendez_vous` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id_specialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilsateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `FK8m2g1q81dvymlyob8a0hnuhlt` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`),
  ADD CONSTRAINT `FKkl5yi9x7v2et8xiubxjbog2os` FOREIGN KEY (`id_centre_medical`) REFERENCES `centre_medical` (`id_centre_medicale`),
  ADD CONSTRAINT `FKl70jugths914207e0lw0pg19y` FOREIGN KEY (`id_docteur`) REFERENCES `docteur` (`id_docteur`);

--
-- Contraintes pour la table `centre_docteur_specialite`
--
ALTER TABLE `centre_docteur_specialite`
  ADD CONSTRAINT `FK9id5w7ib4jnwrhtm8jccf7e39` FOREIGN KEY (`id_centre_medicale`) REFERENCES `centre_medical` (`id_centre_medicale`),
  ADD CONSTRAINT `FKaq051n1eg5s5dhqsj8iih54yp` FOREIGN KEY (`id_docteur`) REFERENCES `docteur` (`id_docteur`),
  ADD CONSTRAINT `FKi4covgfj6iafpgom868tlfd3k` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`);

--
-- Contraintes pour la table `docteur`
--
ALTER TABLE `docteur`
  ADD CONSTRAINT `FKidaoc92ywpr98xnxlxs89y6d` FOREIGN KEY (`id_docteur`) REFERENCES `utilisateur` (`id_utilsateur`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FK955d15ptnvs5r94aa3vh7pjg9` FOREIGN KEY (`id_patient`) REFERENCES `utilisateur` (`id_utilsateur`);

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `FKdr5rw99v3d270m8ax89huphda` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`),
  ADD CONSTRAINT `FKioq4v6x7u76hu4tqgb0tpx0m` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`);

--
-- Contraintes pour la table `rendez_vous_annulee`
--
ALTER TABLE `rendez_vous_annulee`
  ADD CONSTRAINT `FK795sm65tyf93cmworwn97e0jd` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`),
  ADD CONSTRAINT `FKf9tctfq39hxkklfkog2escir5` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
