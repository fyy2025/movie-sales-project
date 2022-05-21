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
shinyUI(
  fluidPage(

    # Application title
    titlePanel("International and domestic sales for movies of different genres"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
      
      #Part of "sidebarLayout"
      sidebarPanel(
        helpText("Instructions: Select Genres"),
        br(),
        #Input to Enter Name
        textInput(inputId="name",label="First Name"),
        
        #Input to Select Genre
        uiOutput(outputId="OUTgenre"),
        
        #Submit Button For Updates
        submitButton("Let's go!")
      ),

      # Show a plot of the generated distribution
      mainPanel(
          
            #First Tab Gives a Preview of the Data Selected
                     h2("Synopsis"),
                     br(),
                     h4(textOutput("OUTsynopsis1")),
                     h4(textOutput("OUTsynopsis2")),
                     br(),
                     plotOutput("OUTpreview"),
                     br()
        
      )
    )
  )
)
