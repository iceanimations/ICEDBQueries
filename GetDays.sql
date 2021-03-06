set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
-- Function gets all holidays (Weekends and other) in the given time frame
ALTER FUNCTION [dbo].[GetDays](
	@begin_date AS DateTime, 
	@end_date AS DateTime
)
RETURNS @Days TABLE 
(	Date DateTime unique,
	DayName Text NOT NULL  )
AS
BEGIN

	DECLARE @date_counter DateTime

	SET @date_counter = @begin_date
	WHILE @date_counter < @end_date
	BEGIN
		INSERT INTO @Days VALUES (@date_counter, DATENAME(dw, @date_counter))
		SET @date_counter = DATEADD(d,1, @date_counter)
	END --WHILE

RETURN
END
