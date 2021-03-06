/*
SET IDENTITY_INSERT dbo.phase off
insert  into dbo.phase( [Idt], [Lbl] ) values (1,'Phase de Groupe Journée 1'),(2,'Phase de Groupe Journée 2'),(3,'Phase de Groupe Journée 3'),(4,'Huitième de finale'),(5,'Quart de finale'),(6,'Demie finale'),(7,'Finale');
SET IDENTITY_INSERT dbo.phase on
*/
SET IDENTITY_INSERT dbo.groups on
go
insert  into dbo.groups( [Idt], [Cod], [Lbl] ) values (1,'A','Groupe A'),(2,'B','Groupe B'),(3,'C','Groupe C'),(4,'D','Groupe D'),(5,'E','Groupe E'),(6,'F','Groupe F');
go
SET IDENTITY_INSERT dbo.groups off
go

SET IDENTITY_INSERT dbo.country on
go
insert  into dbo.country( [Idt], [Cod], [Lbl], [Flag] ) values (7,'FRA','France',NULL),(8,'ROU','Roumanie',NULL),(9,'ALB','Albanie',NULL),(10,'SUI','Suisse',NULL),(11,'WAL','Pays de Galles',NULL),(12,'SVK','Slovaquie',NULL),(13,'ENG','Angleterre',NULL),(14,'RUS','Russie',NULL),(15,'TUR','Turquie',NULL),(16,'CRO','Croatie',NULL),(17,'POL','Pologne',NULL),(18,'NIR','Irlande du Nord',NULL),(19,'GER','Allemagne',NULL),(20,'UKR','Ukraine',NULL),(21,'ESP','Espagne',NULL),(22,'CZE','République Tchèque',NULL),(23,'IRL','Irlande',NULL),(24,'SWE','Suède',NULL),(25,'BEL','Belgique',NULL),(26,'ITA','Italie',NULL),(27,'AUT','Autriche',NULL),(28,'HUN','Hongrie',NULL),(29,'POR','Portugal',NULL),(30,'ISL','Islande',NULL);
go
SET IDENTITY_INSERT dbo.country off
go

SET IDENTITY_INSERT dbo.team on
go
insert  into dbo.team( [Idt], [Cod], [Lbl], [Country_Idt], [Groups_Cod], [NumOrder] ) values (7,'FRA','France',7,'A',1),(8,'ROU','Roumanie',8,'A',2),(9,'ALB','Albanie',9,'A',3),(10,'SUI','Suisse',10,'A',4),(11,'WAL','Pays de Galles',11,'B',3),(12,'SVK','Slovaquie',12,'B',4),(13,'ENG','Angleterre',13,'B',1),(14,'RUS','Russie',14,'B',2),(15,'TUR','Turquie',15,'D',3),(16,'CRO','Croatie',16,'D',4),(17,'POL','Pologne',17,'C',3),(18,'NIR','Irlande du Nord',18,'C',4),(19,'GER','Allemagne',19,'C',1),(20,'UKR','Ukraine',20,'C',2),(21,'ESP','Espagne',21,'D',1),(22,'CZE','République Tchèque',22,'D',2),(23,'IRL','Irlande',23,'E',3),(24,'SWE','Suède',24,'E',4),(25,'BEL','Belgique',25,'E',1),(26,'ITA','Italie',26,'E',2),(27,'AUT','Autriche',27,'F',3),(28,'HUN','Hongrie',28,'F',4),(29,'POR','Portugal',29,'F',1),(30,'ISL','Islande',30,'F',2);
go
SET IDENTITY_INSERT dbo.team off
go

SET IDENTITY_INSERT dbo.groupsmatchschedule  on
go
insert  into dbo.groupsmatchschedule( [Idt], [MatchDay], [NumOrderHome], [NumOrderAway] ) values (1,1,1,2),(2,1,3,4),(3,2,2,4),(4,2,1,3),(5,3,4,1),(6,3,2,3);
go
SET IDENTITY_INSERT dbo.groupsmatchschedule  off
go

