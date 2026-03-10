library('ggplot2')
#check working directory
getwd()

#import your .csv file to your global environment

wforecasts <- read.csv("data/weather_forecasts.csv",header = TRUE,sep =",")

head(df)


#Base R
plot(wforecasts$forecast_temp,wforecasts$observed_temp)


#ggplot

ggplot(wforecasts,aes(x=forecast_temp,y=observed_temp))+geom_point()


