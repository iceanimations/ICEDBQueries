-- select * from ice_project_directory.dbo.Employee WHERE EmployeeName like '%babar%'
--delete from FPEntries where L_UID = 9302418

Declare @code int;
--SET @code=9301019
SET @code=9600154


SELECT * from FPEntries where L_UID = @code
order by C_date, C_time


select top(100) 
	convert(varchar(10), TrackDate, 102) as Date
	,convert(Varchar(10), InOutTime, 108) as Time
	,InOutStatus,
	Employee.EmployeeCode
from attendancedetails join employee on employee.employeeid = attendancedetails.employeeid
where employeecode = convert(varchar, @code)
order by adid desc


SELECT
	DISTINCT
		REPLACE(CONVERT(CHAR(20), CHECKTIME, 102), '.', '') AS C_Date,
		REPLACE(CONVERT(CHAR(20), CHECKTIME, 108), ':', '') AS C_Time,
		(CASE WHEN CHECKTYPE='I' THEN 1 ELSE 2 END) as L_TID,
		CAST(BADGENUMBER AS INT) AS L_UID
	FROM zkt.dbo.CHECKINOUT JOIN zkt.dbo.USERINFO ON zkt.dbo.CHECKINOUT.USERID = zkt.dbo.USERINFO.USERID
	WHERE zkt.dbo.userinfo.badgenumber=@code
	ORDER BY C_Date DESC, C_TIME DESC


SELECT Distinct *
FROM UNIS.dbo.tEnter
WHERE L_UID = @code
ORDER BY C_Date DESC

