## What is Indexing?

Indexes are used in order to retrieve data from a table more quickly than a table without an index. 

An example of why indexing a table is useful would be to equate it to a glossary/index in a textbook. Were you to search for a key word in a book without an index, you would have to read the entire textbook until you found it. Whereas if the textbook contains an index, you can simply look up the word in there and then navigate to the page that is given, without reading the entire textbook.

Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, it's good practice to only create indexes on columns that will be frequently searched against.

## CREATE INDEX

Creates an index on a table where duplicate values are allowed.

```sql
CREATE INDEX index_name
ON database.schema.table_name (column1, column2, ...);
```

## CREATE UNIQUE INDEX

Creates an index on a table where duplicate values are *not* allowed. This means that no two rows are allowed to have the same index key value.

An example where this could be useful would be a database with users' email addresses. The company can't have multiple users with the same email address.

```sql
CREATE UNIQUE INDEX index_name
ON database.schema.table_name (column1, column2, ...);
```

## DROP INDEX

Deletes an index on a table.

```sql
DROP INDEX index_name
ON database.schema.table_name;
```

## Notes

References:
<br>https://www.w3schools.com/sql/sql_create_index.asp
<br>https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search_unique.html
