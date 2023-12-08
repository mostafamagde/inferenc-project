####   READING THE DATA #######
 #Load the data
news <- read.csv("/home/kali/InferPro/news.csv" , )
printsep <- function() {
  print("-----------------------------------------------------------------------------------------------")
}

####     Understanding the structure of the  data  ####

 #look at columns names
names(news)
printsep()
 # view the whole data 
View(news)
printsep()
 #useful summary of dataset structure
str(news)
printsep()
#######    DATA CLEANING ##########
  # 1-Remove negative values from X column 
news$X[news$X<0]<-news$X[news$X<0]*(-1)
  # 2-Omit null values 
printsep()
print('Before Clearing Nulls:')
print(paste('Number Of Rows Contain Nulls: ', nrow(news[rowSums(is.na(news)) > 0, ])))
print('...........................................................')
news<-na.omit(news)
print('After Clearing Nulls:')
print(paste('Number Of Rows Contain Nulls: ', nrow(news[rowSums(is.na(news)) > 0, ])))
printsep()
 # 3-check duplicates 
print(paste('Number Of Duplicated Rows: ', nrow(news[duplicated(news),])))
printsep()

 # 4- Modify Label column 
news$label[news$label=="F"]<- "FAKE"
news$label[news$label=="R"]<- "REAL"
View(news)
 
########   Visualizing #######
#summary(news)
#plot(news$text, news$label, xlab = "text", ylab = "label",  main = "Type of Diet Effect on Weight", col = "blue")
#plot(news[-c(1000)])
#hist(news$text, col = "lightblue", xlab = "text", main = "text histo ")
x = as.data.frame(news)


########  Using classification methods ########
# library(rpart.plot)
# fit=rpart(news~label+title+text,data=x,method = "class",parms =list()  ,control = rpart.control(minsplit=1))
# summary(fit)
