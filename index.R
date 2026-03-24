library(shiny)
library(shinydashboard)

# --- UI Section ---
ui <- dashboardPage(
  dashboardHeader(title = "Geyser Dashboard"),
  
  dashboardSidebar(
    # We move the slider here to keep the main body clean
    sidebarMenu(
      sliderInput("bins", "Histogram bins:", min = 1, max = 50, value = 30)
    )
  ),
  
  dashboardBody(
    fluidRow(
      # We wrap the plot in a box to give it a border and title
      box(
        title = "Eruption Wait Times", 
        status = "primary", 
        solidHeader = TRUE,
        plotOutput("distPlot", height = 300)
      ),
      
      # We can add a second box for context or data summary
      box(
        title = "Dataset Info",
        "The 'faithful' dataset contains the waiting time between eruptions and the duration of the eruption for the Old Faithful geyser in Yellowstone National Park."
      )
    )
  )
)

# --- Server Section ---
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # The logic remains exactly the same as your previous code!
    hist(faithful$waiting,
         breaks = input$bins + 1,
         col = '#3c8dbc', # AdminLTE Blue to match the dashboard
         border = 'white',
         xlab = 'Waiting time (minutes)',
         main = NULL) # Title is now handled by the box
  })
}

shinyApp(ui, server)