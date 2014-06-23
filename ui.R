library(shiny)

shinyUI(pageWithSidebar(
    
    #Header Panel for K-means Clustering UI 
    headerPanel('Iris k-means clustering'),
    
    sidebarPanel(
        # Reactive Input for X-Variable : Possible Choices are: names(iris)
        selectInput('xcol', 'X Variable', names(iris)),
        # Reactive Input for Y-Variable : Possible Choices are: names(iris)
        selectInput('ycol', 'Y Variable', names(iris),
                    selected=names(iris)[[2]]),
        # Reactive Input for specifying number of Cluster Counts
        numericInput('clusters', 'Cluster count', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1')
    )
))