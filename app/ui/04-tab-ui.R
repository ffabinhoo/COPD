tabItem(
  "tab3",
  fluidRow(
    column(
      width = 9,
      fluidRow(
        valueBoxOutput("3box_1"),
        valueBoxOutput("3box_2"),
        valueBoxOutput("3box_3")
      ),
      fluidRow(
        box(
          width = 12,
          plotlyOutput(
            "barPlot3",
            height = 500
          )
        )
      ),
      fluidRow(
        box(width = 12,
            DT::dataTableOutput("table_tab3")
        )
      )
    ),
    box(
      width = 3,
      title = "COPD Variables",
      radioButtons(
        "var_copd3",
        label = NULL,
        choices = copd,
        inline = TRUE
      )
    ),
    box(
      width = 3,
      title = "Types",
      radioButtons(
        "var_type3",
        label = NULL,
        choices = typeStudy,
        inline = TRUE
      )
    ),
    
    
    box(
      width = 3,
      title = "Data Filters - Scenarios",
      selectInput(inputId = "var_scenario3", 
                  label = "Scenarios",
                  choices = scen, 
                  selected = scen[1])
    )
  )
)
