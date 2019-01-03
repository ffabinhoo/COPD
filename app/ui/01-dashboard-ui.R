tabItem(
  "dashboard",
  fluidRow(
    column(
      width = 9,
      fluidRow(
        valueBoxOutput("box_1"),
        valueBoxOutput("box_2"),
        valueBoxOutput("box_3")
      ),
      fluidRow(
        box(
          width = 12,
          plotlyOutput(
            "linePlot",
            
            height = 500
          )
        )
      )
    ),
    box(
      width = 3,
      title = "COPD Variables",
      radioButtons(
        "var_copd",
        label = NULL,
        choices = copd,
        inline = TRUE
      )
    ),
    box(
      width = 3,
      title = "Types",
      radioButtons(
        "var_type",
        label = NULL,
        choices = typeStudy,
        inline = TRUE
      )
    ),
    box(
      width = 3,
      title = "Years",
      sliderInput("var_years", "Range:",
                  min = 1, max = max(years),
                  step = 1,
                  value = c(1,max(years)))
    ),
    box(
      width = 3,
      title = "Data Filters - Scenarios",
      shinyWidgets::pickerInput(
        inputId = "var_scenario", 
        label = "Scenarios", 
        choices = scen, 
        options = list(`actions-box` = TRUE), 
        multiple = TRUE,
        selected = scen
      )
    )
  )
)