
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[UsrMatch]
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
