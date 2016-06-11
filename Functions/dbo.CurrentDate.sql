
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[CurrentDate] (
)
RETURNS datetime
BEGIN
  -- RETURN '12/06/2016 20:00:00' /* Change to real argument */
  RETURN getdate() /* Change to real argument */
END
GO
