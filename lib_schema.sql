-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lib_schema
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `authorID` smallint unsigned NOT NULL AUTO_INCREMENT,
  `authorLastName` varchar(45) NOT NULL,
  `authorFirstName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (2000,'Smith','James'),(2001,'Johnson','James'),(2002,'Williams','James'),(2003,'Davis','Michael'),(2004,'Jones','James'),(2005,'Garcia','James'),(2006,'Miller','James'),(2007,'Johnson','Michael'),(2008,'Rodriguez','James'),(2009,'Martinez','James'),(2010,'Hernandez','James'),(2011,'Lopez','James'),(2012,'Gonzalez','James'),(2013,'Wilson','James'),(2014,'Anderson','James'),(2015,'Thomas','James'),(2016,'Taylor','James'),(2017,'Moore','James'),(2018,'Jackson','James'),(2019,'Martin','James'),(2020,'Smith','Mary'),(2021,'Johnson','Mary'),(2022,'Johnson','William'),(2023,'Brown','Mary'),(2024,'Jones','Mary'),(2025,'Garcia','Mary'),(2026,'Miller','Mary'),(2027,'Davis','Mary'),(2028,'Rodriguez','Mary'),(2029,'Martinez','Mary'),(2030,'Hernandez','Mary'),(2031,'Lopez','Mary'),(2032,'Jones','Elizabeth'),(2033,'Miller','Mary'),(2034,'Anderson','Mary'),(2035,'Thomas','Mary'),(2036,'Taylor','Mary'),(2037,'Moore','Mary'),(2038,'Jackson','Mary'),(2039,'Martin','Mary'),(2040,'Smith','John'),(2041,'Johnson','John'),(2042,'Williams','John'),(2043,'Brown','John'),(2044,'Jones','John'),(2045,'Garcia','John'),(2046,'Miller','John'),(2047,'Davis','John'),(2048,'Williams','Robert'),(2049,'Martinez','John'),(2050,'Hernandez','John'),(2051,'Lopez','John'),(2052,'Gonzalez','John'),(2053,'Wilson','John'),(2054,'Anderson','John'),(2055,'Thomas','John'),(2056,'Davis','James'),(2057,'Moore','John'),(2058,'Jackson','John'),(2059,'Martin','John'),(2060,'Smith','Patricia'),(2061,'Smith','Mary'),(2062,'Williams','Patricia'),(2063,'Brown','Patricia'),(2064,'Jones','Patricia'),(2065,'Wilson','Patricia'),(2066,'Miller','Patricia'),(2067,'Davis','Patricia'),(2068,'Rodriguez','Patricia'),(2069,'Martinez','Patricia'),(2070,'Hernandez','Patricia'),(2071,'Brown','Patricia'),(2072,'Gonzalez','Patricia'),(2073,'Wilson','Patricia'),(2074,'Anderson','Patricia'),(2075,'Thomas','Patricia'),(2076,'Moore','Mary'),(2077,'Moore','Patricia'),(2078,'Jackson','Patricia'),(2079,'Martin','Patricia'),(2080,'Smith','Robert'),(2081,'Johnson','Robert'),(2082,'Williams','Robert'),(2083,'Brown','Robert'),(2084,'Jones','Robert'),(2085,'Garcia','Robert'),(2086,'Wilson','Michael'),(2087,'Davis','Robert'),(2088,'Rodriguez','Robert'),(2089,'Martinez','Robert'),(2090,'Hernandez','Robert'),(2091,'Lopez','Robert'),(2092,'Gonzalez','Robert'),(2093,'Wilson','Robert'),(2094,'Anderson','Robert'),(2095,'Thomas','Robert'),(2096,'Taylor','Robert'),(2097,'Brown','Elizabeth'),(2098,'Jackson','Robert'),(2099,'Martin','Robert'),(2100,'Smith','Jennifer'),(2101,'Johnson','Jennifer');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkouttransaction`
--

