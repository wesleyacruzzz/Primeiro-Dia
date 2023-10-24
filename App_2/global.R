## PACOTES E FUNÇÕES ###########################################################

library(DT)
library(shiny)
library(tidyverse)
library(shinydashboard)

plot_reativo <- function(data,variavel,slider=NULL){
  DF_REACT <- data %>% 
    mutate(VAR = !!as.symbol(variavel))
  
  if(is.factor(DF_REACT$VAR)){
    ggplot(DF_REACT)+
      geom_bar(aes(x=VAR),color="white",fill = "grey50")+
      labs(y="Frequência",x = variavel,
           title = paste("Gráfico de barras de",variavel))+
      theme_light()+
      theme(panel.grid = element_blank())
  } else {
    ggplot(DF_REACT)+
      geom_histogram(aes(x=VAR),color="white",fill = "grey50",
                     bins = slider)+
      labs(y="Frequência",x = variavel,
           title = paste("Histograma de",variavel))+
      theme_light()+
      theme(panel.grid = element_blank())
  }
}

## DADOS #######################################################################

DF <- mtcars %>% 
  mutate(
    TIPO_CARRO = row.names(.),
    cyl = as.factor(cyl),
    vs = as.factor(vs),
    am = as.factor(am),
    gear = as.factor(gear),
    carb = as.factor(carb))

row.names(DF) <- NULL  