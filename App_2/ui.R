dashboardPage(
  dashboardHeader(
    title = "Meu primeiro dashboard",
    titleWidth = "300px"
  ),
  dashboardSidebar(
    width = "300px",
    sliderInput("slider","Número de barras",min=3,max=50,value=30),
    selectInput("variavel","Variável",choices = names(DF)[-12],
                selected = names(DF)[1])
  ),
  
  dashboardBody(
    fluidRow(
      column(6,
             plotOutput("plot",height = "400px"),
             br(),
             infoBoxOutput("media",width = 6),
             infoBoxOutput("variancia",width = 6)),
      column(6,dataTableOutput("table",height = "400px"))
    )
  )
)
