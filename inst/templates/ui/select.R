source("ui_{{table_name}}_dict.R")

#' ui_{{column}}
#'
#' A shiny user interface fragment to select a value for {{column}}.
#'
#' @note This function is programmatically generated. Change with care.
#'
#' @return an input element
#' @family shiny_ui
#' @author Reinhard Simon
#' @export
ui_{{column}} <- function () {
  shiny::selectInput("{{table_name}}_{{column}}",
                     ui_dict()[[toupper("{{column}}")]][["en"]],
                     choices = c{{choices}})
}