DROP TABLE IF EXISTS `checkouttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouttransaction` (
  `transactionID` smallint unsigned NOT NULL AUTO_INCREMENT,
  `patronID` smallint unsigned NOT NULL,
  `transactionDate` date NOT NULL DEFAULT (curdate()),
  `paymentAmount` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`transactionID`),
  KEY `fk_checkoutTransaction_Patron` (`patronID`),
  CONSTRAINT `fk_checkoutTransaction_Patron` FOREIGN KEY (`patronID`) REFERENCES `patron` (`patronID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkouttransaction`
--

LOCK TABLES `checkouttransaction` WRITE;
/*!40000 ALTER TABLE `checkouttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkouttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkouttransactionitem`
--

DROP TABLE IF EXISTS `checkouttransactionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouttransactionitem` (
  `transactionID` smallint unsigned NOT NULL,
  `itemID` smallint unsigned NOT NULL,
  `dueDate` date NOT NULL DEFAULT ((curdate() + interval 2 week)),
  `returnDATE` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`transactionID`,`itemID`),
  KEY `fk_checkoutTransactionItem_Item` (`itemID`),
  CONSTRAINT `fk_checkoutTransactionItem_checkoutTransaction` FOREIGN KEY (`transactionID`) REFERENCES `checkouttransaction` (`transactionID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_checkoutTransactionItem_Item` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkouttransactionitem`
--

LOCK TABLES `checkouttransactionitem` WRITE;
/*!40000 ALTER TABLE `checkouttransactionitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkouttransactionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` smallint unsigned NOT NULL,
  `itemCopy` int NOT NULL,
  `itemTitle` varchar(90) NOT NULL,
  `itemYearPublished` int DEFAULT NULL,
  `itemPublisher` text,
  `itemLoC` varchar(16) NOT NULL,
  `itemAquisitionDate` text,
  `itemCost` decimal(7,2) NOT NULL,
  `itemType` varchar(15) NOT NULL,
  `itemISBN` varchar(17) NOT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `chkItemType` CHECK ((`itemType` in (_utf8mb4'books',_utf8mb4'periodicals',_utf8mb4'recordings',_utf8mb4'videos')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (3000,1,'Great Novel',2020,'Harper Collins','HN59 .T39 2014','15-03-2023',15.00,'periodicals','9781933620000'),(3001,1,'Science Explained',2019,'New York Publishing','PR123 .S45 2005','02-04-2023',28.00,'videos','9781933620001'),(3002,1,'History of Art',2018,'ArtPress','QA987 .R32 2019','20-05-2023',21.00,'recordings','9781933620002'),(3003,1,'Mystery in the Mansion',2022,'Pearson','PS456 .W78 2012','10-06-2023',35.00,'recordings','9781933620003'),(3004,1,'Introduction to Coding',2021,'CodeWorld','HF789 .B23 2008','05-07-2023',16.00,'periodicals','9781933620004'),(3005,1,'Adventure Chronicles',2022,'Adventure Books','TX234 .M56 2017','15-08-2023',18.00,'periodicals','9781933620005'),(3006,1,'Secrets of the Cosmos',2019,'Pearson','LB567 .H89 2021','05-09-2023',24.00,'periodicals','9781933620006'),(3007,1,'Culinary Delights',2020,'New York Publishing','NA345 .P78 2016','20-10-2023',30.00,'videos','9781933620007'),(3008,1,'Time Traveler\'s Dilemma',2017,'Time Travel Books','QP789 .K42 2013','10-11-2023',16.00,'books','9781933620008'),(3009,1,'Beyond the Horizon',2021,'New York Publishing','RC123 .L67 2007','05-12-2023',18.00,'videos','9781933620009'),(3010,1,'Lost in the Amazon',2019,'Explorer Books','HM456 .D32 2015','15-01-2023',19.00,'periodicals','9781933620010'),(3011,1,'Science of Weather',2020,'Meteorology Press','F123 .G56 2011','12-02-2023',32.00,'recordings','9781933620011'),(3012,1,'Tales of Mystery',2018,'Enigma Publications','EK789 .R45 2010','20-03-2023',15.00,'periodicals','9781933620012'),(3013,1,'Art of Cooking',2021,'Culinary Creations','PQ234 .O78 2006','05-04-2023',28.00,'videos','9781933620013'),(3014,1,'A Journey Through Time',2019,'Pearson','RD567 .N89 2009','10-05-2023',21.00,'periodicals','9781933620014'),(3015,1,'Exploring the Universe',2022,'Pearson','HD456 .V32 2018','15-06-2023',35.00,'recordings','9781933620015'),(3016,1,'Gourmet Delights',2018,'Culinary Arts','PR567 .J34 2004','20-07-2023',24.00,'recordings','9781933620016'),(3017,1,'Lost Kingdom',2020,'History Books','HN789 .X56 2022','05-08-2023',30.00,'videos','9781933620017'),(3018,1,'Tales of Mystery',2017,'Enigma Publications','QA123 .Y78 2013','10-09-2023',16.00,'recordings','9781933620018'),(3019,1,'Great Expedition',2021,'Exploration Press','LB234 .Z45 2003','15-10-2023',18.00,'books','9781933620019'),(3020,1,'Secret Garden',2016,'GreenThumb Books','PQ567 .W89 2001','20-11-2023',14.00,'periodicals','9781933620020'),(3021,1,'Scientific Wonders',2022,'Wonder World Publications','PR234 .H78 2002','05-12-2023',29.00,'recordings','9781933620021'),(3022,1,'Culinary Creativity',2021,'Foodie Creations','RC789 .C34 2016','10-01-2022',22.00,'periodicals','9781933620022'),(3023,1,'A Journey in History',2019,'Time Travel Books','QA456 .R89 2010','15-02-2022',27.00,'books','9781933620023'),(3024,1,'Space Odyssey',2020,'Galactic Press','PS789 .S23 2018','10-03-2022',38.00,'periodicals','9781933620024'),(3025,1,'Frankenstein',1818,'Lackington, Hughes, Harding, Mavor and Jones','PR5397 .F7 1818','05-07-2023',6.45,'periodicals','9781933620025'),(3026,1,'My Love for You',2007,'Norton','GH456 .T23 2025','15-08-2023',9.67,'periodicals','9781933620026'),(3027,1,'Homeroom Diaries',2014,'Little, Brown and Company','BC123 .S78 2017','05-09-2023',25.44,'videos','9781933620027'),(3028,1,'The Summer I Turned Pretty',2009,'New York: Simon & Schuster Books for Young Readers, c2009','KM987 .R91 2020','20-10-2023',19.99,'recordings','9781933620028'),(3029,1,'Fire with Fire',2013,'New York: Simon & Schuster Books for Young Readers, c2013','YX456 .W45 2013','10-11-2023',18.64,'recordings','9781933620029'),(3030,1,'Burn for Burn',2012,'New York: Simon & Schuster Books for Young Readers, c2012','AP789 .B89 2009','05-12-2023',17.34,'books','9781933620030'),(3031,1,'Ashes to Ashes',2014,'New York: Simon & Schuster Books for Young Readers [2014]','ZQ234 .M78 2016','15-01-2023',19.56,'videos','9781933620031'),(3032,1,'Hush Hush',2010,'Pocket Books','EF567 .H12 2024','12-02-2023',13.45,'books','9781933620032'),(3033,1,'Coraline',2010,'New York: HarperCollins','OP345 .P67 2018','20-03-2023',11.89,'books','9781933620033'),(3034,1,'No, David!',1998,'New York Publishing','LX789 .K42 2014','05-04-2023',9.89,'videos','9781933620034'),(3035,1,'Out of Control',1993,'Time Travel Books','RG123 .L87 2011','10-05-2023',20.00,'recordings','9781933620035'),(3036,1,'Wintergirls ',2009,'New York Publishing','BD456 .D23 2006','15-06-2023',10.00,'periodicals','9781933620036'),(3037,1,'The Magic Tree House: Dinosaurs',1992,'Explorer Books','FK789 .G56 2012','20-07-2023',8.45,'books','9781933620037'),(3038,1,'The Things They Carried',1990,'Meteorology Press','XY123 .R45 2015','05-08-2023',9.33,'periodicals','9781933620038'),(3039,1,'The Nickel and Dimed',2001,'Scribner Book Company','PQ234 .O78 2013','10-09-2023',9.45,'recordings','9781933620039'),(3040,1,'Songs of Solomon',1977,'Scribner Book Company','ZA567 .N89 2019','15-10-2023',10.45,'periodicals','9781933620040'),(3041,1,'The Bluest Eyes',1970,'Pearson','CD456 .V32 2021','20-11-2023',19.34,'books','9781933620041'),(3042,1,'Moby Dick',1851,'Pearson','EF567 .J34 2008','05-12-2023',4.53,'recordings','9781933620042'),(3043,1,'The Scarlett Letter',1850,'New York: HarperCollins','HN789 .X56 2022','20-11-2023',5.86,'videos','9781933620043'),(3044,1,'Where do I go?',1999,'New York Publishing','KM123 .Y78 2013','05-12-2023',10.93,'videos','9781933620044'),(3045,1,'Fangirl',2013,'Time Travel Books','PR234 .Z45 2007','10-01-2022',12.93,'recordings','9781933620045'),(3046,1,'Sublime',2014,'New York Publishing','NA567 .W89 2010','15-02-2022',14.23,'recordings','9781933620046'),(3047,1,'The Authenticity Project',2020,'Pearson','BC234 .H78 2001','10-03-2022',15.94,'videos','9781933620047'),(3048,1,'Fame and Fortune',2022,'Pearson','RC789 .C34 2002','15-03-2023',16.34,'periodicals','9781933620048'),(3049,1,'Call Me When You\'re Sober',2021,'Scribner Book Company','QA456 .R89 2016','15-02-2022',13.98,'videos','9781933620049'),(3050,1,'The Exchange: After the Firm',2023,'Pearson','AB789 .S23 2023','22-12-2024',29.95,'videos','9781933620050'),(3051,1,'Fourth Wing',2023,'Pearson','PQ5397 .F7 1819','11-06-2023',29.99,'periodicals','9781933620051'),(3052,1,'An American Fight Against Fascism',2023,'Crown Publishing Group','LJ9976 .My4 2024','03-11-2023',32.00,'recordings','9781933620052'),(3053,1,'Killers of the Flower Moon',2018,'New York Publishing','HG456 .T23 2019','06-07-2023',16.95,'recordings','9781933620053'),(3054,1,'Enough',2023,'New York Publishing','CD123 .S78 2025','09-08-2023',30.00,'recordings','9781933620054'),(3055,1,'Worthy',2023,'Dey Street Books','OQ987 .R91 2020','14-03-2023',32.00,'videos','9781933620055'),(3056,1,'Percy Jackson and the Olympians',2023,'Disney Hyperion','HN789 .W12 2054','19-04-2023',19.99,'periodicals','9781933620056'),(3057,1,'Lessons in Chemistry',2022,'Doubleday Books','RC234 .C78 2055','05-11-2023',28.95,'videos','9781933620057'),(3058,1,'Wildfire',2023,'New York Publishing','TX567 .J34 2056','04-10-2023',17.99,'recordings','9781933620058'),(3059,1,'A Little Life',2016,'New York Publishing','EK789 .P45 2057','02-09-2023',17.00,'videos','9781933620059'),(3060,1,'Tom Lake',2023,'Pearson','HF567 .G89 2058','04-08-2023',30.00,'recordings','9781933620060'),(3061,1,'Holly',2023,'Scribner Book Company','NA123 .F67 2059','03-07-2023',30.00,'recordings','9781933620061'),(3062,1,'Judgment Prey',2023,'Pearson','PQ789 .L23 2060','09-06-2023',24.00,'periodicals','9781933620062'),(3063,1,'The Armor of Light',2023,'Viking','HM567 .D12 2061','04-05-2023',30.00,'videos','9781933620063'),(3064,1,'Second ACT',2023,'Delacorte Press','F123 .X45 2062','07-10-2023',16.00,'books','9781933620064'),(3065,1,'Demon Copperhead',2022,'Harper','RD234 .H89 2063','05-09-2023',18.00,'books','9781933620065'),(3066,1,'Blood Lines',2023,'Scribner Book Company','LB789 .Z34 2064','22-03-2023',19.00,'videos','9781933620066'),(3067,1,'The Covenant of Water',2023,'New York Publishing','PR234 .V67 2065','12-01-2024',32.00,'recordings','9781933620067'),(3068,1,'12 Months to Live',2023,'New York Publishing','HN456 .R12 2066','18-06-2023',15.00,'recordings','9781933620068'),(3069,1,'Call Me Hunter',2023,'Pocket Books','QA789 .K34 2067','07-05-2023',28.00,'books','9781933620069'),(3070,1,'Sword Catcher',2023,'Del Rey Books','PS234 .T78 2068','18-03-2024',21.00,'periodicals','9781933620070'),(3071,1,'The Mysteries',2023,'Andrews McMeel Publishing','RC567 .M89 2069','15-02-2022',24.00,'periodicals','9781933620071'),(3072,1,'Throne of the Fallen',2023,'Little Brown and Company','QP789 .N12 2070','05-07-2023',30.00,'recordings','9781933620072'),(3073,1,'The Heaven & Earth Grocery Store',2023,'New York Publishing','TX234 .W45 2071','15-08-2023',16.00,'books','9781933620073'),(3074,1,'None of This Is True',2023,'Atria Books','LB567 .Y89 2072','05-09-2023',18.00,'recordings','9781933620074'),(3075,1,'The Unmaking of June Farrow',2023,'New York Publishing','HD234 .L34 2073','20-10-2023',19.00,'recordings','9781933620075'),(3076,1,'Starling House',2023,'Pocket Books','PS456 .W78 2074','10-11-2023',32.00,'videos','9781933620076'),(3077,1,'The Hurricane Wars',2023,'Pocket Books','HM234 .N89 2075','05-12-2023',15.00,'recordings','9781933620077'),(3078,1,'Bright Lights, Big Christmas',2023,'Pearson','QA567 .J12 2076','15-01-2023',28.00,'videos','9781933620078'),(3079,1,'Code Red: A Mitch Rapp',2023,'Pearson','PR234 .F67 2077','12-02-2023',21.00,'videos','9781933620079'),(3080,1,'The Iliad',2023,'W. W. Norton & Company','HF789 .X56 2078','20-03-2023',35.00,'videos','9781933620080'),(3081,1,'Hello Beautiful',2023,'Dial Press','LB456 .R12 2079','05-04-2023',24.00,'books','9781933620081'),(3082,1,'Aesop\'s Fables Illustrated',2023,'Canterbury Classics','RC234 .T34 2080','20-05-2023',30.00,'books','9781933620082'),(3083,1,'The Boys from Biloxi: A Legal Thriller',2023,'Knopf Doubleday Publishing Group','TX789 .K89 2081','10-06-2023',16.00,'books','9781933620083'),(3084,1,'The Wish',2023,'Grand Central Publishing','PQ567 .H45 2082','05-07-2023',18.00,'videos','9781933620084'),(3085,1,'A Flicker in the Dark',2023,'Pearson','HN234 .G67 2083','15-08-2023',14.00,'recordings','9781933620085'),(3086,1,'The Whittiers',2023,'Pearson','QP789 .V12 2084','05-09-2023',29.00,'periodicals','9781933620086'),(3087,1,'The Noise: A Thriller',2023,'Grand Central Publishing','NA456 .P45 2085','20-10-2023',22.00,'videos','9781933620087'),(3088,1,'The Perfect Holiday',2023,'New York Publishing','F123 .S34 2086','10-11-2023',27.00,'videos','9781933620088'),(3089,1,'The Family Upstairs',2023,'Pocket Books','EK234 .M89 2087','05-12-2023',38.00,'videos','9781933620089'),(3090,1,'The Horsewoman',2023,'Grand Central Publishing','RD789 .D12 2088','15-01-2023',30.00,'periodicals','9781933620090'),(3091,1,'Seven Girls Gone',2023,'Mira Books','HD567 .Z67 2089','12-02-2023',16.00,'videos','9781933620091'),(3092,1,'Clive Cussler\'s Hellburner',2023,'New York Publishing','PR456 .L89 2090','20-03-2023',18.00,'periodicals','9781933620092'),(3093,1,'Moondance: 2-In-1: The Last Honest Woman and Dance to the Piper',2023,'St. Martin\'s Press','TX234 .C78 2091','05-04-2023',19.00,'videos','9781933620093'),(3094,1,'A Snow Country Christmas',2023,'Canary Street Press','HM789 .W45 2092','20-05-2023',32.00,'books','9781933620094'),(3095,1,'Bad Hombres',2023,'Pearson','RC234 .N12 2093','10-06-2023',15.00,'videos','9781933620095'),(3096,1,'The Holiday Heartbreaker',2023,'Pearson','PS567 .R12 2094','05-07-2023',28.00,'books','9781933620096'),(3097,1,'The Scavengers',2023,'Pearson','LB456 .T78 2095','15-08-2023',21.00,'periodicals','9781933620097'),(3098,1,'The Recovery Agent',2023,'Pocket Books','QA789 .Y89 2096','05-09-2023',35.00,'periodicals','9781933620098'),(3099,1,'Bad Luck Vampire: An Argeneau Novel',2023,'Pocket Books','HF234 .F67 2097','20-10-2023',24.00,'periodicals','9781933620099'),(3100,1,'Late Summer Love ',2023,'Pocket Books','PQ456 .G89 2098','10-11-2023',30.00,'books','9781933620100'),(3101,1,'Liar',2023,'Zebra','HN789 .J34 2099','05-12-2023',19.00,'books','9781933620101'),(3102,1,'The Merriam-Webster Dictionary',2022,'Merriam-Webster','QP234 .K12 2100','15-01-2023',32.00,'videos','9781933620102'),(3103,1,'Rosewood Lane ',2023,'Mira Books','PR567 .M34 2101','12-02-2023',15.00,'videos','9781933620103'),(3104,2,'Rosewood Lane ',2023,'Mira Books','PR567 .M34 2101','12-02-2023',15.00,'videos','9781933620103'),(3105,3,'Rosewood Lane ',2023,'Mira Books','PR567 .M34 2101','12-02-2023',15.00,'books','9781933620103');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemauthor`
--

DROP TABLE IF EXISTS `itemauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemauthor` (
  `itemID` smallint unsigned NOT NULL,
  `authorID` smallint unsigned NOT NULL,
  `authorID2` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`itemID`,`authorID`),
  KEY `fk_ItemAuthor_Author` (`authorID`),
  CONSTRAINT `fk_ItemAuthor_Author` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ItemAuthor_Item` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemauthor`
--

LOCK TABLES `itemauthor` WRITE;
/*!40000 ALTER TABLE `itemauthor` DISABLE KEYS */;
INSERT INTO `itemauthor` VALUES (3000,2001,2000),(3001,2002,NULL),(3002,2003,NULL),(3003,2004,NULL),(3004,2005,NULL),(3005,2006,NULL),(3006,2007,NULL),(3007,2008,NULL),(3008,2009,NULL),(3009,2010,NULL),(3010,2011,NULL),(3011,2012,NULL),(3012,2013,NULL),(3013,2014,NULL),(3014,2015,NULL),(3015,2016,NULL),(3016,2017,NULL),(3017,2018,NULL),(3018,2019,NULL),(3019,2020,NULL),(3020,2021,NULL),(3021,2022,NULL),(3022,2023,NULL),(3023,2024,NULL),(3024,2025,NULL),(3025,2026,NULL),(3026,2027,NULL),(3027,2028,NULL),(3028,2029,NULL),(3029,2029,NULL),(3030,2029,NULL),(3031,2029,NULL),(3032,2030,NULL),(3033,2031,NULL),(3034,2032,NULL),(3035,2033,NULL),(3036,2034,NULL),(3037,2035,NULL),(3038,2036,NULL),(3039,2037,NULL),(3040,2038,NULL),(3041,2039,NULL),(3042,2040,NULL),(3043,2041,NULL),(3044,2042,NULL),(3045,2043,NULL),(3046,2044,NULL),(3047,2045,NULL),(3048,2046,NULL),(3049,2047,NULL),(3050,2048,NULL),(3051,2049,NULL),(3052,2050,NULL),(3053,2051,NULL),(3054,2052,NULL),(3055,2053,NULL),(3056,2054,NULL),(3057,2055,NULL),(3058,2056,NULL),(3059,2057,NULL),(3060,2058,NULL),(3061,2059,NULL),(3062,2060,NULL),(3063,2061,NULL),(3064,2062,NULL),(3065,2063,NULL),(3066,2064,NULL),(3067,2065,NULL),(3068,2066,NULL),(3069,2067,NULL),(3070,2068,NULL),(3071,2069,NULL),(3072,2070,NULL),(3073,2071,NULL),(3074,2072,NULL),(3075,2073,NULL),(3076,2074,NULL),(3077,2075,NULL),(3078,2076,NULL),(3079,2077,NULL),(3080,2078,NULL),(3081,2079,NULL),(3082,2080,NULL),(3083,2081,NULL),(3084,2082,NULL),(3085,2083,NULL),(3086,2084,NULL),(3087,2085,NULL),(3088,2086,NULL),(3089,2087,NULL),(3090,2088,NULL),(3091,2089,NULL),(3092,2090,NULL),(3093,2091,NULL),(3094,2092,NULL),(3095,2093,NULL),(3096,2094,NULL),(3097,2095,NULL),(3098,2096,NULL),(3099,2097,NULL),(3100,2098,NULL),(3101,2099,NULL),(3102,2100,NULL),(3103,2101,NULL),(3104,2101,NULL),(3105,2101,NULL);
/*!40000 ALTER TABLE `itemauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron`
--

DROP TABLE IF EXISTS `patron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patron` (
  `patronID` smallint unsigned NOT NULL AUTO_INCREMENT,
  `patronLastName` varchar(45) NOT NULL,
  `patronFirstName` varchar(45) NOT NULL,
  `patronAddress` varchar(90) NOT NULL,
  `patronDateOfBirth` date NOT NULL,
  `patronLastRenewed` date NOT NULL DEFAULT (curdate()),
  `patronContactPhone` varchar(15) NOT NULL,
  `paymentBalance` decimal(13,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`patronID`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron`
--

LOCK TABLES `patron` WRITE;
/*!40000 ALTER TABLE `patron` DISABLE KEYS */;
INSERT INTO `patron` VALUES (1001,'Cook','Sandra','2132 Bank Ct., Washington, DC, 20026','2000-01-01','2024-07-23','9101289856',0.00),(1002,'Rodriguez','Melina','331 Ridge Rd, Wilmington, NC, 20804','1990-11-23','2027-09-03','9106279852',0.00),(1003,'Rodrick','Alexander','434 Nightsville, Nashville, TX, 33033','1984-04-12','2024-04-12','9102246953',0.00),(1004,'York','Miles','5062 Kinsley St, Myrtle Beach, SC, 99221','2001-08-09','2025-01-11','9109312876',0.00),(1005,'Long','Niles','7565 Aiden Dr, Salem, OR, 54354','1999-09-09','2023-12-23','9105678942',0.00),(1006,'Presly','Eugene','8787 Conley Ave, Durham, NC, 23484','1967-08-15','2024-03-04','9103412765',0.00),(1007,'Clerk','Morgan','1212 King Rd, Beulaville, NC, 28518','2000-03-10','2025-06-07','9107895432',0.00),(1008,'Johns','Evelyn','324 Laneside Str, Corn, MN, 43434','1994-06-03','2024-10-06','9104821653',0.00),(1009,'Clark','Labrea','945 Frontside Rd, Nate, RI, 88333','2005-05-06','2024-11-02','9106453278',0.00),(1010,'Anderson','Emily             ','123 Main Street, Anytown, CA 12345','1996-03-25','2025-02-14','9102398765',0.00),(1011,'Mitchell','Daniel','456 Elm Avenue, Springfield, NY 67890','2002-12-02','2025-07-08','9108907654',0.00),(1012,'Hernandez','Olivia','789 Oak Drive, Pleasantville, TX 54321','2004-09-01','2026-09-16','9101234987',0.00),(1013,'Reynolds','Andrew','101 Maple Lane, Oaksville, FL 98765','1991-07-06','2026-11-12','9107654398',0.00),(1014,'Patel','Sophia','234 Pine Street, Riverdale, IL 23456','1998-06-07','2027-08-04','9104892376',0.00),(1015,'Sullivan','William','567 Birch Road, Lakeside, PA 78901','1993-10-12','2025-05-09','9106732485',0.00),(1016,'Wagner','Emma','890 Cedar Lane, Hillcrest, OH 45678','2001-04-16','2025-07-09','9101237654',0.00),(1017,'Kim','Kate          ','345 Willow Drive, Woodsville, MI 32109','1999-01-26','2027-11-30','9109876342',0.00),(1018,'Delgado','Mia','678 Oak Avenue, Riverside, GA 65432','2002-04-30','2028-12-15','9108765423',0.00),(1019,'Navarro','Benjamin','901 Maple Street, Meadowville, NC 21098','1995-06-17','2028-06-30','9104563279',0.00),(1020,'Smith','John','123 Main Street, Anytown, CA 12345','1980-01-01','2025-12-31','9101876234',0.00),(1021,'Doe','Jane','456 Elm Avenue, Smallville, NY 54321','1992-03-15','2024-11-30','9103245789',0.00),(1022,'Johnson','Michael','789 Oak Road, Suburbia, TX 67890','1975-07-10','2026-09-30','9102348976',0.00),(1023,'Blue','Sarah','987 Pine Lane, Midtown, IL 45678','1988-05-20','2026-10-31','9108726349',0.00),(1024,'Lee','Robert','654 Cedar Drive, Hometown, GA 34567','1995-12-05','2025-08-15','9109836542',0.00),(1025,'Scott','Lisa','234 Birch Street, Countyville, FL 23456','1982-02-28','2025-07-05','9102143765',0.00),(1026,'Sinclais','William','876 Maple Avenue, Suburbia, CA 98765','1970-09-14','2026-06-30','9108754321',0.00),(1027,'Graham','Jennifer','567 Oakwood Road, Townsville, NY 87654','1991-06-07','2024-12-15','9102345679',0.00),(1028,'Ross','Kevin','321 Pine Street, Riverside, TX 12345','1987-11-03','2026-05-25','9106423785',0.00),(1029,'Monroe','Amanda','543 Elm Drive, Cityville, AZ 56789','1984-04-19','2024-10-10','9103456872',0.00),(1030,'Taylor','Richard','765 Walnut Lane, Countyville, PA 34567','1977-10-08','2024-04-01','9105687923',0.00),(1031,'Murray','Emily','432 Cedar Road, Suburbia, MI 76543','1990-08-12','2025-07-20','9103498765',0.00),(1032,'Black','Daniel','987 Willow Avenue, Townsville, WA 98765','1986-06-30','2027-11-05','9102837654',0.00),(1033,'Scully','Jessica','234 Birch Street, Smalltown, OH 65432','1993-01-14','2024-12-10','9103248567',0.00),(1034,'Campbell','Christopher','876 Pine Road, Riverside, NV 87654','1981-03-25','2025-09-05','9102347856',0.00),(1035,'Gallo','Mary','321 Oak Drive, Cityville, NC 12345','1976-04-06','2026-08-18','9104325678',0.00),(1036,'Davinci','Thomas','543 Elm Avenue, Suburbia, VA 23456','1989-07-27','2024-06-15','9101237498',0.00),(1037,'Rizzo','Kimberly','765 Cedar Lane, Countyville, OR 34567','1994-12-19','2026-05-30','9107483921',0.00),(1038,'Leone','Joseph','432 Pine Road, Townsville, TN 76543','1979-02-02','2026-11-10','9109182734',0.00),(1039,'Serra','Laura','987 Oakwood Drive, Smallville, LA 98765','1983-10-23','2025-07-05','9107462358',0.00),(1040,'Smith','James','21542 Highland Drive, Milwaukee,WI,53226','1997-09-23','2026-06-30','9103246789',0.00),(1041,'Smith','Micheal','1451 Coburnhollow road,Peoria,IL,61602','1990-08-12','2024-12-15','9105874326',0.00),(1042,'Smith','Robert','1044 Settlers Lane,Hawaii,96718','1986-06-30','2026-05-25','9102374568',0.00),(1043,'Garcia','Maria','4682 North Street,pennsylvania, PN, 15254','1977-10-08','2024-10-10','9109823417',0.00),(1044,'Smith','David','1299 Parker Drive, Mount Vernon, OH,44128','2001-04-16','2024-04-01','9109238467',0.00),(1045,'Rodriguez','Maria','4201 Red Hawk Road,Odessa,NY,14869','1977-09-06','2025-07-20','9108473621',0.00),(1046,'Smith','Maria','5346 walnut land park,Pride, NY,14867','1987-11-03','2027-11-05','9107563498',0.00),(1047,'Hernandez','Maria','789 Oak landlane, Suburbia,TX, 67890','1984-04-19','2024-12-10','9108972634',0.00),(1048,'Martinez','Maria','4326 willow land, Cityville, Nc, 87654','1977-10-08','2025-09-05','9106547832',0.00),(1049,'Johnson','James','4019 wilshire, Charlotte,NC, 28403','1990-08-12','2026-08-18','9104562398',0.00),(1050,'Novak','Rick ','1093 Woodhills, Gibsonia, PA, 15044','2001-04-09','2026-04-18','9109985417',0.00),(1051,'Connor','Susan','328 P O Box, Tuyndaall, SD, 57066','1996-09-05','2025-06-18','9108565971',0.00),(1052,'Adelman','Margaret','10730 Big Canoe, Jasper, GA, 30143','1994-01-09','2026-12-18','9109652388',0.00),(1053,'Barr','Ronald ','784 W 98 Place, Jenks, OK, 74037','2003-01-09','2024-09-02','9103205312',0.00),(1054,'Broadbet','Marie','4616 Breezeway, Midland, TX, 79707','2000-03-02','2025-07-30','9106729014',0.00),(1055,'Lum','Roger','435 Autry Ridge Pt, Alpharetta, GA, 30022','1997-12-02','2025-01-07','9109915782',0.00),(1056,'Donahue','Marlene','30 Wedgewood Rd., Worcuster, MA, 16020','1993-02-01','2024-02-04','9108251518',0.00),(1057,'Johnson','Jeff','19 Burard St, West Roxbury, MA, 21320','2002-02-09','2025-07-23','9105413503',0.00),(1058,'Forbis','Melvin','8 Blakes Dr, Werstfofd, MA 18860','2005-03-02','2025-10-14','9107472959',0.00),(1059,'Aalderink','Abigail','4684 Wetael Road, Liverpool, NY, 13090','2001-04-09','2024-02-18','9106312417',0.00),(1060,'Bartnick','Samuel','4777 Pacific Avenue #1, San Fransisco, CA, 94133','1999-01-21','2025-09-11','9109087190',0.00),(1061,'Bartolo','Sanford','2240 Emil Street, San Fransisco, CA, 93401','1992-07-10','2025-03-08','9102116910',0.00),(1062,'Dumas','John','525 South Olive Street, Los Angeles, CA, 90013','1998-03-22','2024-04-22','9105419321',0.00),(1063,'Hines','Kristi','835 Aerovista, San Luis Obispo, CA, 93401 ','2002-12-31','2025-07-06','9108894791',0.00),(1064,'James','Vicky','1981 North Brodway, Walnut Creek, CA, 94596','1989-05-18','2025-11-14','9108912169',0.00),(1065,'Kline','Lindsy','4468 Columbia Rd, Augusta, GA, 30907','1997-01-03','2026-12-25','9106892218',0.00),(1066,'Lyn','Apple','603 s Washington Ave, Lansing, MI, 48933','2000-08-16','2024-08-19','9105419289',0.00),(1067,'Nazal','Lee','230 E 9th St, Indianapolis, IN, 46204','1991-06-19','2025-03-09','9108857932',0.00),(1068,'Sack','Bradley','21366 Alameda St, Long Beach, CA, 90810','2001-03-22','2026-10-28','9107318413',0.00),(1069,'Catmire','Anna','224 3rd Ave, Brooklyn, NY, 11217','1990-09-27','2025-04-30','9103204917',0.00);
/*!40000 ALTER TABLE `patron` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-12 19:26:27
