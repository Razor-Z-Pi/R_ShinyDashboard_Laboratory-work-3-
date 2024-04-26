library("shiny")
library("shinydashboard")
library("ggplot2")

header <- dashboardHeader(title = "USArrests в. - 11")

sidebar <- dashboardSidebar(sidebarMenu(menuItem("Данные",
                                                 tabName = "data"),
                                        menuItem("Вывод",
                                                 tabName = "info")))
body <- dashboardBody(tabItems(
  tabItem(tabName = "data",
          {
            fluidRow(
              box(
                h2("Выборка из набора данных USArrests"),
                sliderInput("Assault", "Атак", 45, 337, c(45,337)),
                sliderInput("Murder", "Убийства", 1, 	17.4, c(1,	17.4)),
                sliderInput("UrbanPop", "Доля городского населения", 7.8, 44.5, c(7.8,44.5)),
              ))
          }),
  tabItem(tabName = "info",
          {
            fluidRow(box(tableOutput("my_table")))
          })
))
ui <- dashboardPage(header, sidebar, body)
server <- function(input, output) {
  output$my_table <- renderTable(subset(USArrests, 
                                        (Assault >= input$Assault[1] & Assault <= input$Assault[2]) &
                                          (Murder >= input$Murder[1] & Murder <= input$Murder[2]) &
                                          (UrbanPop >= input$UrbanPop[1] & UrbanPop <= input$UrbanPop[2])))
}
shinyApp(ui, server)