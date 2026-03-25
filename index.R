library(shiny)
library(shinydashboard)
library(ggplot2)

# --- UI Section ---
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Template"),
  
  dashboardSidebar(
    sidebarMenu(
      # -----------------------------------------
      # These dynamic elements work with the datasets from ggplot,
      # With your own data you should update these to reflect the story you want to tell
      
      # Dynamic Input: This slider affects Plot 1
      sliderInput("bins", "Histogram Bins:", min = 5, max = 50, value = 30),
      
      # Dynamic Input: This drop-down affects Plot 2
      selectInput("var", "Scatterplot Variable:",
                  choices = c("mpg", "disp", "hp", "wt"), selected = "mpg")
    )
  ),
  
  dashboardBody(
    # -------------------
    # Replace these variables with your own to create dynamic visualisations
    fluidRow(
      # Row 1
      box(title = "Dynamic Histogram",  solidHeader = TRUE,
          plotOutput("plot1", height = 250)),
      
      box(title = "Interactive Scatter", solidHeader = TRUE,
          plotOutput("plot2", height = 250))
    ),
    
    fluidRow(
      # Row 2
      box(title = "Boxplot (Static)", solidHeader = TRUE,
          plotOutput("plot3", height = 250)),
      
      box(title = "Line Chart (Static)",  solidHeader = TRUE,
          plotOutput("plot4", height = 250))
    )
  )
)

# --- Server Section ---
server <- function(input, output) {
  
  #--------------------------------
  # Make sure to update the datasets and visualisations you want to use to tell your story
  
  # 1. Dynamic Histogram (Reacts to input$bins)
  output$plot1 <- renderPlot({
    ggplot(airquality, aes(x = Temp)) +
      geom_histogram(bins = input$bins, fill = "#3c8dbc", color = "white") +
      theme_minimal() +
      labs(title = "Temperature Distribution")
  })
  
  # 2. Dynamic Scatter (Reacts to input$var)
  output$plot2 <- renderPlot({
    ggplot(mtcars, aes_string(x = input$var, y = "qsec")) +
      geom_point(color = "red", size = 3) +
      theme_minimal() +
      labs(title = paste("Effect of", input$var, "on Quarter Mile Time"))
  })
  
  # 3. Static Boxplot
  output$plot3 <- renderPlot({
    ggplot(airquality, aes(x = as.factor(Month), y = Ozone)) +
      geom_boxplot(fill = "orange") +
      theme_minimal() +
      labs(x = "Month", title = "Ozone Levels by Month")
  })
  
  # 4. Static Line Chart
  output$plot4 <- renderPlot({
    ggplot(economics, aes(x = date, y = unemploy)) +
      geom_line(color = "darkgreen") +
      theme_minimal() +
      labs(title = "Unemployment Trend")
  })
}

shinyApp(ui, server)