SET IDENTITY_INSERT dbo.towns on
go
insert  into dbo.towns( [Idt], [Nom] ) values (1,'Saint-Denis'),(2,'Lens Agglo'),(3,'Bordeaux'),(4,'Marseille'),(5,'Paris'),(6,'Nice'),(7,'Lille Métropole'),(8,'Toulouse'),(9,'Lyon'),(10,'Saint-Etienne');
go
SET IDENTITY_INSERT dbo.towns off
go

SET IDENTITY_INSERT dbo.stadium on
go
insert  into dbo.stadium( [Idt], [Nom], [Towns_Idt] ) values (7,'Stade de France',1),(8,'Stade Bollaert-Delelis',2),(9,'Stade de Bordeaux',3),(10,'Stade Vélodrome',4),(11,'Parc des Princes',5),(12,'Stade de Nice',6),(13,'Stade Pierre Mauroy',7),(14,'Stadium de Toulouse',8),(15,'Stade de Lyon',9),(16,'Stade Geiffroy Guichard',10);
go
SET IDENTITY_INSERT dbo.stadium off
go

SET IDENTITY_INSERT dbo.matchs on
go
-- INSERT  into dbo.matchs( [Idt], [Number], [Groups_Cod], [Phase_Idt], [ScheduleDate], [Stadium_Idt] ) values (7,1,'H','A',1,'2016-06-10 21:00:00',7),(8,2,'H','A',1,'2016-06-11 15:00:00',8),(9,14,'H','A',2,'2016-06-15 18:00:00',11),(10,15,'H','A',2,'2016-06-15 21:00:00',10),(11,26,'H','A',3,'2016-06-19 21:00:00',15),(12,25,'H','A',3,'2016-06-19 21:00:00',13),(13,4,'H','B',1,'2016-06-11 21:00:00',10),(14,3,'H','B',1,'2016-06-11 18:00:00',9),(15,13,'H','B',2,'2016-06-15 15:00:00',13),(16,16,'H','B',2,'2016-06-16 15:00:00',8),(17,28,'H','B',3,'2016-06-20 21:00:00',16),(18,27,'H','B',3,'2016-06-20 21:00:00',14),(19,7,'H','C',1,'2016-06-12 21:00:00',13),(20,6,'H','C',1,'2016-06-12 18:00:00',12),(21,17,'H','C',2,'2016-06-16 18:00:00',15),(22,18,'H','C',2,'2016-06-16 21:00:00',7),(23,30,'H','C',3,'2016-06-21 18:00:00',11),(24,29,'H','C',3,'2016-06-21 18:00:00',10),(25,8,'H','D',1,'2016-06-13 15:00:00',14),(26,5,'H','D',1,'2016-06-12 15:00:00',11),(27,20,'H','D',2,'2016-06-17 18:00:00',16),(28,21,'H','D',2,'2016-06-17 21:00:00',12),(29,31,'H','D',3,'2016-06-21 21:00:00',9),(30,32,'H','D',3,'2016-06-21 21:00:00',8),(31,10,'H','E',1,'2016-06-13 21:00:00',15),(32,9,'H','E',1,'2016-06-13 18:00:00',7),(33,19,'H','E',2,'2016-06-17 15:00:00',14),(34,22,'H','E',2,'2016-06-18 15:00:00',9),(35,36,'H','E',3,'2016-06-22 21:00:00',13),(36,35,'H','E',3,'2016-06-22 21:00:00',12),(37,12,'H','F',1,'2016-06-14 21:00:00',16),(38,11,'H','F',1,'2016-06-14 18:00:00',9),(39,23,'H','F',2,'2016-06-18 18:00:00',10),(40,24,'H','F',2,'2016-06-18 21:00:00',11),(41,33,'H','F',3,'2016-06-22 18:00:00',7),(42,34,'H','F',3,'2016-06-22 18:00:00',15),(133,37,'H',NULL,4,'2016-06-25 15:00:00',16),(134,38,'H',NULL,4,'2016-06-25 18:00:00',11),(135,39,'H',NULL,4,'2016-06-25 21:00:00',8),(136,40,'H',NULL,4,'2016-06-26 15:00:00',15),(137,41,'H',NULL,4,'2016-06-26 18:00:00',13),(138,42,'H',NULL,4,'2016-06-26 21:00:00',14),(139,43,'H',NULL,4,'2016-06-27 18:00:00',7),(140,44,'H',NULL,4,'2016-06-27 21:00:00',12),(141,45,'H',NULL,5,'2016-06-30 21:00:00',10),(142,46,'H',NULL,5,'2016-07-01 21:00:00',13),(143,47,'H',NULL,5,'2016-07-02 21:00:00',9),(144,48,'H',NULL,5,'2016-07-03 21:00:00',7),(145,49,'H',NULL,6,'2016-07-06 21:00:00',15),(146,50,'H',NULL,6,'2016-07-07 21:00:00',10),(147,51,'H',NULL,7,'2016-07-10 21:00:00',7);
-- go
SET IDENTITY_INSERT dbo.matchs off
go

