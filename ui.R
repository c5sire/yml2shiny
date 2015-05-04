library(shiny)

source("ui_age.R")
source("ui_last_name.R")


# Define UI for application that draws a histogram
shinyUI(fluidPage(


  # Application title
  titlePanel("Hello Shiny!"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(

      selectInput("ui_lang",
                  "Choose language",
                  choices = c('English' = 'en', 'German' = 'de', 'Spanish' = 'es')),

      ui_last_name(),
      ui_age()
    ),

    # Show a plot of the generated distribution
    mainPanel(
      #hello::ui_dist_plot()
    )
  )
))
