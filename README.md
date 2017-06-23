
# GBM multicore scaling
## h2o, xgboost and lightgbm on multicore and multi-socket systems

Despite the deep learning hype, on most supervised learning problems with tabular data 
(commonly encountered in business) gradient boosting machines (GBMs) are often the
winning single-algorithm solution (winning in accuracy).

The 3 best (in speed, memory footprint and accuracy) open source implementations for GBMs 
are xgboost, h2o and lightgbm (see [benchmarks](https://github.com/szilard/benchm-ml)).

In this repo I'll take a look at the scalability of h2o, xgboost and lightgbm as a function
of the number of CPU cores and sockets on various Amazon EC2 instances. 
Previous [experiments](https://github.com/szilard/ml-x1) have shown significant slow-down
of xgboost on multi-socket systems.


### r3.8xlarge (32 cores)

r3.8xlarge has 2 CPU sockets with 8+8 hyperthreaded cores each.
Cores 0-7 are on CPU1, 8-15 on CPU2, then 16-23 are hyperthread pairs of 0-7 etc.

Relative training times:
![](fig-r3_8x-tools_relative.png)



