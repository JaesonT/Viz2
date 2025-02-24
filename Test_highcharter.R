library(highcharter)
highchart() %>% 
  hc_add_series(mtcars, "scatter", hcaes(x = mpg, y = wt))

