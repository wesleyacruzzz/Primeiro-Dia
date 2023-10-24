library(shiny)
library(ggplot2)

function(input, output, session) {
  
  output$histograma <- renderPlot({
    
    ggplot(faithful)+
      geom_histogram(aes(x=waiting),color="white",fill = "grey50",
                     bins = input$slider)+
      theme_light()+
      theme(panel.grid = element_blank())
    
  })
}
