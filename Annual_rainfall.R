setwd("C://Asutosh//PGDDA//Analytics//Time-Series-practice")

# getting the complete dataset
rainfall_data <- read.csv("rainfall in india 1901-2015.csv", stringsAsFactors = FALSE)

View(rainfall_data)
ann_rainfall_kar <- subset(rainfall_data, rainfall_data$SUBDIVISION == 'SOUTH INTERIOR KARNATAKA')
#subsetting the dataset for Yearly only
ann_rainfall <- as.data.frame(ann_rainfall_kar[, c('YEAR','ANNUAL')])

data_prep <- as.data.frame(ann_rainfall[,-1])
colnames(data_prep) <- "DATA"
#View(data_prep)
data_prep_1 <- as.data.frame(data_prep[-1,])
colnames(data_prep_1) <- "DATA-1"
data_prep_1 <- rbind(data_prep_1, NA)

data_prep_2 <- data.frame(data_prep_1[-1,])
colnames(data_prep_2) <- "DATA-2"
data_prep_2 <- rbind(data_prep_2, c(NA, NA))
#View(data_prep_2)

data_prep_3 <- as.data.frame(data_prep_2[-1,])
colnames(data_prep_3) <- "DATA-3"
data_prep_3 <- rbind(data_prep_3, c(NA, NA, NA))

data_prep_4 <- as.data.frame(data_prep_3[-1,])
colnames(data_prep_4) <- "DATA-4"
data_prep_4 <- rbind(data_prep_4, c(NA, NA, NA, NA))

data_prep_5 <- as.data.frame(data_prep_4[-1,] )
colnames(data_prep_5) <- "DATA-5"
data_prep_5 <- rbind(data_prep_5, c(NA, NA, NA, NA, NA))

#final dataset
data_prep_f <- cbind(data_prep, data_prep_1, data_prep_2, data_prep_3,data_prep_4, data_prep_5)
data_prep_f <- cbind(ann_rainfall[,c('YEAR')] , data_prep_f )
colnames(data_prep_f) <- c('YEAR', 'DATA', 'DATA-1', 'DATA-2', 'DATA-3', 'DATA-4', 'DATA-5')
#View(data_prep_f)

#separate the dataset from 1901-2000 and 2010- further
train <- subset(data_prep_f, data_prep_f$YEAR < 2001)



