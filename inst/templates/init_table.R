init_{{table_name}} <- function(db_name){
  if(is.null(db_name)) stop("Path is NULL.")


  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)

  if(!dbExistsTable(db, "{{table_name}}")){
    dbSendQuery(conn = db,
    "CREATE TABLE {{table_name}}
    (
    {{col_defs}}
    )")

  }

}



