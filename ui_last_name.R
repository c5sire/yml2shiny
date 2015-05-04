source("ui_people_dict.R")

#' ui_last_name
#'
#' A shiny user interface fragment to select a value for last_name.
#'
#' @note This function is programmatically generated. Change with care.
#'
#' @return an input element
#' @family shiny_ui
#' @author Reinhard Simon
#' @export
ui_last_name <- function () {
  shiny::selectInput("people_last_name",
                     ui_dict()[[toupper("last_name")]][["en"]],
                     choices = c('Simon', 'Rossel', 'Berg'))
}
