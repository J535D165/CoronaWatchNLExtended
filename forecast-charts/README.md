## :chart_with_upwards_trend: Forecast charts

The following graphs show the development of Coronavirus on a daily basis. The underlying data can be found in the CoronaWatchNL [data folder](https://github.com/J535D165/CoronaWatchNL/tree/master/data). The graphs are updated on an hourly basis and were generated automatically. Please validate the numbers in the graphs before publishing. See the license section for information about sharing the graphs.

The first predictions are based on exponential growth model.
![forecast-charts/prediction.png](/forecast-charts/prediction.png)

Note, however that the data no longer behave exponentially. If we plot them on
a log axis they deviate from the line quite drastically!
![forecast-charts/prediction_log10.png](/forecast-charts/prediction_log10.png)

Thus we try to fit a sigmoidal curve. One way to fit this, is to first estimate
the growth rate, which we define here as the ratio of new cases over previous
new cases. Once this growth rate reaches 1, it is likely that the data will
stop following an exponential pattern and will taper down into a sigmoid
curvature.

Here is the development of the growth factor over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![forecast-charts/growthfactor.png](/forecast-charts/growthfactor.png)

This then results in the following sigmoidal fit:
![forecast-charts/sigmoid.png](/forecast-charts/sigmoid.png)

As some provinces had the outbreak earlier than others, it's relevant to see the individual provinces. The same linear model is used to estimate the inflection point.
![forecast-charts/growthfactor_Drenthe.png](/forecast-charts/growthfactor_Drenthe.png)
![forecast-charts/growthfactor_Flevoland.png](/forecast-charts/growthfactor_Flevoland.png)
![forecast-charts/growthfactor_Friesland.png](/forecast-charts/growthfactor_Friesland.png)
![forecast-charts/growthfactor_Gelderland.png](/forecast-charts/growthfactor_Gelderland.png)
![forecast-charts/growthfactor_Groningen.png](/forecast-charts/growthfactor_Groningen.png)
![forecast-charts/growthfactor_Limburg.png](/forecast-charts/growthfactor_Limburg.png)
![forecast-charts/growthfactor_Noord-Brabant.png](/forecast-charts/growthfactor_Noord-Brabant.png)
![forecast-charts/growthfactor_Noord-Holland.png](/forecast-charts/growthfactor_Noord-Holland.png)
![forecast-charts/growthfactor_Overijssel.png](/forecast-charts/growthfactor_Overijssel.png)
![forecast-charts/growthfactor_Utrecht.png](/forecast-charts/growthfactor_Utrecht.png)
![forecast-charts/growthfactor_Zeeland.png](/forecast-charts/growthfactor_Zeeland.png)
![forecast-charts/growthfactor_Zuid-Holland.png](/forecast-charts/growthfactor_Zuid-Holland.png)

Also a sigmoid function per province:
![forecast-charts/sigmoid_Drenthe.png](/forecast-charts/sigmoid_Drenthe.png)
![forecast-charts/sigmoid_Flevoland.png](/forecast-charts/sigmoid_Flevoland.png)
![forecast-charts/sigmoid_Friesland.png](/forecast-charts/sigmoid_Friesland.png)
![forecast-charts/sigmoid_Gelderland.png](/forecast-charts/sigmoid_Gelderland.png)
![forecast-charts/sigmoid_Groningen.png](/forecast-charts/sigmoid_Groningen.png)
![forecast-charts/sigmoid_Limburg.png](/forecast-charts/sigmoid_Limburg.png)
![forecast-charts/sigmoid_Noord-Brabant.png](/forecast-charts/sigmoid_Noord-Brabant.png)
![forecast-charts/sigmoid_Noord-Holland.png](/forecast-charts/sigmoid_Noord-Holland.png)
![forecast-charts/sigmoid_Overijssel.png](/forecast-charts/sigmoid_Overijssel.png)
![forecast-charts/sigmoid_Utrecht.png](/forecast-charts/sigmoid_Utrecht.png)
![forecast-charts/sigmoid_Zeeland.png](/forecast-charts/sigmoid_Zeeland.png)
![forecast-charts/sigmoid_Zuid-Holland.png](/forecast-charts/sigmoid_Zuid-Holland.png)

As testing capacity is limited the numbers of positively tested people doesn't give a realistic picture of the outbreak. Using the data of people being hospitalised should give a more realistic picture.

Here is the development of the growth factor of hospitalisations over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![forecast-charts/growthfactor_hospitalisation.png](/forecast-charts/growthfactor_hospitalisation.png)

This then results in the following sigmoidal fit:
![forecast-charts/sigmoid_hospitalisation.png](/forecast-charts/sigmoid_hospitalisation.png)

Here is the development of the growth factor of fatalities over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![forecast-charts/growthfactor_fatalities.png](/forecast-charts/growthfactor_fatalities.png)

This then results in the following sigmoidal fit:
![forecast-charts/sigmoid_fatalities.png](/forecast-charts/sigmoid_fatalities.png)

For more information about this approach, please watch
[the YouTube video](https://www.youtube.com/watch?v=Kas0tIxDvrg) that inspired
this approach, by Grant Sanderson
([3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)).
