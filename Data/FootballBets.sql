--MS SQL Maestro 17.6.0.1
------------------------------------------
--Host     : PURPLE-RAIN
--Database : FootballBets


-- Creating Database "FootballBets"
CREATE DATABASE FootballBets
ON
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FootballBets.mdf',
  NAME = [FootballBets],
  SIZE = 8MB,
  MAXSIZE = UNLIMITED,
  FILEGROWTH = 64MB)
LOG ON
(FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FootballBets_log.ldf',
  NAME = [FootballBets_log],
  SIZE = 8MB,
  MAXSIZE = UNLIMITED,
  FILEGROWTH = 64MB)
COLLATE French_CI_AS
GO

ALTER DATABASE FootballBets
  SET COMPATIBILITY_LEVEL = 60
GO

USE master
GO

ALTER DATABASE [FootballBets]
SET
  MULTI_USER,
  ONLINE,
  READ_WRITE,
  CURSOR_DEFAULT LOCAL,
  RECOVERY FULL,
  PAGE_VERIFY TORN_PAGE_DETECTION,
  PARAMETERIZATION FORCED,
  ENABLE_BROKER,
  CURSOR_CLOSE_ON_COMMIT OFF,
  AUTO_CLOSE OFF,
  AUTO_CREATE_STATISTICS ON,
  AUTO_SHRINK OFF,
  AUTO_UPDATE_STATISTICS ON,
  ANSI_NULL_DEFAULT ON,
  ANSI_NULLS ON,
  ANSI_PADDING ON,
  ANSI_WARNINGS ON,
  ARITHABORT ON,
  CONCAT_NULL_YIELDS_NULL ON,
  NUMERIC_ROUNDABORT OFF,
  QUOTED_IDENTIFIER ON,
  RECURSIVE_TRIGGERS OFF,
  DB_CHAINING OFF,
  TRUSTWORTHY ON,
  AUTO_UPDATE_STATISTICS_ASYNC OFF,
  SUPPLEMENTAL_LOGGING OFF,
  DATE_CORRELATION_OPTIMIZATION OFF,
  ENCRYPTION OFF
WITH NO_WAIT
GO

USE FootballBets
GO

USE FootballBets
GO

-- Creating Role "mds_exec"
CREATE ROLE mds_exec
GO

ALTER AUTHORIZATION
  ON ROLE :: mds_exec
  TO mds_schema_user
GO

-- Creating User "mds_br_user"
CREATE USER mds_br_user
  WITHOUT LOGIN
GO

-- Creating User "mds_schema_user"
CREATE USER mds_schema_user
  WITHOUT LOGIN
GO

-- Creating User "mds_ssb_user"
CREATE USER mds_ssb_user
  WITHOUT LOGIN
  WITH DEFAULT_SCHEMA = mdm
GO

-- Creating Assembly "Microsoft.SqlServer.Types"
CREATE ASSEMBLY [Microsoft.SqlServer.Types]
  FROM 'microsoft.sqlserver.types.dll'
  WITH PERMISSION_SET = UNSAFE
GO

ALTER AUTHORIZATION
  ON ASSEMBLY :: [Microsoft.SqlServer.Types]
  TO sys
GO

-- Creating Schema "dqs"
CREATE SCHEMA dqs
GO

ALTER AUTHORIZATION
  ON SCHEMA :: dqs
  TO mds_schema_user
GO

-- Creating Schema "m2ss"
CREATE SCHEMA m2ss
GO

-- Creating Schema "mdm"
CREATE SCHEMA mdm
GO

ALTER AUTHORIZATION
  ON SCHEMA :: mdm
  TO mds_schema_user
GO

-- Creating Schema "mdq"
CREATE SCHEMA mdq
GO

ALTER AUTHORIZATION
  ON SCHEMA :: mdq
  TO mds_schema_user
GO

-- Creating Schema "usr"
CREATE SCHEMA usr
GO

ALTER AUTHORIZATION
  ON SCHEMA :: usr
  TO mds_br_user
GO

-- Creating Table "dbo.bet"
CREATE TABLE dbo.bet (
  Idt         int IDENTITY(1, 1),
  HomeAway    char NOT NULL CONSTRAINT DF__bet__HomeAway__3493CFA7 DEFAULT NULL,
  Score       smallint CONSTRAINT [DF__bet__Away Score__571DF1D5] DEFAULT NULL,
  Matchs_Idt  int NOT NULL,
  Usr_Idt     int NOT NULL,
  /* Keys */
  CONSTRAINT PK_bet_Idt PRIMARY KEY (Idt)
)
GO

CREATE INDEX fk_Bet_Match1_idx
  ON dbo.bet
  (Matchs_Idt)
GO

CREATE INDEX fk_Bet_Match_copy11_idx
  ON dbo.bet
  (Usr_Idt)
GO

-- Creating Table "dbo.country"
CREATE TABLE dbo.country (
  Idt   int IDENTITY(1, 1),
  Cod   nchar(3) CONSTRAINT DF__country__Cod__5BE2A6F2 DEFAULT NULL,
  Lbl   nvarchar(100) CONSTRAINT DF__country__Lbl__5CD6CB2B DEFAULT NULL,
  Flag  varbinary(max),
  /* Keys */
  CONSTRAINT PK_country_Idt PRIMARY KEY (Idt)
)
GO

-- Creating Table "dbo.groups"
CREATE TABLE dbo.groups (
  Idt  int IDENTITY(1, 1),
  Cod  nchar(3) CONSTRAINT DF__groups__Cod__5EBF139D DEFAULT NULL,
  Lbl  nvarchar(100) CONSTRAINT DF__groups__Lbl__5FB337D6 DEFAULT NULL,
  /* Keys */
  CONSTRAINT PK_groups_Idt PRIMARY KEY (Idt), 
  CONSTRAINT groups$Groups_Ak UNIQUE (Cod)
)
GO

-- Creating Table "dbo.groupsmatchschedule"
CREATE TABLE dbo.groupsmatchschedule (
  Idt           smallint IDENTITY(1, 1),
  MatchDay      smallint NOT NULL,
  NumOrderHome  smallint NOT NULL,
  NumOrderAway  smallint CONSTRAINT DF__groupsmat__NumOr__60A75C0F DEFAULT NULL,
  /* Keys */
  CONSTRAINT PK_groupsmatchschedule_Idt PRIMARY KEY (Idt)
)
GO

-- Creating Table "dbo.matchs"
CREATE TABLE dbo.matchs (
  Idt           int IDENTITY(1, 1),
  Number        smallint CONSTRAINT DF__matchs__Number__619B8048 DEFAULT NULL,
  Groups_Cod    nchar(3) CONSTRAINT DF__matchs__Groups_C__6383C8BA DEFAULT NULL,
  Phase_Idt     int CONSTRAINT DF__matchs__Phase_Id__6477ECF3 DEFAULT NULL,
  ScheduleDate  datetime2(0) CONSTRAINT DF__matchs__Schedule__656C112C DEFAULT NULL,
  Stadium_Idt   int CONSTRAINT DF__matchs__Stadium___66603565 DEFAULT NULL,
  /* Keys */
  CONSTRAINT Matchs_PK PRIMARY KEY (Idt)
)
GO

