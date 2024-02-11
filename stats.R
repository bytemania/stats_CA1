# a
# Install the following packages Hmisc, pastecs, psych
# install.packages('Hmisc')
# install.packages('pastecs')
# install.packages('psych')

#b
#b - hmist
# library(Hmisc)
# salary<-readRDS("salary.rds")
# description <- describe(salary)
# print(description)

#b - pastecs
library(pastecs)
salary<-readRDS("salary.rds")
description <- stat.desc(salary)
print(description)

#b - psych
# library(psych)
# salary<-readRDS("salary.rds")
# description <- psych::describe(salary)
# print(description)

# c
#library(psych)
#salary<-readRDS("salary.rds")
#description_by_gender <- psych::describeBy(salary, group=salary$gender)
#print(description_by_gender)

#d
data(iris)
petalLenght.mean <- mean(iris$Petal.Length)
petalLenght.median <- median(iris$Petal.Length)
petalLenght.range <- range(iris$Petal.Length)
petalLength.98percentile <- quantile(iris$Petal.Length, 0.98)

print(paste('Mean Petal Length:', petalLenght.mean))
print(paste('Median Petal Length:', petalLenght.median))
print(paste('Range Petal Length min:', petalLenght.range[1], ' max:', petalLenght.range[2]))
print(paste('98%  Percentile Petal Length:', petalLength.98percentile))

#e
data(iris)
png(file="histogram-sepal-petal.png")
hist(iris$Sepal.Width, main = 'Histogram of Iris Petal With', xlab = 'Iris Petal With')
dev.off()

# Calculate measures of dispersion
sepalWidth.range <- range(iris$Sepal.Width)
sepalWidth.variance <- var(iris$Sepal.Width)
sepalWidth.sd  <- sd(iris$Sepal.Width)
sepalWidth.iqr <- IQR(iris$Petal.Width)

# Print the measures of dispersion
print(paste("Range of Sepal Width: [", sepalWidth.range[1], ',', sepalWidth.range[2], ']'))
print(paste("Variance of Sepal Width:", sepalWidth.variance))
print(paste("Standard Deviation of Sepal Width:", sepalWidth.sd))
print(paste("Interquartile Range of Sepal Width:", sepalWidth.iqr))

#f
data(HairEyeColor)
dataHairEye <- as.data.frame(HairEyeColor)

ggplot(data = dataHairEye, aes(x = Hair, y=Eye, weight = Freq)) + geom_count() + ggtitle("Hair and Eye Color Total") + theme_bw() + theme(plot.title = element_text(hjust = 0.5)) 
ggsave('hair-eye-two-variables.png')

ggplot(data = dataHairEye, aes(x = Hair, weight = Freq)) + geom_bar(aes(fill = Eye), position = 'dodge') + ggtitle("Hair and Eye Color Total") + ylab("Number of People") + theme(plot.title = element_text(hjust = 0.5))
ggsave('hair-eye-bar-plot.png') 

