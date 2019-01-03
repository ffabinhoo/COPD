### 02 tab

data_incidence_grouped <- reactive({
  req(input$var_copd2)
  incidence_grouped <- incidence %>% 
    group_by(year) %>% 
    summarise_all(funs(mean) ) %>%
    filter(year!=0) %>%
    select(year,n,COPD1,COPD2,COPD3)
  
})


output$barPlot2 <- renderPlotly({
  g<-ggplot(data_incidence_grouped(), aes_string("year",input$var_copd2), fill=input$var_copd2) + ggtitle("Incidence by Variable")
  g<-g+geom_col()
  g<-g+stat_smooth(aes_string(y=input$var_copd2,x="year"),method="gam",se=FALSE,formula=y~s(x,k=7),color="red")
  g
  ggplotly(g)
  
})

output$table_tab2 <-  renderDT({
  data_incidence_grouped()
})