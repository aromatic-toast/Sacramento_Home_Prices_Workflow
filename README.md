# Sacramento Home Prices Predictor
A project to practice data science workflow concepts using Sacramento, CA home prices data. 
- Author: Lesley Miller

# Exploratory Data Analysis 
The data description and exploration report can be found [here](https://aromatic-toast.github.io/Sacramento_Home_Prices_Workflow/doc/eda.html).

# Sacramento Home Prices Project Proposal

# Research Question 
The main objective of this project is to build a model to explain the relation between house prices and various attributes about the house including number bedrooms and bathrooms, geospatial location, housing type and others. The main question will be inferential and will seek to understand how house attributes serve to increase or decrease the house price. In addition to building the model, a sub component will include reporting the most important features for determining house price. 

# Data Source 
The data comes from the Sacramento dataset found in the R `caret` package and can be loaded through the `caret` package or obtained directly form the `SpatialKey` website [here](https://support.spatialkey.com/spatialkey-sample-csv-data)

# Analysis Plan 
The analysis plan includes the initial building of a simple linear model of house price using square footage. This model will then be expanded to a multiple regression to include additional predictors such as city, geo coordinates, number of bedrooms and bathrooms. Any model with additional predictors should provide enough explanatory power to counteract the additional model complexity. This will be assessed by testing the nested models with the Ftest. 

# Planned Analysis Results
The final model will be displayed as a line on top of the dataset. The results will also include a table of the relevant test stastics and associated p-values. 

# Dependencies 
- R and R packages
      - tidyverse
      - docopt
      - broom
      - knitr
      
# Instructions to run analysis scripts in order: 
1. Clone this repo
2. Open RStudio
3. Open an new R project using the Rproj in the project root directory
4. Run the following commands in order:
```
src/load_and_write_csv.R --input_url=http://samplecsvs.s3.amazonaws.com/Sacramentorealestatetransactions.csv
src/eda.R --input_path=data/sacramento_house_prices.csv --output_path=results/
src/modelling.R --input_path=data/sacramento_house_prices.csv --output_plot=results/ --output_table=results/test_stats_table.csv
```
5. To render the final report based on the analysis: 
      - Go to results directory and open `final_report.Rmd`
      - Click the `Knit` button


