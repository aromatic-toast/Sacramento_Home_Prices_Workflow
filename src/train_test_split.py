# author: Lesley Miller 
# date: 2020/02/08
#
# takes in a file path to the dataset and 
# peforms train_test_split to make train, validation and test sets
#
# 

'''This script takes in a file path to a dataset and performs 
train_test_split to obtain train, validation and test sets. It then 
writes those datasets to csv.

Usage: src/train_test_split.py --file_path=<file_path> 

Options:
--file_path=<file_path> Path (the path including file name) to the csv file.
'''

# load packages 
import pandas as pd
from docopt import docopt
from sklearn.model_selection import train_test_split

opt = docopt(__doc__)


# define main function 
def main(file_path):
      
      # read in the data 
      df = pd.read_csv(file_path)
      
      # get the predictors
      X = df.drop(columns=['price'])

      # get the target 
      y  = df['price']
      
      # split into train and test 
      X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=42)
      
      # split into train and validation 
      X_train, X_valid, y_train, y_valid = train_test_split(X_train, y_train, test_size=0.20, random_state=42)
      
      # write train, validation and test sets to csv
      X_train.to_csv('data/X_train.csv', index=False)
      X_valid.to_csv('data/X_valid.csv', index=False)
      X_test.to_csv('data/X_test.csv', index=False)
      
      y_train.to_csv('data/y_train.csv', index=False)
      y_valid.to_csv('data/y_valid.csv', index=False)
      y_test.to_csv('data/y_test.csv', index=False)

      
# call the main function 
if __name__ == "__main__":
   main(opt["--file_path"])
   
      
      
      
      
      
