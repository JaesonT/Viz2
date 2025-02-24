library(echarts4r)
mtcars %>% 
  e_charts(mpg) %>% 
  e_scatter(wt)

