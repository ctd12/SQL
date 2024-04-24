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
| test    | dbo    | cars      | brand      | nvarchar    |
| test    | dbo    | cars      | price      | int    |
| test    | dbo    | people    | first_name | nvarchar    |
| test    | dbo    | people    | last_name  | nvarchar    |
| test    | dbo    | people    | age        | int    |
| test    | dbo    | pets      | name       | nvarchar    |
| test    | dbo    | pets      | age        | int    |
