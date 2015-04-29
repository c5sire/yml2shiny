init_people <- function(path){
  if(is.null(path)) return(FALSE)
  db <- RSQLite::dbConnect(RSQLite::SQLite(), path)

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
    #dbDisconnect(db)
  }

}


