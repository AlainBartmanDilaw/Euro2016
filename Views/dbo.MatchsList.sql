SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[MatchsList]
AS
SELECT m.Idt
     , m.Number
     , m.Groups_Cod
     , m.[Schedule Date] ScheduleDate
     , p.Idt     Phase_Idt
     , p.Lbl     Phase_Lbl
     , s.Nom     Stadium_Name
     , t.Nom     Town_Name
     , th.Cod    Team_Home
     , th.Lbl    Team_Home_Label
     , mh.Score  Score_Home
     , ta.Cod    Team_Away
     , ta.Lbl    Team_Away_Label
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
