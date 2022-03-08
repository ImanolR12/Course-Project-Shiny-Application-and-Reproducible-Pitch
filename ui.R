
library(shiny)
library(plotly)
library(ggplot2)

ui<-fluidPage(
    titlePanel("EUindex"),
    sidebarLayout(
        sidebarPanel( uiOutput("stocks")
        ),  
        mainPanel("Eustocks Graph",
                 h3(textOutput("text1")),
                 plotlyOutput('plot'))
    )
)

