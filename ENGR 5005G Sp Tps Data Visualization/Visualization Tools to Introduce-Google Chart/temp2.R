df1 <- read.csv("data.csv", colClasses = c("Date", "integer", "integer"))
library("googleVis")
mychart <- gvisLineChart(df1, options=list(gvis.editor="Edit this chart", width=1000, height=600))
plot(mychart)