library(shiny)

# É recomendado começar com a função 'fluidPage' que deixa toda a visualização 
# reativa ao mudar as dimensões da tela
fluidPage(
  titlePanel("Meu primeiro aplicativo"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider",
                  "Número de barras",
                  min = 3,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput("histograma")
    )
  )
)