CREATE INDEX Match_Stadium_Fk
  ON dbo.matchs
  (Stadium_Idt)
GO

-- Creating Table "dbo.matchsteam"
CREATE TABLE dbo.matchsteam (
  Idt         int IDENTITY(1, 1),
  Matchs_Idt  int NOT NULL CONSTRAINT DF__matchstea__Match__6754599E DEFAULT 0,
  AwayHome    char CONSTRAINT DF__matchstea__AwayH__395884C4 DEFAULT 'X',
  team_idt    int CONSTRAINT DF__matchstea__team___693CA210 DEFAULT NULL,
  Score       smallint CONSTRAINT DF__matchstea__Score__6A30C649 DEFAULT NULL,
  Calc        nvarchar(100) CONSTRAINT DF__matchsteam__Calc__6B24EA82 DEFAULT NULL,
  /* Keys */
  CONSTRAINT PK_matchsteam_Idt PRIMARY KEY (Idt)
)
GO

-- Creating Table "dbo.Parameters"
CREATE TABLE dbo.Parameters (
  [Name]   nchar(10),
  [Value]  nvarchar(50),
  /* Keys */
  CONSTRAINT PK_Parameters PRIMARY KEY ([Name])
)
GO

CREATE INDEX IX_Parameters
  ON dbo.Parameters
  ([Name])
GO

-- Creating Table "dbo.phase"
CREATE TABLE dbo.phase (
  Idt  int IDENTITY(1, 1),
  Lbl  nvarchar(100) NOT NULL,
  /* Keys */
  CONSTRAINT PK_phase_Idt PRIMARY KEY (Idt)
)
GO

-- Creating Table "dbo.players"
CREATE TABLE dbo.players (
  Idt       int IDENTITY(1, 1),
  [Name]    nvarchar(50) CONSTRAINT DF__players__Name__6C190EBB DEFAULT NULL,
  Surname   nvarchar(50) CONSTRAINT DF__players__Surname__6D0D32F4 DEFAULT NULL,
  Number    smallint CONSTRAINT DF__players__Number__6E01572D DEFAULT NULL,
  Team_Idt  int NOT NULL,
  /* Keys */
  CONSTRAINT PK_players_Idt PRIMARY KEY (Idt)
)
GO

CREATE INDEX fk_Players_Team1_idx
  ON dbo.players
  (Team_Idt)
GO

-- Creating Table "dbo.scorer"
CREATE TABLE dbo.scorer (
  Idt          int IDENTITY(1, 1),
  Minute       nvarchar(45) CONSTRAINT DF__scorer__Minute__6EF57B66 DEFAULT NULL,
  Players_Idt  int NOT NULL,
  Match_Idt    int NOT NULL,
  /* Keys */
  CONSTRAINT PK_scorer_Idt PRIMARY KEY (Idt)
)
GO

CREATE INDEX fk_Scorer_Match1_idx
  ON dbo.scorer
  (Match_Idt)
GO

CREATE INDEX fk_Scorer_Players1_idx
  ON dbo.scorer
  (Players_Idt)
GO

-- Creating Table "dbo.stadium"
CREATE TABLE dbo.stadium (
  Idt        int IDENTITY(1, 1),
  Nom        nvarchar(100) NOT NULL,
  Towns_Idt  int NOT NULL,
  /* Keys */
  CONSTRAINT PK_stadium_Idt PRIMARY KEY (Idt)
)
GO

CREATE INDEX Stadium_Towns_Fk
  ON dbo.stadium
  (Towns_Idt)
GO

-- Creating Table "dbo.team"
CREATE TABLE dbo.team (
  Idt          int IDENTITY(1, 1),
  Cod          nchar(3) CONSTRAINT DF__team__Cod__6FE99F9F DEFAULT NULL,
  Lbl          nvarchar(100) CONSTRAINT DF__team__Lbl__70DDC3D8 DEFAULT NULL,
  Country_Idt  int NOT NULL,
  Groups_Cod   nchar(3) CONSTRAINT DF__team__Groups_Cod__71D1E811 DEFAULT NULL,
  NumOrder     smallint CONSTRAINT DF__team__NumOrder__72C60C4A DEFAULT NULL,
  /* Keys */
  CONSTRAINT PK_team_Idt PRIMARY KEY (Idt)
)
GO

CREATE INDEX fk_Team_Country_idx
  ON dbo.team
  (Country_Idt)
GO

CREATE INDEX Team_Groups_Fk
  ON dbo.team
  (Groups_Cod)
GO

-- Creating Table "dbo.towns"
CREATE TABLE dbo.towns (
  Idt  int IDENTITY(1, 1),
  Nom  nvarchar(50) NOT NULL,
  /* Keys */
  CONSTRAINT PK_towns_Idt PRIMARY KEY (Idt)
)
GO

-- Creating Table "dbo.UserProfile"
CREATE TABLE dbo.UserProfile (
  UserId    int IDENTITY(1, 1),
  UserName  nvarchar(56) NOT NULL,
  EmailId   nvarchar(max),
  Details   nvarchar(max),
  /* Keys */
  CONSTRAINT PK__UserProf__1788CC4C09A971A2 PRIMARY KEY (UserId), 
  CONSTRAINT UQ__UserProf__C9F284560C85DE4D UNIQUE (UserName)
)
GO

CREATE TRIGGER dbo.UserProfile_AfterInsert ON dbo.UserProfile
AFTER INSERT
AS
-- set IDENTITY_INSERT Bettor on ;
insert into Bettor
( Idt, Name )
Select UserId, UserName
  from inserted ;
-- set IDENTITY_INSERT Bettor off ;
GO

-- Creating Table "dbo.Usr"
CREATE TABLE dbo.Usr (
  Idt      int IDENTITY(1, 1),
  [Name]   nvarchar(55) NOT NULL,
  Surname  nvarchar(56),
  eMail    nvarchar(max),
  /* Keys */
  CONSTRAINT Usr_Pk PRIMARY KEY (Idt)
)
GO

CREATE UNIQUE INDEX Usr_Ak
  ON dbo.Usr
  ([Name])
GO

-- Creating Table "dbo.webpages_Membership"
CREATE TABLE dbo.webpages_Membership (
  UserId                                   int,
  CreateDate                               datetime,
  ConfirmationToken                        nvarchar(128),
  IsConfirmed                              bit CONSTRAINT DF__webpages___IsCon__160F4887 DEFAULT 0,
  LastPasswordFailureDate                  datetime,
  PasswordFailuresSinceLastSuccess         int NOT NULL CONSTRAINT DF__webpages___Passw__17036CC0 DEFAULT 0,
  [Password]                               nvarchar(128) NOT NULL,
  PasswordChangedDate                      datetime,
  PasswordSalt                             nvarchar(128) NOT NULL,
  PasswordVerificationToken                nvarchar(128),
  PasswordVerificationTokenExpirationDate  datetime,
  /* Keys */
  CONSTRAINT PK__webpages__1788CC4C14270015 PRIMARY KEY (UserId)
)
GO

