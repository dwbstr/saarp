#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  values <- reactiveValues()
  
    observe({
      input$CalcCalories
      values$calories <- isolate({
        input$fat_weight * 9.0 + input$protien_weight*4.0 + input$carb_weight*4.0         
      })
    })
    
    # Display in right pannel of frontend
    output$current_fats <- renderText({
      input$CalcCalories
      paste("Fats (gms): ", isolate(input$fat_weight))
    })
    
    output$current_protien <- renderText({
      input$CalcCalories
      paste("Protien (gms): ", isolate(input$protien_weight))
    })
    
    output$current_carbs <- renderText({
      input$CalcCalories
      paste("Carbs (gms): ", isolate(input$carb_weight))
    })
    
    # Display your BMI
    output$cc_result <- renderText({
      if(input$CalcCalories == 0) ""
      else
        paste("Your total calories count is: ", values$calories)
    })
})
