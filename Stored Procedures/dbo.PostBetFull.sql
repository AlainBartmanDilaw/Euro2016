SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostBetFull]
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
