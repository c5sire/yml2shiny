post_{{table_name}} <- function(dataframe, db_name){
  if(is.null(db_name)) stop("Path is NULL.")
  if(!file.exists(db_name)) stop("Database file does not exist.")
  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)
  if(!dbExistsTable(db_name, "{{table_name}}")){
    init_{{table_name}}(file_name)
  }
  RSQLite::dbWriteTable(db, "{{table_name}}", dataframe)

}
