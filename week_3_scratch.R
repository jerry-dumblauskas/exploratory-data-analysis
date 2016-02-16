# hierarchy cluster
set.seed(1234)
x <- rnorm(12, rep(1:3, each = 4), 0.2)
y <- rnorm(12, rep(c(1, 2, 1), each = 4), 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x=x, y=y)
dist(dataFrame)

set.seed(143)
dataMatrix<-as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

# kmeans
set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x=x, y=y)
kmeansObj<-kmeans(dataFrame, centers=3)
names(kmeansObj)

par(mar = rep(.2, 4))
plot(x,y, col=kmeansObj$cluster, pch = 19, cex=2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)