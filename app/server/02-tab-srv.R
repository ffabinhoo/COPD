### 02 tab

data_filtered_bar <- reactive({
  req(input$var_copd1)
  bdata1 <- ldata %>%
    filter(type  == "incidence")  %>%
    filter(variable == input$var_copd1) %>%
    filter(year != 0)  %>%
    filter(year >= input$var_years1[1]) %>%
    filter(year <= input$var_years1[2]) %>%
    select(year, value, ci, se)
})
title_2 <- paste0("Incidence by Year")

output$barPlot <- highcharter::renderHighchart({
  data_filtered_bar()  %>% 
    hchart(type = "column", hcaes(x = "year", y = "value")) %>%
    hc_title(text = title_2)
    #hc_add_series(data = density(rbeta(1000, 5, 5)), type = "line")
})


output$table_tab1 <-  renderDT({
  data_filtered_bar()
})