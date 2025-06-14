#Preparation
library("tidyverse")
library("dplyr")
library("lubridate")
library("cluster")

df <- read.csv("C:/Users/ezrah/Documents/통계소프트웨어 기말고사/marvel.csv", header = TRUE)
options(scipen=999)
str(df)
head(df)

df$ReleaseDateUS <- as.Date(df$ReleaseDateUS, format = "%Y-%m-%d")
is.Date(df$ReleaseDateUS)

df$NorthAmerica <- as.numeric(gsub(",","",df$NorthAmerica))
df$OtherTerritories <- as.numeric(gsub(",","",df$OtherTerritories))
df$Budget <- as.numeric(gsub(",","", df$Budget))
df$OpeningWeekendNorthAmerica <- as.numeric(gsub(",","",df$OpeningWeekendNorthAmerica))

sum(is.na(df))

#Top 5 Movie that made the most revenue and the least Revenue

total_revenue <- df$NorthAmerica + df$OtherTerritories + df$Worldwide
df$total_revenue <- total_revenue
profits <- total_revenue - df$Budget
df$profits <- profits

profit_plot <- ggplot(df, aes(x = profits, y = reorder(Title, profits))) + 
  geom_col(color = "black", fill = "blue") + 
  labs(title = "Marvel's Movie Profit",
       x = "Movie's profit",
       y = "Movie Title")
profit_plot

#Yearly Profit and Budget

df2 <- transform(df, ReleaseDateUS = format(as.Date(df$ReleaseDateUS), "%Y"))
profyear <- aggregate(profits ~ ReleaseDateUS, df2, sum)
profyear

profyear_plot <- plot(profyear, type = "o", xlab = "Year", ylab = "Profits ($)", col = "red")

profbud <- aggregate(Budget ~ ReleaseDateUS, df2, sum)
profbud

profyear_plot <- plot(profbud, type = "o", xlab = "Year", ylab = "Budgets ($)", col = "blue")

summary(df$profits)
summary(df$Budget)

#Compare Domestic vs. International Revenue

dom_rev <- sum(df$NorthAmerica + df$OtherTerritories)
Intl_rev <- sum(df$Worldwide)

slices <- c(dom_rev, Intl_rev)
labsS <- c("Domestic Revenue", "Worldwide Revenue")
labsS <- paste(labsS,":", "USD", slices)

com_rev <- pie(slices, labels = labsS, col = c("blue", "cyan"), border = FALSE)

summary(total_revenue)
bxrev <- boxplot(total_revenue, horizontal = TRUE)

#Correlation Budget and Profit

cor(df$profits, df$Budget)
 
df_cor <- ggplot(df, mapping=aes(x = profits, y = Budget)) + 
  geom_point() + 
  labs(title = "Correlation between Budget and Profit", 
       x = "Profits (USD)", 
       y = "Budget (USD)")
df_cor

#Regression Analysis

head(df)
S=sample(1:nrow(df), nrow(df)*0.7)
df.train <- df[S,]
df.test <- df[-S,]
df.reg <- lm(df$profits~df$Budget, data = df.train)
summary(df.reg)

#Clustering

x <- df[,c(4,10)]
head(x)
kms <- kmeans(x, )
clusplot(x, kms$cluster,color=T,shade=T, main="Clusplot")

