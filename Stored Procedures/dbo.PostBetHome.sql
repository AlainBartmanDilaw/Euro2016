SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostBetHome]
@pMatchsIdt int, 
@pUsrIdt    int,
@pScore     int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	execute dbo.PostBet @pMatchsIdt, @pUsrIdt, 'H', @pScore
END
GO
