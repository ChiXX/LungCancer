library(sva)
library(pamr)
library(limma)
data <- read.csv("../../data/cancer_data_BE.csv", row.names = 'ID')

bedata <- t(data[,2:30])


combat_data <- t(ComBat(dat = bedata, batch = data$Origin))

data_new <- as.data.frame(combat_data)
Origin <- data$Origin
ID <- rownames(data_new)
data_new = cbind(ID, Origin, data_new)


write.csv(data_new, file = "../../data/cancer_data_RMBE.csv", row.names = F)
