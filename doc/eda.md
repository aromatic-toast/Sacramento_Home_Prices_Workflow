EDA of Sacramento House Prices
================
Lesley Miller
2/8/2020

``` r
# load packages
suppressPackageStartupMessages(library(tidyverse))
```

``` r
# load training  data 
df <- read_csv("data/X_train.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   city = col_character(),
    ##   zip = col_character(),
    ##   beds = col_double(),
    ##   baths = col_double(),
    ##   sqft = col_double(),
    ##   type = col_character(),
    ##   latitude = col_double(),
    ##   longitude = col_double()
    ## )

# Data Description

[Data Source](https://support.spatialkey.com/spatialkey-sample-csv-data)

> This dataset contains information on various attributes of homes sold
> in and around the Sacramento, California area. The data is from real
> estate transactions taking place over a 5 day period. The data is from
> the website for the `SpatialKey` software and can be found
> [here](https://support.spatialkey.com/spatialkey-sample-csv-data)

    ## [1] "The number of training examples is: 521"

    ## [1] "The number of predictors is: 8"

## Summary of Predictors

| Predictor |    Type     |                                                              Description |
| --------- | :---------: | -----------------------------------------------------------------------: |
| city      | categorical |                                     The city where the house is located. |
| zip       | categorical |                                 The zip code where the house is located. |
| beds      | categorical |                                     The number of bedrooms in the house. |
| baths     | categorical |                                    The number of bathrooms in the house. |
| type      | categorical | The type of dwelling as either `Residential`, `Condo` or `Multi-Family`. |
| sqft      | continuous  |                           The size of the house measured in square feet. |
| latitude  | continuous  |                           The latitude geospatial location of the house. |
| longitude | continuous  |                          The longitude geospatial location of the house. |
