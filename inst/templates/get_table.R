get_{{table_name}} <- function(db_name=NULL) {
  if(is.null(db_name)) stop("Path is NULL.")
  if(!file.exists(db_name)) stop("Database file does not exist.")
  # setup connection
  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)
  # if not exists table create an empty one
  if(!dbExistsTable(db, "{{table_name}}")){
    init_{{table_name}}(db_name)
  }

# return the whole table (or maybe the first x records???)
RSQLite::dbReadTable(db, "{{table_name}}")

}
