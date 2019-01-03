tabItem(
  "tab4",
  fluidRow(
    column(
      width = 9,
      fluidPage(
        h1("Results Summary Stats - Filter", align = "center"),
        plotlyOutput("x2"),
        DT::dataTableOutput("x1"),
        fluidRow(
          p(class = 'text-center', downloadButton('x3', 'Download Filtered Data'))
        )
      )
    )
  )
)
