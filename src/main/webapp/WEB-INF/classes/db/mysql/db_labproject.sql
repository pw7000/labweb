-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_labproject
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'hilliver','c20ad4d76fe97759aa27a0c99bff6710'),(2,'wudi','c20ad4d76fe97759aa27a0c99bff6710');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_instrument`
--

DROP TABLE IF EXISTS `t_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_instrument` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_instrument`
--

LOCK TABLES `t_instrument` WRITE;
/*!40000 ALTER TABLE `t_instrument` DISABLE KEYS */;
INSERT INTO `t_instrument` VALUES (1,'pulsed laser deposition and e-beam evaporation','images/instruments/pld.jpg','Base pressure:<1e-9Torr <br/>growth Temperature: RT-1100K<br/>Sample size:<5mm*5mm'),(2,'spin pumping and magnetic transport measurement system ','images/instruments/sp.jpg','Temperature:4.2-300K<br/> Magnetic field:< 1T<br/>'),(3,'cryogen-free superconducting magnet system','images/instruments/sc.jpg','Field:<9T<br/>Field direction:vertical<br/>Homogeneity:0.1%'),(4,'Superconducting Quantum Interference Device','images/instruments/squid.jpg','Temperature:2-400K<br/>Field direction:vertical <br/>Magnetic Field:<7T');
/*!40000 ALTER TABLE `t_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `memberPic` varchar(255) DEFAULT NULL,
  `memberType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` VALUES (1,'Di Wu','dwu@nju.edu.cn','images/teacher/1.jpg',1),(2,'Shengwei Jiang','swailjohn@gmail.com','images/student/jsw.jpg',3),(3,'Binbin Chen','chenbinbin07112@163.com','images/student/cbb.jpg',3),(4,'Yang Zhou','zhouguomengyang@sina.com','images/student/zy.jpg',2),(5,'Peng Wang','pwang7000@163.com','images/student/wp.jpg',2),(6,'Zhongzhi Luan','lzhzhi@163.com','images/student/lzz.jpg',2),(7,'Song Liu','sliu1013@126.com','images/student/ls.jpg',3),(8,'Yujun Shi','s10syj@gmail.com','images/student/syj.jpg',3),(9,'Fengjuan Yue','fengjuan.yue@gmail.com','images/student/yfj.jpg',3),(10,'Sheng Wang','shenwang@sxu.edu.cn','images/student/ws.jpg',3),(11,'Li Lin','linli@ksfpd.com','images/student/ll.jpg',3),(12,'Lifan Zhou','2314402419@qq.com','images/student/zlf.jpg',2);
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_news`
--

DROP TABLE IF EXISTS `t_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `newsName` varchar(255) DEFAULT NULL,
  `newsContent` varchar(255) DEFAULT NULL,
  `newsPic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_news`
--

LOCK TABLES `t_news` WRITE;
/*!40000 ALTER TABLE `t_news` DISABLE KEYS */;
INSERT INTO `t_news` VALUES (1,'September 2015:Peng Wang get CPS2015 Outstanding Poster Award','Recently, our group member Peng Wang gets cps2015 Outstanding Poster Award.Our group members have got CPS Outstanding Poster Award for six consecutive years.','images/news/20150917.jpg'),(2,'August 2015:New paper “Exchange-Dominated Pure Spin Current Transport in Alq3 Molecules\"','','images/news/20150824.jpg'),(3,'August 2015:New paper “Tuning carrier mobility without spin transport degrading in copper-phthalocyanine”','','images/news/2015080301.png'),(4,'April 2016: Shengwei jiang was rewarded \"the Award for Excellent Research for graduate student\"','','images/news/Shengweijiang.jpg'),(5,'May 2016: Peng Wang visited the Rutherford Appleton Laboratory in UK.','Peng wang visited the Rutherford Appleton Laboratory (the ISIS spallation neutron source) to  do a Polarized Neutron Reflectivity (PNR) experiment.','images/news/RAL.png');
/*!40000 ALTER TABLE `t_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_paper`
--

DROP TABLE IF EXISTS `t_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paperName` varchar(255) DEFAULT NULL,
  `paperAuthors` varchar(255) DEFAULT NULL,
  `publication` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_paper`
--

LOCK TABLES `t_paper` WRITE;
/*!40000 ALTER TABLE `t_paper` DISABLE KEYS */;
INSERT INTO `t_paper` VALUES (1,'In-plane magnetic anisotropy of bcc Co on GaAs(001) ','Y. Z. Wu, H. F. Ding, C. Jing, D. Wu, G. L. Liu, V. Gordon, G. S. Dong, X. F. Jin, S. Zhu, and K. Sun','Phys. Rev. B 57, 11935','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.57.11935'),(2,'Epitaxy and magnetism of Co on GaAs(001)','Y.Z Wu, H.F Ding, C Jing, D Wu, G.S Dong, X.F Jin, K Sun, S Zhu','Journal of Magnetism and Magnetic Materials','http://www.sciencedirect.com/science/article/pii/S0304885398011123'),(3,'Ordered alloying of Pd with the Mo(100) Surface','D. Wu, W. K. Lau, Z. Q. He, Y. J. Feng, M. S. Altman, and C. T. Chan','Phys. Rev. B 62, 8366','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.62.8366'),(4,'Structure and magnetism of Co1-xMnx alloys epitaxially grown on GaAs(001) ','D. Wu, G. L. Liu, C. Jing, Y. Z. Wu, G. S. Dong and X. F. Jin','J. Appl. Phys. 89, 521 (2001)','http://scitation.aip.org/content/aip/journal/jap/89/1/10.1063/1.1332093'),(5,'Magnetic structure of Co 1 -x Mn x alloys','D. Wu, G. L. Liu, C. Jing, Y. Z. Wu, D. Loison, G. S. Dong, X. F. Jin, and Ding-Sheng Wang','Phys. Rev. B 63, 214403','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.63.214403'),(6,'Growth and magnetism of Ni films on GaAs(001)','W.X. Tang, D. Qian, D. Wu, Y.Z. Wu, G.S. Dong, X.F. Jin, S.M. Chen, X.M. Jiang, X.X. Zhang, Z. Zhang','Journal of Magnetism and Magnetic Materials','http://www.sciencedirect.com/science/article/pii/S0304885301008447'),(7,'Element Resolved Spin Configuration in Ferromagnetic Manganese-Doped Gallium Arsenide','D. J. Keavney, D. Wu, J. W. Freeland, E. Johnston-Halperin, D. D. Awschalom, and J. Shi','Phys. Rev. Lett. 91, 187203','http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.91.187203'),(8,'Giant magnetoresistance in organic spin-valves','Z. H. Xiong, Di Wu, Z. Valy Vardeny & Jing Shi','Nature 427, 821-824 ','http://www.nature.com/nature/journal/v427/n6977/abs/nature02325.html'),(9,'Magnetic ordering and anisotropy of epitaxially grown Fe x Cu 1 -x alloy on GaAs ( 001 ) ','Z. Tian, C. S. Tian, L. F. Yin, D. Wu, G. S. Dong, Xiaofeng Jin, and Z. Q. Qiu','Phys. Rev. B 70, 012301 ','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.70.012301'),(10,'Spin and magnetic field effects in organic semiconductor devices','M. Wohlgenannt  ; Z.V. Vardeny ; J. Shi  ; T.L. Francis  ; X.M. Jiang  ; Ö. Mermer ; G. Veeraraghavan ; D. Wu ; Z.H. Xiong',NULL,'http://digital-library.theiet.org/content/journals/10.1049/ip-cds_20045226'),(11,'Concentration-independent local ferromagnetic Mn configuration in Ga 1-xMnx As ','D. Wu, D. J. Keavney, Ruqian Wu, E. Johnston-Halperin, D. D. Awschalom, and Jing Shi','Phys. Rev. B 71, 153310','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.71.153310'),(12,'Body-Centered-Cubic Ni and Its Magnetic Properties','C. S. Tian, D. Qian, D. Wu, R. H. He, Y. Z. Wu, W. X. Tang, L. F. Yin, Y. S. Shi, G. S. Dong, X. F. Jin, X. M. Jiang, F. Q. Liu, H. J. Qian, K. Sun, L. M. Wang, G. Rossi, Z. Q. Qiu, and J. Shi','Phys. Rev. Lett. 94, 137210','http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.94.137210'),(13,'Magnetic-Field-Dependent Carrier Injection at La2/3Sr1/3MnO3/ and Organic Semiconductors Interfaces','D. Wu, Z. H. Xiong, X. G. Li, Z. V. Vardeny, and Jing Shi','Phys. Rev. Lett. 95, 016802','http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.95.016802'),(14,'Spin reversal in small planar structures for off-axis field orientations ','Han-Ting Wang, A. Oriade, S.T. Chui , Di Wu, Jing Shi','Physics Letters A','http://www.sciencedirect.com/science/article/pii/S0375960105011849'),(15,'Organic spintronics: The case of Fe/Alq3/Co spin-valve devices ','F.J. Wang, Z.H. Xiong, D. Wu, J. Shi, Z.V. Vardeny','Synthetic Metals','http://www.sciencedirect.com/science/article/pii/S0379677905007393'),(16,'High-field magnetocrystalline anisotropic resistance effect in (Ga,Mn)As ','D. Wu, Peng Wei, E. Johnston-Halperin, D. D. Awschalom, and Jing Shi','Phys. Rev. B 77, 125320','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.77.125320'),(17,'Enhanced magnetoresistance in self-assembled monolayer of oleic acid molecules on Fe3O4 nanoparticles ','S. Wang, F. J. Yue, D. Wu, F. M. Zhang, W. Zhong and Y. W. Du','Appl. Phys. Lett. 94, 012507 (2009)','http://scitation.aip.org/content/aip/journal/apl/94/1/10.1063/1.3059571'),(18,'Electrodeposition of Periodically Nanostructured Straight Cobalt Filament Arrays ','Xiao-Ping Huang , Wei Han , Zi-Liang Shi , Di Wu , Mu Wang *, Ru-Wen Peng and Nai-Ben Ming','J. Phys. Chem. C, 2009, 113 (5), pp 1694–1697','http://pubs.acs.org/doi/abs/10.1021/jp807673h'),(19,'Manipulating Graphene Mobility and Charge Neutral Point with Ligand-Bound Nanoparticles as Charge Reservoir ','Deqi Wang †, Xinfei Liu †, Le He ‡, Yadong Yin ‡, Di Wu §, and Jing Shi *†','Nano Lett., 2010, 10 (12), pp 4989–4993','http://pubs.acs.org/doi/abs/10.1021/nl103103z'),(20,'Large low-field magnetoresistance in Fe 3 O 4 /molecule nanoparticles at room temperature ','F J Yue, S Wang, L Lin, F M Zhang, C H Li, J L Zuo, Y W Du and D Wu','Journal of Physics D: Applied Physics Volume 44 Number 2','http://iopscience.iop.org/0022-3727/44/2/025001'),(21,'Spin transport in Diluted Magnetic Semiconductors','Y.W. Du*\r\n, F.M. Zhang, D Wu and S.J. Xiong ',NULL,'http://www.cityu.edu.hk/ieeeinec/abstract/DuYW.pdf'),(22,'Formation of Regular Magnetic Domains on Spontaneously Nanostructured Cobalt Filaments ','Xiao-Ping Huang,\r\nZi-Liang Shi,\r\nMu Wang,\r\nMakoto Konoto,\r\nHao-Shen Zhou,\r\nGuo-Bin Ma,\r\nDi Wu,\r\nRuwen Peng,\r\nNai-Ben Ming',NULL,'http://onlinelibrary.wiley.com/doi/10.1002/adma.200904066/full'),(23,'Large magnetoresistance in Fe3O4 molecule nanoparticles ','S. Wang ; F. J. Yue ; L. Lin ; Y. J. Shi ; D. Wu','Proc. SPIE 7760, Spintronics III, 77601D (August 24, 2010)','http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=753556'),(24,'Room-temperature spin valve effects in La0.67Sr0.33MnO3/Alq3/Co devices ','S. Wang, Y.J. Shi, L. Lin, B.B. Chen, F.J. Yue, J. Du, H.F. Ding, F.M. Zhang, D. Wu','Synthetic Metals','http://www.sciencedirect.com/science/article/pii/S0379677911002517'),(25,'Recent advances in spin transport in organic semiconductors ','ShengWei Jiang, FengJuan Yue, Shen Wang, Di Wu','Science China Physics, Mechanics and Astronomy\r\nJanuary 2013, Volume 56, Issue 1, pp 142-150','http://link.springer.com/article/10.1007/s11433-012-4962-8'),(26,'Manipulating spin injection into organic materials through interface engineering','F. J. Yue, Y. J. Shi, B. B. Chen, H. F. Ding, F. M. Zhang and D. Wu','Appl. Phys. Lett. 101, 022416 (2012)','http://scitation.aip.org/content/aip/journal/apl/101/2/10.1063/1.4737008'),(27,'Exchange bias coupling of Co with ultrathin La2/3Sr1/3MnO3 films ','Y. J. Shi, Y. Zhou, H. F. Ding, F. M. Zhang, L. Pi, Y. H. Zhang and D. Wu','Appl. Phys. Lett. 101, 122409 (2012)','http://scitation.aip.org/content/aip/journal/apl/101/12/10.1063/1.4754594'),(28,'Electron mobility determination of efficient phosphorescent iridium complexes with tetraphenylimidodiphosphinate ligand via transient electroluminescence method ','Ming-Yu Teng, Song Zhang, Sheng-Wei Jiang, Xu Yang, Chen Lin, You-Xuan Zheng, Leyong Wang, Di Wu, Jing-Lin Zuo and Xiao-Zeng You','Appl. Phys. Lett. 100, 073303 (2012)','http://scitation.aip.org/content/aip/journal/apl/100/7/10.1063/1.3684971'),(29,'Effects of ferromagnet–molecule chemical bonding on spin injection in an Fe 3 O 4 –molecule granular system','F J Yue, S Wang, L Lin, H F Ding and D Wu','Journal of Physics D: Applied Physics Volume 45 Number 7','http://iopscience.iop.org/0022-3727/45/7/075001'),(30,'Spin Hall angle quantification from spin pumping and microwave photoresistance ','Z. Feng, J. Hu, L. Sun, B. You, D. Wu, J. Du, W. Zhang, A. Hu, Y. Yang, D. M. Tang, B. S. Zhang, and H. F. Ding','Phys. Rev. B 85, 214423','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.85.214423'),(31,'Carriers dependence of the magnetic properties in magnetic topological insulator Sb1.95?xBixCr0.05Te3 ','H. Li, Y. R. Song, Meng-Yu Yao, Fang Yang, Lin Miao, Fengfeng Zhu, Canhua Liu, C. L. Gao, Dong Qian, X. Yao, Jin-Feng Jia, Y. J. Shi and D. Wu','Appl. Phys. Lett. 101, 072406 (2012)','http://scitation.aip.org/content/aip/journal/apl/101/7/10.1063/1.4746404'),(32,'Tuning the carrier density of LaAlO3/SrTiO3 interfaces by capping La1-xSrxMnO3 ','Y. J. Shi, S. Wang, Y. Zhou, H. F. Ding and D. Wu','Appl. Phys. Lett. 102, 071605 (2013)','http://scitation.aip.org/content/aip/journal/apl/102/7/10.1063/1.4793576'),(33,'Spectroscopy of self-assembled one-dimensional atomic string: The role of step edge ','Rongxing Cao, Zhangfeng Zhong, Jian Hu, Xiaopu Zhang, Bingfeng Miao, Liang Sun, Biao You, Di Wu, An Hu, Weiyi Zhang and Haifeng Ding','Appl. Phys. Lett. 103, 081608 (2013)','http://scitation.aip.org/content/aip/journal/apl/103/8/10.1063/1.4819231'),(34,'Size-dependent quantum diffusion of Gd atoms within Fe nano-corrals ','J. Hua, R.X. Caoa, B.F. Miaoa, Z. Liua, Z.F. Zhonga, L. Suna, B. Youa, D. Wua, W. Zhanga, An Hua, S.D. Baderb, H.F. Ding','Surface Science','http://www.sciencedirect.com/science/article/pii/S0039602813002458'),(35,'Giant magnetoresistance enhancement at room-temperature in organic spin valves based on La0.67Sr0.33MnO3 electrodes','B. B. Chen, Y. Zhou, S. Wang, Y. J. Shi, H. F. Ding and D. Wu','Appl. Phys. Lett. 103, 072402 (2013)','http://scitation.aip.org/content/aip/journal/apl/103/7/10.1063/1.4818614'),(36,'Carrier density dependence of the magnetic properties in iron-doped Bi2Se3 topological insulator ','H. Li, Y. R. Song, Meng-Yu Yao, Fengfeng Zhu, Canhua Liu, C. L. Gao, Jin-Feng Jia, Dong Qian, X. Yao, Y. J. Shi and D. Wu','J. Appl. Phys. 113, 043926 (2013)','http://scitation.aip.org/content/aip/journal/jap/113/4/10.1063/1.4788834'),(37,'Two-dimensional quantum diffusion of Gd adatoms in nano-size Fe corrals ','R. X. Cao, B. F. Miao, Z. F. Zhong, L. Sun, B. You, W. Zhang, D. Wu, An Hu, S. D. Bader, and H. F. Ding','Phys. Rev. B 87, 085415 ','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.87.085415'),(38,'Spin transport in molecules studied by Fe3O4/molecule nanoparticles ','F. J. Yue, S. Wang, D. Wu','Applied Physics A','http://link.springer.com/article/10.1007/s00339-013-7625-3'),(39,'Creating an Artificial Two-Dimensional Skyrmion Crystal by Nanopatterning ','L. Sun, R. X. Cao, B. F. Miao, Z. Feng, B. You, D. Wu, W. Zhang, An Hu, and H. F. Ding','Phys. Rev. Lett. 110, 167201','http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.110.167201'),(40,'Coulomb blockade effect of molecularly suspended graphene nanoribbons investigated with scanning tunneling microscopy ','Z. F. Zhong, H. L. Shen, R. X. Cao, L. Sun, K. P. Li, J. Hu, Z. Liu, D. Wu, X. R. Wang, and H. F. Ding','Phys. Rev. B 88, 125408','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.88.125408'),(41,'Tuning the polarization state of light via time retardation with a microstructured surface ','Shang-Chi Jiang, Xiang Xiong, Paulo Sarriugarte, Sheng-Wei Jiang, Xiao-Bo Yin, Yuan Wang, Ru-Wen Peng, Di Wu, Rainer Hillenbrand, Xiang Zhang, and Mu Wang','Phys. Rev. B 88, 161104(R)','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.88.161104'),(42,'The spin Hall angle and spin diffusion length of Pd measured by spin pumping and microwave photoresistance ','X. D. Tao, Z. Feng, B. F. Miao, L. Sun, B. You, D. Wu, J. Du, W. Zhang and H. F. Ding','J. Appl. Phys. 115, 17C504 (2014)','http://scitation.aip.org/content/aip/journal/jap/115/17/10.1063/1.4862215'),(43,'Self-regulated Gd atom trapping in open Fe nanocorrals ','R. X. Cao, Z. Liu, B. F. Miao, L. Sun, D. Wu, B. You, S. C. Li, W. Zhang, A. Hu, S. D. Bader, and H. F. Ding','Phys. Rev. B 90, 045433 ','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.90.045433'),(44,'Fast and controllable switching the circulation and polarity of magnetic vortices','Y. Wen, Z. Feng, B.F. Miao, R.X. Cao, L. Sun, B. You, D. Wu, W. Zhang, Z.S. Jiang, R. Cheng, H.F. Ding,','Journal of Magnetism and Magnetic Materials\r\nVolume 370, December 2014, Pages 68–75','http://www.sciencedirect.com/science/article/pii/S030488531400571X'),(45,'Experimental realization of two-dimensional artificial skyrmion crystals at room temperature ','B. F. Miao, L. Sun, Y. W. Wu, X. D. Tao, X. Xiong, Y. Wen, R. X. Cao, P. Wang, D. Wu, Q. F. Zhan, B. You, J. Du, R. W. Li, and H. F. Ding','Phys. Rev. B 90, 174411 (2014)','http://journals.aps.org/prb/abstract/10.1103/PhysRevB.90.174411'),(46,'Effective anomalous Hall coefficient in an ultrathin Co layer sandwiched by Pt layers ','Peng Zhang, Weiwei Lin, Di Wu, Zhengsheng Jiang and Hai Sang','J. Appl. Phys. 115, 063908 (2014)','http://scitation.aip.org/content/aip/journal/jap/115/6/10.1063/1.4865791'),(47,'The basis of organic spintronics: Fabrication of organic spin valves ','Chen Bin-Bin , Jiang Sheng-Wei , Ding Hai-Feng , Jiang Zheng-Sheng  and Wu Di ','Chinese Physics B Volume 23 Number 1','http://iopscience.iop.org/1674-1056/23/1/018104/'),(48,'Strong asymmetrical bias dependence of magnetoresistance in organic spin valves: the role of ferromagnetic/organic interfaces ','S W Jiang, D J Shu, L Lin, Y J Shi, J Shi, H F Ding, J Du, M Wang and D Wu','New Journal of Physics Volume 16 January 2014','http://iopscience.iop.org/1367-2630/16/1/013028/'),(49,'Anomalous Hall effect in Co/Ni multilayers with perpendicular magnetic anisotropy ','Peng Zhang, Kaixuan Xie, Weiwei Lin, Di Wu and Hai Sang','Appl. Phys. Lett. 104, 082404 (2014)','http://scitation.aip.org/content/aip/journal/apl/104/8/10.1063/1.4866774'),(50,'From self-assembly to quantum guiding: A review of magnetic atomic structures on noble metal surfaces ','Cao Rong-Xing , Zhang Xiao-Pu , Miao Bing-Feng , Sun Liang , Wu Di , You Biao  and Ding Hai-Feng ','Chinese Physics B Volume 23 Number 3','http://iopscience.iop.org/1674-1056/23/3/038102/'),(51,'Voltage polarity manipulation of the magnetoresistance sign in organic spin valve devices','S. W. Jiang, B. B. Chen, P. Wang, Y. Zhou, Y. J. Shi, F. J. Yue, H. F. Ding and D. Wu','Appl. Phys. Lett. 104, 262402 (2014)','http://scitation.aip.org/content/aip/journal/apl/104/26/10.1063/1.4885770'),(52,'FABRICATION OF LATERAL ORGANIC SPIN VALVES BASED ON La 0.7 Sr 0.3 MnO 3 ELECTRODES ','S. W. JIANG, P.Wang, S. C. JIANG, B. B. CHEN, M. WANG, Z. S. JIANG, D.Wu','Spin, Volume 04, Issue 02, June 2014','http://www.worldscientific.com/doi/abs/10.1142/S2010324714400086'),(53,'The role of heavy metal ions on spin transport in organic semiconductors','B.B.Chen, S.Wang, S.W.Jiang, Z.G.Yu, X.G.Wan, H.F.Ding, D.Wu','New J.Physics 17,013004 (2015)','http://iopscience.iop.org/1367-2630/17/1/013004'),(54,'Tuning carrier mobility without spin transport degrading in copper-phthalocyanine','S. W. Jiang, P. Wang, B. B. Chen, Y. Zhou, H. F. Ding, and D. Wu','Appl. Phys. Lett. 107, 042407 (2015)','http://scitation.aip.org/content/aip/journal/apl/107/4/10.1063/1.4927676'),(55,'Exchange-Dominated Pure Spin Current Transport in Alq3 Molecules','S.W.Jiang,S.Liu,P.Wang,Z.Z.Luan,X.D.Tao,H.F.Ding,and D.Wu','Phys. Rev. Lett. 115, 086601 (2015)','http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.115.086601');
/*!40000 ALTER TABLE `t_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_research`
--

DROP TABLE IF EXISTS `t_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_research` (
  `id` int(11) NOT NULL,
  `researchName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research`
--

LOCK TABLES `t_research` WRITE;
/*!40000 ALTER TABLE `t_research` DISABLE KEYS */;
INSERT INTO `t_research` VALUES (1,'Pure spin current related phenomena'),(2,'Spin transport in organic semiconductors'),(3,'Interfacial phenomena in oxide heterostructure');
/*!40000 ALTER TABLE `t_research` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-05 14:37:41
