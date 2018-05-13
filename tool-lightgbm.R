
library(lightgbm)
library(data.table)

set.seed(123)

d_train <- fread("train-10m.csv")

y_train <- d_train$dep_delayed_15min
d_train_xtra <- lgb.prepare_rules(d_train)
d_train <- d_train_xtra$data
cols_cats <- setdiff(names(d_train_xtra$rules),"dep_delayed_15min")
p <- ncol(d_train)-1
X_train <- as.matrix(d_train[,1:p])

dlgb_train <- lgb.Dataset(data = X_train, label = ifelse(y_train=='Y',1,0))


tm <- system.time({
md <- lgb.train(data = dlgb_train, objective = "binary", 
            nrounds = 100, num_leaves = 512, learning_rate = 0.1, categorical_feature = cols_cats)
})
tm

cat(tm[[3]],"\n")

