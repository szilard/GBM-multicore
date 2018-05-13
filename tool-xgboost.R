
library(xgboost)
library(parallel)
library(Matrix)

set.seed(123)

n_proc <- commandArgs(trailingOnly=TRUE)[1]

d_train <- data.table::fread("train-10m.csv")
for (k in c("Month","DayofMonth","DayOfWeek","UniqueCarrier","Origin","Dest", "dep_delayed_15min")) {
  d_train[[k]] <- as.factor(d_train[[k]])
}
X_train <- sparse.model.matrix(dep_delayed_15min ~ .-1, data = d_train)
dxgb_train <- xgb.DMatrix(data = X_train, label = ifelse(d_train$dep_delayed_15min=='Y',1,0))


tm <- system.time({
md <- xgb.train(data = dxgb_train, nthread = n_proc, objective = "binary:logistic", 
        nrounds = 100, max_depth = 10, eta = 0.1)
})
tm

cat(tm[[3]],"\n")
