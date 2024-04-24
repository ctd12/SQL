## T-SQL Window Functions

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

### Basic Row Numbering

Without a PARTITION BY clause, each row will be assigned a different row number, ordered by the ORDER BY clause. ORDER BY must be present.

```sql
SELECT
	Col1,
	Col2,
	ROW_NUMBER() OVER(ORDER BY Col1) as RowNumber
FROM #Duplicates
```

|      | Col1 | Col2 | RowNumber |
| ---- | ---- | ---- | --------- |
| 1    | 1    | A    | 1         |
| 2    | 1    | B    | 2         |
| 3    | 2    | B    | 3         |
| 4    | 2    | B    | 4         |
| 5    | 3    | C    | 5         |
| 6    | 4    | D    | 6         |
| 7    | 4    | D    | 7         |
| 8    | 5    | E    | 8         |
| 9    | 5    | E    | 9         |
| 10   | 5    | E    | 10        |

### Partitioning by One Column

Partitioning restarts the count when a new value is introduced for each PARTITION BY column value.

The below query will assign a row number for each row, with the row number resetting to 1 after a new value is introduced in Col1, the PARTITION BY column. The ORDER BY clause orders the table by Col1 before the rows are numbered:

```sql
SELECT
	Col1,
	Col2,
	ROW_NUMBER() OVER(PARTITION BY Col1 ORDER BY Col1) as RowNumber
FROM #Duplicates
```

|      | Col1 | Col2 | RowNumber |
| ---- | ---- | ---- | --------- |
| 1    | 1    | A    | 1         |
| 2    | 1    | B    | 2         |
| 3    | 2    | B    | 1         |
| 4    | 2    | B    | 2         |
| 5    | 3    | C    | 1         |
| 6    | 4    | D    | 1         |
| 7    | 4    | D    | 2         |
| 8    | 5    | E    | 1         |
| 9    | 5    | E    | 2         |
| 10   | 5    | E    | 3         |

### Partitioning by All Columns

Partitioning by each column will restart the row numbers for each unique set of rows.

You can identify the unique rows by finding those with a row number equal to one.

```sql
SELECT
	Col1,
	Col2,
	ROW_NUMBER() OVER(PARTITION BY Col1, Col2 ORDER BY Col1) as RowNumber
FROM #Duplicates
```

|      | Col1 | Col2 | RowNumber |
| ---- | ---- | ---- | --------- |
| 1    | 1    | A    | 1         |
| 2    | 1    | B    | 1         |
| 3    | 2    | B    | 1         |
| 4    | 2    | B    | 2         |
| 5    | 3    | C    | 1         |
| 6    | 4    | D    | 1         |
| 7    | 4    | D    | 2         |
| 8    | 5    | E    | 1         |
| 9    | 5    | E    | 2         |
| 10   | 5    | E    | 3         |

### RANK, DENSE_RANK

Using the same temp table as above, RANK and DENSE_RANK can be used to rank the rows.

```sql
SELECT
	Col1,
	Col2,
	ROW_NUMBER() OVER(ORDER BY Col1) as [RowNumber],
	RANK() OVER(ORDER BY Col1) as [Rank],
	DENSE_RANK() OVER(ORDER BY Col1) as [DenseRank]
FROM #Duplicates
```

|      | Col1 | Col2 | RowNumber | Rank | DenseRank |
| ---- | ---- | ---- | --------- | ---- | --------- |
| 1    | 1    | A    | 1         | 1    | 1         |
| 2    | 1    | B    | 1         | 1    | 1         |
| 3    | 2    | B    | 1         | 3    | 2         |
| 4    | 2    | B    | 2         | 3    | 2         |
| 5    | 3    | C    | 1         | 5    | 3         |
| 6    | 4    | D    | 1         | 6    | 4         |
| 7    | 4    | D    | 2         | 6    | 4         |
| 8    | 5    | E    | 1         | 8    | 5         |
| 9    | 5    | E    | 2         | 8    | 5         |
| 10   | 5    | E    | 3         | 8    | 5         |

To explain the difference, think of ROW_NUMBER as positional. RANK is both positional and logical. Those two rows are ranked logically the same, but the next row is ranked by the position in the set. DENSE_RANK ranks them logically; Col1: 3 is the 3rd unique date.

## Window Aggregates



## Notes

References:
<br>https://www.red-gate.com/simple-talk/databases/sql-server/t-sql-programming-sql-server/introduction-to-t-sql-window-functions/
