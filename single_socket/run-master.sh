#!/bin/bash

# on r4_8x:
time ./run.sh h2o      | tee res-h2o.csv
time ./run.sh xgboost  | tee res-xgboost.csv
time ./run.sh lightgbm | tee res-lightgbm.csv
cat res-*.csv > res.csv
