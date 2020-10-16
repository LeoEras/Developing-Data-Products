library(shiny)
library(datasets)
library(caret)
library(rattle)

irisData <- iris
modFit <- train(Species ~., method = "rpart", data=irisData) #Fit model

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste(input$variable, " ~ Species", sep="")
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$irisBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = irisData,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        print(modFit$finalModel)
    })
    
    output$irisCT <- renderPlot({
        fancyRpartPlot(modFit$finalModel)
    })
    
})
