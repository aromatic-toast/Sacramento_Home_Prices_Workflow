# author: Lesley Miller 
# Date: 2020/05/08
#


"Pulls from provided url and writes it to csv in the data directory.

Usage: src/load_and_write_csv.R --input_url=<input_url> --output_path=<output_path>

Options:
--input_url=<input_url> The url to the data. 
--output_path=<output_path> The file path including file name for where the data should go. 
" -> doc

# import packages
suppressPackageStartupMessages(library(tidyverse))

opt <- docopt(doc)

# define main function 
main <- function(){
      # load the data from caret
      df <- read_delim(file = input_url,
                       delim = ",")
      
      
      # write the sacramento data to csv
      write_csv(x = df, path = output_path)
}

# call main function 
main()




