library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(shinyWidgets)
library(tools)
library(reshape2)
library(plotly)
library(tools)
library(tidyverse)
library(dygraphs)
library(highcharter)
library(crosstalk)

#setwd("c:/Users/Fabio/Google Drive/Data Science/Sax Institute/App/AppCOPD/")
ldata <- read_csv("results_summary_stats.csv")

incidence<-read_csv("incidence_Data.csv")

scen <-unique(ldata$scenario)
copd <- c("COPD1", "COPD2", "COPD3")
typeStudy <- unique(ldata$type)
years <- unique(ldata$year)



my_colors <- c("#434348", "#7cb5ec")

hcoptslang <- getOption("highcharter.lang")
hcoptslang$thousandsSep <- ","
options(highcharter.lang = hcoptslang)

valueBox2 <- function (value, subtitle, icon = NULL, color = "#7cb5ec", width = 4, 
                       href = NULL) 
{
  if (!is.null(icon)) 
    
    boxContent <- div(class = "small-box", style = paste0("background-color: ", color, ";"), 
                      div(class = "inner", h3(value), p(subtitle)), if (!is.null(icon)) 
                        div(class = "icon-large", icon))
  if (!is.null(href)) 
    boxContent <- a(href = href, boxContent)
  div(class = if (!is.null(width)) 
    paste0("col-sm-", width), boxContent)
}

hc_btn_options <- list(
  contextButton = list(
    menuItems = list(
      list(
        text = "Export to PDF",
        onclick = JS(
          "function () { this.exportChart({
          type: 'application/pdf'
          }); }"
        )
      ),
      list(
        text = "Export to SVG",
        onclick = JS(
          "function () { this.exportChart({
          type: 'image/svg+xml'
          }); }"
        )
      )
        )
    )
  )

