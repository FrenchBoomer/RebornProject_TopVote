-- Généré le :  Dim 10 nov. 2019 à 03:04

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Structure de la table `votes_topserveur`
--

DROP TABLE IF EXISTS `votes_topserveur`;
CREATE TABLE IF NOT EXISTS `votes_topserveur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT 'Citizen Citizen',
  `ip` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `date` date NOT NULL DEFAULT '2010-04-06',
  `nombredevotes` int(11) NOT NULL DEFAULT '1',
  `recuperation` varchar(55) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `votes_topserveur`
--

INSERT INTO `votes_topserveur` (`id`, `nom`, `ip`, `date`, `nombredevotes`, `recuperation`) VALUES
(1, 'Citizen Citizen', '127.0.0.1', '2010-04-06', 1, 'active'),
COMMIT;