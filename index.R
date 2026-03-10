library(shiny)

ui <- fluidPage(
  # create drop down menu
  selectInput(inputId = "distr", label = "Distribution:",
              choices = c("Normal" = "norm", "Uniform" = "unif")),
  plotOutput("hist") # histogram placement
)

server <- function(input, output) {
  
  # create reactive value with ID "data" and a default value
  rv <- reactiveValues(data = 0)
  
  # change the actual value inside custom reactive value variable
  observeEvent(input$distr, {
    if(input$distr == "norm"){
      rv$data <- rnorm(1000)
    } else if(input$distr == "unif"){
      rv$data <- runif(1000)
    }
  })
  
  # plot the histogram if reactive value changes
  output$hist <- renderPlot({
    hist(rv$data)
  })
}

shinyApp(ui = ui, server = server)
