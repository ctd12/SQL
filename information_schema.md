## Extracting Table Detail from INFORMATION_SCHEMA

Sometimes it is necessary to view detail on column names or column data types for a certain table(s). It is possible to extract this information with a simple query:

```sql
SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
```
The output for a sample database/table catalog titled "test" would be:

|   TABLE_CATALOG   | TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME | DATA_TYPE |
| ----------------- | ------------ | ---------- | ----------- | --------- |
| test    | dbo    | cars      | brand      | nvarchar |
| test    | dbo    | cars      | price      | int      |
| test    | dbo    | people    | first_name | nvarchar |
| test    | dbo    | people    | last_name  | nvarchar |
| test    | dbo    | people    | age        | int      |
| test    | dbo    | pets      | name       | nvarchar |
| test    | dbo    | pets      | age        | int      |

## Utilizing a WHERE Clause

The above query will extract all information for all tables in that table catalog. However, specific tables and/or column names can be pulled just by using a simple WHERE clause:

```sql
SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'people' and COLUMN_NAME in ('first_name', 'last_name')
```
The output for a sample database/table catalog titled "test" would be:

|   TABLE_CATALOG   | TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME | DATA_TYPE |
| ----------------- | ------------ | ---------- | ----------- | --------- |
| test    | dbo    | people    | first_name | nvarchar |
| test    | dbo    | people    | last_name  | nvarchar |

## Notes

The code in this document is for T-SQL, however the syntax for other databases is very similar.

References:
<br>https://datatofish.com/data-type-columns-sql-server/
