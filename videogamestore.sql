-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2017 at 08:56 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videogamestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `user_id` varchar(100) NOT NULL,
  `game_id` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` double DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`user_id`, `game_id`, `quantity`, `price`, `processed`) VALUES
('d593a994-5fcf-4435-b958-cd57516c1ecd', 'f660a994-b5df-11e7-abc4-cec278b6b50a', 1, 56, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '0a3df864-b2f1-11e7-abc4-cec278b6b50a', 1, 24, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', 'fea9fe24-b28e-11e7-abc4-cec278b6b50a', 4, 10, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '5adfeaa4-b2e0-11e7-abc4-cec278b6b50a', 2, 45, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', 'e9fb828c-b6e8-11e7-abc4-cec278b6b50a', 2, 50, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '8929e5a0-b5dc-11e7-abc4-cec278b6b50a', 1, 26, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '97d82bc6-b5db-11e7-abc4-cec278b6b50a', 2, 80, 1),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '47741964-b825-11e7-abc4-cec278b6b50a', 1, 22, 1),
('65e013ac-8737-4b39-988e-01df812d2027', '47741964-b825-11e7-abc4-cec278b6b50a', 2, 22, 1),
('0d15d0b8-e300-4fed-a618-7bfc36d76903', 'e5ecc294-b6ea-11e7-abc4-cec278b6b50a', 1, 100, 1),
('0d15d0b8-e300-4fed-a618-7bfc36d76903', '51048a26-b6eb-11e7-abc4-cec278b6b50a', 1, 40, 1),
('df679f46-523e-4cc5-be28-98904e7c1138', '3ede9ebc-b5de-11e7-abc4-cec278b6b50a', 1, 56, 1),
('df679f46-523e-4cc5-be28-98904e7c1138', 'dc9e5a4a-b820-11e7-abc4-cec278b6b50a', 2, 66, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `game_id` varchar(100) NOT NULL,
  `comment_details` varchar(10000) NOT NULL,
  `comment_date` date NOT NULL,
  `ratings` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
CREATE TABLE IF NOT EXISTS `favourite` (
  `user_id` varchar(100) NOT NULL,
  `game_id` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`user_id`, `game_id`) VALUES
('null', 'fea9fe24-b28e-11e7-abc4-cec278b6b50a'),
('null', 'fea9fe24-b28e-11e7-abc4-cec278b6b50a'),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '97d82bc6-b5db-11e7-abc4-cec278b6b50a'),
('d593a994-5fcf-4435-b958-cd57516c1ecd', '51048a26-b6eb-11e7-abc4-cec278b6b50a'),
('null', 'fea9fe24-b28e-11e7-abc4-cec278b6b50a'),
('0d15d0b8-e300-4fed-a618-7bfc36d76903', '1c23fbd6-b81f-11e7-abc4-cec278b6b50a'),
('d593a994-5fcf-4435-b958-cd57516c1ecdclass=', 'f660a994-b5df-11e7-abc4-cec278b6b50a'),
('d593a994-5fcf-4435-b958-cd57516c1ecdclass=', 'f660a994-b5df-11e7-abc4-cec278b6b50a');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `game_id` varchar(100) NOT NULL,
  `game_name` varchar(100) NOT NULL,
  `game_description` varchar(10000) NOT NULL,
  `console` varchar(20) NOT NULL,
  `num_players` varchar(20) NOT NULL,
  `coop` varchar(10) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `developer` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `front_box_art` varchar(50) NOT NULL,
  `back_box_art` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `developer_logo` varchar(50) NOT NULL,
  `price` decimal(20,0) NOT NULL,
  `discount` double(20,0) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_id`, `game_name`, `game_description`, `console`, `num_players`, `coop`, `genre`, `release_date`, `developer`, `publisher`, `front_box_art`, `back_box_art`, `logo`, `developer_logo`, `price`, `discount`, `quantity`) VALUES
