#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

shinyUI(fluidPage(
  
  div(class = 'outer',
      tags$head(
        includeCSS("styles.css")
      ),
      leafletOutput("bem_map", width = '100%', height = '100%'))
))
