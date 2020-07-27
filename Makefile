all : results/sqft_density.png results/sqft_vs_price.png results/test_stats_table.csv results/SLR_plot.png

# download data 
data/sacramento_house_prices.csv :
	Rscript src/load_and_write_csv.R \
	--input_url="http://samplecsvs.s3.amazonaws.com/Sacramentorealestatetransactions.csv" \
	--output_path=data/
	
# get X_train data 
data/X_train.csv : data/sacramento_house_prices.csv
	python src/train_test_split.py \
	--file_path=data/sacramento_house_prices.csv \
	--output_dir=data/

	
# get test statistics table and model plot 
results/test_stats_table.csv : data/sacramento_house_prices.csv
	Rscript src/modelling.R \
	--input_path=data/sacramento_house_prices.csv \
	--output_dir=results/
	
# get linear model plot 
results/SLR_plot.png : data/sacramento_house_prices.csv
	Rscript src/modelling.R \
	--input_path=data/sacramento_house_prices.csv \ 
	--output_dir=results/

	
# eda plots for final report 
results/sqft_density.png results/sqft_vs_price.png results/house_size_range.csv: data/sacramento_house_prices.csv
	Rscript src/eda.R \
	--input_path=data/sacramento_house_prices.csv \
	--output_path=results/
	
clean:
	rm -f results/*.csv
	rm -f results/*.png
	rm -f data/*.csv
	
	
	