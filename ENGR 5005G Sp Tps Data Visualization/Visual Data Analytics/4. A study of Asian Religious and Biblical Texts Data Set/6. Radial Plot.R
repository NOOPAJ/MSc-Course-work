#Radial Plot
# install.packages("dendextend")
# install.packages("circlize")
library(dendextend)
library(circlize)

# Load data
df1<- read.csv("cleanfile.csv")

# create a dendrogram
hc <- hclust(dist(df1))
dend <- as.dendrogram(hc)

# modify the dendrogram to have some colors in the branches and labels
dend <- dend %>% 
  color_branches(k=4) %>% 
  color_labels

# plot the radial plot
par(mar = rep(0,4))
circlize_dendrogram(dend, dend_track_height = 0.8) 
