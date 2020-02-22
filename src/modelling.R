# author: Lesley Miller 
# date: 2020/02/20
# 

" This script builds a simple linear regression model and prodces a plot of the model along with a table of the model test statistics. 

Usage: src/modelling.R --input_path=<input_path> --output_plot=<output_plot> --output_table=<output_table>

Options:
--input_path=<file_path> Path (the path including file name) to the input csv file.
--output_plot=<output_plot> Path to model result plot.
--output_table=<output_table> Path to test statistics results table.
" -> doc

# import packages 
suppressPackageStartupMessages(library(tidyverse))
library(docopt)
library(broom)

opt <- docopt(doc)

# define main function 
main <- function(input_path, output_plot, output_table) {
      # read in the data 
      df <- read_csv(input_path)
   
      
      # build a simple lm model 
      model <- lm(price ~ sqft, data = df)
      
      # save the test stats of the model 
      write_csv(tidy(model), path = output_table)
      
      # visualize the simple linear regression (SLR)
      plot <- df %>% 
            ggplot(aes(x = sqft, y = price)) +
            geom_point() + 
            geom_smooth(method = 'lm') + 
            labs(title = "Simple Linear Regression of Price with House Square Footage",
                 x = "Square Footage",
                 y = " House Price")
      
      ggsave(filename = "SLR_plot.png", plot = plot, path = output_plot)
      
}

# call main function 
main(opt$input_path, opt$output_plot, opt$output_table)