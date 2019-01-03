
header <- dashboardHeader(title = "COPD - Web application - Sax Institute")

sidebar <- dashboardSidebar(sidebarMenu(
  menuItem("COPD - General", tabName = "dashboard", icon = icon("table"))
  ,menuItem("Incidence by Year", tabName = "tab1", icon = icon("chart-bar"))
  ,menuItem("Incidence by Variable", tabName = "tab2", icon = icon("chart-bar"))
  ,menuItem("Scenario - Conf interval", tabName = "tab3", icon = icon("chart-bar"))
  ,menuItem("Results Summary Stats ", tabName = "tab4", icon = icon("chart-bar"))
  
))

body <- dashboardBody(
  
  tabItems(
    source("ui/01-dashboard-ui.R", local = TRUE)$value,
    source("ui/02-tab-ui.R", local = TRUE)$value,
    source("ui/03-tab-ui.R", local = TRUE)$value,
    source("ui/04-tab-ui.R", local = TRUE)$value,
    source("ui/05-tab-ui.R", local = TRUE)$value,
    tabItem(tabName = "table", fluidRow(box(width = 12)))
  )
)

dashboardPage(header, sidebar, body, skin = "black")
