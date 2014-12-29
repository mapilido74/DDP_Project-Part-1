library(shiny)
library(ggplot2)
library(datasets)
library(psych)

ToGr<-ToothGrowth
ToGr$dose<-factor(ToGr$dose)

## Show the behaviour of the ToothGrowth under the effect of Vitamin C and 
## depending of the way in wich the supplemet was administered.

shinyServer(function(input, output) {
    
    output$plot<- renderPlot(function() {
        if (input$fill_color==""){
            aes_mapping<-aes_string(x=input$x, y="len")
        } else {
            aes_mapping<-aes_string(x=input$x, y="len", color=input$fill_color)
        }
        g <- ggplot(ToGr, mapping=aes_mapping)
        p<-g+geom_boxplot()
        print(p)
        
    })
    
    ## Show the summary by group "describeBy"  or the general summary "summary". 
    
    output$view<-renderTable(function() {
       
                if(input$summaryType!="None") {
                    
                    if(input$summaryType=="describeBy") {
                        describeBy(ToGr$len, list(ToGr$dose, ToGr$supp), mat=TRUE, digits=2) 
                    } else{
                        summary(ToGr)
                    }
                    
                }
        
    }
    
   )
})