-- Creating Table "dbo.webpages_OAuthMembership"
CREATE TABLE dbo.webpages_OAuthMembership (
  Provider        nvarchar(30),
  ProviderUserId  nvarchar(100),
  UserId          int NOT NULL,
  /* Keys */
  CONSTRAINT PK__webpages__F53FC0ED10566F31 PRIMARY KEY (Provider, ProviderUserId)
)
GO

-- Creating Table "dbo.webpages_Roles"
CREATE TABLE dbo.webpages_Roles (
  RoleId    int IDENTITY(1, 1),
  RoleName  nvarchar(256) NOT NULL,
  /* Keys */
  CONSTRAINT PK__webpages__8AFACE1A19DFD96B PRIMARY KEY (RoleId), 
  CONSTRAINT UQ__webpages__8A2B61601CBC4616 UNIQUE (RoleName)
)
GO

-- Creating Table "dbo.webpages_UsersInRoles"
CREATE TABLE dbo.webpages_UsersInRoles (
  UserId  int,
  RoleId  int,
  /* Keys */
  CONSTRAINT PK__webpages__AF2760AD208CD6FA PRIMARY KEY (UserId, RoleId)
)
GO

-- Creating Table "m2ss.MSSsmaDmNCKeyColumns"
CREATE TABLE m2ss.MSSsmaDmNCKeyColumns (
  [object_id]                int,
  key_name                   sys.sysname,
  key_type                   char(2),
  key_column_id              int,
  index_column_id            int,
  is_disabled                bit,
  referenced_object_id       int,
  delete_referential_action  tinyint,
  update_referential_action  tinyint,
  is_not_for_replication     bit,
  is_not_trusted             bit,
  referenced_column_id       int,
  /* Keys */
  CONSTRAINT PK__MSSsmaDm__BC5021FB03F0984C PRIMARY KEY ([object_id], key_name, key_type, key_column_id)
)
GO

-- Creating Table "m2ss.MSSsmaDmTables"
CREATE TABLE m2ss.MSSsmaDmTables (
  [object_id]    int,
  [schema_id]    int NOT NULL,
  status         tinyint,
  dm_start_time  datetime NOT NULL,
  /* Keys */
  CONSTRAINT PK__MSSsmaDm__3DC088B500200768 PRIMARY KEY ([object_id])
)
GO



-- Data from table "dbo.bet"
SET IDENTITY_INSERT dbo.bet ON
GO


SET IDENTITY_INSERT dbo.bet OFF
GO



-- Data from table "dbo.country"
SET IDENTITY_INSERT dbo.country ON
GO

INSERT INTO dbo.country (Idt, Cod, Lbl, Flag) VALUES
  (7, N'FRA', N'France', NULL),
  (8, N'ROU', N'Roumanie', NULL),
  (9, N'ALB', N'Albanie', NULL),
  (10, N'SUI', N'Suisse', NULL),
  (11, N'WAL', N'Pays de Galles', NULL),
  (12, N'SVK', N'Slovaquie', NULL),
  (13, N'ENG', N'Angleterre', NULL),
  (14, N'RUS', N'Russie', NULL),
  (15, N'TUR', N'Turquie', NULL),
  (16, N'CRO', N'Croatie', NULL),
  (17, N'POL', N'Pologne', NULL),
  (18, N'NIR', N'Irlande du Nord', NULL),
  (19, N'GER', N'Allemagne', NULL),
  (20, N'UKR', N'Ukraine', NULL),
  (21, N'ESP', N'Espagne', NULL),
  (22, N'CZE', N'République Tchèque', NULL),
  (23, N'IRL', N'Irlande', NULL),
  (24, N'SWE', N'Suède', NULL),
  (25, N'BEL', N'Belgique', NULL),
  (26, N'ITA', N'Italie', NULL),
  (27, N'AUT', N'Autriche', NULL),
  (28, N'HUN', N'Hongrie', NULL),
  (29, N'POR', N'Portugal', NULL),
  (30, N'ISL', N'Islande', NULL),
  (31, N'ARB', N'Arabie Saoudite', NULL),
  (32, N'EGY', N'Egypte', NULL),
  (33, N'URU', N'Uruguay', NULL),
  (34, N'MAR', N'Maroc', NULL),
  (35, N'IRN', N'Iran', NULL),
  (36, N'AUS', N'Australie', NULL),
  (37, N'DEN', N'Danemark', NULL),
  (38, N'ARG', N'Argentine', NULL),
  (39, N'NIG', N'Nigéria', NULL),
  (40, N'BRA', N'Brasil', NULL),
  (42, N'COS', N'Costa Rica', NULL),
  (43, N'SRB', N'Serbie', NULL),
  (44, N'MEX', N'Mexique', NULL),
  (45, N'COR', N'Corée du Sud', NULL),
  (46, N'PAN', N'Panama', NULL),
  (47, N'TUN', N'Tunisie', NULL),
  (48, N'COL', N'Colombie', NULL),
  (49, N'SEN', N'Sénégal', NULL),
  (50, N'JPN', N'Japon', NULL),
  (51, N'PER', N'Pérou', NULL);

SET IDENTITY_INSERT dbo.country OFF
GO



-- Data from table "dbo.groups"
SET IDENTITY_INSERT dbo.groups ON
GO

INSERT INTO dbo.groups (Idt, Cod, Lbl) VALUES
  (1, N'A  ', N'Groupe A'),
  (2, N'B  ', N'Groupe B'),
  (3, N'C  ', N'Groupe C'),
  (4, N'D  ', N'Groupe D'),
  (5, N'E  ', N'Groupe E'),
  (6, N'F  ', N'Groupe F'),
  (7, N'G  ', N'Groupe G'),
  (8, N'H  ', N'Groupe H');

SET IDENTITY_INSERT dbo.groups OFF
GO



-- Data from table "dbo.groupsmatchschedule"
SET IDENTITY_INSERT dbo.groupsmatchschedule ON
GO

INSERT INTO dbo.groupsmatchschedule (Idt, MatchDay, NumOrderHome, NumOrderAway) VALUES
  (1, 1, 1, 2),
  (2, 1, 3, 4),
  (3, 2, 4, 2),
  (4, 2, 1, 3),
  (5, 3, 4, 1),
  (6, 3, 3, 2);

SET IDENTITY_INSERT dbo.groupsmatchschedule OFF
GO



-- Data from table "dbo.matchs"
SET IDENTITY_INSERT dbo.matchs ON
GO

