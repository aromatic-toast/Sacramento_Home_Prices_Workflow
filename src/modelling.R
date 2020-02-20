# author: Lesley Miller 
# date: 2020/02/20
# 

'''This script has a description here!

Usage: src/modelling.R --input_path=<input_path> --output_path=<output_path>

Options:
--input_path=<file_path> Path (the path including file name) to the input csv file.
--output_path=<output_path> Path to the output directory where modelling results should go.
''' -> doc

# import packages 
suppressPackageStartupMessages(library(tidyverse))
library(docopt)
library(broom)

opt <- docopt(doc)

# define main function 
main <- function(input_path, output_path){
      # read in the data 
      X_train <- read_csv("data/X_train.csv")
      y_train <- read_csv("data/y_train.csv", col_names  = c("price"))
      X_valid <- read_csv("data/X_valid.csv")
      y_valid <- read_csv("data/y_valid.csv", col_names  = c("price"))
      
      # combine the target column with rest of predictors 
      X_train_combined <- as_tibble(cbind(X_train, y_train))
      
      # build a simple lm model 
      model1 <- lm(price ~ sqft, data = X_train_combined)
      tidy(model1)
      
      # visualize the simple linear regression (SLR)
      X_train_combined %>% 
            ggplot(aes(x = sqft, y = price)) +
            geom_point() + 
            geom_smooth(method = 'lm') + 
            labs(title = "Simple Linear Regression of Price with House Square Footage",
                 x = "Square Footage",
                 y = " House Price")
      
      # build a multiple regression 
      model2 <- lm(price ~ sqft * as.factor(beds), data = X_train_combined)
      tidy(model2)
      
}

# call main function 
main(opt$input_path, opt$output_path)