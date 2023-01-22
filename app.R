# Personal Interactive Resume - App
# Author: Jakub Serek
# Version: 0.001
# Date: 22.01.2023

libs_to_load <- c("shiny", "dplyr", "tidyr", "plotly",
                  "lubridate", "stringr", "shinyWidgets", "shinyBS",
                  "htmlwidgets", "DT", "zoo", "shinydashboardPlus",
                  "shinycssloaders", "waiter")

lapply(libs_to_load, require, character.only = TRUE)


ui <- fillPage(
  
  # setBackgroundColor(color = "#5D5D5D",
  #                    gradient = "linear",
  #                    direction = "bottom"),
  
  tags$head(tags$style(
    
    "
    /* Main body */
    body {
      background-color: #5D5D5D;
    }
    
    "
  )),
  
  tags$style(HTML(
    
    "
    #txt_welcome {
      position: relative;
      top: 20%;
      left: 8%;
      color: #FF5F1F !important;
      font-family: 'Montserrat Thin Medium';
      font-size: 40px;
    
    }
    
    #txt_description {
      position: relative;
      bottom: 65%;
      left: 8%;
      color: #FFFFFF !important;
      font-family: 'Montserrat Thin Light';
      font-size: 16px;
    }
    
    "
  )),
                
  fillRow(id = "row_welcome",
    
    h1(id = "txt_welcome",
       "hello Traveler!")
  ),
  
  fillRow(id = "row_description",
    
    # p(id = "txt_description",
    #   "I am pleased to welcome you on my personal, virtual space-hub.", <br>,
    # "Take a rest here before you leap further into the Internet abyss.")
    
    htmlOutput(outputId = "txt_description")
    
  )

)


server <- function(input, output, session) {
  
  output$txt_description <- renderUI({
    
    HTML(paste("I am pleased to welcome you on my personal, virtual space-hub.",
               "Take a rest here before you leap further into the Internet abyss.",
               "",
               "I’m Jakub Serek, a research focused psychologist keen on numbers.",
               "Nowadays going under nameras of UX Researcher & Data Analyst.",
               "",
               "If you would like to get to know me better, then",
               "have a look and explore what I have to offer.",
               sep = "<br/>"))
    
  })
  
  
}


shinyApp(ui, server)