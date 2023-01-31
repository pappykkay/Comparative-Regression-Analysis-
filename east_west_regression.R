
################# Libraries for the project #####################

library(Hmisc)
library(correlation)
library(pastecs)
library(ggplot2)
library(GGally)
library(corrplot)
library(ggplot2)
library(datarium)
library(qqplotr)
library(ggplot2)
library(qqplotr)
library(car)

################# read the csv file data from working directory #####################

east_reg <-read.csv("devt_east.csv")


################# Description of dataset for proper understanding ###################

head(east_reg)
summary(east_reg)
dim(east_reg)
Hmisc::describe(east_reg)


################# To visualise missing data (38 missing values) #####################

sum(is.na(east_reg))


################# Regression Analysis on Eastern Europe variables ###################

str(east_reg)

round(cor(east_reg[c("co2", "female_emp", "fertility", "gdp_pop", "sanitation", 
                     "internet", "mortality", "life_exp")]), digits = 2)

corrplot(cor(east_reg[c("co2", "female_emp", "fertility", "gdp_pop", "sanitation",
                         "internet", "mortality", "life_exp")], title("East Europe")))

shapiro.test(east_reg$co2)


###### Correlation between life expectancy and GDP (0.68). To test for normality ##########

shapiro.test(east_reg$gdp_pop)


####### p-value is 0.0001004 which is less than 0.05, data not normally distributed #######
####### Apply log function to ensure normality, improved distribution but non-normal ######

new_east_reg <- log(east_reg$gdp_pop)

hist(new_east_reg)

shapiro.test(new_east_reg)


### To fit a linear regression model between life expectancy (Y) and GDP growth rate (X) ###

east_reg_model <- lm((east_reg$life_exp) ~ east_reg$gdp_pop, east_reg)

summary.lm(east_reg_model)


##### Multiple R-Squared value of 0.4691 means GDP can predict 47% of life expectancy  ####

plot(east_reg$life_exp ~ east_reg$gdp_pop, east_reg, col = "blue", 
     main = "Regression: GDP & Life expectancy", 
     xlab = "GDP per poulation", ylab = "Life Expectancy")

###### Regression equation = 65.22 + 0.15GDP  ###############################################
#################  Plotting the regression line   ###########################################

abline(east_reg_model, col="red")


####################  Plotting the residual vs fits error: east_reg_model    ###############

plot(east_reg_model, 1)


#################### Cecking for normality of residuals: east_reg_model     ###############

plot(east_reg_model, 2)


####################### Checking for homoscedality: east_reg_model          ###############

plot(east_reg_model, 3)


################## Adding a second variable: Sanitation to improve the model ##############

east_reg_model_2 <- lm(east_reg$life_exp ~ east_reg$gdp_pop + east_reg$sanitation, east_reg)

summary.lm(east_reg_model_2)

################    life expectancy = 56.65 + 0.14GDP  + 0.11 Sanitation   #################

###################    #Adjusted Rsquared value is now 0.5876, a more improved model  ######


#################### Plotting the residual vs fits error: east_reg_model_2       ###########

plot(east_reg_model_2, 1)


#################### Cecking for normality of residuals: east_reg_model_2     ############

plot(east_reg_model_2, 2)


#################### Checking for homoscedality: east_reg_model_2     ############

plot(east_reg_model_2, 3)



################## Adding a third variable: internet to improve the model #################

east_reg_model_3 <- lm(east_reg$life_exp ~ east_reg$gdp_pop + east_reg$sanitation + 
                         east_reg$internet, east_reg)

summary.lm(east_reg_model_3)


###### Regression equation = 57.79 + 0.97GDP + O,10Sanitation  +  0.05Internet ##############
####################### Plotting the residual vs fits error: east_reg_model_3    ############

plot(east_reg_model_3, 1)

####################### Plotting the residual vs fits error: east_reg_model_3  ##############

plot(east_reg_model_3, 2)

####################### Checking for homoscedality: east_reg_model_3          ###############

plot(east_reg_model_3, 3)

#checking for multicolinearity
vif(east_reg_model_3)


