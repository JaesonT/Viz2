library(echarts4r)
library(dplyr)
mtcars %>% 
  e_charts(mpg) %>% 
  e_scatter(wt)

