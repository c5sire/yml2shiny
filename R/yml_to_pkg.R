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


get_out_name <- function (tpl_file, table_name, target_dir) {
  tbl_fil<- stringr::str_replace(tpl_file, "table", table_name)
  file.path(target_dir, tbl_fil)
}

get_ui_type <- function(ui_el){
  stringr::str_split(ui_el, ";")[[1]][1] %>% stringr::str_trim()
}

get_ui_details <- function(ui_el){
  stringr::str_split(ui_el, ";")[[1]][2] %>% stringr::str_trim()
}

get_dict <- function(ll){
  i=1
  ids <- names(ll)
  ent <- character(length(ids))
  for(i in 1:length(ids)){
    z <- paste("\n", names(ll[[i]]), " = '", unlist(ll[[i]]), "'", sep="")
    v <- paste(z, collapse=", ")
    ent[i] <- paste(toupper(ids[i]), " = list(", v, "\n)")
  }

  paste(ent, collapse=",\n ")
}

get_ui_details_slider <- function(ui_el){
  x <- get_ui_details(ui_el)
  x <- stringr::str_split(x, ",")[[1]]
  x <- stringr::str_split(x, "=") %>% unlist
  x <- sapply(x, stringr::str_trim) %>% matrix(ncol=2, byrow=TRUE) %>% as.data.frame
  as.integer(as.character(x[,2]))
}

yml_to_pkg <- function(name="", path=getwd()){
  # read yaml file
  yml <- yaml::yaml.load_file("inst/examples/db.yml")
  # read function templates to init database, tables, etc


  # database files are directly under the directory
  tpl_files <- list.files("inst/templates", "*.R")
  target_dir <- "."

  for(i in 1:n){
    table_name <- names(yml)[i]
    col_defs   <- cols_to_sl3(yml[[i]]$columns)
#     tpl_id <- "inst/templates/init_table.R"
#     tpl <- readLines(tpl_id)
    # eventually as for loop
    n <- length(names(yml))

    for(j in 1:length(tpl_files)){

      tpl <- readLines(file.path("inst/templates", tpl_files[j]))
      out <- whisker::whisker.render(tpl)
      out_id <- get_out_name(tpl_files[j], table_name, target_dir)
      writeLines(out, con = out_id)
      #cat(paste("\twriting", out_id, "\n"))
    }

    # create language lookup dictionary
    dict_defs <- get_dict(yml[[i]]$ll)
    tpl <- readLines(file.path("inst/templates/ui", "ui_dict.R"))
    out_id <- file.path(target_dir, paste("ui_",table_name,"_dict.R", sep="" ))
    out <- whisker::whisker.render(tpl)
    writeLines(out, con = out_id)

    # create ui elements based on yml declarations in ui
    columns <- names(yml[[i]]$ui)
    #cat(columns)
    for(j in 1:length(columns)) {
      column <- columns[j]
      ui_type = get_ui_type(yml[[i]]$ui[[column]])
      #cat(ui_type)
      if(ui_type == "select"){
        choices = get_ui_details(yml[[i]]$ui[[column]])
        tpl <- readLines(file.path("inst/templates/ui", "select.R"))
        out_id <- file.path(target_dir, paste0("ui_", column,".R" ))
        out <- whisker::whisker.render(tpl)
        writeLines(out, con = out_id)
        #cat(paste("\twriting", out_id, "\n"))
      }
      if(ui_type == "slider"){
        choices = get_ui_details(yml[[i]]$ui[[column]])
        tpl <- readLines(file.path("inst/templates/ui", "slider.R"))
        out_id <- file.path(target_dir, paste0("ui_", column,".R" ))
        y<- get_ui_detais_slider(yml[[i]]$ui[[column]])
        column_min <- y[1]
        column_max <- y[2]
        column_default <- y[3]
        out <- whisker::whisker.render(tpl)
        writeLines(out, con = out_id)
        #cat(paste("\twriting", out_id, "\n"))
      }
    }

  }
  # read shiny templates to create shiny fragment and shiny app
}



# standard functions: add one record, update one record
# add dictionary function

# internally: check on import that the excel table headers match the definition file!
# also on import: option to batch replace or add from an excel file!


# Next create shiny functions by ui_element, grouped into forms, editable table and a whole example
# with linked lookup tables.
# other features: import/export to excel files. One table per sheet.

# use devtools::in_dir to create a new package per database!




