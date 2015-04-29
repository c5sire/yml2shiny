get_{{table_name}} <- function(db_path=NULL) {
  if(is.null(path)) stop("Path is NULL.")
  if(!file.exists(path)) stop("Database file does not exist.")
  # setup connection
  db <- RSQLite::dbConnect(RSQLite::SQLite(), path)
  # if not exists table create an empty one
  if(!dbExistsTable(db, "{{table_name}}")){
    init_{{table_name}}(db_path)
  }

# return the whole table (or maybe the first x records???)
RSQLite::dbReadTable(db, "{{table_name}}")
  dbDisconnect(db)
}
