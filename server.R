# The Shiny Server is a K-means Classification Example over the iris dataset.
# Possible X and y inputs are possible names(iris) variables, with number of
# Clusters are defined as input.

# Note all the inputs provided are Reactive;and are excellent demonstration of a
# responsive, dynamic applications.

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {
    
    # Combine the selected reactive variables into a new data frame
    selectedData <- reactive({
        iris[, c(input$xcol, input$ycol)]
    })
    
    # Obtain the kmeans cluster based on number of clusters specified
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    # Create a plot and colour the data based on K-means cluster classification.
    output$plot1 <- renderPlot({
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
})