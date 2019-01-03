tabItem(
  "tab1",
  fluidRow(
    column(
      width = 9,
      fluidRow(
        valueBoxOutput("paid_box1"),
        valueBoxOutput("case_box1"),
        valueBoxOutput("reported_box1")
      ),
      fluidRow(
        box(
          width = 12,
          highcharter::highchartOutput(
            "barPlot",
            height = 500
          )
        ) 
      ),
      fluidRow(
        box(width = 12,
            DT::dataTableOutput("table_tab1")
        )
      )
    ),
    box(
      width = 3,
      title = "COPD Variables",
      radioButtons(
        "var_copd1",
        label = NULL,
        choices = copd,
        inline = TRUE
      )
    ),
    box(
      width = 3,
      title = "Years",
      sliderInput("var_years1", "Range:",
                  min = 1, max = max(years),
                  step = 1,
                  value = c(1,max(years)))
    )
  )
)
