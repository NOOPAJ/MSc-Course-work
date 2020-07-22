df <- read.csv("daily.csv", colClasses = c("Date", "float"))
library("googleVis")
mychart1 <- gvisLineChart(df, options=list(gvis.editor="Edit this chart", width=1000, height=600))
plot(mychart1)



