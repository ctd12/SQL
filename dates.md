## Datediff and Dateadd to Retrieve Points in Time

### Day
```sql
DECLARE @ThisDate datetime;
SET @ThisDate = getdate(); 

select dateadd(dd, datediff(dd, 0, @ThisDate), 0)       -- Beginning of this day
select dateadd(dd, datediff(dd, 0, @ThisDate) + 1, 0)   -- Beginning of next day
select dateadd(dd, datediff(dd, 0, @ThisDate) - 1, 0)   -- Beginning of previous day
```
### Week
```sql
DECLARE @ThisDate datetime;
SET @ThisDate = getdate();

select dateadd(wk, datediff(wk, 0, @ThisDate), 0)       -- Beginning of this week (Monday)
select dateadd(wk, datediff(wk, 0, @ThisDate) + 1, 0)   -- Beginning of next week (Monday)
select dateadd(wk, datediff(wk, 0, @ThisDate) - 1, 0)   -- Beginning of previous week (Monday)
```
### Month
```sql
DECLARE @ThisDate datetime;
SET @ThisDate = getdate();

select dateadd(mm, datediff(mm, 0, @ThisDate), 0)                   -- Beginning of this month
select dateadd(mm, datediff(mm, 0, @ThisDate) + 1, 0)               -- Beginning of next month
select dateadd(mm, datediff(mm, 0, @ThisDate) - 1, 0)               -- Beginning of previous month
select convert(date, dateadd(d, -(day(@ThisDate)), @ThisDate), 0)   -- End of previous month
```
### Quarter
```sql
DECLARE @ThisDate datetime;
SET @ThisDate = getdate();

select dateadd(qq, datediff(qq, 0, @ThisDate), 0)       -- Beginning of this quarter (Calendar)
select dateadd(qq, datediff(qq, 0, @ThisDate) + 1, 0)   -- Beginning of next quarter (Calendar)
select dateadd(qq, datediff(qq, 0, @ThisDate) - 1, 0)   -- Beginning of previous quarter (Calendar)
```
### Year
```sql
DECLARE @ThisDate datetime;
SET @ThisDate = getdate();

select dateadd(yy, datediff(yy, 0, @ThisDate), 0)       -- Beginning of this year
select dateadd(yy, datediff(yy, 0, @ThisDate) + 1, 0)   -- Beginning of next year
select dateadd(yy, datediff(yy, 0, @ThisDate) - 1, 0)   -- Beginning of previous year
```
