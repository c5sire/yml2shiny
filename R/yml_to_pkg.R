cols_to_sl3 <- function(columns){
  cols <- unlist(columns)
  types <-as.vector(cols)
  ff <- function(type) {switch(type,
         integer = "INTEGER",
         real = "REAL",
         string = "TEXT",
         logical = "TEXT",
         date = "TEXT",
         time = "TEXT",
         blob = "BLOB"
         )}
  tt <- unlist(lapply(types, ff))
  paste(names(cols),  tt) %>% paste(collapse = ",\n ")
}


yml_to_pkg <- function(name, path=getwd()){
  # read yaml file
  yml <- yaml::yaml.load_file("inst/examples/db.yml")
  # read function templates to init database, tables, etc
  tpl <- readLines("inst/templates/init_table.R")
  # eventually as for loop
  n <- length(names(yml))
  target_dir <- "."
  tpl_files <- list.files("inst/templates")
  for(i in 1:n){
    table_name <- names(yml)[i]
    col_defs   <- cols_to_sl3(yml[[i]]$columns)

    for(j in 1:length(tpl_files)){

      tbl_fil<- stringr::str_replace(tpl_files[j], "table", table_name)
      tbl_id <- file.path(target_dir, tbl_fil)
      out <- whisker::whisker.render(tpl_files[j])
      writeLines(out, con = tbl_id)
      cat(paste(tpl_files[j], "\twriting", tbl_id, "\n"))
    }
  }
  # read shiny templates to create shiny fragment and shiny app
}

