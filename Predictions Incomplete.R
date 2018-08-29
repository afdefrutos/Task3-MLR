IncLucasAndres <- read_delim("~/Desktop/Task3-MLR/newproductLucasAndres.csv", 
                                      ";", escape_double = FALSE, trim_ws = TRUE)

View(IncLucasAndres)


IncLucasAndres$Depth <- NULL
IncLucasAndres$Width <- NULL
IncLucasAndres$Heigth <- NULL
IncLucasAndres$X1 <- NULL
IncLucasAndres$Best_seller_rank <- NULL
IncLucasAndres$`1Stars` <- NULL
IncLucasAndres$`5Stars` <- NULL
IncLucasAndres$`3Stars` <- NULL
IncLucasAndres$`2Stars`<- NULL
IncLucasAndres$Environment_Impact <- NULL

IncLucasAndres$Relative_Price <- NULL
IncLucasAndres$Product_ID <- NULL
IncLucasAndres$Dimension <- NULL

#LucasAndres$Dimension[is.na(LucasAndres$Dimension)] <- round(mean(LucasAndres$Dimension, na.rm = TRUE))



View(IncLucasAndres)


IncLucasAndresDV<- dummyVars(" ~ .", data = IncLucasAndres)


View(IncLucasAndresDV)


IncLucasAndresDVready <- data.frame(predict(IncLucasAndresDV, newdata = IncLucasAndres))

View(IncLucasAndresDVready)
IncLucasAndresDVready$X1 <- NULL

View(IncLucasAndresDVready)


knnpredict <- predict(knnfit, newdata = IncLucasAndresDVready)
knnpredict



SurveyIncomplete$new_column <- knnpredict
View(SurveyIncomplete)

SurveyIncomplete$brand<- NULL
SurveyIncomplete$delete_column <- NULL


KNNComplete <- SurveyIncomplete

View(KNNComplete)

write.csv (x = KNNComplete, file = "finalknn.csv")

count(Finalpredictions$new_column)