INSERT INTO dbo.matchs (Idt, Number, Groups_Cod, Phase_Idt, ScheduleDate, Stadium_Idt) VALUES
  (148, 1, N'A  ', 8, N'2018-06-14 18:00:00', NULL),
  (149, 2, N'A  ', 8, N'2018-06-15 17:00:00', NULL),
  (150, 17, N'A  ', 8, N'2018-06-19 21:00:00', NULL),
  (152, 18, N'A  ', 8, N'2018-06-20 18:00:00', NULL),
  (153, 33, N'A  ', 8, N'2018-06-25 17:00:00', NULL),
  (154, 34, N'A  ', 8, N'2018-06-25 17:00:00', NULL),
  (155, 3, N'B  ', 8, N'2018-06-15 18:00:00', NULL),
  (156, 4, N'B  ', 8, N'2018-06-15 21:00:00', NULL),
  (157, 19, N'B  ', 8, N'2018-06-20 15:00:00', NULL),
  (158, 20, N'B  ', 8, N'2018-06-20 21:00:00', NULL),
  (159, 35, N'B  ', 8, N'2018-06-25 21:00:00', NULL),
  (160, 36, N'B  ', 8, N'2018-06-25 21:00:00', NULL),
  (161, 5, N'C  ', 8, N'2018-06-16 12:00:00', NULL),
  (162, 6, N'C  ', 8, N'2018-06-16 19:00:00', NULL),
  (163, 21, N'C  ', 8, N'2018-06-21 17:00:00', NULL),
  (164, 22, N'C  ', 8, N'2018-06-21 14:00:00', NULL),
  (165, 37, N'C  ', 8, N'2018-06-26 17:00:00', NULL),
  (166, 38, N'C  ', 8, N'2018-06-26 17:00:00', NULL),
  (167, 7, N'D  ', 8, N'2018-06-16 16:00:00', NULL),
  (168, 8, N'D  ', 8, N'2018-06-16 21:00:00', NULL),
  (169, 23, N'D  ', 8, N'2018-06-21 21:00:00', NULL),
  (170, 24, N'D  ', 8, N'2018-06-22 18:00:00', NULL),
  (171, 39, N'D  ', 8, N'2018-06-26 21:00:00', NULL),
  (172, 40, N'D  ', 8, N'2018-06-26 21:00:00', NULL),
  (173, 9, N'E  ', 8, N'2018-06-17 16:00:00', NULL),
  (174, 10, N'E  ', 8, N'2018-06-17 21:00:00', NULL),
  (175, 25, N'E  ', 8, N'2018-06-22 15:00:00', NULL),
  (176, 26, N'E  ', 8, N'2018-06-22 20:00:00', NULL),
  (177, 41, N'E  ', 8, N'2018-06-27 21:00:00', NULL),
  (178, 42, N'E  ', 8, N'2018-06-27 21:00:00', NULL),
  (179, 11, N'F  ', 8, N'2018-06-17 18:00:00', NULL),
  (180, 12, N'F  ', 8, N'2018-06-18 15:00:00', NULL),
  (181, 27, N'F  ', 8, N'2018-06-23 21:00:00', NULL),
  (182, 28, N'F  ', 8, N'2018-06-23 18:00:00', NULL),
  (183, 43, N'F  ', 8, N'2018-06-27 17:00:00', NULL),
  (184, 44, N'F  ', 8, N'2018-06-27 17:00:00', NULL),
  (185, 13, N'G  ', 8, N'2018-06-18 18:00:00', NULL),
  (186, 14, N'G  ', 8, N'2018-06-18 21:00:00', NULL),
  (187, 29, N'G  ', 8, N'2018-06-23 15:00:00', NULL),
  (188, 30, N'G  ', 8, N'2018-06-24 15:00:00', NULL),
  (189, 45, N'G  ', 8, N'2018-06-28 20:00:00', NULL),
  (190, 46, N'G  ', 8, N'2018-06-28 20:00:00', NULL),
  (191, 15, N'H  ', 8, N'2018-06-19 15:00:00', NULL),
  (192, 16, N'H  ', 8, N'2018-06-19 18:00:00', NULL),
  (193, 31, N'H  ', 8, N'2018-06-24 21:00:00', NULL),
  (194, 32, N'H  ', 8, N'2018-06-24 20:00:00', NULL),
  (195, 47, N'H  ', 8, N'2018-06-28 18:00:00', NULL),
  (196, 48, N'H  ', 8, N'2018-06-28 18:00:00', NULL);

SET IDENTITY_INSERT dbo.matchs OFF
GO



-- Data from table "dbo.matchsteam"
SET IDENTITY_INSERT dbo.matchsteam ON
GO


SET IDENTITY_INSERT dbo.matchsteam OFF
GO



-- Data from table "dbo.Parameters"



-- Data from table "dbo.phase"
SET IDENTITY_INSERT dbo.phase ON
GO

INSERT INTO dbo.phase (Idt, Lbl) VALUES
  (8, N'Phase 1'),
  (9, N'Phase 2');

SET IDENTITY_INSERT dbo.phase OFF
GO



-- Data from table "dbo.players"
SET IDENTITY_INSERT dbo.players ON
GO


SET IDENTITY_INSERT dbo.players OFF
GO



-- Data from table "dbo.scorer"
SET IDENTITY_INSERT dbo.scorer ON
GO


SET IDENTITY_INSERT dbo.scorer OFF
GO



-- Data from table "dbo.stadium"
SET IDENTITY_INSERT dbo.stadium ON
GO

INSERT INTO dbo.stadium (Idt, Nom, Towns_Idt) VALUES
  (7, N'Stade de France', 1),
  (8, N'Stade Bollaert-Delelis', 2),
  (9, N'Stade de Bordeaux', 3),
  (10, N'Stade Vélodrome', 4),
  (11, N'Parc des Princes', 5),
  (12, N'Stade de Nice', 6),
  (13, N'Stade Pierre Mauroy', 7),
  (14, N'Stadium de Toulouse', 8),
  (15, N'Stade de Lyon', 9),
  (16, N'Stade Geiffroy Guichard', 10);

SET IDENTITY_INSERT dbo.stadium OFF
GO



-- Data from table "dbo.team"
SET IDENTITY_INSERT dbo.team ON
GO

INSERT INTO dbo.team (Idt, Cod, Lbl, Country_Idt, Groups_Cod, NumOrder) VALUES
  (7, N'RUS', N'Russie', 14, N'A  ', 1),
  (8, N'ARB', N'Arabie Saoudite', 31, N'A  ', 2),
  (9, N'EGY', N'Egypte', 32, N'A  ', 3),
  (10, N'URU', N'Uruguay', 33, N'A  ', 4),
  (11, N'POR', N'Portugal', 29, N'B  ', 1),
  (12, N'ESP', N'Espagne', 21, N'B  ', 2),
  (13, N'MAR', N'Maroc', 34, N'B  ', 3),
  (14, N'IRN', N'Iran', 35, N'B  ', 4),
  (15, N'FRA', N'France', 7, N'C  ', 1),
  (16, N'AUS', N'Australie', 36, N'C  ', 2),
  (17, N'PER', N'Pérou', 51, N'C  ', 3),
  (18, N'DEN', N'Danemark', 37, N'C  ', 4),
  (19, N'ARG', N'Argentine', 38, N'D  ', 1),
  (20, N'ISL', N'Islande', 30, N'D  ', 2),
  (21, N'CRO', N'Croatie', 16, N'D  ', 3),
  (22, N'NIG', N'Nigéria', 39, N'D  ', 4),
  (23, N'BRA', N'Brasil', 40, N'E  ', 1),
  (24, N'SUI', N'Suisse', 10, N'E  ', 2),
  (25, N'COS', N'Costa Rica', 42, N'E  ', 3),
  (26, N'SRB', N'Serbie', 43, N'E  ', 4),
  (27, N'GER', N'Allemagne', 19, N'F  ', 1),
  (28, N'MEX', N'Mexique', 44, N'F  ', 2),
  (29, N'SWE', N'Suède', 24, N'F  ', 3),
  (30, N'COR', N'Corée du Sud', 45, N'F  ', 4),
  (34, N'BEL', N'Belgique', 25, N'G  ', 1),
  (35, N'PAN', N'Panama', 46, N'G  ', 2),
  (36, N'TUN', N'Tunisie', 47, N'G  ', 3),
  (37, N'ENG', N'Angleterre', 13, N'G  ', 4),
  (38, N'POL', N'Pologne', 17, N'H  ', 1),
  (39, N'COL', N'Colombie', 48, N'H  ', 2),
  (40, N'SEN', N'Sénégal', 49, N'H  ', 3),
  (41, N'JPN', N'Japon', 50, N'H  ', 4);

