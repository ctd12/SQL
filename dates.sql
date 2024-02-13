DECLARE @ThisDate datetime;
SET @ThisDate = getdate(); 

-- DAY
select dateadd(dd, datediff(dd, 0, @ThisDate), 0)     -- Beginning of this day
select dateadd(dd, datediff(dd, 0, @ThisDate) + 1, 0) -- Beginning of next day
select dateadd(dd, datediff(dd, 0, @ThisDate) - 1, 0) -- Beginning of previous day

-- WEEK
select dateadd(wk, datediff(wk, 0, @ThisDate), 0)     -- Beginning of this week (Monday)
select dateadd(wk, datediff(wk, 0, @ThisDate) + 1, 0) -- Beginning of next week (Monday)
select dateadd(wk, datediff(wk, 0, @ThisDate) - 1, 0) -- Beginning of previous week (Monday)

-- MONTH
select dateadd(mm, datediff(mm, 0, @ThisDate), 0)     -- Beginning of this month
select dateadd(mm, datediff(mm, 0, @ThisDate) + 1, 0) -- Beginning of next month
select dateadd(mm, datediff(mm, 0, @ThisDate) - 1, 0) -- Beginning of previous month
select convert(date, dateadd(d, -(day(@ThisDate)), @ThisDate), 0) -- End of previous month

-- QUARTER
select dateadd(qq, datediff(qq, 0, @ThisDate), 0)     -- Beginning of this quarter (Calendar)
select dateadd(qq, datediff(qq, 0, @ThisDate) + 1, 0) -- Beginning of next quarter (Calendar)
select dateadd(qq, datediff(qq, 0, @ThisDate) - 1, 0) -- Beginning of previous quarter (Calendar)

-- YEAR
select dateadd(yy, datediff(yy, 0, @ThisDate), 0)     -- Beginning of this year
select dateadd(yy, datediff(yy, 0, @ThisDate) + 1, 0) -- Beginning of next year
select dateadd(yy, datediff(yy, 0, @ThisDate) - 1, 0) -- Beginning of previous year
