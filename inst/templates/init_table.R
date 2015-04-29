init_{{table_name}} <- function(path){
  if(is.null(path)) stop("Path is NULL.")
  if(!file.exists(path)) stop("Database file does not exist.")

  db <- RSQLite::dbConnect(RSQLite::SQLite(), path)

  if(!dbExistsTable(db, "{{table_name}}")){
    dbSendQuery(conn = db,
    "CREATE TABLE {{table_name}}
    (
    {{col_defs}}
    )")

  }
  dbDisconnect(db)
}



