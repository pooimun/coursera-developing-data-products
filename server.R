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
        input$FindBMI
        values$bmi <- isolate({
            input$ing_weight_kg/(input$int_height_cm/100*input$int_height_cm/100)
        })
    })
    
    # Display current values
    output$current_height <- renderText({
        input$FindBMI
        paste("Height (cm):", isolate(input$int_height_cm))
    })
    
    output$current_weight <- renderText({
        input$FindBMI
        paste("Weight (kg):", isolate(input$ing_weight_kg))
    })
    
    output$status_indicator <- renderText({
        if(input$FindBMI ==0)""
        else{
            if (values$bmi < 18.5)
            {
                values$status_indicator = "Underweight"
            }
            else if (values$bmi < 24.9)
            {
                values$status_indicator = "Normal weight"
            }
            else if (values$bmi < 29.9)
            {
                values$status_indicator = "Overweight"
            }
            else
            {
                values$status_indicator = "Obesity"
            }
            
            paste(values$status_indicator)
        }
    })
    
    
    # Display BMI
    output$BMI_result <- renderText({
        if(input$FindBMI ==0)""
        else
            paste(values$bmi)
    })
    
})
