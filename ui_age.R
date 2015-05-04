source("ui_people_dict.R")

#' ui_age
#'
#' A shiny user interface fragment to select a value for age.
#'
#' @note This function is programmatically generated. Change with care.
#'
#' @return an input element
#' @family shiny_ui
#' @author Reinhard Simon
#' @export
ui_age <- function () {
  shiny::sliderInput("people_age",
                     ui_dict()[[toupper("age")]][["en"]],
                     min=1,
                      max = 140,
                      value = 20)
}
