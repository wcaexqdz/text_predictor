#
# This is the UI of a text predictor app
# It asks the user for input which is a string of words
# It outputs the predicted next word
# 

library(shiny)
source("model.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Text predictor"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("typed", "Type some text here:")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h4("prediction:"),
            textOutput("pred")
        )
    )
))
