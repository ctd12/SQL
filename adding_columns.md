## Adding a Column to an Existing Table

Create a temp table:

```sql
DROP TABLE IF EXISTS #temp;

CREATE TABLE #temp
(
	Col1 INT,
	Col2 VARCHAR(1)
);

INSERT INTO #temp (Col1, Col2) VALUES
(1,'A'),(1,'B'),(2,'B'),(2,'B'),(3,'C');

SELECT * FROM #temp;
```

|      | Col1 | Col2 |
| ---- | ---- | ---- |
| 1    | 1    | A    |
| 2    | 1    | B    |
| 3    | 2    | B    |
| 4    | 2    | B    |
| 5    | 3    | C    |

Add a column to the table using a CASE statement:

```sql
ALTER TABLE #temp
ADD New_Col AS ( CASE
			WHEN Col1 in (1, 3) THEN 'z'
			ELSE 'r'
		 END);
					
SELECT * FROM #temp;
```

|      | Col1 | Col2 | New_Col |
| ---- | ---- | ---- | ------- |
| 1    | 1    | A    |    z    |
| 2    | 1    | B    |    z    |
| 3    | 2    | B    |    r    |
| 4    | 2    | B    |    r    |
| 5    | 3    | C    |    z    |
