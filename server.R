library(shiny)

source("ui_people_dict.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  observe({
    c_lang <- input$ui_lang

    updateSelectInput(session, "people_last_name",
                    label = ui_people_dict()[["LAST_NAME"]][[c_lang]])

    updateSliderInput(session, "people_age",
                      label = ui_people_dict()[["AGE"]][[c_lang]])
  })
})
