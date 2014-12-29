library(shiny)


## The dependent variable is always "len" and you can choose as a independent 
## variables between  "dose" or "supp" or both . The behaviour is shown in a 
## boxplot. In addtition you can choose the kind of summary that you can see: 
## general statisitics or statistics  by group

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

