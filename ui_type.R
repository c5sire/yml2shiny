source("ui_adress_dict.R")

#' ui_type
#'
#' A shiny user interface fragment to select a value for type.
#'
#' @note This function is programmatically generated. Change with care.
#'
#' @return an input element
#' @family shiny_ui
#' @author Reinhard Simon
#' @export
ui_type <- function () {
  shiny::selectInput("adress_type",
                     ui_dict()[[toupper("type")]][["en"]],
                     choices = c('home', 'office'))
}
