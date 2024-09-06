## SQL
Educational links to articles and guides on SQL. Queries and notation commonly needed are in the files above.

## What Does This Repository Have?

* [Cross and Outer Apply](#cross-and-outer-apply)
* [Information Schema](#information-schema)
* [Pivot Tables & Dynamic Pivot Tables](#pivot-tables-and-dynamic-pivot-tables)
* [Sequencing](#sequencing-analytics)
* [Wildcards](#wildcard-characters)
* [Window Functions](#window-functions)

## Cross and Outer Apply

**Guide to T-SQL APPLY Operator** [[Website](https://thwack.solarwinds.com/groups/data-driven/b/blog/posts/what-is-sql-cross-apply-guide-to-t-sql-apply-operator)]
* Detailed outline of how CROSS APPLY and OUTER APPLY worok.
* These joins allow for values to be passed from a table or view into a user-defined function or subquery. For example, in a table of product types, the sum of all transactions from another table based on the product type can be added to each row.

## Information Schema

**Get the Data Type of Columns in SQL Server** [[Website](https://datatofish.com/data-type-columns-sql-server/)]
* How to get table information such as table names, table column names, and column data types from a table catalog.

## Pivot Tables and Dynamic Pivot Tables

**Dynamic Pivot Tables in SQL Server** [[Website](https://www.sqlshack.com/dynamic-pivot-tables-in-sql-server/)]
* Guide on how to build regular and dynamic pivot tables.
* Dynamic tables are used when it's not feasible/possible to hardcode all of the columns that we need to pivot on.

**Prefix Column Names When Using Dynamic Pivot** [[Stack Overflow](https://stackoverflow.com/questions/40028251/prefix-column-names-when-using-dynamic-pivot)]
* How to add a prefix to new columns in a dynamic pivot table.

## Sequencing Analytics

**A Beginner's Guide to Sequence Analytics in SQL** [[Website](https://www.motifanalytics.com/posts/a-beginners-guide-to-sequence-analytics-in-sql)]
* Creating a sequence of events; order of events, next event, lag until next event, etc.

## Wildcard Characters

**SQL Wildcard Characters** [[Website](https://www.w3schools.com/sql/sql_wildcards.asp)]
* Wildcard characters are used with the LIKE operator to search for a specified pattern in a column.

## Window Functions

**Introduction to T-SQL Window Functions** [[Website](https://www.red-gate.com/simple-talk/databases/sql-server/t-sql-programming-sql-server/introduction-to-t-sql-window-functions/)]
* Overview of basic window functions including:
  * ROW_NUMBER
  * PARTITIONING
  * RANK
  * DENSE_RANK
  * Window aggregates
  * LAG
  * LEAD
 
The file [window_functions.md](window_functions.md) contains a short writeup demonstrating the functions explained in the article.

# Files
[adding_columns.md](adding_columns.md)
* How to add a column to an existing table.

[dates.md](dates.md)
* Select statements to reference difference dates in time, such as the first date of last month.

[indexing.md](indexing.md)
* Basic overview of indexes; what they are and how to create/delete them from a table.

[query_template.sql](query_template.sql)
* Template for creating a query; author, tables used, purpose, revision history, etc.

[window_functions.md](window_functions.md)
* Overview of basic window functions.
