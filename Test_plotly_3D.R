library(plotly)
plot_ly(mtcars, x = ~mpg, y = ~wt, z = ~hp, type = "scatter3d", mode = "markers")
