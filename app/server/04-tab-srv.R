### 03 tab

data_conf_tab4 <- reactive({
  req(input$var_scenario3)
  data_conf_tab4 <- ldata %>%
    filter(type  == input$var_type3)  %>%
    filter(variable == input$var_copd3) %>%
    filter(scenario %in% input$var_scenario3) %>%
    filter(year != 0) %>%
    select("year","value","type","variable", "scenario")
  
})


output$barPlot3 <- renderPlotly({
  h <- ggplot(aes(y = value, x = year, colour=scenario), data = data_conf_tab4()) + 
    geom_ribbon(aes(ymin=value*0.9725, ymax=value*1.0275), fill = "grey70") +
    geom_line(aes(y = value, x = year),colour="#000099") +
    ggtitle("Scenario - Conf Interval")
  
  click_data <- event_data("plotly_click")
  
  select_data <- event_data("plotly_selected", source = "subset")
  print("aqui e...")
  print(select_data)
  
  ggplotly(h)
  
})


dataBarPlot3 <- renderPlotly({
  h <- ggplot(aes(y = value, x = year, colour=scenario), data = data_conf_tab4()) + 
    geom_ribbon(aes(ymin=value*0.9725, ymax=value*1.0275), fill = "grey70") +
    geom_line(aes(y = value, x = year),colour="#000099")
  
  click_data <- event_data("plotly_click")
  select_data <- event_data("plotly_selected", source = "subset")
  
  if (!is.null(select_data)) {
    event.data <- event_data("plotly_selected", source = "subset")
  }else if (!is.null(click_data)) {
    data_conf_tab4()
  }else{
    data_conf_tab4()
  }
})
