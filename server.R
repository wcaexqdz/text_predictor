#
# This is the server for the app
# It calls the prediction from the model
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$pred <- renderText({
        pred(input$typed)
    })

})
