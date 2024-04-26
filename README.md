# R_ShinyDashboard_Laboratory-work-4
Лабораторная работа №4 – Построение веб-приложений с помощью Shiny Dashboard / Lab work #4 - Building web applications with Shiny Dashboard
______
Цель работы: познакомиться с технологией создания интерактивных веб-приложений с помощью пакета shinydashboard. /
Purpose of work: to get acquainted with the technology of creating interactive web applications with the help of shinydashboard package.
______
Shiny Dashboard представляет технологию создания интерактивных панелей. Пользовательский интерфейс Shiny Dashboard состоит из трех компонентов: header, sidebar и body. /
Shiny Dashboard is a technology for creating interactive panels. The Shiny Dashboard user interface consists of three components: header, sidebar and body.
```R
library(shinydashboard)
header <- dashboardHeader()
sidebar <- dashboardSidebar()
body <- dashboardBody()
ui <- dashboardPage(header, sidebar, body)
server <- function(input, output) {}
shinyApp(ui, server)
```
Для создания нового Shiny Dashboard необходимо определить компоненты интерфейса (функции: dashboardHeader(), dashboardSidebar(), dashboardBody()) и переместить их в пользовательский интерфейс приложения с использованием функции dashboardPage(). 
Работа с серверной частью аналогична работе в стандартных Shiny приложениях. / 
To create a new Shiny Dashboard it is necessary to define interface components (functions: dashboardHeader(), dashboardSidebar(), dashboardBody()) and move them to the user interface of the application using the dashboardPage() function. 
The work with the server part is similar to the work in standard Shiny applications.
____
Установка необходимых пакетов / Installing the necessary packages
```R
install.packages("shiny")
install.packages("rsconnect")
install.packages("shinydashboard")
```
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Подключите пакет rsconnect и запустите функцию rsconnect::setAccountInfo(), чтобы указать свои учетные данные для shinyapps.io / Plug in the rsconnect package and run the rsconnect::setAccountInfo() function to specify your credentials for shinyapps.io
```R
library(rsconnect)
rsconnect::setAccountInfo(name='your_shinyappsio_account_name', 
                          token='your_shinyappsio_token', 
                          secret='your_shinyappsio_secret')
```
Замените your_shinyappsio_account_name, your_shinyappsio_token и your_shinyappsio_secret на свои реальные данные. Вы можете найти свой токен и секрет на сайте shinyapps.io в разделе Tokens / Replace your_shinyappsio_account_name, your_shinyappsio_token and your_shinyappsio_secret with your real data. You can find your token and secret on shinyapps.io under Tokens
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Используйте функцию rsconnect::deployApp() для задеплоя вашего Shiny приложения / Use the rsconnect::deployApp() function to deploy your Shiny application
```R
rsconnect::deployApp('path_to_your_shiny_app')
```
Вместо path_to_your_shiny_app укажите путь к вашему Shiny приложению / Instead of path_to_your_shiny_app, specify the path to your Shiny app
_______________________________________________________________________________________________________________________________________________________
# Практическая часть / Practical part
_____
Задание 1 – С помощью пакета shinydashboard постройте приложение, запрашивающее различную информацию у пользователя на различных вкладках и выводящее результат на отдельной вкладке. В приложении также необходимо показать умение создавать различные меню в Header. Для построения приложения используйте не менее 4 вкладок, каждая из которых должна содержать минимум два поля типа Input.
Задание 2 – Используя исходный набор данных (по варианту). Постройте приложение Shiny Dashboard настраивающее отображение данных. Используйте логику, аналогичную заданию 1.
____
Task 1 - Using the shinydashboard package, build an application that queries different information from the user on different tabs and displays the result on a separate tab. The application should also show the ability to create different menus in Header. Use at least 4 tabs to build the application, each tab must contain at least two fields of type Input.
Task 2 - Using the original dataset (per option). Build a Shiny Dashboard application customizing the data display. Use logic similar to assignment 1.