('fea9fe24-b28e-11e7-abc4-cec278b6b50a', 'Nhl 2005', 'The graphics have been even more improved from last year. Now the ''cyber players'' look so close to their real life counterparts that their hard to distinguish. Player models are updated with more life like skin, hair and features. This includes more facial animations and emotions. The coaches are also redone in this manner. The in-game meanwhile adds a whole slew of new animations, cutscenes, goalie animations and enhancements to the fighting engine.In the control department, NHL 2005 adds a new feature called Open-Ice control. This feature lets you potentially control players without the puck, set up for picks, double team and more. Shooting wrist shots and slap shots are also now mapped to separate buttons for more flexibility.The gameplay introduces a new feature as personalities for players. Such that a player like Tie Domi will play more like an enforcer, while Markus Naslund will rely more on finesse and skill. You will be relied on to balance this personalities on each line of a team to create chemistry. The dynasty mode has been redone with a new interface and tweaks. Free Agency and Trading has been tweaked along with the handling of a team. The new system allows you to keep up to date on weekly injuries/streaks reports, letters from you.', 'PlayStation 2', 'N/A', 'No', 'Sports', '2004-09-22', 'EA Sports', 'EA', 'assets/frontBoxArt/nhl2005.jpg', 'assets/backBoxArt/nhl2005.jpg', 'assets/logo/ea.jpg', 'assets/logo/ea.jpg', '10', 20, '46'),
('5adfeaa4-b2e0-11e7-abc4-cec278b6b50a', 'nba 2k17', 'Following the record-breaking launch of NBA 2K16, the NBA 2K franchise continues to stake its claim as the most authentic sports video game with NBA 2K17. As the franchise that "all sports video games should aspire to be" (GamesRadar), NBA 2K17 will take the game to new heights and continue to blur the lines between video game and reality.', 'Xbox One', '4', 'No', 'Sports', '2016-09-16', 'Visual Concepts', '2k', 'assets/frontBoxArt/nba2k17.jpg', 'assets/backBoxArt/nba2k17.jpg', 'assets/logo/2k.jpg', 'assets/logo/2k.jpg', '45', 0, '48'),
('0a3df864-b2f1-11e7-abc4-cec278b6b50a', 'Fifa 17', 'Powered by Frostbite, FIFA 17 transforms the way you play, compete, and emotionally connect with the game. FIFA 17 immerses you in authentic football experiences by leveraging the sophistication of a new game engine, while introducing you to football players full of depth and emotion, and taking you to brand new worlds accessible only in the game. Complete innovation in the way players think and move, physically interact with opponents, and execute in attack lets you own every moment on the pitch.', 'Xbox One', '1', 'No', 'Sports', '2016-09-27', 'EA Canada', 'Electronic Arts ', 'assets/frontBoxArt/fifa17.jpg', 'assets/backBoxArt/fifa17.jpg', 'assets/logo/ea.jpg', 'assets/logo/ea.jpg', '24', 0, '48'),
('938f826a-b5d8-11e7-abc4-cec278b6b50a', 'Diablo 3', 'The game takes place in Sanctuary, the dark fantasy world of the Diablo series. This world was saved twenty years prior by a handful of unnamed heroes in Diablo II, having survived the onslaught brought by the armies of the Burning Hells, who have gone mad from their ordeals. It is up to a new generation of heroes to face the forces of evil threatening the world of Sanctuary.\r\n\r\nPlayers will have the opportunity to explore familiar settings such as Tristram.\r\n\r\nThe only confirmed NPCs are Deckard Cain, who has appeared in both of the previous games, and his niece, Leah, a new character who accompanies the hero in quests from time to time. The plot will revolve around two surviving Lesser Evils, Azmodan and Belial, and an artifact known as the Black Soulstone. Diablo''s world map is composed primarily of two main continents with several small islands in the Northwest region. The world of Sanctuary has been dramatically changed by the destruction of the World Stone in Diablo II: Lord of Destruction.', 'PlayStation 3', '4', 'Yes', 'ARPG', '2013-03-09', 'Blizzard', 'Activision', 'assets/frontBoxArt/diablo3.jpg', 'assets/frontBoxArt/diablo3.jpg', 'assets/logo/activision.jpg', 'assets/logo/blizzard.jpg', '17', 0, '50'),
('b0a37aa8-b5da-11e7-abc4-cec278b6b50a', 'Marvel vs Capcom 2', 'Marvel vs. Capcom 2: New Age of Heroes is a fighting game, developed and published by Capcom. It is the fourth game in the Marvel vs. Capcom series of fighting games. With the fourth installment of this series, Capcom simplified the player controls to make the gameplay more accessible to the wider audience of casual players. The button configuration was trimmed down to 4 main buttons and 2 assist buttons. The game also features a different air-combo system and 3 on 3 tag, compared to the 2 on 2 tag from previous games in the series.', 'Sega Dreamcast', '2', 'No', 'Fighting', '2000-06-30', 'Capcom', 'Capcom', 'assets/frontBoxArt/mvsc.jpg', 'assets/backBoxArt/mvsc.jpg', 'assets/logo/mvsc.jpg', 'assets/logo/mvsc.jpg', '18', 0, '50'),
('97d82bc6-b5db-11e7-abc4-cec278b6b50a', 'The Legend of Zelda : Breath of the Wild', 'The Legend of Zelda: Breath of the Wild is an action-adventure video game developed and published by Nintendo for the Nintendo Switch and Wii U video game consoles. The game is a part of The Legend of Zelda series, and follows amnesiac protagonist Link, who awakens from a hundred-year slumber to a mysterious voice that guides him to defeat Calamity Ganon before he can destroy the kingdom of Hyrule.\r\n\r\nThe title''s gameplay and mechanics constitute a departure from the series'' usual conventions, featuring an open-world environment, a detailed physics engine, high-definition visuals, and voice acting. Announced in 2013, the game was initially planned for release as a Wii U exclusive in 2015, but was delayed twice prior to its release on March 3, 2017. Breath of the Wild was a launch title for the Switch, as well as the final Nintendo-produced game for the Wii U.\r\n\r\nBreath of the Wild received universal acclaim from critics, who deemed it to be one of the greatest video games of all time. Critics praised the game''s open-ended, physics-driven gameplay that encourages player experimentation and exploration, with many calling it a landmark title in open-world game design, although minor criticism was directed at the game''s technical performance at launch.', 'Nintendo Switch', '1', 'No', 'Adventure', '2017-03-03', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/zelda.jpg', 'assets/backBoxArt/zelda.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '80', 0, '48'),
('8929e5a0-b5dc-11e7-abc4-cec278b6b50a', 'Metal Gear Solid HD Collection', 'From the critically acclaimed director, Hideo Kojima, Metal Gear Solid HD Collection offers a handful of the most popular Metal Gear Solid titles from the past in true HD for the first time ever. Featuring three complete games, Metal Gear Solid 2: Sons of Liberty, Metal Gear Solid: Snake Eater and Metal Gear Solid: Peace Walker, the HD Collection offers old and new fans a chance to experience the epic game play, design and storytelling of the MGS franchise. The "Metal Gear Solid (MGS)" series is the seminal work of Hideo Kojima, Japan''s master game creator, and the progenitor of the stealth action game genre. The series has become a global phenomenon, with over 27 million copies sold worldwide. The player controls a secret agent from an elite special forces unit who is sent on solo sneaking missions through enemy installations, vast jungles, and sometimes even the thick of battle. Alone and surrounded by the enemy, even a special forces agent will find it tough to come out alive. But that is the secret behind the series'' popularity-the cerebral challenge of figuring out how to avoid combat, and the thrill of sneaking through enemy territory undetected. The MGS series is also known for its storyline, which blends seamlessly with the gameplay. The scenarios are based on extensive research and incorporate the drama of actual developments in society. These elements have made MGS what it is today: a mature work of entertainment that transcends national borders and the confines of video games, and one of the leading products of the Japanese content business.', 'PlayStation 3', '1', 'No', 'Stealth', '2011-11-08', 'Kojima', 'Konami', 'assets/frontBoxArt/msg.jpg', 'assets/backBoxArt/msg.jpg', 'assets/logo/konami.jpg', 'assets/logo/kojima.jpg', '26', 10, '49'),
('e5ff7938-b5dd-11e7-abc4-cec278b6b50a', 'Super Smash Bros : Project M', 'Project M is a community-made mod of Brawl inspired by Super Smash Bros. Melee''s gameplay designed to add rich, technical gameplay to a balanced cast of characters while additionally enhancing the speed of play. Project M employs new codes which seamlessly add in new, universal features to the entire cast to add technical variety to all characters.', 'Nintendo Wii', '1', 'No', 'Fighting', '2014-11-01', 'Project M Development Team', 'Project M Development Team', 'assets/frontBoxArt/pm.jpg', 'assets/backBoxArt/pm.jpg', 'assets/logo/pm.jpg', 'assets/logo/pm.jpg', '65', 0, '50'),
('3ede9ebc-b5de-11e7-abc4-cec278b6b50a', 'Starcraft 2 : Legacy of the Void', 'You are Hierarch Artanis, leader of the mighty protoss race. Years ago, your homeworld of Aiur fell to the merciless zerg Swarm. Now, at long last, you have raised a powerful fleet of warships known as the Golden Armada, and are poised to reclaim your world. But an ancient evil—Amon—threatens this destiny and the fate of the entire galaxy. Only you can reunite the protoss factions and defeat the coming darkness before it consumes all life in the sector.', 'PC', '4', 'No', 'Strategy', '2015-11-10', 'Blizzard', 'Blizzard', 'assets/frontBoxArt/sc.jpg', 'assets/backBoxArt/sc.jpg', 'assets/logo/blizzard.jpg', 'assets/logo/blizzard.jpg', '56', 35, '49'),
('f660a994-b5df-11e7-abc4-cec278b6b50a', 'Madden 17', 'Take your team all the way in Madden NFL 17 and put yourself at the center of your team’s Championship run in Franchise mode, delivering all-new ways to play and more decisions to make. Driven by the most balanced gameplay yet, the deepest commentary in Madden NFL franchise history, along with fun and fresh ways to play modes such as Ultimate Team and Draft Champions, Madden NFL 17 is the most complete Madden…ever.', 'PlayStation 4', '1', 'No', 'Sports', '2016-08-23', 'EA Tiburon', 'EA Sports', 'assets/frontBoxArt/madden17.jpg', 'assets/backBoxArt/madden17.jpg', 'assets/logo/ea.jpg', 'assets/logo/ea.jpg', '56', 0, '48'),
('884b62d6-b5e0-11e7-abc4-cec278b6b50a\r\n', 'Tales Of Phantasia', '"No overview is currently available for this title."\r\n', 'PlayStation', '1', 'No', 'RPG', '2006-09-07', 'Namco', 'Namco', 'assets/frontBoxArt/tales.jpg', 'assets/backBoxArt/tales.jpg', 'assets/logo/namco.jpg', 'assets/logo/namco.jpg', '30', 0, '50'),
('79daf80a-b5e1-11e7-abc4-cec278b6b50a', 'Monster Hunter', 'The Monster Hunter franchise is a series of fantasy-themed action role-playing video games that started with the game Monster Hunter for PlayStation 2. The series is developed and published by Capcom. As the title suggests, the player takes the role of a hunter in a fantasy environment and completes quests by hunting out specific kinds of monsters to kill or capture. The series has branched out into PlayStation Portable games and a massively multiplayer online game. In Japan, the Monster Hunter series is immensely popular, and it has gained a cult following in the west, with the port Monster Hunter Freedom (known in Japan as Monster Hunter Portable) and its sequels, Monster Hunter Freedom 2 / Monster Hunter Portable 2nd, Monster Hunter Freedom Unite / Monster Hunter Portable 2nd G, Monster Hunter Portable 3rd and an online game called Monster Hunter Frontier Online selling millions of copies, and Monster Hunter Tri becoming the highest-selling third-party Wii game in Japan.[1] Since the series debuted, it has sold 28 million units as of March 31, 2014.[2] As of February 17, 2015, the series has sold 32 million units.[3] There is also an anime based on the spin-off game Monster Hunter Diary: Poka Poka Airou Village and a book called Monster Hunter EPISODE', 'PlayStation 2', '1', 'No', 'ARPG', '2004-09-21', 'Capcom', 'Capcom', 'assets/frontBoxArt/mh.jpg', 'assets/backBoxArt/mh.jpg', 'assets/logo/capcom.jpg', 'assets/logo/capcom.jpg', '20', 0, '50'),
('89db0314-b6de-11e7-abc4-cec278b6b50a', 'Halo 3 : ODST', 'Halo 3: ODST ("Orbital Drop Shock Troopers") is a 2009 first-person shooter video game developed by Bungie and published by Microsoft Game Studios. It is part of the Halo franchise, and was released on the Xbox 360 video game console on September 22, 2009. Players assume the roles of United Nations Space Command soldiers, known as "Orbital Drop Shock Troopers" or ODSTs, during and after the events of Halo 2. In the game''s campaign mode, players explore the ruined city of New Mombasa to discover what happened to their missing teammates in the midst of an alien invasion. In the "Firefight" multiplayer option, players battle increasingly difficult waves of enemies to score points and survive as long as possible; Halo 3''s multiplayer is contained on a separate disc packaged with ODST.', 'Xbox One', '4', 'Yes', 'FPS', '2009-09-22', 'Bungie', 'Microsoft Games Studio', 'assets/frontBoxArt/halo3.jpg', 'assets/backBoxArt/halo3.jpg', 'assets/logo/ms.jpg', 'assets/logo/bungie.jpg', '40', 0, '50'),
('a21bec6c-b6df-11e7-abc4-cec278b6b50a', 'Forza 7', 'A racing video game featuring over 700 cars—including new Forza Edition cars, most of which have been brought over from Forza Horizon 3—and more than 200 different configurations to race on across 32 locations at launch, including all from Forza Motorsport 6; a fictional street circuit in Dubai is one of the new circuits and several tracks returning from Forza Motorsport 4 including Maple Valley Raceway, Mugello Circuit and Suzuka Circuit.[4] Two features that are new to the Motorsport title include dynamic weather (previously seen in Horizon titles) and customisable drivers.', 'Xbox One', '1', 'No', 'Racing', '2017-10-03', 'Turn 10 Studios', 'Microsoft Games Studio', 'assets/frontBoxArt/forza7.jpg', 'assets/backBoxArt/forza7.jpg', 'assets/logo/ms.jpg', 'assets/logo/turn.jpg', '80', 0, '50'),
('bbdd1a4e-b6e0-11e7-abc4-cec278b6b50a', 'Overwatch : Origins Edition', 'Overwatch is an upcoming multiplayer first-person shooter in development by Blizzard Entertainment. Unveiled at BlizzCon 2014, the game emphasizes cooperative gameplay using a cast of various "heroes", each with their own abilities and roles within a team. The game entered closed beta in North America and Europe on October 27, 2015, with plans to bring the beta to Asia at a later date. The game is scheduled to be released for Microsoft Windows, PlayStation 4, and Xbox One in the first or second quarter of 2016. Unlike previous Blizzard releases, there are no plans for a version of Overwatch for OS X.', 'PlayStation 4', '4', 'No', 'Shooter', '2016-05-24', 'Blizzard', 'Blizzard', 'assets/frontBoxArt/overwatch.jpg', 'assets/backBoxArt/overwatch.jpg', 'assets/logo/blizzard.jpg', 'assets/logo/blizzard.jpg', '100', 0, '50'),
('277361d2-b6e1-11e7-abc4-cec278b6b50a', 'Grand Theft Auto V', 'Los Santos: a sprawling sun-soaked metropolis full of self-help gurus, starlets and fading celebrities, once the envy of the Western world, now struggling to stay afloat in an era of economic uncertainty and cheap reality TV.\r\n\r\nAmidst the turmoil, three very different criminals plot their own chances of survival and success: Franklin, a street hustler looking for real opportunities and serious money; Michael, a professional ex-con whose retirement is a lot less rosy than he hoped it would be; and Trevor, a violent maniac driven by the chance of a cheap high and the next big score. Running out of options, the crew risks everything in a series of daring and dangerous heists that could set them up for life.\r\n\r\nThe biggest, most dynamic and most diverse open world ever created, Grand Theft Auto V blends storytelling and gameplay in new ways as players repeatedly jump in and out of the lives of the game''s three lead characters, playing all sides of the game''s interwoven story.\r\n\r\nAll the classic hallmarks of the groundbreaking series return, including incredible attention to detail and Grand Theft Auto''s darkly humorous take on modern culture, alongside a brand new and ambitious approach to open world multiplayer.', 'Xbox One', '4', 'No', 'Action', '2014-11-18', 'Rockstar', 'Rockstar', 'assets/frontBoxArt/gta.jpg', 'assets/backBoxArt/gta.jpg', 'assets/logo/gta.jpg', 'assets/logo/rockstar.jpg', '90', 0, '50'),
('c41490ce-b6e1-11e7-abc4-cec278b6b50a', 'Gears of War 4', 'A new generation of soldiers battles the enemy in Gears of War 4, the next game in the blockbuster third-person shooter series.', 'Xbox One', '4', 'Yes', 'Shooter', '2016-10-11', 'The Coalition', 'Microsoft', 'assets/frontBoxArt/gearofwars4.jpg', 'assets/backBoxArt/gearofwars4.jpg', 'assets/logo/bethesda.jpg', 'assets/logo/ms.jpg', '91', 0, '50'),
('991d016a-b6e3-11e7-abc4-cec278b6b50a', 'Ori and the Blind Forest', 'Set as a 2D open world, platform game, the player controls Ori, a white guardian spirit. He has the ability to shoot Spirit Flame and wall run. He is required to interact with his environment as he jump from platforms and solve puzzles. He is faced with enemies as he makes his way to restoring the forest. The player helps Ori collect health shards, energy shards, new abilities, and upgrades. Beside him is Sein who is the light and eyes of the Spirit Tree.', 'PC', '1', 'No', 'Platform', '2015-03-11', 'Moon Studios', 'Microsoft Games Studio', 'assets/frontBoxArt/ori.jpg', 'assets/backBoxArt/ori.jpg', 'assets/logo/ms.jpg', 'assets/logo/moonstudio.jpg', '22', 0, '50'),
('3249dc14-b6e4-11e7-abc4-cec278b6b50a', 'The Witcher 3 : Wild Hunt\r\n', 'The game will be the third in the series, which is based on the book series of the same name by Polish author Andrzej Sapkowski. The Witcher 3 is set "In an open world 30 times larger" than the previous games, featuring the return of protagonist Geralt.\r\n\r\nThe Witcher: Wild Hunt is a story-driven, next-generation open world role-playing game set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher you play as the professional monster hunter, Geralt of Rivia, tasked with finding a child of prophecy in a vast open world rich with merchant cities, viking pirate islands, dangerous mountain passes, and forgotten caverns to explore.', 'PC', '1', 'No', 'RPG', '2015-05-19', 'CD Projekt Red', 'CD Projekt Red', 'assets/frontBoxArt/witcher3.jpg', 'assets/backBoxArt/witcher3.jpg', 'assets/logo/cd.jpg', 'assets/logo/cd.jpg', '90', 0, '50'),
('1e9d1e96-b6e5-11e7-abc4-cec278b6b50a', 'Rise of the Tomb Raider', 'After uncovering an ancient mystery, Lara must explore the most treacherous and remote regions of Siberia to find the secret of immortality before a ruthless organization known as Trinity. Lara must use her wits and survival skills, form new alliances, and ultimately embrace her destiny as the Tomb Raider. Experience high-octane action moments, conquer beautifully hostile environments, engage in brutal guerilla combat, and explore awe-inspiring deadly tombs in the evolution of survival action. In “Rise of the Tomb Raider,” Lara becomes more than a survivor as she embarks on her first Tomb Raiding expedition.', 'PC', '1', 'No', 'Action', '2016-01-28', 'Crystal Dynamics', 'Square Enix', 'assets/frontBoxArt/tombraider.jpg', 'assets/backBoxArt/tombraider.jpg', 'assets/logo/enix.jpg', 'assets/logo/crystal.jpg', '60', 0, '50'),
('f4f4302e-b6e5-11e7-abc4-cec278b6b50a', 'Destiny', 'From the creators of Halo and the publisher of Call of Duty comes Destiny. With an unprecedented variety of FPS gameplay, Destiny promises to deliver an incredible story set within a newly-imagined, always-connected universe filled with action and adventure.\r\n\r\nEverything changed with the arrival of the Traveler. It sparked a Golden Age when our civilization spanned the solar system ... but it didn''t last. Something hit us, knocked us down. The survivors built a city beneath the Traveler, and have begun to explore our old worlds, only to find them filled with deadly foes. In Destiny, you are a Guardian of the last safe city on Earth, able to wield incredible power. Defend the City. Defeat our enemies. Reclaim all that we have lost.', 'PlayStation 4', '4', 'Yes', 'Shooter', '2014-09-09', 'Bungie', 'Activision', 'assets/frontBoxArt/destiny.jpg', 'assets/backBoxArt/destiny.jpg', 'assets/logo/activision.jpg', 'assets/logo/bungie.jpg', '40', 0, '50'),
('7d15f2d0-b6e6-11e7-abc4-cec278b6b50a', 'Dark Souls 3', 'Prepare to die, again with the third entry in the brutal blockbuster action-RPG franchise. A dark and brooding fantasy adventure awaits players in a vast twisted world full of fearsome beasts, devious traps and hidden secrets. The embers of a once-proud kingdom set the stage for this new adventure. Battle against fearsome enemies and bosses with a variety of weapons and magic through a mysterious land riddled with secrets.', 'PC', '1', 'Yes', 'Action', '2016-04-12', 'FromSoftware', 'Bandai Namco Games', 'assets/frontBoxArt/darksouls.jpg', 'assets/backBoxArt/darksouls.jpg', 'assets/logo/bandai.jpg', 'assets/logo/fromsoftware.jpg', '40', 15, '50'),
('145ec87e-b6e7-11e7-abc4-cec278b6b50a', 'Battlefield 4', 'Battlefield 4 puts you in the boots of US Marine Sgt. Daniel Recker, member of the Tombstone squad. Against the backdrop of a global conflict between US, Russia and China, you''ll engage in combat on foot and by operating land, sea and air units. \r\n\r\nThankfully, you''re not alone in your struggles on the Battlefield. The bonds with your teammates will grow stronger as you face perils of every kind. Don''t let your squad down; they''re counting on you as much as you need them to survive.\r\n\r\nIn Battlefield 4 you''ll engage in both close quarters squad-based combat and in vast battles commandeering tanks, jeeps, jets, helicopters and naval units. Utilize high-tech gadgets, a wide variety of weapons, and the dynamic environment itself as the climactic story progresses.\r\n\r\nBattlefield 4 takes the fight to many urban environments like the outskirts of Baku and the skyscrapers of Shanghai, all of which become explosive, dynamic playgrounds for the Tombstone Squad.\r\n\r\nWhether you''re riding the waves of the South China Sea or traversing Shanghai''s iconic Huangpu River, naval warfare is central in Battlefield 4''s single player campaign.\r\n\r\nFight on huge fields, massive industrial areas, or in enemy air space. Nothing compares to the scale and scope of Battlefield 4.', 'PC', '4', 'Yes', 'Shooter', '2013-10-31', 'EA Digital Illusions CE', 'EA', 'assets/frontBoxArt/battlefield4.jpg', 'assets/backBoxArt/battlefield4.jpg', 'assets/logo/ea.jpg', 'assets/logo/ea.jpg', '13', 0, '50'),
('a4ea2802-b6e7-11e7-abc4-cec278b6b50a', 'Middle-Earth : Shadow of Mordor', 'Middle-Earth: Shadow of Mordor is an action-packed adventure-RPG inspired by J.R.R. Tolkien''s The Hobbit and The Lord of the Rings. Exploring an original story of vengeance and redemption, the game puts players in the role of Talion, a valiant ranger whose family is slain in front of him the night Sauron and his army return to Mordor -- moments before his own life is taken. Resurrected by a Spirit of vengeance and empowered with Wraith abilities, Talion ventures into Mordor and vows to destroy those who have wronged him. Through the course of his personal vendetta, Talion uncovers the truth of the Spirit that compels him, learns the origins of the Rings of Power and ultimately confronts his true nemesis.', 'PlayStation 4', '1', 'No', 'ARPG', '2014-09-30', 'Monolith Productions', 'Warner Bros. Interactive', 'assets/frontBoxArt/shadow.jpg', 'assets/backBoxArt/shadow.jpg', 'assets/logo/wb.jpg', 'assets/logo/monolith.jpg', '46', 0, '50'),
('7c3d8b00-b6e8-11e7-abc4-cec278b6b50a', 'DOOM', 'Science has unlocked the gates to the unknown, and now the only thing standing in the way of the forces of Hell is a lone space marine. Featuring dramatic storylines, pulse-pounding action, revolutionary technology and unique sci-fi based weaponry, DOOM is the franchise that ushered in the FPS revolution and evolved the genre into the juggernaut it is today. With several installments featuring some of the most frightening and gripping first-person gaming experiences ever created, the DOOM franchise is a cultural milestone that has transcended the realm of video games on the way to becoming a mainstream entertainment phenomenon.', 'Xbox One', '4', 'No', 'Shooter', '2016-05-13', 'ID Software', 'Bethesda', 'assets/frontBoxArt/doom.jpg', 'assets/backBoxArt/doom.jpg', 'assets/logo/bethesda.jpg', 'assets/logo/id.jpg', '80', 0, '50'),
('e9fb828c-b6e8-11e7-abc4-cec278b6b50a', 'Metal Gear Solid V : The Phantom Pain', 'Development powerhouse, Kojima Productions, continues forth the ‘METAL GEAR SOLID V Experience’ with the latest chapter, METAL GEAR SOLID V: The Phantom Pain. Ushering in a new era for the franchise with cutting-edge technology powered by the Fox Engine, MGSV: The Phantom Pain, will provide players a first-rate gaming experience as they are offered tactical freedom to carry out open-world missions.\r\n\r\nTaking place nine years after the events of MGSV: Ground Zeroes and the fall of Mother Base, Snake a.k.a. Big Boss, awakes from a near decade-long coma. The game resumes the story in 1984, with the Cold War still as the backdrop, which continues to shape a global crisis. Snake’s journey takes him into a world where he is driven by a need for revenge and the pursuit of a shadow group, XOF.\r\n\r\nHideo Kojima, head of Kojima Productions, continues to ambitiously explore mature themes such as the psychology of warfare and the atrocities that result from those that engage in its vicious cycle. One of the most anticipated games of the year with its open-world design, photorealistic visual fidelity and feature-rich game design, MGSV: The Phantom Pain will leave its mark as one of the hallmarks in the gaming industry for its cinematic storytelling, heavy themes, and immersive tactical gameplay.', 'PlayStation 4', '1', 'No', 'Stealth', '2015-09-01', 'Kojima', 'Konami', 'assets/frontBoxArt/phantom.jpg', 'assets/backBoxArt/phantom.jpg', 'assets/logo/konami.jpg', 'assets/logo/kojima.jpg', '50', 0, '48'),
('d3969ada-b6e9-11e7-abc4-cec278b6b50a', 'Inside', 'Inside is a puzzle-platformer adventure game developed and published by Playdead in 2016 for PlayStation 4, Xbox One and Microsoft Windows. The game will be released for Nintendo Switch and iOS at an unannounced date. The player controls a boy in a dystopic world, solving environmental puzzles and avoiding death. It is the spiritual successor to Playdead''s 2010 game Limbo, and features similar 2.5D gameplay.', 'PC', '1', 'No', 'Platform', '2016-06-29', 'Playdead', 'Playdead', 'assets/frontBoxArt/inside.jpg', 'assets/backBoxArt/inside.jpg', 'assets/logo/playdead.jpg', 'assets/logo/playdead.jpg', '30', 0, '50'),
('63b4199e-b6ea-11e7-abc4-cec278b6b50a', 'Injustice : Gods Among Us', 'What if our greatest heroes became our greatest threat ? Injustice: Gods Among Us debuts as a bold new fighting game franchise that introduces a deep, original story featuring favorite DC Comics icons such as Batman, Superman, Wonder Woman, The Flash, Harley Quinn, Solomon Grundy and others. Set in a world where the lines between good and evil are is blurred, players will experience heroes and villains engaging in epic battles on a massive scale.', 'Nintendo Wii U', '2', 'No', 'Fighting', '2013-04-16', 'NetherRealm Studios', 'Warner Bros', 'assets/frontBoxArt/injustice.jpg', 'assets/backBoxArt/injustice.jpg', 'assets/logo/wb.jpg', 'assets/logo/nothern.jpg', '30', 0, '50'),
('e5ecc294-b6ea-11e7-abc4-cec278b6b50a', 'Mario Kart 8 Deluxe', 'Hit the road with the definitive version of Mario Kart 8 and play anytime, anywhere! Race your friends or battle them in a revised battle mode on new and returning battle courses. Play locally in up to 4-player multiplayer in 1080p while playing in TV Mode. Every track from the Wii U version, including DLC, makes a glorious return. Plus, the Inklings appear as all-new guest characters, along with returning favorites, such as King Boo, Dry Bones, and Bowser Jr.!', 'Nintendo Switch', '4', 'Yes', 'Sports', '2017-04-28', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/mariokart.jpg', 'assets/backBoxArt/mariokart.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '100', 0, '49'),
('51048a26-b6eb-11e7-abc4-cec278b6b50a', 'Mario Party 10', 'Bowser crashes the latest Mario Party, the first installment of the series on the Wii U console. In the new Bowser Party mini-games, play as Bowser himself and face off against up to four others playing as Mario and friends. Control Bowser using the buttons, motion controls and touch screen of the Wii U GamePad controller in different ways, and wreak havoc as Bowser in each mini-game while the other players strive to survive.', 'Nintendo Wii U', '4', 'No', 'Action', '2015-03-20', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/marioparty.jpg', 'assets/backBoxArt/marioparty.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '40', 0, '49'),
('062fbba0-b6ec-11e7-abc4-cec278b6b50a', 'Metroid Prime', 'Ten years ago, beneath the surface of Planet Zebes, the mercenaries known as "Space Pirates" were defeated by interstellar bounty hunter Samus Aran. Descending to the very core of the pirate stronghold, Samus exterminated the energy based parasites called "Metroids" and defeated Mother Brain, the leader of the pirate hoarde.\r\n\r\nBut the Space Pirates were far from finished. Several pirate research vessels were orbiting Zebes when Samus fought on the surface below.\r\n\r\nAfter the fall of Mother Brain, the ships escaped, with the hope of finding enough resources to rebuild their forces and take their revenge.\r\n\r\nAfter discovering a possible pirate colony on planet Talon IV, Samus has once again prepared for war, hoping to end the Pirate threat forever.', 'Nintendo GameCube', '1', 'No', 'Action', '2002-11-17', 'Retro Studios', 'Nintendo', 'assets/frontBoxArt/metroid.jpg', 'assets/backBoxArt/metroid.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/retro.jpg', '14', 0, '50'),
('1c23fbd6-b81f-11e7-abc4-cec278b6b50a', 'Splatoon 2', 'Ink-splatting action is back and fresher than ever. Get hyped for the sequel to the game about splatting ink and claiming turf, as the squid-like Inklings return in a colorful and chaotic 4 vs. 4 action shooter. For the first time, take Turf War battles on-the-go via local multiplayer in portable play styles. You can also compete in frenetic online matches like before. Two years have passed since the release of Splatoon, and two years have also passed in the game world, leading to an evolution in fashion trends and new styles of weapons and gear. Staying fresh never looked so good. Features: New weapons New dual-wielding Splat Dualies join the action, complete with a new Dodge Roll move. Mainstays like the Splat Roller and Splat Charger have also been remixed to include new gameplay mechanics and brand-new special weapons. Local and Online Multiplayer In a first for the series, compete in local multiplayer Turf War battles, whether in TV mode or on-the-go in handheld or tabletop modes. Online battles also make a return. New ways to play Play using the Joy-Con controllers or the Nintendo Switch Pro Controller, both of which allow for gyro controls for better aiming and control. New Trends Two years have passed since the release of Splatoon in real life, and two years have also passed in the game world. Some familiar characters return under different circumstances, and new characters are introduced as well. Fresh Updates - Similar to Splatoon for Wii U, updates will roll out post-launch, adding new content. Smart Device Support An upcoming smart-phone application for the Nintendo Switch system will enhance matchmaking and allow for voice chat options. Turf War Iconic 4 vs. 4 Turf War battles return. The goal is to splat ink on as much territory as possible, while strategically submerging yourself in your team''s colors and blasting your enemies.', 'Nintendo Switch', '4', 'No', 'S', '2017-07-21', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/splatoon.jpg', 'assets/backBoxArt/splatoon.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '80', 0, '50'),
('b542b686-b81f-11e7-abc4-cec278b6b50a', 'Super Mario 64', 'Mario is super in a whole new way! Combining the finest 3-D graphics ever developed for a video game and an explosive sound track, Super Mario 64 becomes a new standard for video games. It''s packed with bruising battles, daunting obstacle courses and underwater adventures. Retrieve the Power Stars from their hidden locations and confront your arch nemesis - Bowser, King of the Koopas!', 'Nintendo 64', '1', 'No', 'Action', '1996-09-29', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/supermario64.jpg', 'assets/backBoxArt/supermario64.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '23', 20, '50'),
('53781c6a-b820-11e7-abc4-cec278b6b50a', 'Super Mario Maker', 'Super Mario Maker lets people’s imaginations run wild. For the first time ever, friends can have fun playing through levels they create for one another. The Wii U GamePad controller makes it so easy for anyone to create levels; it may feel like simply sketching out ideas on paper. Players can enjoy a seemingly endless supply of inventive Mario levels from players around the world.', 'Nintendo Wii U', '1', 'No', 'Platform', '2015-09-11', 'Nintendo', 'Nintendo', 'assets/frontBoxArt/mariomaker.jpg', 'assets/backBoxArt/mariomaker.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/nintendo.jpg', '65', 10, '50'),
('dc9e5a4a-b820-11e7-abc4-cec278b6b50a', 'Xenoblade Chronicles X', 'The next massive sci-fi role-playing game from Monolith Soft, creators of Baten Kaitos and Xenoblade Chronicles, comes exclusively to Wii U. In Xenoblade Chronicles X, a terrible intergalactic war leaves just a handful of Earth survivors trying to live in a beautiful yet hostile environment. Players engage in battles against powerful creatures of all forms and sizes using the deep battle system that builds on the triumphs of the team''s previous RPG adventures.', 'Nintendo Wii U', '1', 'Yes', 'RPG', '2015-12-04', 'Monolith', 'Nintendo', 'assets/frontBoxArt/xeno.jpg', 'assets/backBoxArt/xeno.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/monolith.jpg', '66', 30, '48'),
('5eeb7ca8-b821-11e7-abc4-cec278b6b50', 'Pokemon X', 'An all-new 3D Pokemon adventure packed with never-before-seen Pokemon will launch worldwide in October 2013. Pokemon X and Pokemon Y will present a new generation of Pokemon, and introduce players to an exciting new adventure in a breathtaking 3D world.', 'Nintendo 3DS', '1', 'No', 'RPG', '2013-10-12', 'Game Freak', 'Nintendo', 'assets/frontBoxArt/pokx.jpg', 'assets/backBoxArt/pokx.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/gamefreak.jpg', '34', 15, '50'),
('c70bfe3e-b821-11e7-abc4-cec278b6b50a', 'Pokemon Y', 'An all-new 3D Pokemon adventure packed with never-before-seen Pokemon will launch worldwide in October 2013. Pokemon X and Pokemon Y will present a new generation of Pokemon, and introduce players to an exciting new adventure in a breathtaking 3D world.', 'Nintendo 3DS', '1', 'No', 'RPG', '2013-10-12', 'Game Freak', 'Nintendo', 'assets/frontBoxArt/poky.jpg', 'assets/backBoxArt/poky.jpg', 'assets/logo/nintendo.jpg', 'assets/logo/gamefreak.jpg', '34', 15, '50'),
('57a98088-b822-11e7-abc4-cec278b6b50a', 'Call of Duty: Modern Warfare 3', 'Call of Duty: Modern Warfare 3 (stylized as Call of Duty: MW3) is a 2011 first-person shooter video game, developed by Infinity Ward and Sledgehammer Games (Treyarch for the Wii version), with development assistance from Raven Software, and published by Activision. It is the third installment in the Modern Warfare saga, a direct sequel to 2009''s Call of Duty: Modern Warfare 2, and the eighth Call of Duty installment.', 'PlayStation 3', '4', 'No', 'Shooter', '2011-11-08', 'Treyarch', 'Infinity Ward', 'assets/frontBoxArt/mw3.jpg', 'assets/backBoxArt/mw3.jpg', 'assets/logo/iw.jpg', 'assets/logo/treyarch.jpg', '24', 0, '50'),
('e875fd9e-b822-11e7-abc4-cec278b6b50a', 'The Elder Scrolls V: Skyrim', 'The Elder Scrolls V: Skyrim was released in 2011 by Bethesda Softworks and marks the next chapter in the highly anticipated Elder Scrolls saga. Skyrim reimagines and revolutionizes the open-world fantasy, bringing to life a complete virtual world, open for exploration in any way.', 'PC', '1', 'No', 'RPG', '2011-11-11', 'Bethesda', 'Bethesda', 'assets/frontBoxArt/skyrim.jpg', 'assets/backBoxArt/skyrim.jpg', 'assets/logo/bethesda.jpg', 'assets/logo/bethesda.jpg', '30', 0, '50'),
('4f93a846-b823-11e7-abc4-cec278b6b50a', 'The Sims 4', 'The Sims 4 is the highly anticipated life simulation game that lets you play with life like never before! Create and control Sims with big personalities, new emotions, and distinct appearances. Experience new levels of creativity when you sculpt Sims with the powerful Create A Sim and design beautiful homes with tactile, room-based Build Mode. With free content updates for owners of The Sims 4 if and when available, you’ll have the latest content and features to evolve your game experience. Control the mind, body, and heart of your Sims and explore lively, vibrant neighborhoods filled with rich communities of smarter Sims that bring your stories to life.', 'PC', '1', 'No', 'Construction', '2014-09-02', 'Maxis', 'EA', 'assets/frontBoxArt/sims4.jpg', 'assets/backBoxArt/sims4.jpg', 'assets/logo/ea.jpg', 'assets/logo/maxis.jpg', '11', 0, '50'),
('d78afccc-b823-11e7-abc4-cec278b6b50a', 'Wolfenstein: The New Order', 'Wolfenstein: The New Order is an upcoming first-person shooter video game in development by MachineGames to be published by Bethesda Softworks for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360 and Xbox One.[3] The New Order is the ninth installment in the Wolfenstein series and the first since 1992 developed without the Id Software label; however, developer MachineGames will utilize id Software''s proprietary game engine id Tech 5.', 'Xbox One', '1', 'No', 'Shooter', '2014-05-20', 'Bethesda', 'Bethesda', 'assets/frontBoxArt/wolf.jpg', 'assets/backBoxArt/wolf.jpg', 'assets/logo/bethesda.jpg', 'assets/logo/bethesda.jpg', '29', 0, '50'),
('26c3a23a-b824-11e7-abc4-cec278b6b50a', 'XCOM 2', 'The sequel to the award-winning strategy title XCOM: Enemy Unknown, XCOM 2 transports players 20 years into the future, where humanity lost the war against the alien threat that has established a new world order. The secret paramilitary organization known as XCOM is largely forgotten, and must strike back to reclaim control of Earth and free mankind from the aliens’ rule.', 'Xbox One', '1', 'No', 'Strategy', '2016-09-27', '2K Games', '2K Games', 'assets/frontBoxArt/xcom.jpg', 'assets/backBoxArt/xcom.jpg', 'assets/logo/2k.jpg', 'assets/logo/2k.jpg', '69', 0, '50'),
('7fefc852-b824-11e7-abc4-cec278b6b50a', 'Fallout 4', 'As the sole survivor of Vault 111, you enter a world destroyed by nuclear war. Every second is a fight for survival, and every choice is yours. Only you can rebuild and determine the fate of the Wasteland. Welcome home.\r\n\r\nFreedom and Liberty! - Do whatever you want in a massive open world with hundreds of locations, characters, and quests. Join multiple factions vying for power or go it alone, the choices are all yours.\r\n\r\nYou''re S.P.E.C.I.A.L! - Be whoever you want with the S.P.E.C.I.A.L. character system. From a Power Armored soldier to the charismatic smooth talker, you can choose from hundreds of Perks and develop your own play-style.', 'PC', '1', 'No', 'RPG', '2015-11-10', 'Bethesda', 'Bethesda', 'assets/frontBoxArt/fallout4.jpg', 'assets/backBoxArt/fallout4.jpg', 'assets/logo/bethesda.jpg', 'assets/logo/bethesda.jpg', '29', 0, '50'),
('47741964-b825-11e7-abc4-cec278b6b50a', 'Mass Effect 3', 'In Mass Effect 3, an ancient alien race known only as Reapers, has launched an all-out invasion of the galaxy, leaving nothing but a trail of destruction in their wake. Earth has been taken, the galaxy is on the verge of total annihilation, and you are the only one who can stop them. The price of failure is extinction. You, as Commander Shepard, must lead the counter assault to take it back. Only you can determine how events will play out, which planets you will save from annihilation and which alliances you will form or abandon as you rally the forces of the galaxy to eliminate the Reaper threat once and for all.', 'PlayStation 3', '4', 'Yes', 'RPG', '2012-03-06', 'BioWare', 'EA', 'assets/frontBoxArt/mass.jpg', 'assets/backBoxArt/mass.jpg', 'assets/logo/ea.jpg', 'assets/logo/bioware.jpg', '22', 0, '47'),
('a94796ca-b825-11e7-abc4-cec278b6b50a', 'Counter-Strike: Global Offensive', 'Counter-Strike: Global Offensive (CS: GO) will expand upon the team-based action gameplay that it pioneered when it was launched 12 years ago.', 'PC', '4', 'No', 'Shooter', '2012-08-21', 'Valve', 'Valve', 'assets/frontBoxArt/csgo.jpg', 'assets/backBoxArt/csgo.jpg', 'assets/logo/valve.jpg', 'assets/logo/valve.jpg', '34', 0, '50'),
('6537a3ac-b826-11e7-abc4-cec278b6b50a', 'Hearthstone: Heroes of Warcraft', 'Sheathe your sword, draw your deck, and get ready for Hearthstone - the fast paced strategy card game that''s easy to learn and massively fun. Start a free game on Battle.net and play your cards to sling spells, summon creatures, and command the heroes of Warcraft in duels of epic strategy.', 'PC', '1', 'No', 'Strategy', '2014-03-11', 'Blizzard', 'Blizzard', 'assets/frontBoxArt/hs.jpg', 'assets/frontBoxArt/hs.jpg', 'assets/logo/blizzard.jpg', 'assets/logo/blizzard.jpg', '0', 0, '50'),
('d798129c-b826-11e7-abc4-cec278b6b50a', 'Assassin''s Creed: Brotherhood', 'Assassin''s Creed: Brotherhood is an action-adventure video game with main emphasis on nonlinear gameplay, sandbox style gameplay, parkour movements, crowd-blending stealth, assassinations and melee fighting system. The combat system features several and for the first time in the series, the game offers a multi-player mode alongside 15+ hours of single-player gameplay.', 'PlayStation 3', '1', 'No', 'Action', '2010-11-16', 'Ubisoft Montreal', 'Ubisoft', 'assets/frontBoxArt/ac.jpg', 'assets/backBoxArt/ac.jpg', 'assets/logo/ubisoft.jpg', 'assets/logo/ubisoft.jpg', '26', 0, '50'),
('5e080396-b827-11e7-abc4-cec278b6b50a', 'Watch Dogs', 'The storyline of Watch Dogs game is built around the concept of information warfare, data being interconnected, and the world''s increasing use of technology—questioning who exactly runs the computers they depend on. The game is set in an alternate reality version of Chicago, Illinois, which is one of many cities to feature a supercomputer known as a "CtOS" (Central Operating System). The system controls almost every piece of technology in the city, and contains information on all of the city''s residents and activities which can be used for various purposes. In the game''s universe, the Northeast blackout of 2003 was found to be caused by a hacker, prompting the development of CtOS. The game will follow a man named Aiden Pearce, a highly skilled hacker described as a person who uses both "fists and wits." The gameplay demo shown at E3 2012 depicted Aiden''s attempt to assassinate a media mogul named Joseph DeMarco, who had been wrongly acquitted on charges of murder. In a demonstration shown at E3 2013, Pearce helps a fellow hacker named T-Bone escape after he is discovered attempting to steal a motherboard.\r\n', 'Xbox 360', '4', 'No', 'Action', '2014-05-27', 'Ubisoft', 'Ubisoft', 'assets/frontBoxArt/watchdog.jpg', 'assets/backBoxArt/watchdog.jpg', 'assets/logo/ubisoft.jpg', 'assets/logo/ubisoft.jpg', '20', 0, '50'),
('baebcd7c-b827-11e7-abc4-cec278b6b50a', 'Tom Clancy''s: The Division', 'A devastating pandemic sweeps through New York City, and one by one, basic services fail. In only days, without food or water, society collapses into chaos. The Division, a classified unit of self-supported tactical agents, is activated. Leading seemingly ordinary lives among us, The Division agents are trained to operate independently of command, as all else fails. ', 'PlayStation 4', '4', 'No', 'MMO', '2016-03-08', 'Ubisoft', 'Ubisoft', 'assets/frontBoxArt/division.jpg', 'assets/backBoxArt/division.jpg', 'assets/logo/ubisoft.jpg', 'assets/logo/ubisoft.jpg', '87', 0, '50'),
('0e91fb40-b828-11e7-abc4-cec278b6b50a', 'Life is Strange', 'Life Is Strange is a graphic adventure, played from a third-person view.[1] Introducing the mechanic of rewinding time allows the player to go back and redo any action other than what is done past a checkpoint (however long a checkpoint lasts).[2] The choices made will alter and affect the story through short, mid or long-term consequences.[3] Dontnod creative director Jean-Maxime Moris added however that "for each one of your choices that you make there''s no definite answer. Something good in the short-term might turn out worse later". Whenever a course of action poses an influence to the story, a butterfly symbol comes into view.[5] Dialogue exchanges can be rewound while branching options are used for conversation.[6][7] Once an event is reset, the details provided earlier are permitted to avail themselves in the future.[8] Items that are collected before time traveling will be kept in the inventory after the fact.[9] The player can also examine and interact with objects indicated by a system of hand drawn icons, which enables puzzle solving.', 'PlayStation 4', '1', 'No', 'Adventure', '2015-01-30', 'Square Enix', 'Square Enix', 'assets/frontBoxArt/life.jpg', 'assets/backBoxArt/life.jpg', 'assets/logo/enix.jpg', 'assets/logo/enix.jpg', '40', 0, '50'),
('6aae633c-b828-11e7-abc4-cec278b6b50a', 'Child of Light', 'The kingdom of Lemuria is in despair The Black Queen has stolen the Sun, the Moon and the Stars. You play as Aurora, a young princess with a pure heart whose soul is brought to the kingdom of Lemuria. Embark on a quest to recapture the three sources of light, defeat the Black Queen and restore the kingdom of Lemuria.', 'PC', '2', 'Yes', 'Platform', '2014-04-30', 'Ubisoft Montreal', 'Ubisoft', 'assets/frontBoxArt/child.jpg', 'assets/backBoxArt/chld.jpg', 'assets/logo/ubisoft.jpg', 'assets/logo/ubisoft.jpg', '15', 0, '50'),
('2da8bdef-8bac-42de-a6af-fca11bbdb820', 'Best Game', 'best game in the wor', 'PlayStation', '4', 'Yes', 'Sports', '2017-02-20', 'EA', 'EA', 'n/a', 'n/a', 'n/a', 'n/a', '90', 0, '45');

