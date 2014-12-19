library(shiny)

shinyUI(pageWithSidebar(
    
    headerPanel("Tooth Growth Explorer"),
    
    sidebarPanel(
        selectInput('y', 'Y', "len"),
        selectInput('x', 'X', c("Dose"="dose", "Supplement Type"= "supp")), 
        selectInput('fill_color', 'Color',c("None"="", "Dose"="dose", "Supplement"="supp")),
        radioButtons("summaryType", "Select Summary", list("None", "describeBy", "summary")), 
        selected="Supplement"
        ),
    
    mainPanel(
        
        plotOutput('plot'),
        textOutput("summary"),
        tableOutput("view")
    )
))

