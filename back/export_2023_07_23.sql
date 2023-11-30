-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `cryptiwiki` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cryptiwiki`;

CREATE TABLE `creature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physical_percularities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_mention` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `related_creatures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `other_names` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json)',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A6C6AF4A76ED395` (`user_id`),
  CONSTRAINT `FK_2A6C6AF4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature` (`id`, `user_id`, `name`, `resume`, `description`, `picture`, `size`, `weight`, `physical_percularities`, `diet`, `origin`, `localisation`, `first_mention`, `created_at`, `updated_at`, `is_valid`, `is_visible`, `related_creatures`, `other_names`, `slug`) VALUES
(1,	NULL,	'Wolpertinger',	'Le Wolpertinger est une créature légendaire de la mythologie bavaroise. Il est souvent décrit comme un animal hybride, résultant de la fusion de différentes espèces. Le terme \"Wolpertinger\" est dérivé du mot allemand \"Wolpertinger\" qui signifie \"artisan tourneur\" en référence à l\'artisanat du bois.',	'Le Wolpertinger est une créature légendaire issue du folklore bavarois. Présentée comme une espèce de chimère, le Wolpertinger est réputé pour sa nature hybride, combinant des caractéristiques d\'animaux tels que le lapin, le canard, la chouette et le cerf. Cette curieuse créature fascine depuis longtemps les habitants des régions montagneuses de Bavière, et son image est devenue emblématique de la culture traditionnelle de la région.\n        Description : Le Wolpertinger est décrit comme un animal au corps de lapin, avec des ailes de chauve-souris et des bois de cerf ramifiés. Ses pattes avant ressemblent à celles d\'un canard, tandis que ses pattes arrière sont semblables à celles d\'un cerf. Il est souvent représenté avec une queue touffue et une tête portant des attributs variés, tels que des plumes, des poils et des yeux globuleux. La taille du Wolpertinger varie généralement entre celle d\'un lièvre et celle d\'un petit cerf.\n        Particularités : Le Wolpertinger est souvent associé à des histoires fantastiques et des légendes locales. On dit qu\'il habite principalement dans les forêts et les montagnes de Bavière, où il vit dans des terriers souterrains et se déplace avec une grande agilité. Le folklore local attribue au Wolpertinger des pouvoirs magiques et des capacités de métamorphose, lui permettant de se camoufler dans son environnement et d\'échapper aux regards indiscrets.\n        Témoignages : Bien que le Wolpertinger soit généralement considéré comme une créature légendaire, de nombreux témoignages de rencontres avec cette étrange chimère ont été rapportés au fil des ans. Les habitants de la région de Bavière prétendent avoir aperçu le Wolpertinger lors de promenades en forêt ou lors de soirées de chasse. Cependant, ces témoignages sont souvent contradictoires et accompagnés de preuves visuelles peu fiables, telles que des photographies floues ou des traces peu concluantes.',	'/wolpertinger.jpg',	'de 40 à 60cm de long',	'jusqu\'à 6kg',	'Possède diverses formes, des cornes de cerf, des ailes de rapace, des crocs de loup',	'Omnivore',	'Folklore allemand',	'Alpes bavaroises',	'XVIème siècle',	'2023-07-13 15:24:48',	NULL,	1,	1,	'[\"Jackalope\",\"Skvader\"]',	'[\"Oibadrischl\",\"Raurackl\",\"Rammeschucksn\"]',	'wolpertinger'),
(2,	NULL,	'Monstre du Loch Ness',	'Le monstre du Loch Ness est une légende célèbre entourant une prétendue créature aquatique vivant dans le Loch Ness, un lac situé en Écosse',	'Le monstre du Loch Ness, également connu sous le nom affectueux de \'Nessie\', est une créature légendaire qui aurait été aperçue dans les eaux troubles du Loch Ness en Écosse. Considéré comme l\\\'une des énigmes les plus célèbres et persistantes du monde, le monstre du Loch Ness a suscité l\\\'intérêt et la curiosité de nombreux chercheurs, explorateurs et amateurs de mystères au fil des décennies.\n        Description : La description du monstre du Loch Ness varie selon les témoignages, mais on le décrit généralement comme une créature aquatique de grande taille, ressemblant à un serpent ou à un reptile. Certains rapports suggèrent qu\\\'il pourrait mesurer entre 10 et 15 mètres de long, avec une apparence similaire à celle d\\\'un plésiosaure, un reptile marin préhistorique. Selon ces récits, le monstre du Loch Ness possède un long cou, une tête de forme allongée et une série de bosses ou de bosses sur son dos.\n        Particularités : Le monstre du Loch Ness est souvent associé à des particularités intrigantes. L\\\'une des caractéristiques les plus notables est sa capacité présumée à échapper à la détection malgré les efforts déployés pour le localiser. Des tentatives de recherche ont été menées au fil des années, utilisant des sonars, des photographies sous-marines et même des plongées en eaux profondes, mais aucune preuve concluante n\\\'a été obtenue. Cette capacité à éviter la capture a alimenté la spéculation selon laquelle le monstre du Loch Ness pourrait être une espèce inconnue, dotée de facultés de camouflage ou de comportements furtifs.\n        Témoignages : Depuis les premières observations rapportées au début du XXe siècle, de nombreux témoignages de rencontres avec le monstre du Loch Ness ont été enregistrés. Les récits incluent des observations visuelles, des photographies et même des enregistrements sonores prétendument liés à la présence de la créature. Cependant, l\\\'authenticité de ces preuves a souvent été remise en question, et les avis sont partagés quant à la validité des témoignages. Parmi les témoignages les plus célèbres figure la photographie controversée, connue sous le nom de \'Surgeon\\\'s Photograph\', prise en 1934 par le chirurgien Robert Kenneth Wilson. Bien que cette photographie ait longtemps été considérée comme une preuve convaincante de l\\\'existence du monstre du Loch Ness, elle a ultérieurement été révélée comme une supercherie. Depuis lors, de nombreuses autres photographies et témoignages ont été présentés, mais la plupart d\\\'entre eux ont été critiqués pour leur manque de clarté ou de fiabilité.',	'/loch_ness_monster.jpg',	'entre 10m et 15m de long',	'plusieurs tonnes',	'Seule la partie émergée de l\'animal a été observée',	'Carnivore',	'Folklore écossais',	'Loch Ness',	'1898',	'2023-07-13 15:24:48',	NULL,	1,	1,	'[\"\"]',	'[\"Nessie\"]',	'monstre-du-loch-ness'),
(3,	NULL,	'Le Yéti',	'Le yéti, également connu sous le nom d\'abominable homme des neiges, est une créature légendaire souvent décrite comme une espèce de grand primate vivant dans les régions montagneuses de l\'Himalaya.',	'Le monstre du Yéti, également connu sous le nom d\'abominable homme des neiges, est une créature légendaire qui aurait été aperçue dans les régions montagneuses de l\'Himalaya. Considéré comme l\'un des mystères les plus célèbres et intrigants du monde, le monstre du Yéti a suscité l\'intérêt et la fascination de nombreux chercheurs, explorateurs et passionnés de cryptozoologie à travers le temps.\n        Description : La description du monstre du Yéti varie en fonction des témoignages et des légendes locales. Dans les récits les plus courants, le Yéti est décrit comme une créature de grande taille, similaire à un grand singe ou à un hominidé. On le décrit souvent comme étant recouvert d\'une épaisse fourrure brune ou grise pour résister aux conditions extrêmes des régions montagneuses. Le Yéti est généralement décrit comme ayant une silhouette massive, avec de larges épaules et une stature bipède, lui permettant de se déplacer debout.\n        Particularités : Le monstre du Yéti est souvent associé à certaines particularités intrigantes. L\'une des caractéristiques les plus notables est son habitat supposé dans les zones reculées et difficiles d\'accès de l\'Himalaya, ce qui a rendu les expéditions et les recherches sur le terrain particulièrement complexes. Les témoignages et les légendes suggèrent que le Yéti est bien adapté à la vie en haute altitude et est capable de se déplacer habilement dans des conditions extrêmes. Un autre aspect intéressant est l\'existence de traces présumées du Yéti, notamment des empreintes de pas dans la neige ou la boue. Certaines de ces traces ont été collectées au fil des ans, mais leur authenticité a souvent été remise en question. Les moulages et les photographies d\'empreintes de pas, bien que parfois intrigants, n\'ont pas encore fourni de preuve concluante de l\'existence du Yéti.\n        Témoignages:  Depuis les premiers récits des populations locales de l\'Himalaya, de nombreux témoignages de rencontres avec le monstre du Yéti ont été enregistrés. Les témoins prétendent avoir aperçu la créature, parfois de près, lors de leurs expéditions en montagne. Certains affirment avoir vu le Yéti à distance, tandis que d\'autres prétendent avoir eu des interactions plus directes avec lui. Cependant, les témoignages varient en termes de détails et de fiabilité, et l\'existence du monstre du Yéti reste controversée. Les preuves photographiques et les enregistrements sonores prétendument liés au Yéti ont également été remis en question et soumis à un examen rigoureux. Malgré cela, l\'existence possible du Yéti continue de fasciner les explorateurs et les amateurs de mystère, alimentant de nouvelles expéditions et recherches dans les régions montagneuses de l\'Himalaya.',	'/yeti.jpg',	'entre 1,5m et 3,75m',	'entre 100kg et 200Kg?',	'Epaisse toison le protégeant du froid, visage rappelant étrangement celui d\\\'un humain',	'Omnivore',	'Floklore himalayen',	'Asie de l\\\'Est',	'IVème siècle av JC',	'2023-07-13 15:24:48',	NULL,	1,	1,	'[\"Bigfoot\",\"Almasty\",\"Yeren\",\"Basajaun\"]',	'[\"Abominable homme des neiges\",\"Migou\",\"Meh-teh\",\"Dzu-teh\",\"Kang admi\",\"Jobran\",\"Chemo\",\"Teh-lma\",\"Yeh-teh\"]',	'le-yeti');

