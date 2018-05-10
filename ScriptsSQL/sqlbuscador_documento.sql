-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sqlbuscador
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `n_documento` varchar(200) DEFAULT NULL,
  `n_archivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  UNIQUE KEY `n_archivo_UNIQUE` (`n_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'s are usually created from multiple editions,','00ws110.txt'),(2,'Divina Commedia di Dante','0ddc809a.txt'),(3,'The Divine Comedy Dante','0ddcc10.txt'),(4,'The Divine Comedy Dante','0ddcl10.txt'),(5,'s are usually created from multiple editions,','11001108.txt'),(6,'Russia in 1919, by Arthur Ransome','19rus10.txt'),(7,'The Argonautica by Apollonius Rhodius','1argn10.txt'),(8,'Critical & Historical Essays, by Macaulay','1cahe10.txt'),(9,'Volume 1:','1dfre10.txt'),(10,'The official release date all s is at','1donq10.txt'),(11,'s are usually created from multiple editions,','1drvb10.txt'),(12,'The History Herodotus V1 by Herodotus','1hofh10.txt'),(13,'Schiller\'s History the Thirty Years\' War','1jcfs10.txt'),(14,'The Writings Abraham Lincoln, v1','1linc11.txt'),(15,'The Legends the Jews Volume 1','1lotj10.txt'),(16,'s are usually created from multiple editions,','1mart10.txt'),(17,'s are usually created from multiple editions,','1mlyd10.txt'),(18,'Myth, Ritual, and Religion, Vol. 1','1mrar10.txt'),(19,'','1musk12.txt'),(20,'On War, by Carl von Clausewitz','1onwr10.txt'),(21,'Robin Hood by J. Walker McSpadden','1rbnh10.txt'),(22,'The Ethics, by Benedict de Spinoza','1spne10.txt'),(23,'The Works Rudyard Kipling','1vkip11.txt'),(24,'Sir Thomas More ascribed in part to','1ws4710.txt'),(25,'Cromwell attributed in part to','1ws4910.txt'),(26,'The Life Sir John Oldcastle','1ws5110.txt'),(27,'20,000 Leagues Under the Sea','2000010.txt'),(28,'s are usually created from multiple editions,','21001108.txt'),(29,'Critical & Historical Essays, by Macaulay','2cahe10.txt'),(30,'A Tale Two Cities, by Dickens','2city12.txt'),(31,'','2dfre11.txt'),(32,'Don Quijote, by Cervantes, in Spanish','2donq10.txt'),(33,'s are usually created from multiple editions,','2drvb10.txt'),(34,'The History Herodotus V2 by Herodotus','2hofh10.txt'),(35,'The Writings Abraham Lincoln, v2','2linc11.txt'),(36,'The Legends the Jews Volume 2','2lotj10.txt'),(37,'s are usually created from multiple editions,','2mart10.txt'),(38,'s are usually created from multiple editions,','2mlyd10.txt'),(39,'Ten Years Later, by Dumas [Pere]','2musk10.txt'),(40,'The official release date all s is at','2rbnh10.txt'),(41,'The Ethics, by Benedict de Spinoza','2spne10.txt'),(42,'King Henry VI, Part 1, by Shakespeare','2ws0110.txt'),(43,'King Henry VI, Part 2, by Shakespeare','2ws0210.txt'),(44,'King Henry VI, Part 3, by Shakespeare','2ws0310.txt'),(45,'King Richard III by Shakespeare','2ws0410.txt'),(46,'The Comedy Errors by Shakespeare','2ws0610.txt'),(47,'The Rape Lucrece by Shakespeare','2ws0810.txt'),(48,'Titus Andronicus by Shakespeare','2ws0910.txt'),(49,'The Taming the Shrew by Shakespeare','2ws1010.txt'),(50,'The Two Gentlemen Verona by Shakespeare','2ws1110.txt'),(51,'Love\'s Labour\'s Lost by Shakespeare','2ws1210.txt'),(52,'King John by Shakespeare','2ws1410.txt'),(53,'King Richard II by Shakespeare','2ws1510.txt'),(54,'Romeo and Juliet by Shakespeare','2ws1610.txt'),(55,'A Midsummer Night\'s Dream by Shakespeare','2ws1710.txt'),(56,'The Merchant Venice by Shakespeare','2ws1810.txt'),(57,'King Henry IV, Part 1, by Shakespeare','2ws1910.txt'),(58,'The Merry Wives Windsor by Shakespeare','2ws2010.txt'),(59,'King Henry IV, Part 2, by Shakespeare','2ws2110.txt'),(60,'Much Ado About Nothing by Shakespeare','2ws2210.txt'),(61,'King Henry V by Shakespeare','2ws2310.txt'),(62,'Julius Caesar by Shakespeare','2ws2410.txt'),(63,'As You Like It by Shakespeare','2ws2510.txt'),(64,'Hamlet by Shakespeare','2ws2610.txt'),(65,'The Phoenix and the Turtle by Shakespeare','2ws2710.txt'),(66,'Twelfth Night by Shakespeare','2ws2810.txt'),(67,'Troilus and Cressida by Shakespeare','2ws2910.txt'),(68,'All\'s Well That Ends Well by Shakespeare','2ws3010.txt'),(69,'Measure for Measure by Shakespeare','2ws3110.txt'),(70,'Othello Shakespeare','2ws3210.txt'),(71,'King Lear by Shakespeare','2ws3310.txt'),(72,'Macbeth by Shakespeare','2ws3410.txt'),(73,'Antony and Cleopatra by Shakespeare','2ws3510.txt'),(74,'Coriolanus by Shakespeare','2ws3610.txt'),(75,'Timon Athens by Shakespeare','2ws3710.txt'),(76,'Pericles by Shakespeare','2ws3810.txt'),(77,'Cymbeline by Shakespeare','2ws3910.txt'),(78,'The Winter\'s Tale by Shakespeare','2ws4010.txt'),(79,'The Tempest by Shakespeare','2ws4110.txt'),(80,'Henry VIII by Shakespeare','2ws4210.txt'),(81,'The Two Noble Kinsmen by Shakespeare','2ws4310.txt'),(82,'A Lover\'s Complaint by Shakespeare','2ws4410.txt'),(83,'The Passionate Pilgrim by Shakespeare','2ws4510.txt'),(84,'Two Years Before the Mast, by Dana','2yb4m10.txt'),(85,'s are usually created from multiple editions,','31001108.txt'),(86,'Volume 3:','3dfre10.txt'),(87,'Holy Bible, Douay-Rheims Version, N.T.','3drvb10.txt'),(88,'The Writings Abraham Lincoln, v3','3linc11.txt'),(89,'THE LEGENDS OF THE JEWS VOLUME III','3lotj10.txt'),(90,'Ten Years Later, by Dumas [Pere]','3musk11.txt'),(91,'The Ethics, by Benedict de Spinoza','3spne10.txt'),(92,'s are usually created from multiple editions,','41001108.txt'),(93,'Volume 4:','4dfre10.txt'),(94,'The Writings Abraham Lincoln, v4','4linc11.txt'),(95,'THE LEGENDS OF THE JEWS VOLUME IV','4lotj10.txt'),(96,'The Ethics, by Benedict de Spinoza','4spne10.txt'),(97,'s are usually created from multiple editions,','51001108.txt'),(98,'','5dfre11.txt'),(99,'The Writings Abraham Lincoln, v5','5linc11.txt'),(100,'The Ethics, by Benedict de Spinoza','5spne10.txt'),(101,'Five Weeks in a Balloon, by Jules Verne','5wiab10.txt'),(102,'s are usually created from multiple editions,','61001108.txt'),(103,'Volume 6:','6dfre10.txt'),(104,'The Writings Abraham Lincoln, v6','6linc11.txt'),(105,'s are usually created from multiple editions,','71001108.txt'),(106,'','7king10.txt'),(107,'The Writings Abraham Lincoln, v7','7linc11.txt'),(108,'','7mynr10.txt'),(109,'Around the World in 80 Days','80day11.txt'),(110,'s are usually created from multiple editions,','81001108.txt'),(111,'','8aggr10.txt'),(112,'The Antediluvian World','8ataw11.txt'),(113,'','8augr10.txt'),(114,'','8cand10.txt'),(115,'','8celt10.txt'),(116,'','8clel10.txt'),(117,'The Autobiography Benvenuto Cellini','8clln10.txt'),(118,'Crime and Punishment, by Dostoevsky','8crmp10.txt'),(119,'','8csus10.txt'),(120,'','8cury10.txt'),(121,'','8dubc10.txt'),(122,'','8eftl10.txt'),(123,'','8elit10.txt'),(124,'','8euhs10.txt'),(125,'Famous Men The Middle Ages by','8fmtm10.txt'),(126,'An African Millionaire, by Grant Allen','8frml10.txt'),(127,'','8frog10.txt'),(128,'','8ghst10.txt'),(129,'','8grtr10.txt'),(130,'','8gs3410.txt'),(131,'','8gtdr10.txt'),(132,'','8hcal10.txt'),(133,'','8hfld10.txt'),(134,'','8hist10.txt'),(135,'','8hmvg10.txt'),(136,'','8homr10.txt'),(137,'','8hsrs10.txt'),(138,'','8idol10.txt'),(139,'','8igjp10.txt'),(140,'','8jeev10.txt'),(141,'','8josh10.txt'),(142,'','8jrc710.txt'),(143,'A Journey to the Interior the Earth','8jrny10.txt'),(144,'','8knck10.txt'),(145,'','8ldvc10.txt'),(146,'','8ldvn10.txt'),(147,'','8lndp10.txt'),(148,'','8lssm10u.txt'),(149,'','8luth10.txt'),(150,'','8mala10.txt'),(151,'','8moon10.txt'),(152,'','8moor10.txt'),(153,'','8ntle10.txt'),(154,'','8phil10.txt'),(155,'','8purg10.txt'),(156,'The Religion Babylonia and Assyria','8rbaa10.txt'),(157,'','8rdsl10.txt'),(158,'','8read10.txt'),(159,'','8recn10.txt'),(160,'','8rheb10.txt'),(161,'','8rinc10.txt'),(162,'','8rome10.txt'),(163,'','8romn10.txt'),(164,'The Adventures Roderick Random','8rran10.txt'),(165,'','8rtib10.txt'),(166,'s are usually created from multiple editions,','8saht10.txt'),(167,'','8sced10.txt'),(168,'','8shkm10.txt'),(169,'Du côté de chez Swann (A la recherche du temps','8swan11.txt'),(170,'','8swnn10.txt'),(171,'','8tjna10.txt'),(172,'','8tomj10.txt'),(173,'','8trsa10.txt'),(174,'The South Pole, Volume 1','8tspv111.txt'),(175,'The South Pole, Volume 2','8tspv211.txt'),(176,'','8unlt10.txt'),(177,'','8ushx10.txt'),(178,'','8va0910.txt'),(179,'','8vnmm10.txt'),(180,'','8wsh110.txt'),(181,'','8wwrt10.txt'),(182,'Eight Years\' Wanderings in Ceylon','8year10.txt'),(183,'s are usually created from multiple editions,','91001108.txt'),(184,'The Book the Thousand Nights','a1001108.txt'),(185,'','aaard10.txt'),(186,'The Autobiography Charles Darwin','adrwn10.txt'),(187,'','advsh12.txt'),(188,'This is the  Aesop\'s Fables','aesop11.txt'),(189,'The Age Innocence by Wharton','agino10.txt'),(190,'','agnsg10.txt'),(191,'This is the  Alice in Wonderland','alice30.txt'),(192,'Anecdotes Johnson by Hesther Lynch Piozzi','andsj10.txt'),(193,'Andersonville, by John McElroy, entire','andvl11.txt'),(194,'Vergil\'s Aeneid in English','anide10.txt'),(195,'Vergil\'s Aeneid in Latin','anidl10.txt'),(196,'Anne Green Gables','anne11.txt'),(197,'Anthem, by Ayn Rand','anthm10z.txt'),(198,'Areopagitica, by John Milton','areop10.txt'),(199,'','arjpl10.txt'),(200,'','armyl10.txt'),(201,'Anne Avonlea','avon10.txt'),(202,'','b033w10.txt'),(203,'Supplemental Nights, Volume 1 by','b1001108.txt'),(204,'The Red Badge Courage','badge10a.txt'),(205,'s are usually created from multiple editions,','baron10.txt'),(206,'Black Beauty, by Anna Sewell','bbeau10.txt'),(207,', LEGENDS OF BABYLON AND EGYPT','beheb10.txt'),(208,'Ben-Hur:  A Tale the Christ','benhr10.txt'),(209,'The Autobiography Franklin','bfaut10.txt'),(210,', The Bhagavad-Gita, translated by','bgita10.txt'),(211,'','bhawk10.txt'),(212,'The Birds','birds10.txt'),(213,'Bleak House by Charles Dickens','blkhs10.txt'),(214,'','bllfn10.txt'),(215,'Boyhood in Norway, by Hjalmar Boyesen','bnrwy10.txt'),(216,'','bough11.txt'),(217,'s are usually created from multiple editions,','bribe10.txt'),(218,'History Of The Britons, by Nennius','brtns10.txt'),(219,'The Hound the Baskervilles, by Doyle','bskrv11a.txt'),(220,'','btbst10.txt'),(221,'Barchester Towers by Anthony Trollope','btowe10.txt'),(222,'','btsnl10.txt'),(223,'','bwulf11.txt'),(224,'Beyond Good and Evil, by Friedrich Nietzsche','bygdv10.txt'),(225,'Supplemental Nights, Volume 2','c1001108.txt'),(226,'The Call the Wild','callw10.txt'),(227,'','canpw10.txt'),(228,'','carol13.txt'),(229,'The Canterbury Tales and Other Poems','cbtls12.txt'),(230,'s are usually created from multiple editions,','cdben10.txt'),(231,'s are usually created from multiple editions,','cdbfr10.txt'),(232,'','cfvrw10.txt'),(233,'Chaucer, by Adolphus William Ward','chacr10.txt'),(234,'Childhood, by Leo Tolstoy/Tolstoi','chldh10.txt'),(235,'','chshr10.txt'),(236,'','civil11.txt'),(237,'','clckm10.txt'),(238,'The Clouds, by Aristophanes','cloud10.txt'),(239,'','clprm10u.txt'),(240,'Cinderella; The Little Glass Slipper','cndrl10.txt'),(241,'THE CHINESE CLASSICS (CONFUCIAN ANALECTS)','cnfcs10.txt'),(242,'','cnstr10.txt'),(243,'Off on a Comet, by Jules Verne','comet10.txt'),(244,'Common Sense, by Thomas Paine','comsn10.txt'),(245,'','conra10.txt'),(246,'The U. S. Constitution','const11.txt'),(247,':  Complete Plays Gilbert and Sullivan','cpogs10.txt'),(248,'David Copperfield, by Charles Dickens','cprfd10.txt'),(249,'The Critique Pure Reason, by Immanuel Kant','cprrn10.txt'),(250,'Captains Courageous, by Kipling','cptcr11a.txt'),(251,'Crito, by Plato','crito10.txt'),(252,'The Count Monte Cristo by Dumas','crsto12.txt'),(253,'Cartrefi Cymru, by Owen M. Edwards','crtcm10.txt'),(254,'','cs10w10.txt'),(255,'In Search the Castaways by Jules Verne','cstwy11.txt'),(256,'The Old Curiosity Shop','curio10.txt'),(257,'The Memoirs Three Civil War Generals','cwgen11.txt'),(258,'Cyropaedia, by Xenophon [Dakyns]','cyrus10.txt'),(259,'Supplemental Nights, Volume 3 by','d1001108.txt'),(260,'Dubliners','dblnr11.txt'),(261,'A Discourse on Method','dcart10.txt'),(262,'David Crockett:  His Life and Adventures','dchla10.txt'),(263,'Dot and the Kangaroo, by Ethel Pedley','dkang10.txt'),(264,'The Island Doctor Moreau','dmoro11.txt'),(265,'','dmsnd11.txt'),(266,'The Danish History, Books I-IX','dnhst10.txt'),(267,'Dorothy and the Wizard in Oz','doroz10.txt'),(268,'Dracula, by Bram Stoker','dracu12.txt'),(269,'The Tragical History Dr. Faustus','drfst10.txt'),(270,'','drthn11.txt'),(271,'s are usually created from multiple editions,','dscep10.txt'),(272,'The Descent Man by Charles Darwin','dscmn10.txt'),(273,'The official release date all s is at','dtroy10.txt'),(274,'This is the  Fredercik Douglass','duglas11.txt'),(275,'','dyssy10.txt'),(276,'Supplemental Nights, Volume 4 by','e1001108.txt'),(277,'Essays Francis Bacon','ebacn10.txt'),(278,'s are usually created from multiple editions,','eduha10.txt'),(279,'A  The Number  e   [Natural Log]','ee710.txt'),(280,'This  Prepared Down Under In Australia by:','emihh10a.txt'),(281,'Every Man Out Of His Humour, by Ben Jonson','emohh10.txt'),(282,'Epicoene:  Or, The Silent Woman','eotsw10.txt'),(283,'','esper10.txt'),(284,'','esycr10.txt'),(285,'Essay on Man by Alexander Pope','esymn10.txt'),(286,'Supplemental Nights, Volume 5 by','f1001108.txt'),(287,'','fb10w11.txt'),(288,'This is the  The Federalist Papers.','feder16.txt'),(289,'of','fevch10.txt'),(290,'s are often created from several printed','fgths10.txt'),(291,'Frederick Chopin as a Man and Musician, Volume 1','fkchp10.txt'),(292,'The Foolish Dictionary, by Gideon Wurdz','fldct10.txt'),(293,'Frankenstein by Mary Shelley','frank14.txt'),(294,'','fs40w10.txt'),(295,'; The Fall Troy, by Quintus Smyrnaeus','ftroy10.txt'),(296,'The Insidious Dr. Fu Manchu by Sax Rohmer','fuman12.txt'),(297,'Supplemental Nights, Volume 6 by','g1001108.txt'),(298,'','g138v10.txt'),(299,'Caesar\'s Commentaries in Latin','galli10.txt'),(300,'The Secret Garden','gardn11.txt'),(301,'The Golden Bowl, Complete, by Henry James','gbwlc10.txt'),(302,'Gargantua and Pantagruel, by Rabelais','ggpnt10.txt'),(303,'','gltrv10.txt'),(304,'Original Short Stories, Maupassant, Entire','gm00v11.txt'),(305,'Gods Mars','gmars12.txt'),(306,'The Entire PG Works George Meredith','gn06v10.txt'),(307,'','gp37w10.txt'),(308,'Great Expectations, by Charles Dickens','grexp10a.txt'),(309,'Fairy Tales, by the Grimm Brothers','grimm10.txt'),(310,'Henry VIII And His Court, by Louise Muhlbach','h8ahc10.txt'),(311,'','handi10.txt'),(312,'Hard Times, by Charles Dickens','hardt10.txt'),(313,'','hbtht10.txt'),(314,', History the Catholic Church from the','hcath10.txt'),(315,'Heart Darkness','hdark12a.txt'),(316,'','hfinn12.txt'),(317,'A History Of Greek Art, by F. B. Tarbell','hgrkr10.txt'),(318,'s are usually created from multiple editions,','hhmms11.txt'),(319,'the Impeachment Andrew Johnson','hioaj10.txt'),(320,'Helen Troy, by Andrew Lang','hlnty10.txt'),(321,'','hmjnc10.txt'),(322,'','hmjnc11.txt'),(323,'Howards End, by E. M. Forster','hoend10.txt'),(324,'','holyw10.txt'),(325,'The official release date all s is at','homer10.txt'),(326,'The Happy Prince and Other Tales','hpaot10.txt'),(327,'History Phoenicia, by Rawlinson','hphnc10.txt'),(328,'s are usually created from multiple editions,','hstwl10.txt'),(329,'The official release date all s is at','humbn10.txt'),(330,'An Iceland Fisherman, by Pierre Loti','icfsh10.txt'),(331,'The Idiot, by Dostoevsky','idiot10.txt'),(332,'The official release date all s is at','idyll10a.txt'),(333,'','iliad10a.txt'),(334,'','iliad10b.txt'),(335,'','inagu10.txt'),(336,'s are usually created from multiple editions,','irish10.txt'),(337,'The Man in the Iron Mask, by Dumas, Pere','ironm11.txt'),(338,'In the Heart Africa, by Baker','ithoa10.txt'),(339,'s are usually created from multiple editions,','jandc10.txt'),(340,'','janey11.txt'),(341,'The Confessions J. J. Rousseau, entire','jj13b10.txt'),(342,'End this  The Dutch Republic, v1','jm00v10.txt'),(343,'The Jew Malta, by Marlowe','jmlta10.txt'),(344,'The Jungle Book by Kipling','jnglb10.txt'),(345,'Japanese Fairy Tales, by Yei Theodora Ozaki','jpnft10.txt'),(346,'Thomas Hardy\'s Jude the Obscure.','jude11.txt'),(347,'','judsm10.txt'),(348,'The Jungle, by Upton Sinclair','jungl10.txt'),(349,'','kalec10.txt'),(350,'','kalev10.txt'),(351,'The King James Bible','kjv10.txt'),(352,'','kknta10.txt'),(353,'End  The Koran as translated by Rodwell End','koran12a.txt'),(354,'Kansas Women in Literature','kswom10.txt'),(355,'','lacob11.txt'),(356,'The Alchemist, by Ben Jonson.','lchms10.txt'),(357,'','lcjnl10.txt'),(358,'','legva12.txt'),(359,'Les Miserables, by Victor Hugo','lesms10.txt'),(360,'Life Chopin, by Franz Liszt','lfcpn10.txt'),(361,'','lflcn10.txt'),(362,'This is the  Through the Looking-Glass','lglass18.txt'),(363,'','lgsp10.txt'),(364,'','lgtrd10.txt'),(365,'Give Me LIberty Or Give Me Death','liber11.txt'),(366,'Literary Blunders, by Henry Wheatley','litbl10.txt'),(367,'The Lady the Lake','llake10.txt'),(368,'From London to Land\'s End by Defoe','lndle10.txt'),(369,'His Last Bow, by Sir Arthur Conan Doyle','lstbw10.txt'),(370,'','lsttn10.txt'),(371,'Letters on Sweden, etc., by Wollstonecraft','ltswd10.txt'),(372,'Beethoven: the Man and the Artist','lvbma11.txt'),(373,'','lwmen12.txt'),(374,'The Magic Oz, by L. Frank Baum','magoz10.txt'),(375,'The Communist Manifesto','manif12.txt'),(376,'','marmn10a.txt'),(377,'The Mayor Casterbridge','mayrc10.txt'),(378,', Madame Bovary, by Gustave Flaubert','mbova10.txt'),(379,'Imitation Christ, by Thomas A Kempis','mcrst11.txt'),(380,'Middlemarch by George Eliot','mdmar10.txt'),(381,'','mdntp10.txt'),(382,'A Modest Proposal, by Swift','mdprp10.txt'),(383,'','mdvll10.txt'),(384,'Memoirs Sherlock Holmes','memho11.txt'),(385,'Martin Hyde, by John Masefield','mhyde10.txt'),(386,'','milnd11.txt'),(387,'Major Barbara','mjbrb10.txt'),(388,'Myths and Legends California and the','mlcal10.txt'),(389,'','mlfls10.txt'),(390,'The Essays Montaigne, Complete','mn20v11.txt'),(391,'Moby Dick, by Herman Melville','moby11.txt'),(392,'s are usually created from multiple editions,','mohic10.txt'),(393,'This  was prepared by Tony Adam','mohwk10.txt'),(394,'Moll Flanders, by Daniel Defoe','mollf10.txt'),(395,'Jules Verne\'s Classic Books','moon10.txt'),(396,'','mormon13.txt'),(397,'Messer Marco Polo, by Donn-Byrne','mpolo10.txt'),(398,'','mrclt10.txt'),(399,'Massacre at Paris, by Marlowe','msprs10.txt'),(400,'A Dog\'s Tale, by Mark Twain','mtdtl11.txt'),(401,'How Tell a Story and Others, by Twain','mthts11.txt'),(402,'Mutual Aid, by P. Kropotkin','mtlad10.txt'),(403,'','mtrcs10.txt'),(404,'The Man Who Knew Too Much, by Chesterton','mwktm10a.txt'),(405,'My Antonia by Willa Cather','myant11.txt'),(406,'Return the Native by Thomas Hardy','nativ10.txt'),(407,'The Memoirs Napoleon, Complete','nb17v11.txt'),(408,'The Nibelungenlied','nblng10.txt'),(409,'Private Life Napoleon, by Constant, Entire','nc13v11.txt'),(410,'Nicholas Nickleby, by Dickens','ncklb10.txt'),(411,'The Fall the Niebelungs','niebl10.txt'),(412,'Njal\'s Saga by Unknown Icelanders','njals10.txt'),(413,'Anna Karenina, by Leo Tolstoy','nkrnn11.txt'),(414,'Anna Christie, by Eugene O\'Neill','nnchr10.txt'),(415,'The official release date all s is at','nnsns10.txt'),(416,'Notes from the Underground','notun11.txt'),(417,'Napoleon Bonaparte','nplnb10.txt'),(418,'An Enquiry Concerning the Principles Morals','nqpmr10.txt'),(419,'Nonsense Novels, by Stephen Leacock','nsnvl10.txt'),(420,'The Old Northwest, A Chronicle the','oldno10.txt'),(421,'','oleng10.txt'),(422,'Oliver Twist by Charles Dickens','olivr10.txt'),(423,'One Divided by Pi','onepi10.txt'),(424,'Orlando Furioso, by Ludovico Ariosto','orfur10.txt'),(425,'s are usually created from multiple','oroos10.txt'),(426,'','otoos11.txt'),(427,'','ovtop10.txt'),(428,'An Occurrence at Owl Creek Bridge','owlcr10.txt'),(429,'The Marvelous Land Oz','ozland10.txt'),(430,'','pam1w10.txt'),(431,'','pandp12.txt'),(432,'','panic10.txt'),(433,'','pas8w10.txt'),(434,'Pharsalia, [Civil War] by Lucanus','pcwar10.txt'),(435,'','pengl10.txt'),(436,'/Project Gutenberg Book English Verse','pgbev10.txt'),(437,'The Gutenberg Encyclopedia','pge0112.txt'),(438,'Phaedo, by Plato','phado10.txt'),(439,'','phant12.txt'),(440,'','phrlc10.txt'),(441,'the number Pi','pimil10.txt'),(442,'','plgrm11.txt'),(443,'Plutarch\'s Lives, by A.H. Clough','plivs10.txt'),(444,'','plpwr10.txt'),(445,'This is the  Paradise Lost(Raben)','plrabn12.txt'),(446,'A Princess Mars by Burroughs','pmars13.txt'),(447,'Preface to Major Barbara:','pmbrb10.txt'),(448,'The Philosophy Misery by Proudhon','pmisr10.txt'),(449,'The Works Edgar Allan Poe V. 1','poe1v10.txt'),(450,'The Works Edgar Allan Poe V. 2','poe2v10.txt'),(451,'The Works Edgar Allan Poe V. 3','poe3v11.txt'),(452,'The Works Edgar Allan Poe V. 4','poe4v10.txt'),(453,'The Works Edgar Allan Poe V. 5','poe5v10.txt'),(454,'','poeti10.txt'),(455,'The Story the Pony Express','ponye10.txt'),(456,'The Playboy the Western World','potww10.txt'),(457,'s are usually created from multiple editions,','ppikg10.txt'),(458,'Apology, by Plato','pplgy10.txt'),(459,'The official release date all s is at','pprty10.txt'),(460,'','prblm10.txt'),(461,'The Princess and the Goblin','prgob10.txt'),(462,'U. S. Project Trinity Report','prjtr10.txt'),(463,'','prppr11.txt'),(464,'s are often created from several printed','prtrt10.txt'),(465,'','pscmg10.txt'),(466,'Pygmalion, by George Bernard Shaw','pygml10.txt'),(467,'Record Buddhistic Kingdoms, by Fa-Hien','rbddh10.txt'),(468,'s are usually created from multiple editions,','rcddv10.txt'),(469,'The Road to Oz, by L. Frank Baum','rd2oz10.txt'),(470,'Uncle Remus His Songs and His Sayings','remus10.txt'),(471,'The Republic by Plato','repub13.txt'),(472,'Resurrection, by Leo Tolstoy','resur10.txt'),(473,'Paradise Regained by John Milton','rgain10.txt'),(474,'The Return Sherlock Holmes','rholm10.txt'),(475,'The Rime the Ancient Mariner','rime10.txt'),(476,'Religions Ancient China, by Giles','rlchn10.txt'),(477,'','rnpz810.txt'),(478,'','rob3w10.txt'),(479,'This is the  Roget\'s Thesaurus No. Two','roget15a.txt'),(480,'The Rosary, by Florence L. Barclay','rosry11.txt'),(481,'The Red Planet','rplan10.txt'),(482,'Irish Fairy Tales, by James Stephens','rshft10.txt'),(483,'','samur10.txt'),(484,'','sawyr11.txt'),(485,'The Scarlet Pimpernel','scarp10.txt'),(486,'Sister Carrie by Theodore Dreiser','scarr10.txt'),(487,'The Scarlet Letter, by Hawthorne','scrlt12.txt'),(488,'s are usually created from multiple editions,','secad10.txt'),(489,'Sense and Sensibility, by Austen','sense11.txt'),(490,'Female Suffrage, by Susan Fenimore Cooper','sffrg10.txt'),(491,'Is Shakespeare Dead? by Mark Twain','shkdd10.txt'),(492,'The Complete Poetical Works Percy Bysshe','shlyc10.txt'),(493,'s are usually created from multiple editions,','shndy10.txt'),(494,'She, by H. Rider Haggard','shrhe10.txt'),(495,'','siddh10.txt'),(496,'The Sign the Four, by A. Conan Doyle','sign410.txt'),(497,'Songs Innocence and Experience by Blake','sinex10.txt'),(498,'Myths and Legends the Sioux,','sioux10.txt'),(499,'The Works Samuel Johnson','sjv0410.txt'),(500,'','skawe10.txt'),(501,'','sleep11.txt'),(502,'The Soul Man, by Oscar Wilde','slman10.txt'),(503,'','smtlc10.txt'),(504,'The Song Roland, Anonymous','sorol10.txt'),(505,'The Souls Black Folk','soulb10.txt'),(506,'Diary Samuel Pepys, Diary Entire','sp85g10.txt'),(507,'','spatr10.txt'),(508,'','sphjd10.txt'),(509,'Spoon River Anthology, by Masters','sprvr11.txt'),(510,'Thus Spake Zarathustra, by Nietzsche','spzar10.txt'),(511,'s are usually created from multiple editions,','ssklt10.txt'),(512,'The official release date all s is at','sstcq10.txt'),(513,'','st15w10.txt'),(514,'','strtt10.txt'),(515,'A Study In Scarlet, by Doyle','study10.txt'),(516,'','suall10.txt'),(517,'The Art War by Sun Tzu','sunzu10.txt'),(518,'','svncl10.txt'),(519,'','swoop10.txt'),(520,'','tagod10.txt'),(521,'The Return Tarzan by Burroughs','tarz210.txt'),(522,'Tarzan the Apes','tarzn10.txt'),(523,'','tbisp10.txt'),(524,'','tbyty10.txt'),(525,'the The Confessions Saint Augustine','tcosa10.txt'),(526,'Tacitus on Germany, Translated by Gordon','tctgr10.txt'),(527,'Tess the d\'Urbervilles','tess10.txt'),(528,'The Fifteen Decisive Battles of','tfdbt10.txt'),(529,'','tfgtv10.txt'),(530,'','tftaa10.txt'),(531,'','tgovt10.txt'),(532,'The Decameron, Volume I, by Giovanni','thdcm10.txt'),(533,'The Jewel Seven Stars','thjwl10.txt'),(534,'The English Constitution','thngl10.txt'),(535,'Criticisms on  The Origin Species','thx1010.txt'),(536,'H. G. Wells\' The Time Machine','timem11.txt'),(537,'The Importance Being Earnest','tiobe10.txt'),(538,'Tamburlaine the Great. . .Part 1','tmbn110.txt'),(539,'Tamburlaine the Great, Part 2','tmbn210.txt'),(540,'','tmrcr10.txt'),(541,'The Theory the Leisure Class','totlc10.txt'),(542,'The Prince, by Nicolo Machiavelli','tprnc10.txt'),(543,'Theodore Roosevelt, An Autobiography','trabi10.txt'),(544,'Treasure Island','treas11.txt'),(545,'Chaucer\'s Troilus and Criseyde','troic10.txt'),(546,'A Treatise Human Nature, by David Hume','trthn10.txt'),(547,'Through Russia, by Maxim Gorky','truss10.txt'),(548,'Tales Shakespeare','tshak10.txt'),(549,'Sinking the Titanic et al','ttnic10.txt'),(550,'The Turn the Screw','tturn10.txt'),(551,'The Warden, by Anthony Trollope','twrdn10.txt'),(552,'The Writings Thomas Paine Vol. I','twtp110.txt'),(553,'The Writings Thomas Paine Vol. II','twtp210.txt'),(554,'The Writings Thomas Paine Vol. IV','twtp410.txt'),(555,'','ulyss12.txt'),(556,'US Presidents\' Inaugural Speeches','uspis10.txt'),(557,'Uncle Tom\'s Cabin by Harriet Beecher Stowe','utomc11.txt'),(558,'Utopia, by Thomas More','utopi10.txt'),(559,'Unbeaten Tracks in Japan, by Bird','utrkj10.txt'),(560,'','vampy10.txt'),(561,'Uncle Vanya, by Anton Checkov','vanya10.txt'),(562,'Epopee to the Forgotten by Ivan Vazov','vazov10.txt'),(563,'The Voyage the Beagle, by Charles Darwin','vbgle11a.txt'),(564,'The Voice the City, by O Henry','vccty10.txt'),(565,'','vfair12.txt'),(566,'The Valley Fear, by Arthur Conan Doyle','vfear11a.txt'),(567,'Volpone; Or, The Fox','vlpnr10.txt'),(568,'The Story the Volsungs','vlsng10.txt'),(569,'A Vindication the Rights Woman','vorow10.txt'),(570,'Visit to Iceland, by Madame Ida Pfeiffer','vstil10.txt'),(571,'s are usually created from multiple editions,','warje10.txt'),(572,'H. G. Wells\' War the Worlds','warw12.txt'),(573,'The Way All Flesh by Samuel Butler','wflsh10.txt'),(574,'The Declaration Independence','when12.txt'),(575,'','whwar10.txt'),(576,'The Wizard Oz','wizoz10.txt'),(577,'Wealth Nations, by Adam Smith','wltnt10.txt'),(578,'','wlwrk10.txt'),(579,'Warlord Mars','wmars13.txt'),(580,'Women in Love, by D.H. Lawrence','wmnlv10.txt'),(581,'Winesburg, Ohio by Sherwood Anderson','wnbrg11.txt'),(582,'War and Peace, by by Leo Tolstoy','wrnpc10.txt'),(583,'Shakespeare\'s Sonnets','wssnt10.txt'),(584,'Venus and Adonis by Shakespeare','wsvns10.txt'),(585,'White Fang, by Jack London','wtfng10.txt'),(586,'Wuthering Heights by Emily Bronte','wuthr10.txt'),(587,'Who Was Who: 5000 B. C. to Date','wwasw10.txt'),(588,'The Well at the World\'s End by Morris','wwend10.txt'),(589,'The Wind in the Willows','wwill10.txt'),(590,'The Way the World, by Congreve','wwrld10.txt'),(591,'The Yellow Wallpaper, by Gilman','ylwlp10.txt'),(592,'The Zambesi Expedition by David Livingstone','zambs10.txt'),(593,'The Prisoner Zenda, by Hope','zenda10.txt');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-10  1:55:33
