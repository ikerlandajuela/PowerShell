# Create a database and a table
$Query = "CREATE TABLE NAMES (fullname VARCHAR(20) PRIMARY KEY, surname TEXT, givenname TEXT, BirthDate DATETIME)"
$DataSource = ".\Names.SQLite"

Invoke-SqliteQuery -Query $Query -DataSource $DataSource