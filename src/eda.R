# author: Lesley Miller
# date: 2020/02/21

"This script produce plots from the exploratory data analysis that are to be included in the final report. 

Usage: src/eda.R --input_path=<input_path> --output_path=<output_path>

Options:
--input_path=<input_path> Path to the input data.
--output_path=<output_path> Path to the directory where output figures will go.
" -> doc

# import packages
suppressPackageStartupMessages(library(tidyverse))
library(docopt)

opt <- docopt(doc)

# define the main function 
main <-  function(input_path, output_path) {
      # read in the data 
      df <- read_csv(input_path)
      df <- df %>% 
         rename(sqft =  sq__ft)
      
      # make tibble of range of house size 
      house_size_range <- tibble(`Smallest House Size` = range(df$sqft)[1],
                                 `Largest House Size` = range(df$sqft)[2])
      
      # get the peak house size
      peak_house_size <- density(df$sqft)$x[119]
      
      # make a density plot of the house square footage
      density_plot <- df %>% 
            ggplot(aes(x = sqft)) + 
            geom_density(color = "turquoise") + 
            labs(title = "Distribution of House Size",
                 x = "Square Footage",
                 y = "Density") + 
            theme_grey() + 
            geom_vline(xintercept = peak_house_size) +
            annotate(geom = "text", 
                     x = 1800, 
                     y = 1.5e-04, 
                     label = paste("Peak House Size\n", 
                                   round(peak_house_size,1), "sqft"))
      
      scatterplot <- df %>% 
            ggplot(aes(x = sqft, y = price)) +
            geom_point(aes(color = sqft, alpha = 0.5)) +
            labs(title = "Relationship Between Price and House Size",
                 x = "House Size (sqft log2 scale)", 
                 y = "House Price (log2 scale)") +
            scale_x_continuous(trans = "log2") + 
            scale_y_continuous(trans = "log2")
      
      # save the eda results 
      write_csv(house_size_range, path = paste(output_path, "house_size_range.csv"))
      ggsave(filename = "sqft_density.png", plot = density_plot, path = output_path)
      ggsave(filename = "sqft_vs_price.png", plot = scatterplot, path = output_path)
      
      
}

# call the main function 
main(opt$input_path, opt$output_path)