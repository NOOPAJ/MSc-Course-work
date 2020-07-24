#Dendogram of all chapters in the Buddhism book
#Import the libraries
library("ggplot2")
library("ggdendro")

# Load data
df <- read.csv("cleanfile.csv")

# Compute distances and hierarchical clustering
dd <- dist(scale(df[2:1349]), method = "euclidean")
hc <- hclust(dd, method = "ward.D2")


plot(hc, hang = -1, cex = 0.6, labels = df$book)
