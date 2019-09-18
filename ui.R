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
    titlePanel("BMI Calculator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            helpText("This app will help you to find out your BMI index"),            
            br(),           
            numericInput("ing_weight_kg",label = h4("Weight (kg)"),min = 40, max = 300,0), #, value = 70
            br(),
            numericInput("int_height_cm",label = h4("Height (cm)"),min = 50, max = 250,0), #,value = 170
            br(),
            
            br(),   
            actionButton("FindBMI", label = "Enter")    
            
            
        ),
        mainPanel
        (
            tabsetPanel
            (
                tabPanel("BMI Result",
                         p(h4("Your BMI result:")),
                         textOutput("BMI_result"),
                         br(),
                         p(h4("Classification:")),
                         textOutput("status_indicator")
                         
                ),
                tabPanel(
                    "Documentation",
                    p(h4("BMI app")),
                    br(),
                    helpText("This app calculates a person BMI based on weight and height")
                )
                
                
            )
        )
    )
))

