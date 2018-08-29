library(readr)
setwd("~/Desktop/Task-3---Multiple-Regression")
LucasAndres <- read_csv("~/Desktop/Task3-MLR/LucasAndres.csv")
View(LucasAndres)


#LucasAndres$Dimension <- LucasAndres$Depth*LucasAndres$Width*LucasAndres$Heigth
LucasAndres$Depth <- NULL
LucasAndres$Width <- NULL
LucasAndres$Heigth <- NULL
LucasAndres$X1 <- NULL
LucasAndres$Best_seller_rank <- NULL
LucasAndres$`1Stars` <- NULL
LucasAndres$`5Stars` <- NULL
LucasAndres$`3Stars` <- NULL
LucasAndres$`2Stars`<- NULL
LucasAndres$Environment_Impact <- NULL

LucasAndres$Relative_Price <- NULL
LucasAndres$Product_ID <- NULL
LucasAndres$Dimension <- NULL

#LucasAndres$Dimension[is.na(LucasAndres$Dimension)] <- round(mean(LucasAndres$Dimension, na.rm = TRUE))

LucasAndres <- LucasAndres[-c(34, 35, 36, 38, 39, 40, 41),] #Delete extended warranty points


View(LucasAndres)

LucasAndresDV<- dummyVars(" ~ .", data = LucasAndres)
LucasAndresDVready <- data.frame(predict(LucasAndresDV, newdata = LucasAndres))





try <- LucasAndresDVready

try$Product_type<- NULL

corrData <- cor(try)

View(corrData)

corrplot(corrData, method="circle")
corrData

dev.off()
