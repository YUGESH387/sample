library(RSQLite)
library(shiny)


ui <- fluidPage(
  titlePanel("Student Information System"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Name:"),
      textInput("email", "Email:"),
      selectInput("major", "Dept:", c("AI&DS", "CSE", "CSBS", "BT")),
      actionButton("add", "Add Student"),
    ),
    mainPanel(
      tableOutput("students")
    )
  )
)
server <- function(input, output) {
  con <- dbConnect(RSQLite::SQLite(), "students.db")
  dbExecute(con, "CREATE TABLE IF NOT EXISTS students (
                 id INTEGER PRIMARY KEY,
                 name TEXT,
                 email TEXT,
                 major TEXT)")
  observeEvent(input$add, {
    dbExecute(con, "INSERT INTO students (name,major,email)
                   VALUES (?,?,?)",params = c(input$name,input$major,input$email))
    output$students <- renderTable(dbGetQuery(con, "SELECT * FROM students"))
  })
  output$students <- renderTable(dbGetQuery(con, "SELECT * FROM students"))
}
shinyApp(ui, server)