SET IDENTITY_INSERT dbo.matchsteam on
go
insert  into dbo.matchsteam( [Idt], [Matchs_Idt], [AwayHome], [team_idt], [Score], [Calc] ) values (1,7,'H',7,3,'Group=A;Team=1'),(2,7,'A',8,0,'Group=A;Team=2'),(3,8,'H',9,4,'Group=A;Team=3'),(4,8,'A',10,0,'Group=A;Team=4'),(5,9,'H',8,2,'Group=A;Team=2'),(6,9,'A',10,2,'Group=A;Team=4'),(7,10,'H',7,2,'Group=A;Team=1'),(8,10,'A',9,0,'Group=A;Team=3'),(9,11,'H',10,1,'Group=A;Team=4'),(10,11,'A',7,3,'Group=A;Team=1'),(11,12,'A',9,0,'Group=A;Team=3'),(12,12,'H',8,4,'Group=A;Team=2'),(13,13,'A',14,2,'Group=B;Team=2'),(14,13,'H',13,2,'Group=B;Team=1'),(15,14,'A',12,4,'Group=B;Team=4'),(16,14,'H',11,1,'Group=B;Team=3'),(17,15,'H',14,1,'Group=B;Team=2'),(18,15,'A',12,4,'Group=B;Team=4'),(19,16,'H',13,2,'Group=B;Team=1'),(20,16,'A',11,0,'Group=B;Team=3'),(21,17,'H',12,4,'Group=B;Team=4'),(22,17,'A',13,1,'Group=B;Team=1'),(23,18,'H',14,1,'Group=B;Team=2'),(24,18,'A',11,4,'Group=B;Team=3'),(25,19,'H',19,3,'Group=C;Team=1'),(26,19,'A',20,4,'Group=C;Team=2'),(27,20,'H',17,0,'Group=C;Team=3'),(28,20,'A',18,4,'Group=C;Team=4'),(29,21,'H',20,4,'Group=C;Team=2'),(30,21,'A',18,2,'Group=C;Team=4'),(31,22,'H',19,2,'Group=C;Team=1'),(32,22,'A',17,0,'Group=C;Team=3'),(33,23,'H',18,1,'Group=C;Team=4'),(34,23,'A',19,4,'Group=C;Team=1'),(35,24,'H',20,1,'Group=C;Team=2'),(36,24,'A',17,1,'Group=C;Team=3'),(37,25,'H',21,4,'Group=D;Team=1'),(38,25,'A',22,1,'Group=D;Team=2'),(39,26,'H',15,1,'Group=D;Team=3'),(40,26,'A',16,0,'Group=D;Team=4'),(41,27,'H',22,2,'Group=D;Team=2'),(42,27,'A',16,3,'Group=D;Team=4'),(43,28,'A',15,3,'Group=D;Team=3'),(44,28,'H',21,3,'Group=D;Team=1'),(45,29,'A',21,3,'Group=D;Team=1'),(46,29,'H',16,3,'Group=D;Team=4'),(47,30,'A',15,4,'Group=D;Team=3'),(48,30,'H',22,1,'Group=D;Team=2'),(49,31,'H',25,4,'Group=E;Team=1'),(50,31,'A',26,4,'Group=E;Team=2'),(51,32,'H',23,4,'Group=E;Team=3'),(52,32,'A',24,3,'Group=E;Team=4'),(53,33,'H',26,3,'Group=E;Team=2'),(54,33,'A',24,3,'Group=E;Team=4'),(55,34,'H',25,1,'Group=E;Team=1'),(56,34,'A',23,0,'Group=E;Team=3'),(57,35,'H',24,4,'Group=E;Team=4'),(58,35,'A',25,1,'Group=E;Team=1'),(59,36,'H',26,2,'Group=E;Team=2'),(60,36,'A',23,4,'Group=E;Team=3'),(61,37,'H',29,0,'Group=F;Team=1'),(62,37,'A',30,3,'Group=F;Team=2'),(63,38,'H',27,4,'Group=F;Team=3'),(64,38,'A',28,4,'Group=F;Team=4'),(65,39,'H',30,2,'Group=F;Team=2'),(66,39,'A',28,3,'Group=F;Team=4'),(67,40,'H',29,0,'Group=F;Team=1'),(68,40,'A',27,2,'Group=F;Team=3'),(69,41,'H',28,2,'Group=F;Team=4'),(70,41,'A',29,4,'Group=F;Team=1'),(71,42,'H',30,2,'Group=F;Team=2'),(72,42,'A',27,2,'Group=F;Team=3'),(73,133,'H',NULL,NULL,'Group=A;Rank=2'),(74,133,'A',NULL,NULL,'Group=C;Rank=2'),(75,134,'A',NULL,NULL,'Group=A/C/D;Rank=3'),(76,134,'H',NULL,NULL,'Group=C;Rank=1'),(77,135,'A',NULL,NULL,'Group=B/E/F;Rank=3'),(78,135,'H',NULL,NULL,'Group=D;Rank=1'),(79,136,'A',NULL,NULL,'Group=C/D/E;Rank=3'),(80,136,'H',NULL,NULL,'Group=A;Rank=1'),(81,137,'H',NULL,NULL,'Group=C;Rank=1'),(82,137,'A',NULL,NULL,'Group=A/B/F;Rank=3'),(83,138,'H',NULL,NULL,'Group=F;Rank=1'),(84,138,'A',NULL,NULL,'Group=E;Rank=2'),(85,139,'H',NULL,NULL,'Group=E;Rank=1'),(86,139,'A',NULL,NULL,'Group=D;Rank=2'),(87,140,'H',NULL,NULL,'Group=B;Rank=2'),(88,140,'A',NULL,NULL,'Group=F;Rank=2'),(89,141,'H',NULL,NULL,'Winner=37'),(90,141,'A',NULL,NULL,'Winner=39'),(91,142,'H',NULL,NULL,'Winner=38'),(92,142,'A',NULL,NULL,'Winner=42'),(93,143,'H',NULL,NULL,'Winner=41'),(94,143,'A',NULL,NULL,'Winner=43'),(95,144,'H',NULL,NULL,'Winner=40'),(96,144,'A',NULL,NULL,'Winner=44'),(97,145,'H',NULL,NULL,'Winner=45'),(98,145,'A',NULL,NULL,'Winner=46'),(99,146,'H',NULL,NULL,'Winner=47'),(100,146,'A',NULL,NULL,'Winner=48'),(101,147,'H',NULL,NULL,'Winner=49'),(102,147,'A',NULL,NULL,'Winner=50');
go
SET IDENTITY_INSERT dbo.matchsteam off
go
