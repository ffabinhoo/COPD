tabItem(
  "tab2",
  fluidRow(
    column(
      width = 9,
      fluidRow(
        valueBoxOutput("paid_box2"),
        valueBoxOutput("case_box2"),
        valueBoxOutput("reported_box2")
      ),
      fluidRow(
        box(
          width = 12,
          plotlyOutput(
            "barPlot2",
            height = 500
          )
        )
      ),
      fluidRow(
        box(width = 12,
            DT::dataTableOutput("table_tab2")
        )
      )
    ),
    box(
      width = 3,
      title = "COPD Variables",
      radioButtons(
        "var_copd2",
        label = NULL,
        choices = copd,
        inline = TRUE
      )
    )
  )
)
