post_people <- function(dataframe, db_name){
  if(is.null(db_name)) stop("Path is NULL.")
  if(!file.exists(db_name)) stop("Database file does not exist.")
  db <- RSQLite::dbConnect(RSQLite::SQLite(), db_name)
  if(!dbExistsTable(db_name, "people")){
    init_people(file_name)
  }
  RSQLite::dbWriteTable(db, "people", dataframe)

}