SET IDENTITY_INSERT dbo.team OFF
GO



-- Data from table "dbo.towns"
SET IDENTITY_INSERT dbo.towns ON
GO

INSERT INTO dbo.towns (Idt, Nom) VALUES
  (1, N'Saint-Denis'),
  (2, N'Lens Agglo'),
  (3, N'Bordeaux'),
  (4, N'Marseille'),
  (5, N'Paris'),
  (6, N'Nice'),
  (7, N'Lille Métropole'),
  (8, N'Toulouse'),
  (9, N'Lyon'),
  (10, N'Saint-Etienne');

SET IDENTITY_INSERT dbo.towns OFF
GO



-- Data from table "dbo.UserProfile"
SET IDENTITY_INSERT dbo.UserProfile ON
GO


SET IDENTITY_INSERT dbo.UserProfile OFF
GO



-- Data from table "dbo.Usr"
SET IDENTITY_INSERT dbo.Usr ON
GO


SET IDENTITY_INSERT dbo.Usr OFF
GO



-- Data from table "dbo.webpages_Membership"



-- Data from table "dbo.webpages_OAuthMembership"



-- Data from table "dbo.webpages_Roles"
SET IDENTITY_INSERT dbo.webpages_Roles ON
GO


SET IDENTITY_INSERT dbo.webpages_Roles OFF
GO



-- Data from table "dbo.webpages_UsersInRoles"



-- Data from table "m2ss.MSSsmaDmNCKeyColumns"



-- Data from table "m2ss.MSSsmaDmTables"



ALTER TABLE dbo.bet
  ADD CONSTRAINT Bet_Matchs_Fk
  FOREIGN KEY (Matchs_Idt)
    REFERENCES dbo.matchs(Idt)
GO

ALTER TABLE dbo.matchs
  ADD CONSTRAINT Matchs_Groups_Fk
  FOREIGN KEY (Groups_Cod)
    REFERENCES dbo.groups(Cod)
GO

ALTER TABLE dbo.matchs
  ADD CONSTRAINT Matchs_Phase_Fk
  FOREIGN KEY (Phase_Idt)
    REFERENCES dbo.phase(Idt)
GO

ALTER TABLE dbo.matchs
  ADD CONSTRAINT Matchs_Stadium_Fk
  FOREIGN KEY (Stadium_Idt)
    REFERENCES dbo.stadium(Idt)
GO

ALTER TABLE dbo.matchsteam
  ADD CONSTRAINT MatchsTeam_Match_Fk
  FOREIGN KEY (Matchs_Idt)
    REFERENCES dbo.matchs(Idt)
GO

ALTER TABLE dbo.matchsteam
  ADD CONSTRAINT MatchsTeam_Team_Fk
  FOREIGN KEY (team_idt)
    REFERENCES dbo.team(Idt)
GO

ALTER TABLE dbo.stadium
  ADD CONSTRAINT Stadium_Towns_Fk
  FOREIGN KEY (Towns_Idt)
    REFERENCES dbo.towns(Idt)
GO

ALTER TABLE dbo.team
  ADD CONSTRAINT Team_Country_Fk
  FOREIGN KEY (Country_Idt)
    REFERENCES dbo.country(Idt)
GO

ALTER TABLE dbo.team
  ADD CONSTRAINT Team_Groups_Fk
  FOREIGN KEY (Groups_Cod)
    REFERENCES dbo.groups(Cod)
GO

ALTER TABLE dbo.webpages_UsersInRoles
  ADD CONSTRAINT fk_RoleId
  FOREIGN KEY (RoleId)
    REFERENCES dbo.webpages_Roles(RoleId)
GO

ALTER TABLE dbo.webpages_UsersInRoles
  ADD CONSTRAINT fk_UserId
  FOREIGN KEY (UserId)
    REFERENCES dbo.Usr(Idt)
GO

-- Creating View "dbo.MatchsList"
CREATE VIEW dbo.MatchsList
(
  Idt,
  Number,
  Groups_Cod,
  ScheduleDate,
  Phase_Idt,
  Phase_Lbl,
  Stadium_Name,
  Town_Name,
  Team_Home,
  Team_Home_Label,
  ImageHome,
  Score_Home,
  Team_Away,
  Team_Away_Label,
  ImageAway,
  Score_Away
)
AS
SELECT m.Idt
     , m.Number
     , m.Groups_Cod
     , m.ScheduleDate
     , p.Idt     Phase_Idt
     , p.Lbl     Phase_Lbl
     , s.Nom     Stadium_Name
     , t.Nom     Town_Name
     , th.Cod    Team_Home
     , th.Lbl    Team_Home_Label
     , '/Images/Flag/' + th.Lbl + '.png' ImageHome 
     , mh.Score  Score_Home
     , ta.Cod    Team_Away
     , ta.Lbl    Team_Away_Label
     , '/Images/Flag/' + ta.Lbl + '.png' ImageAway 
     , ma.Score  Score_Away
  FROM dbo.matchs m
 INNER JOIN dbo.stadium    s  ON s.Idt         = m.Stadium_Idt
 INNER JOIN dbo.towns      t  ON t.Idt         = s.Towns_Idt
 INNER JOIN dbo.Phase      p  on p.Idt         = m.Phase_Idt
 INNER JOIN dbo.matchsteam mh ON mh.Matchs_Idt = m.Idt        and mh.AwayHome = 'H'
 INNER JOIN dbo.matchsteam ma ON ma.Matchs_Idt = m.Idt        and ma.AwayHome = 'A'
  LEFT JOIN dbo.team       th ON th.Idt        = mh.team_idt
  LEFT JOIN dbo.team       ta ON ta.Idt        = ma.team_idt
GO

