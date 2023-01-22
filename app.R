# Personal Interactive Resume - App
# Author: Jakub Serek
# Version: 0.001
# Date: 22.01.2023

libs_to_load <- c("shiny", "dplyr", "tidyr", "plotly",
                  "lubridate", "stringr", "shinyWidgets", "shinyBS",
                  "htmlwidgets", "DT", "zoo", "shinydashboardPlus",
                  "shinycssloaders", "waiter", "shiny.router")

lapply(libs_to_load, require, character.only = TRUE)

landing_page <- fillPage(
  
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
      bottom: 70%;
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
          
          htmlOutput(outputId = "txt_description")
          
  )
)

resume_page <- fillPage(
  h1("my resume")
)

aboutMe_page <- fillPage(
  h1("about me")
)

research_page <- fillPage(
  h1("research show-case")
)

analytical_page <- fillPage(
  h1("analytical show-case")
)

router <- make_router(
  route("/", landing_page, NA),
  route("resume", resume_page, NA),
  route("about", aboutMe_page, NA),
  route("research", research_page, NA),
  route("dashboards", analytical_page, NA)
)

ui <- fillPage(
  theme = "main.css",
  
  tags$ul(
    tags$li(a(href = route_link("/"), "home")),
    tags$li(a(href = route_link("resume"), "resume")),
    tags$li(a(href = route_link("about"), "about me")),
    tags$li(a(href = route_link("research"), "research\nshow-case")),
    tags$li(a(href = route_link("dashboards", "analytical\ndashboards")))
  ),
  router$ui
)


server <- function(input, output, session) {
  
  output$txt_description <- renderUI({
    
    HTML(paste("I am pleased to welcome you on my personal, virtual space-hub.",
               "Take a rest here before you leap further into the Internet abyss.",
               "",
               "I am Jakub Serek, a research focused psychologist keen on numbers.",
               "Nowadays going under names like UX Researcher & Data Analyst.",
               "",
               "If you would like to get to know me better, then",
               "have a look and explore what I have to offer.",
               sep = "<br/>"))
    
  })
  
  
}


shinyApp(ui, server)