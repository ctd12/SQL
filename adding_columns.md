## Adding a Column to an Existing Table

Window functions perform a calculation over a set of rows. The window is defined by the OVER clause which determines if the rows are partitioned into smaller sets and if they are ordered. In fact, if you use a window function you will always use an OVER clause.

The OVER clause may contain a PARTITION BY option. This breaks the rows into smaller sets. You might think that this is the same as GROUP BY, but it’s not. When grouping, one row per unique group is returned. When using PARTITION BY, all of the detail rows are returned along with the calculations.

## Ranking Functions: ROW_NUMBER

Numbers the output of a result set. More specifically, returns the sequential number of a row within a partition of a result set, starting at 1 for the first row in each partition.

One benefit of ROW_NUMBER is the ability to turn non-unique rows into unique rows. This could be used to eliminate duplicate rows, for example.

Create a temp table below that contains duplicate rows:

```sql
DROP TABLE IF EXISTS #Duplicates;

CREATE TABLE #Duplicates
(
	Col1 INT,
	Col2 VARCHAR(1)
);

INSERT INTO #Duplicates (Col1, Col2) VALUES
(1,'A'),(1,'B'),(2,'B'),(2,'B'),(3,'C'),
(4,'D'),(4,'D'),(5,'E'),(5,'E'),(5,'E');

SELECT * FROM #Duplicates;
```

|      | Col1 | Col2 |
| ---- | ---- | ---- |
| 1    | 1    | A    |
| 2    | 1    | B    |
| 3    | 2    | B    |
| 4    | 2    | B    |
| 5    | 3    | C    |
| 6    | 4    | D    |
| 7    | 4    | D    |
| 8    | 5    | E    |
| 9    | 5    | E    |
| 10   | 5    | E    |