-- Creating View "dbo.UsrMatch"
CREATE VIEW dbo.UsrMatch
(
  Matchs_Idt,
  Usr_Idt,
  Usr_Name,
  Bet_Idt_Home,
  HomeScore,
  Bet_Idt_Away,
  AwayScore,
  Idt,
  Number,
  Groups_Cod,
  ScheduleDate,
  Finished,
  Phase_Idt,
  Phase_Lbl,
  Stadium_Name,
  Town_Name,
  Team_Home,
  Team_Home_Label,
  ImageHome,
  Score_Home,
  Team_Away,
  Team_Away_Label,
  ImageAway,
  Score_Away,
  MatchIsFullFilled
)
AS
select x.*
     , bh.Idt             Bet_Idt_Home
     , bh.Score           HomeScore                                                    
     , ba.Idt             Bet_Idt_Away
     , ba.Score           AwayScore
     , ml.Idt
     , ml.Number
     , ml.Groups_Cod
     , ml.ScheduleDate
     , case when ml.ScheduleDate < dbo.CurrentDate()
       then 1
       else 0
       end                Finished
     , ml.Phase_Idt
     , ml.Phase_Lbl
     , ml.Stadium_Name
     , ml.Town_Name
     , ml.Team_Home
     , ml.Team_Home_Label
     , ml.ImageHome
     , ml.Score_Home
     , ml.Team_Away
     , ml.Team_Away_Label
     , ml.ImageAway
     , ml.Score_Away
     , case isnull(ml.Team_Home, '-') + isnull(ml.Team_Away, '-')
       when '--'
       then 0
       else 1
       end MatchIsFullFilled
  from (                                                                                            
select m.Idt Matchs_Idt
     , bt.Idt Usr_Idt                                                                               
     , bt.Name Usr_Name                                                                             
  from Matchs m                                                                                     
     , Usr bt                                                                                       
 where 1 = 1                                                                                        
       ) as x                                                                                             
  left join Bet bh on bh.Matchs_Idt = x.Matchs_Idt and bh.Usr_Idt = x.Usr_Idt and bh.HomeAway = 'H'
  left join Bet ba on ba.Matchs_Idt = x.Matchs_Idt and ba.Usr_Idt = x.Usr_Idt and ba.HomeAway = 'A'
  join MatchsList ml on ml.Idt = x.Matchs_Idt
GO

-- Creating UDF "dbo.CurrentDate"
CREATE FUNCTION dbo.CurrentDate (
)
RETURNS datetime
BEGIN
  -- RETURN '12/06/2016 20:00:00' /* Change to real argument */
  RETURN getdate() /* Change to real argument */
END
GO

-- Creating Procedure "dbo.PostBet"
CREATE PROCEDURE dbo.PostBet
@pMatchsIdt int, 
@pUsrIdt int, 
@pHomeAway char, 
@pScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

      update Bet
         set Score      = @pScore
       where Matchs_Idt = @pMatchsIdt
         and Usr_Idt    = @pUsrIdt
         and HomeAway   = @pHomeAway
         ;

    IF @@ROWCOUNT = 0
       insert into Bet
         ( Score, Matchs_Idt, Usr_Idt, HomeAway
         ) values
         ( @pScore, @pMatchsIdt, @pUsrIdt, @pHomeAway
         ); 
END
GO

-- Creating Procedure "dbo.PostBetAway"
CREATE PROCEDURE dbo.PostBetAway
@pMatchsIdt int, 
@pUsrIdt int, 
@pScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	execute dbo.PostBet @pMatchsIdt, @pUsrIdt, 'A', @pScore
END
GO

-- Creating Procedure "dbo.PostBetFull"
CREATE PROCEDURE dbo.PostBetFull
@pMatchsIdt int, 
@pUsrName nvarchar(55), 
@pScoreHome int, 
@pScoreAway int
AS
DECLARE
@UsrIdt    int
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select @UsrIdt = Idt from Usr where Name = @pUsrName
	
	execute dbo.PostBetHome @pMatchsIdt, @UsrIdt, @pScoreHome
	execute dbo.PostBetAway @pMatchsIdt, @UsrIdt, @pScoreAway
	
END
GO

-- Creating Procedure "dbo.PostBetHome"
CREATE PROCEDURE dbo.PostBetHome
@pMatchsIdt int, 
@pUsrIdt int, 
@pScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	execute dbo.PostBet @pMatchsIdt, @pUsrIdt, 'H', @pScore
END
GO

-- Creating Procedure "dbo.PostScore"
CREATE PROCEDURE dbo.PostScore
@pMatchIdt int, 
@pScoreHome int, 
@pScoreAway int
AS

declare @MatchIdt int

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT @pMatchIdt, @pScoreHome
	--select @MatchIdt = Idt
	  --from matchs
     --where Idt = @pMatchIdt
     
    --if @MatchIdt = @pMatchIdt
    --begin
    
      update MatchsTeam
         set Score = case AwayHome
                     when 'H' then @pScoreHome
                     when 'A' then @pScoreAway
                     end
       where Matchs_Idt = @pMatchIdt
    --end
    
END
GO

-- Creating Procedure "m2ss.sp_MSSsmaDmDisableConstraints"
CREATE PROCEDURE m2ss.sp_MSSsmaDmDisableConstraints
@key_type char(2), 
@mode int, 
@parallel_load int, 
@minimal_logging int, 
@error_log nvarchar(4000) OUT
AS
declare 
@schema_id				   int,
@table_id				   int,
@constraint				   sysname,
@column_id				   int,
@index_column_id		   int,
@column					   sysname,
@columns				   nvarchar(4000),
@ref_table                 sysname,
@ref_column				   sysname,
@ref_columns               nvarchar(4000), 
@constraint_type           sysname,
@cmd                       nvarchar(4000),
@is_disabled               bit,
@mode_action               sysname,
@parent_column_id          int,
@constraint_column_id      int,
@referenced_object_id      int,
@delete_referential_action int,
@update_referential_action int,
@referenced_column_id      int,
@index_name                sysname,
@index_id                  int,
@index_type                varchar(2),
@temp_key_type             varchar(2)

