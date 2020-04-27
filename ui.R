#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calories Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("This calculator calculates calories based on grams of fats, protein and carbs provided"),            
      br(),           
      numericInput("fat_weight",label = h4("How many grams of fats?"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("protien_weight",label = h4("How many grams of protien?"),min = 0, max = 1000,0), #, value = 70
      br(),
      numericInput("carb_weight",label = h4("How many grams of carbs?"),min = 0, max = 1000,0), #, value = 70
      
      br(),   
      actionButton("CalcCalories", label = "CALCULATE")  
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel
      (
        tabPanel("Calculate the calories consumed",
                 p(h4("Here are your input values ")),
                 textOutput("current_fats"),
                 br(),
                 textOutput("current_protien"),
                 br(),
                 textOutput("current_carbs"),
                 br(),
                 p(h4("Calculation Results")),
                 textOutput("cc_result")
        ),
        tabPanel(
          "Documentation",
          p(h4("Calories Calculator Application")),
          br(),
          helpText("This simple application calculates number of calories consumed based on the fats, protien and carb consumption information provided"),
          p(h3("Why Calories calculation is important?")),
          helpText("Keeping track of your daily calories consumption is the first step in healthy diet")
        )
    )
  )
))
)