CREATE TABLE `creature_habitat` (
  `creature_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  PRIMARY KEY (`creature_id`,`habitat_id`),
  KEY `IDX_EFDFA20AF9AB048` (`creature_id`),
  KEY `IDX_EFDFA20AAFFE2D26` (`habitat_id`),
  CONSTRAINT `FK_EFDFA20AAFFE2D26` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EFDFA20AF9AB048` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_habitat` (`creature_id`, `habitat_id`) VALUES
(1,	8),
(2,	6),
(2,	7),
(3,	1),
(3,	9);

CREATE TABLE `creature_type` (
  `creature_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`creature_id`,`type_id`),
  KEY `IDX_167238A4F9AB048` (`creature_id`),
  KEY `IDX_167238A4C54C8C93` (`type_id`),
  CONSTRAINT `FK_167238A4C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_167238A4F9AB048` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_type` (`creature_id`, `type_id`) VALUES
(1,	4),
(1,	5),
(1,	9),
(2,	10),
(3,	3);

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230712152509',	'2023-07-12 17:25:18',	414),
('DoctrineMigrations\\Version20230712153912',	'2023-07-12 17:39:20',	22),
('DoctrineMigrations\\Version20230713084359',	'2023-07-13 10:44:07',	81),
('DoctrineMigrations\\Version20230713095522',	'2023-07-13 11:55:29',	93),
('DoctrineMigrations\\Version20230713095709',	'2023-07-13 11:57:14',	60);

CREATE TABLE `habitat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `habitat` (`id`, `name`) VALUES
(1,	'habitat#0'),
(2,	'habitat#1'),
(3,	'habitat#2'),
(4,	'habitat#3'),
(5,	'habitat#4'),
(6,	'habitat#5'),
(7,	'habitat#6'),
(8,	'habitat#7'),
(9,	'habitat#8'),
(10,	'habitat#9'),
(11,	'habitat#10');

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `profile_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profile_picture` (`id`, `title`, `url`) VALUES
(1,	'picture#0',	'https://picsum.photos/200/300'),
(2,	'picture#1',	'https://picsum.photos/200/300'),
(3,	'picture#2',	'https://picsum.photos/200/300'),
(4,	'picture#3',	'https://picsum.photos/200/300');

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `type` (`id`, `name`) VALUES
(1,	'type#0'),
(2,	'type#1'),
(3,	'type#2'),
(4,	'type#3'),
(5,	'type#4'),
(6,	'type#5'),
(7,	'type#6'),
(8,	'type#7'),
(9,	'type#8'),
(10,	'type#9'),
(11,	'type#10');

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `is_valid` tinyint(1) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D649EE45BDBF` (`picture_id`),
  CONSTRAINT `FK_8D93D649EE45BDBF` FOREIGN KEY (`picture_id`) REFERENCES `profile_picture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`id`, `picture_id`, `email`, `name`, `password`, `role`, `is_valid`, `token`) VALUES
(1,	4,	'admin@admin.com',	'Jules',	'$2y$13$cTT0fbMGIrMgvinqRtnq2.BMqaCZGWTCHpAj2fHqTlZq4JmYdMbje',	'[\"ROLE_ADMIN\"]',	1,	NULL);

-- 2023-07-13 15:18:21