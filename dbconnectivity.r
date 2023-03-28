library(odbc)

# Set up the connection details
con <- dbConnect(odbc(),
                 Driver = "MySQL ODBC 8.0 Unicode Driver",
                 Server = "localhost",
                 Database = "mydatabase",
                 UID = "myusername",
                 PWD = "mypassword")

# Query the database
result <- dbGetQuery(con, "SELECT * FROM mytable")

# Close the connection
dbDisconnect(con)
