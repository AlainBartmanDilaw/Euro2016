SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostBet]
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
