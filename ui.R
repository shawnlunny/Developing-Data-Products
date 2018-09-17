library(shiny)
library(shinyjs)
library(dplyr)
data("women")

shinyUI(fluidPage(
  useShinyjs(),
  
  #Inspired by carnival games that attempt to predict your weight based on your height
  
  titlePanel("Predict women's weight by their height"),

  sidebarLayout(
    sidebarPanel(
      h3("Enter height to see live weight prediction"),
      numericInput("height", "Height (in inches)", value = 65),
      h3("Add new data points (smarter predictions over time)"),
      wellPanel(
        numericInput("addh", "Height (in inches)", value = 60, min = 24, max = 92),
        numericInput("addw", "Weight (in lbs)", value = 120, min = 60, max = 300),
        actionButton("addData", "Add new data point")
      )       
    ),
    
    mainPanel(
      plotOutput("plot"),
      textOutput("status")
    )
  )
))