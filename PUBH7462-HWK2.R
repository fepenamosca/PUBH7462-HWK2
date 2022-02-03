# Load libraries

library(tidyverse)

# x = a random sample of size n = 1000 from N(0, 1) (rnorm())
x <- rnorm(1000,0,1)

# y = a random sample of size n = 1000 from N(1, 2)
y <- rnorm(1000,1,2)

# Create vector that combines x+y
z <- y + x

# sum_indicator = a logical variable, TRUE if x + y > 0.5 (hint: ifelse())
sum_indicator <- ifelse(z > 0.5,"Yes","No")

# Generate dataframe (need to use tibble for this)
test <- data.frame(x,y,sum_indicator)

# Relevel variable
test$sum_indicator <- forcats::fct_relevel(test$sum_indicator,"Yes","No")

# Scatter plot y by x
ggplot(test,aes(y = y,x = x,color = sum_indicator)) + geom_point() + theme_classic()+labs(colour="x+y > 0.5")+ggtitle("Scatterplot of y by x")

# Part 2.1
#The number of observations (rows), variables/features (columns), and what each variable/feature
# describes about each observation

# Mean and standard deviation flipper length
mean(penguin.df$flipper_length_mm,na.rm = TRUE)
sd(penguin.df$flipper_length_mm,na.rm = TRUE)

# Mean and standard divation bill length
mean(penguin.df$bill_length_mm,na.rm = TRUE)
sd(penguin.df$flipper_length_mm,na.rm = TRUE)
# Part 2.2

# Upload data
penguin.df <- read_rds("./data/penguin.RDS")

# Scatter plot bill length by flipper length and species
ggplot(penguin.df,aes(y =flipper_length_mm,x =bill_length_mm,color=species)) + geom_point() + theme_classic()+labs(colour="Species")+labs(title="Flipper length by bill length",x ="Bill length (mm)", y = "Flipper length (mm)")

# Scatter plot bill length by flipper length and sex
ggplot(penguin.df,aes(y =flipper_length_mm,x =bill_length_mm,color=sex)) + geom_point() + theme_classic()+labs(colour="Sex")+labs(title="Flipper length by bill length",x ="Bill length (mm)", y = "Flipper length (mm)")+ facet_grid(~sex)

