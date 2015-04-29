init_{{table_name}} <- function(dataframe, path){
  if(is.null(path)) stop("Path is NULL.")
  if(!file.exists(path)) stop("Database file does not exist.")
  if(!dbExistsTable(db, "{{table_name}}")){
    init_{{table_name}}(db_path)
  }
  RSQLite::dbWriteTable(db, "{{table_name}}", dataframe)
  dbDisconnect(db)
  }
