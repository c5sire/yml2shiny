init_adress <- function(db_name){
  if(is.null(db_name)) stop("Path is NULL.")


  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)

  if(!dbExistsTable(db, "adress")){
    dbSendQuery(conn = db,
    "CREATE TABLE adress
    (
    id INTEGER,
 id_people INTEGER,
 type TEXT,
 city TEXT,
 country TEXT
    )")

  }

}



