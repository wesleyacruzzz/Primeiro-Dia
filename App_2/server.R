function(input, output, session) {
  
  ## TABELA ####################################################################
  
  plot_reactive <- reactive({
    #DF_REACT <- DF %>% 
    #  select(input$variavel)
    
    #names(DF_REACT) <- "VAR"
    
    plot_reativo(DF,input$variavel,input$slider)
  })
  
  output$plot <- renderPlot({
    
    plot_reactive()
    
  })
  
  ## TABELA ####################################################################
  
  output$table <- renderDataTable({
    
    DF %>% 
      select(TIPO_CARRO,input$variavel)
    
  })
  
  ## INFOBOX MEDIA #############################################################

    media <- reactive({
    
    vetor <- DF %>% pull(input$variavel)
    
    if(is.factor(vetor)){
      infoBox(HTML(paste("Essa variável é um fator, escolha uma",br(),
                         "variável numérica.")),color = "orange",fill = T)
    } else {
      infoBox(title = paste("A média de",input$variavel,"é:",round(mean(vetor),2)),
              fill = T)
    }
  })
  
  output$media <- renderInfoBox({
    media()
  })
  
  ## INFOBOX VARIÂNCIA #########################################################
  
  variancia <- reactive({
    
    vetor <- DF %>% pull(input$variavel)
    
    if(is.factor(vetor)){
      infoBox(HTML(paste("Essa variável é um fator, escolha uma",br(),
                         "variável numérica.")),color = "orange",fill = T)
    } else {
      infoBox(title = paste("A variância de",input$variavel,"é:",round(var(vetor),2)),
              fill = T)
    }
  })
  
  output$variancia <- renderInfoBox({
    variancia()
  })
}