##### With residual vs fitted error almost centred around zero, and the normal Q-Q plot
##### following the straight line of normality, homoscedasticity centred around the mean
##### and multicolinearity's VIF within acceptable limit, the regression dependent cariables
##### can adequately model life expectancy with 68% prediction accuracy.
##### Regression equation = 57.79 + 0.97GDP + O,10Sanitation  +  0.05Internet




################# WEST EUROPE REGRESSION MODEL #####################################


################# read the csv file data from working directory #####################

west_reg <-read.csv("devt_west.csv")

################# Description of dataset for proper understanding ###################

head(west_reg)
summary(west_reg)
dim(west_reg)
Hmisc::describe(west_reg)


################# To visualise missing data (38 missing values) #####################

sum(is.na(west_reg))


################# Regression Analysis on western Europe variables ###################

str(west_reg)

round(cor(west_reg[c("co2", "female_emp", "fertility", "gdp_pop", "sanitation", 
                     "internet", "mortality", "life_exp")]), digits = 2)

corrplot(cor(west_reg[c("co2", "female_emp", "fertility", "gdp_pop", "sanitation",
                        "internet", "mortality", "life_exp")], title("west Europe")))


###### Correlation between life expectancy and  (0.71). To test for normality ##########

shapiro.test(west_reg$gdp_pop)


####### p-value is 0.00556 which is less than 0.05, data not normally distributed #######
####### Apply log function to ensure normality, improved distribution but non-normal ######

new_west_reg <- log(west_reg$gdp_pop)

hist(new_west_reg)

shapiro.test(new_west_reg)


### To fit a linear regression model between life expectancy (Y) and GDP growth rate (X) ###

west_reg_model <- lm((west_reg$life_exp) ~ west_reg$gdp_pop, west_reg)

summary.lm(west_reg_model)


##### Multiple R-Squared value of 0.4958 means GDP can predict 50% of life expectancy  ####

plot(west_reg$life_exp ~ west_reg$gdp_pop, west_reg, col = "blue", 
     main = "Regression: GDP & Life expectancy", 
     xlab = "GDP per poulation", ylab = "Life Expectancy")

################Regression equation: Life expectancy = 63.88 + 0.17GDP   ####################
#################  Plotting the regression line   ###########################################

abline(west_reg_model, col="red")


####################  Plotting the residual vs fits error: west_reg_model    ###############

plot(west_reg_model, 1)


#################### Cecking for normality of residuals: west_reg_model     ###############

plot(west_reg_model, 2)


####################### Checking for homoscedality: west_reg_model          ###############

plot(west_reg_model, 3)


################## Adding a second variable: Sanitation to improve the model ##############

west_reg_model_2 <- lm(west_reg$life_exp ~ west_reg$gdp_pop + west_reg$internet, west_reg)

summary.lm(west_reg_model_2)


################    life expectancy = 72.22 + 0.05GDP  + 0.04Internet     #################

###################    #Adjusted Rsquared value is now 0.79, a more improved model  ######


#################### Plotting the residual vs fits error: west_reg_model_2       ###########

plot(west_reg_model_2, 1)


#################### Cecking for normality of residuals: west_reg_model_2        ############

plot(west_reg_model_2, 2)


#################### Checking for homoscedality: west_reg_model_2                ############

plot(west_reg_model_2, 3)



################## Adding a third variable: internet to improve the model    #################

west_reg_model_3 <- lm(west_reg$life_exp ~ west_reg$gdp_pop + west_reg$internet + 
                         west_reg$fertility, west_reg)

summary.lm(west_reg_model_3)


#########  Regression equation = 70.79 + 0.05GDP + 0,03Internet + 1.17Fertility    ###########
####################### Plotting the residual vs fits error: west_reg_model_3    ############

plot(west_reg_model_3, 1)

####################### Plotting the residual vs fits error: west_reg_model_3  ###############

plot(west_reg_model_3, 2)

####################### Checking for homoscedality: west_reg_model_3          ###############

plot(west_reg_model_3, 3)

#checking for multicolinearity
vif(west_reg_model_3)


##### With residual vs fitted error almost centred around zero, and the normal Q-Q plot
##### following the straight line of normality, homoscedasticity centred around the mean
##### and multicolinearity's VIF within acceptable limit, the regression dependent cariables
##### can adequately model life expectancy with 80% prediction accuracy.
##### Regression equation = 70.79 + 0.05GDP + 0,03Internet + 1.17Fertility

