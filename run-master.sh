#!/bin/bash

# on r3_8x:
time ./run.sh r3_8x h2o      | tee res-r3_8x-h2o.csv
time ./run.sh r3_8x xgboost  | tee res-r3_8x-xgboost.csv
time ./run.sh r3_8x lightgbm | tee res-r3_8x-lightgbm.csv
cat res-r3_8x-*.csv > res-r3_8x.csv

# on r4_8x:
time ./run.sh r4_8x h2o      | tee res-r4_8x-h2o.csv
time ./run.sh r4_8x xgboost  | tee res-r4_8x-xgboost.csv
time ./run.sh r4_8x lightgbm | tee res-r4_8x-lightgbm.csv
cat res-r4_8x-*.csv > res-r4_8x.csv

# on x1_32x:
time ./run.sh x1_32x h2o      | tee res-x1_32x-h2o.csv
time ./run.sh x1_32x xgboost  | tee res-x1_32x-xgboost.csv
time ./run.sh x1_32x lightgbm | tee res-x1_32x-lightgbm.csv
cat res-x1_32x-*.csv > res-x1_32x.csv

