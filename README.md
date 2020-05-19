![corona_artwork.jpg](corona_artwork.jpg)

# CoronaWatchNL: COVID-19 case counts in The Netherlands

[**CoronaWatchNL**](https://github.com/J535D165/CoronaWatchNL) collects COVID-19 disease count cases in **The Netherlands**. Numbers are collected from the RIVM (National Institute for Public Health and the Environment) website on a daily basis. This project standardizes, and publishes data and makes it **Findable, Accessible, Interoperable, and Reusable (FAIR)**. We aim to collect a complete time series and prepare a dataset for reproducible analysis and academic use.

Dutch:
> CoronalWatchNL verzamelt ziektecijfers over COVID-19 in Nederland. Dagelijks worden de cijfers verzameld van de website van het RIVM. Dit project standaardiseert en publiceert de gegevens en maakt ze vindbaar, toegankelijk, interoperabel en herbruikbaar (FAIR). We streven ernaar om een dataset beschikbaar te stellen voor reproduceerbare analyses en wetenschappelijk gebruik.


# CoronaWatchNL_Models

**CoronaWatchNL_Models** is a collection of models build on COVID-19 case counts in the Netherlands. All graphics can be found in the [plots folder](/plots). The underlying data can be found on the [CoronaWatchNL repository](https://github.com/J535D165/CoronaWatchNL). The graphs are updated on a daily basis and were generated automatically. See the [license section](#license-and-academic-use) for information about sharing the graphs.

# :chart_with_upwards_trend: Forecast charts

## COVID-19 case counts
The following graphs show various predictions about the development of the coronavirus outbreak in the Netherlands.

### Exponential growth model

The first predictions are based on exponential growth model.
![plots/prediction.png](/plots/prediction.png)

Note, however that the data no longer behave exponentially. If we plot them on
a log axis they deviate from the line quite drastically!
![plots/prediction_log10.png](/plots/prediction_log10.png)


### Growth rate

Thus we try to fit a sigmoidal curve. One way to fit this, is to first estimate
the growth rate, which we define here as the ratio of new cases over previous
new cases. Once this growth rate reaches 1, it is likely that the data will
stop following an exponential pattern and will taper down into a sigmoid
curvature.

Here is the development of the growth factor over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![plots/growthfactor.png](/plots/growthfactor.png)


### Sigmoidal curve

This then results in the following sigmoidal fit:
![plots/sigmoid.png](/plots/sigmoid.png)

### Exponential growth per province

As some provinces had the outbreak earlier than others, it's relevant to see the individual provinces. The same linear model is used to estimate the inflection point.
![plots/growthfactor_Drenthe.png](/plots/growthfactor_Drenthe.png)
![plots/growthfactor_Flevoland.png](/plots/growthfactor_Flevoland.png)
![plots/growthfactor_Friesland.png](/plots/growthfactor_Friesland.png)
![plots/growthfactor_Gelderland.png](/plots/growthfactor_Gelderland.png)
![plots/growthfactor_Groningen.png](/plots/growthfactor_Groningen.png)
![plots/growthfactor_Limburg.png](/plots/growthfactor_Limburg.png)
![plots/growthfactor_Noord-Brabant.png](/plots/growthfactor_Noord-Brabant.png)
![plots/growthfactor_Noord-Holland.png](/plots/growthfactor_Noord-Holland.png)
![plots/growthfactor_Overijssel.png](/plots/growthfactor_Overijssel.png)
![plots/growthfactor_Utrecht.png](/plots/growthfactor_Utrecht.png)
![plots/growthfactor_Zeeland.png](/plots/growthfactor_Zeeland.png)
![plots/growthfactor_Zuid-Holland.png](/plots/growthfactor_Zuid-Holland.png)

### Sigmoidal curve per province
Also a sigmoid function per province:
![plots/sigmoid_Drenthe.png](/plots/sigmoid_Drenthe.png)
![plots/sigmoid_Flevoland.png](/plots/sigmoid_Flevoland.png)
![plots/sigmoid_Friesland.png](/plots/sigmoid_Friesland.png)
![plots/sigmoid_Gelderland.png](/plots/sigmoid_Gelderland.png)
![plots/sigmoid_Groningen.png](/plots/sigmoid_Groningen.png)
![plots/sigmoid_Limburg.png](/plots/sigmoid_Limburg.png)
![plots/sigmoid_Noord-Brabant.png](/plots/sigmoid_Noord-Brabant.png)
![plots/sigmoid_Noord-Holland.png](/plots/sigmoid_Noord-Holland.png)
![plots/sigmoid_Overijssel.png](/plots/sigmoid_Overijssel.png)
![plots/sigmoid_Utrecht.png](/plots/sigmoid_Utrecht.png)
![plots/sigmoid_Zeeland.png](/plots/sigmoid_Zeeland.png)
![plots/sigmoid_Zuid-Holland.png](/plots/sigmoid_Zuid-Holland.png)

As testing capacity is limited the numbers of positively tested people doesn't give a realistic picture of the outbreak. Using the data of people being hospitalised should give a more realistic picture.

## Hospitalisation
Here is the development of the growth factor of hospitalisations over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![plots/growthfactor_hospitalisation.png](/plots/growthfactor_hospitalisation.png)

This then results in the following sigmoidal fit:
![plots/sigmoid_hospitalisation.png](/plots/sigmoid_hospitalisation.png)

## Fatalities
Here is the development of the growth factor of fatalities over time, with a linear model fit
to try to estimate when the inflection point will occur (or has occurred).

![plots/growthfactor_fatalities.png](/plots/growthfactor_fatalities.png)

This then results in the following sigmoidal fit:
![plots/sigmoid_fatalities.png](/plots/sigmoid_fatalities.png)

For more information about this approach, please watch
[the YouTube video](https://www.youtube.com/watch?v=Kas0tIxDvrg) that inspired
this approach, by Grant Sanderson
([3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)).


## Sources

The used [datasets](https://github.com/J535D165/CoronaWatchNL) are obtained from the following sources.

| Source | Institute |Collected variables |
|---|---| --- |
| https://www.rivm.nl/nieuws/actuele-informatie-over-coronavirus | RIVM | Positively tested patients, Fatalities (total), Hospitalized (total) |
| https://www.rivm.nl/coronavirus-kaart-van-nederland-per-gemeente | RIVM | Positive tests per municipality |
| https://www.rivm.nl/nieuws/actuele-informatie-over-coronavirus/data | RIVM | Epidemiological reports |
| https://www.stichting-nice.nl/ | Stichting NICE | Postively tested patients admitted to IC, Number of ICUs with positively tested patient(s), Number of fatal IC cases, Number of survived IC cases  |


## Remarks

Since 3 March 2020, RIVM reports the number of diagnoses with the coronavirus and their municipality of residence on a daily base. The data contains the total number of positively tested patients. It is not a dataset with the current number of sick people in the Netherlands. The RIVM does not currently provide data on people who have been cured.


## License and academic use

The graphs and data are licensed [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/). The original data is copyright RIVM.

For academic use, use presistent data from [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3711575.svg)](https://doi.org/10.5281/zenodo.3711575). This is a persistent copy of the data. Version number refer to the date. Please cite:

```De Bruin, J. (2020). Number of diagnoses with coronavirus disease (COVID-19) in The Netherlands (Version v2020.3.15) [Data set]. Zenodo. http://doi.org/10.5281/zenodo.3711575```

Image from [iXimus](https://pixabay.com/nl/users/iXimus-2352783/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4901881) via [Pixabay](https://pixabay.com/nl/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4901881)

## About CoronaWatchNL

**CoronaWatchNL** is collective of researchers and volunteers in The Netherlands. We aim to make the reported number on COVID-19 disease in The Netherlands FAIR. The project is initiated and maintained by [Utrecht University Research Data Management Support](https://www.uu.nl/en/research/research-data-management) and receives support from [Utrecht University Applied Data Science](https://www.uu.nl/en/research/applied-data-science). 

Help on this project is appreciated. We are looking for new graphs, forecasts, and maps. Please report issues in the Issue Tracker. Want to contribute? Please check out the `help wanted` tag in the [Issue Tracker](https://github.com/J535D165/CoronaWatchNL/issues). Do you wish to share an application related to these visuals? Have a look at the CoronaWatchNL [applications folder](https://github.com/J535D165/CoronaWatchNL/tree/master/applications).

Please send an email to jonathandebruinos@gmail.com and/or r.voorvaart@uu.nl
