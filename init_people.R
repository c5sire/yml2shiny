init_people <- function(db_name){
  if(is.null(db_name)) stop("Path is NULL.")


  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)

  if(!dbExistsTable(db, "people")){
    dbSendQuery(conn = db,
    "CREATE TABLE people
    (
    id INTEGER,
 first_name TEXT,
 last_name TEXT,
 age INTEGER,
 birthday TEXT
    )")

  }

}