BEGIN
	SET @error_log = N''
	SET @mode_action = 
		CASE (@mode) 
			WHEN 0 THEN N' NOCHECK ' 
			WHEN 1 THEN N' CHECK ' 
			WHEN 2 THEN N' DROP ' 
			WHEN 3 THEN N' ADD ' 
			WHEN 4 THEN N' DISABLE ' 
			WHEN 5 THEN N' REBUILD ' 
		END
	IF(@key_type = N'PK' or @key_type = N'UQ' )
	BEGIN
		--DROP PRIMARY AND UNIQUE KEYS
		DECLARE #keycol_cur CURSOR STATIC FOR
		SELECT pk_un.parent_object_id, pk_un.name, pk_un.type, ic.column_id, ic.index_column_id, pk_un.schema_id
			FROM sys.key_constraints pk_un 
				JOIN sys.index_columns ic ON pk_un.unique_index_id = ic.index_id AND pk_un.parent_object_id = ic.object_id
				JOIN sys.indexes idx ON idx.object_id = pk_un.parent_object_id AND idx.index_id = ic.index_id
				JOIN  [m2ss].[MSSsmaDmTables] t ON t.object_id = pk_un.parent_object_id
			WHERE (@minimal_logging = 1) AND (idx.index_id <> 1) AND pk_un.type = @key_type
			ORDER BY object_name(ic.object_id), ic.index_column_id 
		OPEN #keycol_cur
		FETCH #keycol_cur INTO @table_id, @constraint, @constraint_type, @column_id, @index_column_id, @schema_id
		WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [m2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				, key_name
				, key_type
				, key_column_id
				, index_column_id
			) VALUES (@table_id, @constraint, @constraint_type, @column_id, @index_column_id)
		
			IF EXISTS (SELECT * FROM sys.key_constraints WHERE name = @constraint AND schema_id = @schema_id) 
			BEGIN
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)		
				BEGIN TRY
					EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
				
			FETCH #keycol_cur INTO @table_id, @constraint, @constraint_type, @column_id, @index_column_id, @schema_id
		END
		CLOSE #keycol_cur
		DEALLOCATE #keycol_cur
	END
	ELSE IF(@key_type = 'NF')
	BEGIN
		-- DROP FOREIGNKEY REFERENCES ON NON CLUSTERED PK OR UK
		SET @temp_key_type= 'NF'
		DECLARE #fk_col_cur CURSOR STATIC FOR
		SELECT 
			fk.parent_object_id, fk.schema_id, fk.name, fk.type, fkc.parent_column_id, fkc.constraint_column_id, fk.is_disabled,
			fk.referenced_object_id, fk.delete_referential_action, fk.update_referential_action, fkc.referenced_column_id
		FROM sys.foreign_keys fk 
			JOIN sys.foreign_key_columns fkc ON 
					fk.object_id = fkc.constraint_object_id 
				AND fk.parent_object_id = fkc.parent_object_id 
				AND fk.referenced_object_id = fkc.referenced_object_id
			JOIN sys.key_constraints pk ON pk.parent_object_id = fk.referenced_object_id
			JOIN  [m2ss].[MSSsmaDmTables] t ON t.object_id = pk.parent_object_id
		WHERE (pk.type IN (N'PK', N'UQ') AND ((@minimal_logging = 1) AND (fk.key_index_id <> 1)))
		ORDER BY object_name(fkc.constraint_object_id), fkc.constraint_column_id 
		
		OPEN #fk_col_cur
		FETCH #fk_col_cur INTO 
			@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled, 
			@referenced_object_id, @delete_referential_action, @update_referential_action, @referenced_column_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [m2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				,key_name
				,key_type
				,key_column_id
				,index_column_id
				,is_disabled
				,referenced_object_id
				,delete_referential_action
				,update_referential_action
				,referenced_column_id
			) 
			values (
				@table_id, @constraint, @temp_key_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action, @referenced_column_id
			)
			
			IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = @constraint AND schema_id = @schema_id)
			BEGIN		
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
				BEGIN TRY
					EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop foreign key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
			FETCH #fk_col_cur INTO 
				@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action,@referenced_column_id
			END
			CLOSE #fk_col_cur
			DEALLOCATE #fk_col_cur
		END
	ELSE IF(@key_type = N'FK' AND @parallel_load = 1)
	BEGIN
		-- DROP FOREIGNKEY REFERENCES ON CLUSTERED PK OR UK WITH PARALLEL DM
		SET @temp_key_type = 'FK'
		DECLARE #fk_col_cur CURSOR STATIC FOR
		SELECT 
			fk.parent_object_id, fk.schema_id, fk.name, fk.type, fkc.parent_column_id, fkc.constraint_column_id, fk.is_disabled,
			fk.referenced_object_id, fk.delete_referential_action, fk.update_referential_action, fkc.referenced_column_id
		FROM sys.foreign_keys fk 
			JOIN sys.foreign_key_columns fkc ON 
					fk.object_id = fkc.constraint_object_id 
				AND fk.parent_object_id = fkc.parent_object_id 
				AND fk.referenced_object_id = fkc.referenced_object_id
			JOIN  [m2ss].[MSSsmaDmTables] t ON t.object_id = fk.referenced_object_id
		ORDER BY object_name(fkc.constraint_object_id), fkc.constraint_column_id 
	
		OPEN #fk_col_cur
		FETCH #fk_col_cur INTO 
			@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, 
			@is_disabled,@referenced_object_id, @delete_referential_action,@update_referential_action,@referenced_column_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [m2ss].[MSSsmaDmNCKeyColumns] (
				object_id
				,key_name
				,key_type
				,key_column_id
				,index_column_id
				,is_disabled
				,referenced_object_id
				,delete_referential_action
				,update_referential_action
				,referenced_column_id
			) 
			values (
				@table_id, @constraint, @temp_key_type, @column_id, @constraint_column_id, @is_disabled,@referenced_object_id,
				@delete_referential_action, @update_referential_action, @referenced_column_id
			)
			
			IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = @constraint AND schema_id = @schema_id)
			BEGIN
				SET @cmd = N'ALTER TABLE ' + quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
				BEGIN TRY
						EXEC(@cmd)
				END TRY
				BEGIN CATCH
					SET @error_log = @error_log + 'Unable to drop foreign key '+quotename(@constraint)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
					SET @error_log = @error_log + @cmd + char(10) + char(13)
					SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)
				END CATCH
			END
			FETCH #fk_col_cur INTO 
				@table_id, @schema_id, @constraint, @constraint_type, @column_id, @constraint_column_id, @is_disabled, 
				@referenced_object_id, @delete_referential_action, @update_referential_action, @referenced_column_id
		END
		CLOSE #fk_col_cur
		DEALLOCATE #fk_col_cur			
	END
	ELSE IF (@key_type = N'NC')
	BEGIN
		-- DISABLE NON CLUSTERED INDEXES WITH BULK LOAD OPTIMIZATION
		DECLARE #index_col_cur CURSOR FORWARD_ONLY FOR
		SELECT t.object_id AS TableID, t.schema_id,Idxs.[name],Idxs.object_id,'NC',Idxs.index_id 
			FROM  [sys].[indexes] Idxs JOIN [m2ss].[MSSsmaDmTables] t on t.object_id = Idxs.object_id
			WHERE Idxs.[type] = 2 AND Idxs.[is_disabled] = 0 
			
		OPEN #index_col_cur
		FETCH #index_col_cur INTO @table_id, @schema_id, @index_name, @index_id, @index_type,@index_id
		WHILE(@@FETCH_STATUS <> -1)
		BEGIN
			INSERT [m2ss].[MSSsmaDmNCKeyColumns] (
				object_id,
				key_name,
				key_type,
				key_column_id
			) VALUES (@table_id, @index_name, @index_type,@index_id)			
			
			SET @cmd = N'ALTER INDEX ' +quotename(@index_name)+ ' ON '+ quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id)) + @mode_action
			BEGIN TRY
					EXEC(@cmd)
			END TRY
			BEGIN CATCH
				SET @error_log = @error_log + 'Unable to disable non-clustered index '+quotename(@index_name)+' to the table '+	quotename(schema_name(@schema_id)) + N'.' + quotename(object_name(@table_id))+ char(10) + char(13)
				SET @error_log = @error_log + @cmd + char(10) + char(13)
				SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL ErrorMessage:'+ERROR_MESSAGE()+ char(10) + char(13)	
			END CATCH
			
			FETCH #index_col_cur INTO @table_id, @schema_id, @index_name, @index_id, @index_type,@index_id
		END
	END
