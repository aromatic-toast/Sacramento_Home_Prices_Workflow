# author: Lesley Miller 
# Date: 2020/05/08
#
# loads data and writes it to csv in the data directory

# usage: Rscript src/load_and_write_csv.R

# import packages
suppressPackageStartupMessages(library(tidyverse))
library(caret)

# define main function 
main <- function(){
      # load the data from caret
      data("Sacramento")
      
      # convert to a tibble 
      df <- as_tibble(Sacramento)
      
      
      # write the sacramento data to csv
      write_csv(x = df, path = "data/sacramento_house_prices.csv")
}

# call main function 
main()




