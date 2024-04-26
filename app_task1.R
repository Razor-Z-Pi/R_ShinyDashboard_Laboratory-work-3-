library("shiny")
library("shinydashboard")

header <- dashboardHeader(title = "shinydashboard",dropdownMenu(
  type = "message",
  messageItem(
    from = "Друг",
    message = "Hello World!!!",
    icon = icon("user"),
    time = "20:10"),
  messageItem(
    from = "Паша",
    message = "Я php верстальщик",
    icon = icon("user"),
    time = "00:00"))
)

sidebar <- dashboardSidebar(sidebarMenu(
  menuItem("Профиль",tabName = "data"),
  menuItem("Доп. информация",tabName = "special"),
  menuItem("Поддержка",tabName = "helper"),
  menuItem("Вся заполненная информация",tabName = "infoProg")))

body <- dashboardBody(tabItems(
  tabItem(tabName = "data",
          {
            fluidRow(
              box(
                title = "Введите про себя данные!!!",
                textInput("Name", "Имя"),
                textInput("Fname", "Фамилия"),
                textInput("Srname", "Отчество"),
                submitButton("Подтвердить")
              )
            )
          }),
  tabItem(tabName = "special",
          {
            fluidRow(
              box(
                title = "Нам требуется ваша личная информация",
                textInput("number", "Номер телефона"),
                textInput("email", "Ваша почта"),
                textInput("adress", "Ваш город"),
                submitButton("Подтвердить")
              )
            )
          }),
  tabItem(tabName = "helper",
          {
            fluidRow(
              box(
                title = "Нам требуется узнать в чем проблема",
                textInput("yourip", "Введите свою проблему:"),
                numericInput("numyourip", "Введите свой слот проблемы:", min = 1, max = 300, value = 100),
                checkboxInput("ipconfirm", "Вы подтверждаете?", value = FALSE),
                submitButton("Подтвердить")
              )
            )
          }),
  tabItem(tabName = "infoProg",
          {
            fluidRow(
              box(width = 200,h1("Удостоверьтесь в правильности введенной информации")),
              box(h4("Имя"),
                  verbatimTextOutput("outName"),
                  h4("Фамилия"),
                  verbatimTextOutput("outFname"),
                  h4("Отчество"),
                  verbatimTextOutput("outSrname")),
              box(h4("Номер телефона"),
                  verbatimTextOutput("outnumber"),
                  h4("Ваша почта"),
                  verbatimTextOutput("outemail"),
                  h4("Ваш город"),
                  verbatimTextOutput("outadress")),
              box(h2("Ваш последнее обращение к поддержки"),
                  verbatimTextOutput("outyourip"),
                  h4("Ваш слот"),
                  verbatimTextOutput("outnumyourip"),
                  h4("Ваше подтверждение ошибки"),
                  verbatimTextOutput("outipconfirm")),
            )
          })
))
ui <- dashboardPage(header, sidebar, body)
server <- function(input, output) {
  output$outName <- renderText({ input$Name })
  output$outFname <- renderText({ input$Fname })
  output$outSrname <- renderText({ input$Srname })
  
  output$outnumber <- renderText({ input$number })
  output$outemail <- renderText({ input$email })
  output$outadress <- renderText({ input$adress })
  
  output$outyourip <- renderText({ input$yourip })
  output$outnumyourip <- renderText({ input$numyourip })
  
  observe({
    if (input$ipconfirm == TRUE){
      output$outipconfirm <- renderText("Подтверждено")
    }else{
      output$outipconfirm <- renderText("Не уверен")
    }
    
  })
  
}
shinyApp(ui, server)

