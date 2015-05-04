source("ui_adress_dict.R")

#' ui_id_people
#'
#' A shiny user interface fragment to select a value for id_people.
#'
#' @note This function is programmatically generated. Change with care.
#'
#' @return an input element
#' @family shiny_ui
#' @author Reinhard Simon
#' @export
ui_id_people <- function () {
  shiny::selectInput("adress_id_people",
                     ui_dict()[[toupper("id_people")]][["en"]],
                     choices = cpeople_id = (last_name, firt_name, sep = ', '))
}