-- --------------------------------------------------------

--
-- Table structure for table `gameorder`
--

DROP TABLE IF EXISTS `gameorder`;
CREATE TABLE IF NOT EXISTS `gameorder` (
  `order_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `timestamp` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gameorder`
--

INSERT INTO `gameorder` (`order_id`, `user_id`, `total`, `timestamp`) VALUES
('7d093cc6-da90-4166-ba30-2e1bb6af11aa', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '80', '2017.11.21.22.22.37'),
('4d18d1aa-3e48-46ea-83e2-f5ed715d18eb', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '10', '2017.11.21.22.25.12'),
('140b2084-9a1e-4be9-b2a2-8f6cabf8103a', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '90', '2017.11.21.22.29.31'),
('7b4c4958-cd27-426e-8613-1426dca64803', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '126', '2017.11.21.22.33.16'),
('86e80842-b4f5-42d6-b3d8-022808c97881', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '160', '2017.11.25.20.01.01'),
('c817aa76-055c-4e72-8323-0a9650091694', 'd593a994-5fcf-4435-b958-cd57516c1ecd', '22', '2017.11.25.20.12.23'),
('f881618e-7202-4898-9304-f54b94c50198', '65e013ac-8737-4b39-988e-01df812d2027', '44', '2017.11.25.22.10.14'),
('d3096855-aba5-44c9-81db-5ea828c0c6c9', '0d15d0b8-e300-4fed-a618-7bfc36d76903', '140', '2017.11.26.15.35.37'),
('4241c0a4-e592-437c-9e1a-7af582978f67', 'df679f46-523e-4cc5-be28-98904e7c1138', '188', '2017.11.26.15.39.16');

-- --------------------------------------------------------

--
-- Table structure for table `gameproduct`
--

DROP TABLE IF EXISTS `gameproduct`;
CREATE TABLE IF NOT EXISTS `gameproduct` (
  `order_id` varchar(100) NOT NULL,
  `game_id` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gameproduct`
--

INSERT INTO `gameproduct` (`order_id`, `game_id`) VALUES
('7d093cc6-da90-4166-ba30-2e1bb6af11aa', 'f660a994-b5df-11e7-abc4-cec278b6b50a'),
('7d093cc6-da90-4166-ba30-2e1bb6af11aa', '0a3df864-b2f1-11e7-abc4-cec278b6b50a'),
('4d18d1aa-3e48-46ea-83e2-f5ed715d18eb', 'fea9fe24-b28e-11e7-abc4-cec278b6b50a'),
('140b2084-9a1e-4be9-b2a2-8f6cabf8103a', '5adfeaa4-b2e0-11e7-abc4-cec278b6b50a'),
('7b4c4958-cd27-426e-8613-1426dca64803', 'e9fb828c-b6e8-11e7-abc4-cec278b6b50a'),
('7b4c4958-cd27-426e-8613-1426dca64803', '8929e5a0-b5dc-11e7-abc4-cec278b6b50a'),
('86e80842-b4f5-42d6-b3d8-022808c97881', '97d82bc6-b5db-11e7-abc4-cec278b6b50a'),
('c817aa76-055c-4e72-8323-0a9650091694', '47741964-b825-11e7-abc4-cec278b6b50a'),
('f881618e-7202-4898-9304-f54b94c50198', '47741964-b825-11e7-abc4-cec278b6b50a'),
('d3096855-aba5-44c9-81db-5ea828c0c6c9', 'e5ecc294-b6ea-11e7-abc4-cec278b6b50a'),
('d3096855-aba5-44c9-81db-5ea828c0c6c9', '51048a26-b6eb-11e7-abc4-cec278b6b50a'),
('4241c0a4-e592-437c-9e1a-7af582978f67', '3ede9ebc-b5de-11e7-abc4-cec278b6b50a'),
('4241c0a4-e592-437c-9e1a-7af582978f67', 'dc9e5a4a-b820-11e7-abc4-cec278b6b50a');

-- --------------------------------------------------------

--
-- Table structure for table `temporarylogin`
--

DROP TABLE IF EXISTS `temporarylogin`;
CREATE TABLE IF NOT EXISTS `temporarylogin` (
  `user_id` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `timestamp` date NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(40) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `country` varchar(40) NOT NULL,
  `credit_card_type` varchar(20) NOT NULL,
  `credit_card_number` varchar(20) NOT NULL,
  `credit_card_cvv` varchar(10) NOT NULL,
  `credit_card_expiry` varchar(20) NOT NULL,
  `last_login` varchar(20) DEFAULT NULL,
  `lock_counter` int(11) NOT NULL DEFAULT '0',
  `isLocked` tinyint(1) NOT NULL DEFAULT '0',
  `forgot_pass` tinyint(1) NOT NULL DEFAULT '0',
  `Role` varchar(20) DEFAULT '0',
  `discount_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `firstname`, `lastname`, `email`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `credit_card_type`, `credit_card_number`, `credit_card_cvv`, `credit_card_expiry`, `last_login`, `lock_counter`, `isLocked`, `forgot_pass`, `Role`, `discount_value`) VALUES
('d593a994-5fcf-4435-b958-cd57516c1ecd', 'test', 'moh', 'raza', 'mohd_theo_60@hotmail.com', '990', 'cote', 'Montréal', 'quebec', 'h9b2n2', 'canada', 'master', '1234567891011121', '111', '04/2012', '2017.11.26.15.42.47', 0, 0, 0, 'admin', 15),
('d9223e7d-a4d5-4f53-be30-9ed62e4f6101', 'sarah1234', 'sarah', 'sajjad', 's@live.com', '990', 'cote vertu', 'Montréal', 'Quebec', 'h4l1y4', 'Canada', 'master', '5392586554369580', '333', '02/2020', '2017.10.26.00.16.23', 0, 1, 0, '', 0),
('65e013ac-8737-4b39-988e-01df812d2027', 'test', 'Jason', 'Lum', 'j@lum.ca', '990', 'Henri Bourassaa', 'Montréall', 'Quebecc', 'h4l1y41', 'Canadaa', 'master', '444444444445', '322', '02/2021', '2017.11.25.22.08.06', 2, 0, 0, '', 0),
('0d15d0b8-e300-4fed-a618-7bfc36d76903', '1234', 'Robert', 'Lee', 'rl@gmail.com', '4321', 'Louis Payette', 'Laval', 'Quebec', 'h7b1y3', 'Canada', 'visa', '41111111111111', '890', '06/2022', '2017.11.26.15.32.50', 0, 0, 0, 'normal', 0),
('df679f46-523e-4cc5-be28-98904e7c1138', '1234', 'John', 'Tucker', 'mohraza60@gmail.com', '9890', 'St Laurent', 'Montréal', 'Quebec', 'h4l1y4', 'Canada', 'master', '2222222222222222', '202', '02/2018', '2017.11.26.15.42.39', 0, 0, 0, 'normal', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
