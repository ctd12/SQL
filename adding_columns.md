## Adding a Column to an Existing Table

Create a temp table:

```sql
DROP TABLE IF EXISTS #Duplicates;

CREATE TABLE #Duplicates
(
	Col1 INT,
	Col2 VARCHAR(1)
);

INSERT INTO #Duplicates (Col1, Col2) VALUES
(1,'A'),(1,'B'),(2,'B'),(2,'B'),(3,'C');

SELECT * FROM #Duplicates;
```

|      | Col1 | Col2 |
| ---- | ---- | ---- |
| 1    | 1    | A    |
| 2    | 1    | B    |
| 3    | 2    | B    |
| 4    | 2    | B    |
| 5    | 3    | C    |
