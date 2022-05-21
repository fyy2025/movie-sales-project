#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
movie6=read_csv("/Users/fanyiyang/Desktop/UNC/Course/Stor320/Final\ Project/FINAL_MOVIE.csv")
names(movie6)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  #Build Input Based Off Genre Names 
  output$OUTgenre <- renderUI({
    selectizeInput(inputId='INgenre',
                   label="Available Genres",
                   choices=names(movie6)[14:29],
                   selected="Action",
                   multiple=TRUE,
                   options=list())
  })
  
  #Display the Options Selected By the User
  output$OUTsynopsis1<-renderText({
    expr=paste("User:",input$name)
  })
  output$OUTsynopsis2<-renderText({
    expr=paste("Genre Selected:",paste(input$INgenre,collapse=", "))
  })
  
  #Part 1: Create a Graph Previewing Data
  output$OUTpreview<-renderPlot({
    part=movie6
    for (genre in input$INgenre){
      i=which(genre==names(part))
      part=part[part[[i]]==1,]
    }
    part %>% 
      mutate(dom=domestic_sales/1000000,intl=international_sales/1000000,
             compare=dom>intl)%>%
      select(dom,intl,compare) %>% 
      ggplot()+
      geom_point(aes(x=dom,y=intl,col=compare))+
      xlab("Domestic Sales in million dollars")+
      ylab("International Sales in million dollars")+
      scale_color_discrete(name="Higher Sales",labels=c("International","Domestic"))
  })

})
