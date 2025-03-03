# Week 3: Data Wrangling and Advanced Plotly Visualizations

#
# 1 Install and load required packages
#
library(plotly)             # Load plotly
library(dplyr)              # Load dplyr

#
# 2 Load and Prepare Sample Dataset
#
data(mtcars)  # Load mtcars dataset
mtcars <- mtcars %>% 
  mutate(cyl = factor(cyl), gear = factor(gear))  # Convert categorical variables to factors
head(mtcars)  # View first few rows

#
# 3 Advanced Scatter Plot with Color Encoding and Faceting
#
plot_ly(data = mtcars, x = ~mpg, y = ~wt, color = ~cyl, type = 'scatter', mode = 'markers') %>%
  layout(title = "Miles Per Gallon vs. Weight by Cylinder",
         xaxis = list(title = "MPG"),
         yaxis = list(title = "Weight"))

#
# 4 Customizing Scatter Plot with Size Mapping
#
plot_ly(data = mtcars, x = ~mpg, y = ~wt, size = ~hp, color = ~cyl, 
        type = 'scatter', mode = 'markers') %>%
  layout(title = "MPG vs. Weight (Size represents Horsepower)",
         xaxis = list(title = "MPG"),
         yaxis = list(title = "Weight"))

#
# 5 Grouped and Stacked Bar Chart
#
mtcars_summary <- mtcars %>% group_by(cyl, gear) %>% summarise(Count = n())

plot_ly(mtcars_summary, x = ~gear, y = ~Count, color = ~cyl, type = "bar") %>%
  layout(title = "Car Count by Gear and Cylinder",
         barmode = "stack",
         xaxis = list(title = "Gear"),
         yaxis = list(title = "Count"))

#
# 6 Interactive Heatmap
#
heatmap_data <- as.matrix(mtcars[, c("mpg", "hp", "wt", "qsec")])
plot_ly(z = heatmap_data, type = "heatmap") %>%
  layout(title = "Heatmap of Car Attributes")

#
# 7 Interactive Bubble Chart
#
plot_ly(mtcars, x = ~mpg, y = ~hp, size = ~wt, color = ~cyl, type = 'scatter', mode = 'markers', marker = list(line = list(width = 2))) %>%
  layout(title = "Bubble Chart: MPG vs HP (Size = Weight)",
         xaxis = list(title = "Miles Per Gallon (MPG)"),
         yaxis = list(title = "Horsepower (HP)"))

#
# 8 Density Plot using 2D Histogram
#
plot_ly(mtcars, x = ~mpg, y = ~hp, type = "histogram2d") %>%
  layout(title = "2D Histogram Density Plot: MPG vs HP",
         xaxis = list(title = "Miles Per Gallon"),
         yaxis = list(title = "Horsepower"))

