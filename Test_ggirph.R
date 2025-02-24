library(ggiraph)
library(ggplot2)
p <- ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point_interactive(aes(tooltip = rownames(mtcars)))
girafe(ggobj = p)
