SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		BarmtanDilaw,,Alain Léglise>
-- Create date: 2016-06-04>
-- Description:	Envoi des scores d'un match donné>
-- =============================================
CREATE PROCEDURE [dbo].[PostScore] 
	-- Add the parameters for the stored procedure here
		@pMatchIdt int = 0
	,	@pScoreHome int
	,	@pScoreAway int
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
