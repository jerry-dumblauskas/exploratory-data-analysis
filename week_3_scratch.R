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


# dim red


set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])


set.seed(678910)
for (i in 1:40) {
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  ## If coin is heads add a common pattern to that row
  if (coinFlip) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
  }
}

heatmap(dataMatrix)
