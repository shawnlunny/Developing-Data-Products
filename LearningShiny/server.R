library(shiny)
library(shinyjs)
library(dplyr)
data("women")

shinyServer(function(input, output, session) {

  #reuse the model
  runModel <- function(){
    model <- lm(weight ~ height, data = women)
  }
  
  pred <- function(){
    predict(runModel(), newdata=data.frame(height = input$height))
  }
  
  #predict on our model
  runPred <- reactive({
    #add validation for bad inputs
    validate(
      need(input$height != "", "Please enter a valid number")
    )
    pred()
  })
  
  #The data point and associated display text size gets bigger or smaller based on the persons weight
  runPlot <- function(){
    output$plot <- renderPlot({
      plot(women$height, women$weight, xlab = "Height (in)", ylab = "Weight (lbs)", type="l", bty="n", pch=16)
      points(input$height, pred(), col="red", pch=16, cex=pred()/60)
      text(input$height, pred(), labels=round(runPred(), digits=2), pos=3, font=2, col="blue", cex=pred()/60)
      abline(coef(runModel()), col="blue", lwd=2)
    })
  }
  
  runPlot()
  
  #save new data entry
  observeEvent(input$addData, {
    #add validation for bad inputs
    validate(
      need(input$addh != "" && input$addw != "", "Please enter valid numbers for weight and height")
    )
    
    women <- rbind(women, c(input$addh, input$addw))
    women <<- arrange(women, height, weight)
    
    runPlot()
    
    output$status <- renderText("Data point successfully added.")
    #Clear message to prepare for next data point
    delay(2000, hide("status"))
    show("text")
    
  })
  
})