END
GO

-- Creating Procedure "m2ss.sp_MSSsmaDmFixConstraints"
CREATE PROCEDURE m2ss.sp_MSSsmaDmFixConstraints
@key_type char(2), 
@mode int, 
@parallel_load int, 
@minimal_logging int, 
@error_log nvarchar(4000) OUT
AS

DECLARE 
@table						sysname, 
@object_id					int,
@constraint					sysname,
@column						sysname,
@columns					nvarchar(4000),
@ref_table					sysname,
@ref_column					sysname,
@ref_columns				nvarchar(4000), 
@mode_action				sysname,
@constraint_type			sysname,
@cmd						nvarchar(4000),
@is_disabled			    bit,
@schema						sysname,
@fkschema					sysname,
@cascade_update_clause		nvarchar(100),
@cascade_delete_clause		nvarchar(100),
@delete_referential_action  int,
@update_referential_action  int

SET @error_log = N''
SET @key_type = UPPER(@key_type)
SET @mode_action = 
	CASE (@mode) 
		WHEN 0 THEN N' NOCHECK ' 
		WHEN 1 THEN N' CHECK ' 
		WHEN 2 THEN N' DROP ' 
		WHEN 3 THEN N' ADD ' 
		WHEN 4 THEN N' DISABLE ' 
		WHEN 5 THEN N' REBUILD ' 
	END
SET @constraint_type = 
	CASE (@key_type) 
		WHEN 'PK' THEN N' PRIMARY KEY NONCLUSTERED '
		WHEN 'UQ' THEN N' UNIQUE NONCLUSTERED ' 
		WHEN 'NF' THEN N' FOREIGN KEY ' 
		WHEN 'FK' THEN N' FOREIGN KEY ' 
	END
	
DECLARE #key_cur CURSOR FORWARD_ONLY FOR
	SELECT DISTINCT o.name, k.object_id, schema_name(o.schema_id), key_name, ro.name, schema_name(ro.schema_id), is_disabled, update_referential_action, delete_referential_action  
		FROM [m2ss].[MSSsmaDmNCKeyColumns] k JOIN sys.objects o on k.object_id = o.object_id JOIN sys.objects ro on k.referenced_object_id = ro.object_id 
		WHERE key_type = @key_type
OPEN #key_cur
FETCH #key_cur INTO @table, @object_id, @schema, @constraint, @ref_table, @fkschema, @is_disabled, @update_referential_action, @delete_referential_action
WHILE (@@FETCH_STATUS <> -1)
BEGIN
	IF (@key_type = 'NC')
	BEGIN
		SET @cmd = N'ALTER INDEX ' + quotename(@constraint) + ' ON ' + quotename(@schema) + N'.' + quotename(@table) + ' REBUILD WITH (MAXDOP=0)'
	END
	ELSE IF (@mode <> 3) -- anything other than add is simple
	BEGIN
		SET @cmd = N'ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table) + @mode_action + N' CONSTRAINT ' + quotename(@constraint)
	END
	ELSE
	BEGIN 
		SET @columns  = N''
		SET @ref_columns = N''
		SET @cmd 
			= N'ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table)
			+ N' WITH NOCHECK' -- adding constriant with NOCHECK always as CHECK constraints is set to false in project settings.
			+ N' ADD CONSTRAINT ' +  quotename(@constraint) + @constraint_type
		DECLARE #keycol_cur CURSOR FORWARD_ONLY FOR
		SELECT c.name, rc.name 
			FROM [m2ss].[MSSsmaDmNCKeyColumns] k 
				JOIN sys.columns c ON k.object_id = c.object_id and k.key_column_id = c.column_id 
				LEFT JOIN sys.columns rc ON k.referenced_object_id = rc.object_id and k.referenced_column_id = rc.column_id 
			WHERE k.object_id = @object_id and key_name = @constraint and k.key_type=@key_type
			ORDER BY k.index_column_id

		OPEN #keycol_cur
		FETCH #keycol_cur INTO @column, @ref_column
		WHILE (@@FETCH_STATUS <> -1)
		BEGIN
			SET @columns = @columns + @column + N',' 
			SET @ref_columns = @ref_columns + @ref_column + N',' 
			FETCH #keycol_cur INTO @column, @ref_column
		END	
		CLOSE #keycol_cur
		DEALLOCATE #keycol_cur
		IF (@key_type = 'NF' or @key_type = 'FK')
		BEGIN
			SET @cascade_update_clause  = N''
			SET @cascade_delete_clause = N''
			SET @cascade_update_clause = 
				CASE (@update_referential_action) 
					WHEN 0 THEN N' ON UPDATE NO ACTION ' 
					WHEN 1 THEN N' ON UPDATE CASCADE ' 
					WHEN 2 THEN N' ON UPDATE SET NULL ' 
					WHEN 3 THEN N' ON UPDATE SET DEFAULT ' 
				END
			SET @cascade_delete_clause = 
				CASE (@delete_referential_action) 
					WHEN 0 THEN N' ON DELETE NO ACTION ' 
					WHEN 1 THEN N' ON DELETE CASCADE ' 
					WHEN 2 THEN N' ON DELETE SET NULL ' 
					WHEN 3 THEN N' ON DELETE SET DEFAULT ' 
				END

			SET @cmd = @cmd + N'(' + LEFT(@columns, LEN(@columns) - 1 ) + N') REFERENCES ' + quotename(@fkschema) + '.' + quotename(@ref_table) + N'(' + LEFT(@ref_columns, LEN(@ref_columns) - 1 ) + N')' + @cascade_update_clause+ @cascade_delete_clause
			IF (@is_disabled = 1)
				SET @cmd = @cmd + N' ALTER TABLE ' + quotename(@schema) + N'.' + quotename(@table) + N' NOCHECK' + N' CONSTRAINT ' + quotename(@constraint)
		END
		ELSE
		BEGIN
			SET @cmd = @cmd + N'(' + LEFT(@columns, LEN(@columns) - 1 ) + N')'
		END
		
	END
		BEGIN TRY
				EXEC(@cmd)
		END TRY
		BEGIN CATCH
			SET @error_log = @error_log + 'Unable to add constraint '+quotename(@constraint)+' to the table '+	quotename(@schema) + N'.' + quotename(@table)+ char(10) + char(13)
			SET @error_log = @error_log + @cmd + char(10) + char(13)
			SET @error_log = @error_log + ' SQL Error Number:'+ cast(ERROR_NUMBER() as varchar(10))+' SQL Error Message:'+ERROR_MESSAGE()+ char(10) + char(13)
		END CATCH
	FETCH #key_cur INTO @table, @object_id, @schema, @constraint, @ref_table, @fkschema, @is_disabled, @update_referential_action, @delete_referential_action
END
CLOSE #key_cur
DEALLOCATE #key_cur
GO

