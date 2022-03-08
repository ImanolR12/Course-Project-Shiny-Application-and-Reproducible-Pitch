library(shiny)
library(plotly)
library(lubridate)
library(ggplot2)
library(tidyr)
library(dplyr)

shinyServer(function(input, output) {
    data("EuStockMarkets")
    stocks<-as.data.frame(EuStockMarkets) %>%
        gather(index, price) %>%
        mutate(time=rep(time(EuStockMarkets), 4))
    
    
    output$stocks <- renderUI({
        selectInput("index", "Choose a index:", as.list(unique(stocks$index)), 
                    selected = stocks$index)
    }) 
    output$text1 <- renderText({
        paste("You have selected: ", unique(input$index))
    })
    output$plot<-renderPlotly({ 
        dt<-stocks[stocks$index == input$index, ]
        p <- ggplot(data = dt, aes(x = time, y = price)) + geom_line()
    
    p <- ggplotly(p)
        
    
    }
     )  }
)  


