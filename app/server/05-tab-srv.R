### 03 tab

# data_conf_tab5 <- reactive({
#   req(input$var_scenario3)
#   data_conf_tab4 <- ldata %>%
#     filter(type  == input$var_type3)  %>%
#     filter(variable == input$var_copd3) %>%
#     filter(scenario %in% input$var_scenario3) %>%
#     filter(year != 0) %>%
#     select("year","value","type","variable", "scenario")
#   
# })

#m <- reactive({
m <- ldata %>%
  filter(type  == "incidence")  %>%
  filter(variable == "COPD1") %>%
  filter(scenario %in% "basline 100K 10x") %>%
  filter(year != 0) %>%
  select("X1","year","value","type","variable", "scenario")
#})



d <- SharedData$new(m, ~X1)

# highlight selected rows in the scatterplot
output$x2 <- renderPlotly({
  
  s <- input$x1_rows_selected
  
  if (!length(s)) {
    p <- d %>%
      plot_ly(x = ~year, y = ~value, mode = "markers", color = I('black'), name = 'Unfiltered') %>%
      layout(showlegend = T) %>% 
      highlight("plotly_selected", color = I('red'), selected = attrs_selected(name = 'Filtered'))
  } else if (length(s)) {
    pp <- m %>%
      plot_ly() %>% 
      add_trace(x = ~year, y = ~value, mode = "markers", color = I('black'), name = 'Unfiltered') %>%
      layout(showlegend = T)
    
    # selected data
    pp <- add_trace(pp, data = m[s, , drop = F], x = ~year, y = ~value, mode = "markers",
                    color = I('red'), name = 'Filtered')
  }
  
})

# highlight selected rows in the table
output$x1 <- DT::renderDataTable({
  m2 <- m[d$selection(),]
  dt <- DT::datatable(m)
  if (NROW(m2) == 0) {
    dt
  } else {
    DT::formatStyle(dt, "X1", target = "row",
                    color = DT::styleEqual(m2$X1, rep("white", length(m2$X1))),
                    backgroundColor = DT::styleEqual(m2$X1, rep("blue", length(m2$X1))))
  }
})

# download the filtered data
output$x3 = downloadHandler('data-filtered.csv', content = function(file) {
  s <- input$x1_rows_selected
  if (length(s)) {
    write.csv(m[s, , drop = FALSE], file)
  } else if (!length(s)) {
    write.csv(m[d$selection(),], file)
  }
})



