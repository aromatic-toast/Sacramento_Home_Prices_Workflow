# author: Lesley Miller 
# date: 2020/02/20
# 

"This script builds a simple linear regression model and prodces a plot of the model along with a table of the model test statistics.

Usage: src/modelling.R --input_path=<input_path> --output_dir=<output_dir>

Options:
--input_path=<file_path> Path (the path including file name) to the input csv file.
--output_dir=<output_dir> Output directory for model result plot and test stats table.
" -> doc

# import packages 
suppressPackageStartupMessages(library(tidyverse))
library(docopt)
library(broom)

opt <- docopt(doc)

# define main function 
main <- function(input_path, output_dir) {
      # read in the data 
      df <- read_csv(input_path)
      
      df <- df %>% 
         rename(sqft =  sq__ft)
   
      
      # build a simple lm model 
      model <- lm(price ~ sqft, data = df)
      
      # visualize the simple linear regression (SLR)
      plot <- df %>% 
            ggplot(aes(x = sqft, y = price)) +
            geom_point() + 
            geom_smooth(method = 'lm') + 
            labs(title = "Simple Linear Regression of Price with House Square Footage",
                 x = "Square Footage",
                 y = " House Price")
      # save the test stats of the model 
      write_csv(tidy(model), path = paste(output_dir, "test_stats_table.csv"))
      
      # save the lm model plot 
      ggsave(filename = "SLR_plot.png", plot = plot, path = output_dir)
      
}

# call main function 
main(opt$input_path, opt$output_dir)