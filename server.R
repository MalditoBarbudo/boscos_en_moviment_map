#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(mapview)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  load('global_map.RData')
   
  output$bem_map <- renderLeaflet({
    
    global_map
    
  })
  
})
