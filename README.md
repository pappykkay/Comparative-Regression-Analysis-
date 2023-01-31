# Comparative-Regression-Analysis-
 A Comparative Analysis of Selected Life Expectancy Indicators in Europe: A Case Study of Western and Eastern Europe. 
 
The study made use of two datasets. The first dataset was downloaded from the UN Data repository.  The repository contained annual historical data for world development and other indices. For this study, ten years of millennium development goal target data were extracted using selected indices for the major economies in Western and Eastern Europe (France, Germany, Switzerland, Netherlands, and Belgium) and Eastern Europe (Russia Federation, Ukraine, Romania, Hungary, and the Czech Republic). The countries were selected based on the size of their economies and we believe the sample size is representative of the performance of this region and will be used as the sample statistical data for the regions. The data for this report was extracted as a CSV file, uploaded to the RStudio platform, and transformed in a way fit for analysis. 
 
Regression analysis experiment was performed using life expectancy as the dependent variable. Correlation results in the eastern region showed that GDP per capita and internet access have a high degree of correlation relative to life expectancy.
Fitting a regression line of GDP on life expectancy, we obtained the regression model in Equatiion 1

Life expectancy=57.78 +0.07(GDP)+0.10(Sanitation)+0.06(Internet)….... Equation 1

The model performance measured from the Multiple R-squared:  0.6863, and Adjusted R-squared:  0.6788 implies that the selected variables can model the life expectancy of the Eastern Europe data with an assurance of 68%. This according to the study is not bad with the concern of dreadfully low p-value: < 2.2e-16. 
Overall, it is an average model with moderate residual vs fit error, mild normal Q-Q, and standardized error. The Variance Inflation Factor (VIF) for the three independent variables is well within acceptable standards.

For Western Europe, the fitted independent variables were internet access, GDP per capita, and fertility ratio to obtain the model in Equation 2

Life expectancy=70.79 +0.05(GDP)+1.17(Fertlity)+0.04(Internet)….... Equation 2

The model returned an accuracy of 80% measured from the Adjusted R-square value of 0.8034 and p-value: 2.2e-16. As a better model and comparatively with Eastern  Europe results, the residual vs fit error is more centered around the mean, normal Q-Q line fitter to the slope line, and a more balanced residual error. The VIF for the variables is also within acceptable standards.

Of notable interest is that internet access and GDP are important variables in modelling life expectancy for the two regions. The point of departure however is that sanitation plays a more important role in eastern Europe than in the West while the fertility ratio was the most influential regression variable in the west, as well as across the two regions.

