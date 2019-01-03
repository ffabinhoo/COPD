### dashboard tab

data_filtered <- reactive({
  req(input$var_scenario)
  ldata1 <- ldata %>%
    filter(type  == input$var_type)  %>%
    filter(variable == input$var_copd) %>%
    filter(scenario %in% input$var_scenario) %>%
   # filter(inrange(input$var_years)) %>%
    filter(year != 0) %>%
    filter(year >= input$var_years[1]) %>%
    filter(year <= input$var_years[2]) %>%
    select("year","value","type","variable", "scenario")
})  

scenario1 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[1]) %>%
    select("year","value", "scenario")
})
scenario2 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[2]) %>%
    select("year","value", "scenario")
})
scenario3 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[3]) %>%
    select("year","value", "scenario")
})
scenario4 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[4]) %>%
    select("year","value", "scenario")
})

scenario5 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[5]) %>%
    select("year","value", "scenario")
})

scenario6 <- reactive({
  data_filtered() %>%
    filter(scenario %in% scen[6]) %>%
    select("year","value", "scenario")
})

dataScenario<- reactive({
  cbind("Scenario 1"=scenario1(),"Scenario 2"=scenario2(),"Scenario 3"=scenario3(),
        "Scenario 4"=scenario4(),"Scenario 5"=scenario5(),"Scenario 6"=scenario6())
})

output$linePlot <- renderPlotly({
  p <- ggplot() + geom_line(aes(y = value, x = year, colour=scenario), data = data_filtered())  + ggtitle("COPD - Dashboard")
  ggplotly(p)
})

output$box_1 <- renderValueBox({
  out <- data_filtered()
  valueBox(
    format(round(mean(out$value), 0), big.mark = ","),
    subtitle = "Average",
    icon = icon("university")
  )
})
output$box_2 <- renderValueBox({
  out <- data_filtered()
  valueBox(
    format(round(sd(out$value), 0), big.mark = ","),
    subtitle = "Standard Deviation",
    icon = icon("university")
  )
})
output$box_3 <- renderValueBox({
  out <- data_filtered()
  se <- function(x) sqrt(var(x)/length(x))
  valueBox(
    format(round(se(out$value), 0), big.mark = ","),
    subtitle = "Standard Error",
    icon = icon("university")
  )
})


output$range <- renderPrint({ input$var_years })