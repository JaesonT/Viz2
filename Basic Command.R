#Renaming CSV file to df
df <- read.csv("Accidents.csv")

df

#Plot For Injured
plot_ly(data= df, 
        x= ~Year, 
        y = ~Injured, 
        type = "scatter",
        mode = "lines")

#Plot for Death
plot_ly(data= df, 
        x= ~Year, 
        y = ~Death, 
        type = "scatter",
        mode = "lines")