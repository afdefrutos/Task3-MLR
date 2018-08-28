library(readr)
setwd("~/Desktop/Task-3---Multiple-Regression")
library(readr)
LucasAndres <- read_csv("LucasAndres.csv")
View(LucasAndres)


LucasAndres$Dimension <- LucasAndres$Depth*LucasAndres$Width*LucasAndres$Heigth
LucasAndres$Depth <- NULL
LucasAndres$Width <- NULL
LucasAndres$Heigth <- NULL
LucasAndres$X1 <- NULL
LucasAndres$Best_seller_rank <- NULL
LucasAndres$`1Stars` <- NULL


LucasAndresDV<- dummyVars(" ~ .", data = LucasAndres)
LucasAndresDVready <- data.frame(predict(LucasAndresDV, newdata = LucasAndres))


LucasAndresDVready$Dimension <- NULL


corrData <- cor(LucasAndresDVready)
corrData

corrplot(corrData)
 
