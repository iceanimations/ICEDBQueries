set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[makeDateTime]
(
	-- Add the parameters for the function here
	@c_date CHAR(11),
	@c_time CHAR(12)
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @datetime DATETIME
	DECLARE @time char(12)

	SET @time = @c_time;
	IF LEN(@time) = 6
	BEGIN
		SET @time = SUBSTRING(@time, 1, 2) + ':' + SUBSTRING(@time, 3, 2)+ ':' + SUBSTRING(@time, 5, 2);
	END

	-- Add the T-SQL statements to compute the return value here
	SET @datetime = CAST((@c_date + ' ' + @time) AS DATETIME)

	-- Return the result of the function
	RETURN @datetime

END

